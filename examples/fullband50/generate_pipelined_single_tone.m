function output_dir = generate_pipelined_single_tone(output_dir)
% 流水线 ADC 单音。直接点击运行，或在命令行输入 generate_pipelined_single_tone。
% 教程版：10 个相干频点 × 5 档幅度，共 50 组。
% 可选：generate_pipelined_single_tone('my_run')，目标目录必须尚不存在。
% 输出 data/ 中的 CSV、数据说明.txt 和 generation.json；Workbench 请选择 data。
% 默认输出到本脚本旁的 outputs/pipelined_single_tone，已有目录时自动另建目录。
% 许可：参见仓库根目录 LICENSE.txt。

%% 1. 常用参数（频率 Hz，电压 V，时间 s）
cfg.fs = 1e9;                       % 总采样率
cfg.n_samples = 32768;             % 每组点数；2 的幂
cfg.vref = 1;                      % 模拟输入范围 [-Vref, +Vref]
cfg.thermal_noise_rms_lsb = 5;      % 输入等效热噪声 RMS；单位 LSB，设为 0 关闭
% 默认 32768 点 Hann 窗：热噪声平均功率噪声底约 -101.7 dBFS/频点。
cfg.thermal_noise_seed = 2101;    % 噪声独立随机种子，不改变信号相位
cfg.amplitude_dbfs = [-1 -3 -6 -9 -12]; % 合成信号峰值 / Vref，不是每个音的幅度
cfg.frequency_range = [1e6 499e6];
cfg.frequency_count = 10;          % 10 个频率 x 5 档幅度 = 50 组
cfg.signal_seed = 1101;            % 固定后可复现频率与相位
% lab1 的 5 级 2.5-bit + 4-bit 后端，名义级间增益均为 4。
cfg.gain = [3.96 4.02 3.98 4.01 4.00]; % 理想：[4 4 4 4 4]
cfg.cubic = [1.0 0.5 0.2 0 0];     % 余量三阶系数，V^-2；理想为 0
cfg.memory = [0.005 0.003 0.001 0 0]; % 上个采样点余量系数；理想为 0
cfg.comparator_error_v = [0.01 0.005 0.003 0 0]; % 各级比较器误差上限
cfg.dac_error_v = [0.002 0.001 0.0005 0 0];     % 各级 DAC 误差上限
cfg.model_seed = 42;               % 三种信号保持相同，代表同一颗 ADC
cfg.warmup = 128;                  % 预热后丢弃，避免记忆项的启动瞬态

%% 2. 频率与输出目录
if nargin < 1
    output_dir = fullfile(fileparts(mfilename('fullpath')), 'outputs', 'pipelined_single_tone');
    if isfolder(output_dir) || isfile(output_dir)
        output_dir = [output_dir '_' char(datetime('now', 'Format', 'yyyyMMdd_HHmmss_SSS'))];
    end
end
assert(~isfolder(output_dir) && ~isfile(output_dir), ...
    '输出目录已经存在，请换一个目录名，避免覆盖旧数据。');
assert(cfg.n_samples >= 16 && mod(log2(cfg.n_samples), 1) == 0, ...
    'n_samples 必须是不小于 16 的 2 的幂。');
assert(cfg.vref > 0 && all(isfinite(cfg.amplitude_dbfs)) && ...
    all(cfg.amplitude_dbfs < 0), 'Vref 必须为正，幅度必须为有限负 dBFS。');
assert(0 < cfg.frequency_range(1) && ...
    cfg.frequency_range(1) < cfg.frequency_range(2) && ...
    cfg.frequency_range(2) < cfg.fs/2, '频率范围必须位于 (0, Fs/2)。');
assert(all(abs(cfg.memory) < 1) && cfg.warmup >= 0 && ...
    mod(cfg.warmup, 1) == 0, '记忆系数应小于 1，预热点数应为非负整数。');
rng(cfg.model_seed, 'twister');
cfg.comparator_offsets = cfg.comparator_error_v(:) .* (2*rand(5, 8)-1);
cfg.dac_errors = cfg.dac_error_v(:) .* (2*rand(5, 9)-1);
rng(cfg.signal_seed, 'twister');
assert(isscalar(cfg.thermal_noise_rms_lsb) && isfinite(cfg.thermal_noise_rms_lsb) && ...
    cfg.thermal_noise_rms_lsb >= 0, '热噪声 RMS 必须为有限非负数。');
cfg.thermal_noise_rms_v = cfg.thermal_noise_rms_lsb * (2*cfg.vref/2^14);
noise_stream = RandStream('mt19937ar', 'Seed', cfg.thermal_noise_seed);
df = cfg.fs / cfg.n_samples;
tone_bins = odd_bins(cfg.frequency_range, df, cfg.frequency_count).';
assert(size(unique(tone_bins, 'rows'), 1) == size(tone_bins, 1), ...
    '频率组发生重复，请增大 n_samples 或减少频率组数。');
assert(all(diff(tone_bins, 1, 2) > 0, 'all'), ...
    '同组频率发生重复，请增大 n_samples 或减少音数。');
data_dir = fullfile(output_dir, 'data');
mkdir(data_dir);

%% 3. 逐组生成：同一频率组使用 5 档幅度，硬件误差保持不变
t = (-cfg.warmup:cfg.n_samples-1).' / cfg.fs;
keep = cfg.warmup + (1:cfg.n_samples);
group_id = 0;
records = struct([]);
total_groups = size(tone_bins, 1) * numel(cfg.amplitude_dbfs);
for p = 1:size(tone_bins, 1)
    frequencies = tone_bins(p, :) * df;
    phases = 2*pi*rand(1, numel(frequencies));
    waves = sin(2*pi*t*frequencies + phases);
    unit_signal = sum(waves, 2);
    peak = max(abs(unit_signal(keep)));
    for amplitude_dbfs = cfg.amplitude_dbfs
        group_id = group_id + 1;
        tone_amplitude = cfg.vref * 10^(amplitude_dbfs/20) / peak;
        ideal = tone_amplitude * unit_signal;
        thermal_noise = cfg.thermal_noise_rms_v * randn(noise_stream, size(ideal));
        raw = pipeline_codes(ideal + thermal_noise, cfg);
        raw = raw(keep, :);
        tag = sprintf('PS_f%07.3fM_A%05.1fdBFS', frequencies(1)/1e6, amplitude_dbfs);
        name = sprintf('%s_%04d.csv', tag, group_id);
        writematrix(raw, fullfile(data_dir, name));

        records(group_id).capture_id = sprintf('%04d', group_id);
        records(group_id).path = ['data/' name];
        records(group_id).frequency_index = p;
        records(group_id).tone_bin = tone_bins(p);
        records(group_id).frequency_hz = frequencies(1);
        records(group_id).phase_radians = phases(1);
        records(group_id).amplitude_dbfs = amplitude_dbfs;
        records(group_id).sine_amplitude_v = tone_amplitude;
        records(group_id).rows = cfg.n_samples;
        records(group_id).columns = 6;

        if mod(group_id, 25) == 0 || group_id == total_groups
            fprintf('pipelined_single_tone: %d / %d groups\n', group_id, total_groups);
        end
    end
end
write_description(output_dir, cfg, group_id);

metadata.schema_version = 2;
metadata.generator = 'generate_pipelined_single_tone.m';
metadata.matlab_version = version;
metadata.configuration = cfg;
metadata.frequency_bins = tone_bins;
metadata.captures = records;
fid_metadata = fopen(fullfile(output_dir, 'generation.json'), 'w', 'n', 'UTF-8');
assert(fid_metadata >= 0, 'Cannot write generation metadata');
fprintf(fid_metadata, '%s', jsonencode(metadata, 'PrettyPrint', true));
fclose(fid_metadata);

fprintf('Saved: %s\n', output_dir);
end

function codes = pipeline_codes(vin, cfg)
% 参考 lab1_a_pipelined_adc/pipelined_adc_pure.m 的逐级余量公式。
% stage 1~5: D=-4..4；backend: D=-8..7，重建电平为 (D+0.5)/8。
% 按整列计算各级，filter 实现 r(n)=drive(n)+memory*r(n-1)。
assert(all(isfinite(vin)) && all(abs(vin) < cfg.vref), '模拟输入超出量程。');
codes = zeros(numel(vin), 6);
residue = vin;
for stage = 1:5
    thresholds = cfg.vref*(-3.5:3.5)/4 + cfg.comparator_offsets(stage, :);
    assert(all(diff(thresholds) > 0), '比较器门限失序，请减小误差。');
    index = sum(residue > thresholds, 2) + 1;
    decision = index - 5;
    errors = cfg.dac_errors(stage, :);
    vdac = decision*cfg.vref/4 + reshape(errors(index), [], 1);
    delta = residue - vdac;
    drive = cfg.gain(stage)*delta + cfg.cubic(stage)*delta.^3;
    residue = filter(1, [1 -cfg.memory(stage)], drive);
    assert(all(isfinite(residue)) && all(abs(residue) < cfg.vref), ...
        '第 %d 级余量超量程，请减小输入幅度或误差参数。', stage);
    codes(:, stage) = decision;
end
codes(:, 6) = sum(residue/cfg.vref > (-7:7)/8, 2) - 8;
end

function write_description(output_dir, cfg, count)
% 说明放在最外层，避免被 Workbench 当作原始 TXT 数据读取。
fid = fopen(fullfile(output_dir, '数据说明.txt'), 'wt', 'n', 'UTF-8');
assert(fid >= 0, '无法写入数据说明。');
closer = onCleanup(@() fclose(fid));
fprintf(fid, 'ADC：流水线，5 个 2.5-bit 级 + 4-bit 后端，含固定级间误差。\n');
fprintf(fid, '数据：单音；共 %d 组，每组 %d 点。\n', count, cfg.n_samples);
fprintf(fid, '频率范围：%.0f–%.0f MHz；总采样率：%.0f MS/s。\n', ...
    cfg.frequency_range(1)/1e6, cfg.frequency_range(2)/1e6, cfg.fs/1e6);
fprintf(fid, '幅度：%s dBFS，表示合成波形的峰值。\n', num2str(cfg.amplitude_dbfs(:).'));
fprintf(fid, '误差按第1~5级排列：级间增益=%s（理想值4，相对误差=%s %%）。\n', ...
    mat2str(cfg.gain, 8), mat2str((cfg.gain/4-1)*100, 8));
fprintf(fid, '三阶余量系数=%s V^-2；记忆系数=%s（无量纲）。\n', ...
    mat2str(cfg.cubic, 8), mat2str(cfg.memory, 8));
fprintf(fid, '比较器偏移/DAC电平偏差：在各级 ±%s / ±%s mV 范围均匀生成，固定随机种子=%d。\n', ...
    mat2str(cfg.comparator_error_v*1e3, 8), mat2str(cfg.dac_error_v*1e3, 8), cfg.model_seed);
fprintf(fid, '实际固定偏差（mV）：比较器按门限从低到高排列，DAC按码字-4~4排列。\n');
for stage = 1:5
    fprintf(fid, '第%d级：比较器=%s；DAC=%s。\n', stage, ...
        mat2str(cfg.comparator_offsets(stage, :)*1e3, 8), mat2str(cfg.dac_errors(stage, :)*1e3, 8));
end
fprintf(fid, '以上器件误差保持固定；后端为理想4-bit量化，未加入随机采样抖动。\n');
fprintf(fid, '输入等效热噪声：零均值白高斯，RMS=%.6g LSB（%.6g uV）；量化前加入，各采样点独立；随机种子=%d。\n', ...
    cfg.thermal_noise_rms_lsb, cfg.thermal_noise_rms_v*1e6, cfg.thermal_noise_seed);
fprintf(fid, '热噪声频谱：%d点FFT、Hann窗、输入/Vref归一化，平均功率噪声底约%.2f dBFS/频点；单次FFT上下波动，信号/杂散另计。\n', ...
    cfg.n_samples, 10*log10(6*(cfg.thermal_noise_rms_v/cfg.vref)^2/cfg.n_samples));
fprintf(fid, '导入：选择 data 文件夹；有符号十进制 6 列，各级位宽 2.5,2.5,2.5,2.5,2.5,4，级间增益均为 4。\n');
end

function bins = odd_bins(limits, df, count)
% 限定在请求频段内的奇数 FFT bin，避免短周期，并保证整记录相干。
lo = ceil(limits(1)/df);
hi = floor(limits(2)/df);
lo = lo + (mod(lo, 2) == 0);
hi = hi - (mod(hi, 2) == 0);
assert(count >= 1 && mod(count, 1) == 0 && (hi-lo)/2+1 >= count, ...
    '频段内的 FFT bin 不足，或组数/音数不是正整数。');
bins = 2*round(linspace((lo-1)/2, (hi-1)/2, count)) + 1;
end
