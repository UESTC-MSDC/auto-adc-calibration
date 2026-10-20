# 全频段 50 组实验记录

[快速上手](../../docs/quick-start.zh-CN.md) · [English guide](../../docs/quick-start.md) · [数据清单](manifest.json) · [完整实验记录](experiment.json)

本目录提供“流水线ADC_全频段50组”实验的原始教学数据及结果记录。应用为 Windows 版 3.5.0，记录日期为 2026-10-20。文档整理直接读取已完成项目，未重新训练、测试或调整模型。

## 数据与复现范围

`raw/` 含 50 个 CSV：10 个相干频点 × -1、-3、-6、-9、-12 dBFS 五档幅度，每文件 32768 行、6 列。采样率 1 GS/s，五个 2.5-bit 流水线级加 4-bit 后端，名义级间增益均为 4。

生成参考为 `generate_pipelined_single_tone.m`，由 MATLAB R2025a 执行。频点数量改为 10，目标频率范围改为 1–499 MHz；幅度、噪声、器件误差和随机种子保留原设置。`manifest.json` 记录实际频率、相位、固定失配参数、种子、文件尺寸及 SHA-256。使用数据无需 MATLAB，原始生成脚本不包含在本资料目录中。

| 参数 | 数值 |
| --- | --- |
| 实际级间增益 | 3.96、4.02、3.98、4.01、4 |
| 三阶余量系数 | 1、0.5、0.2、0、0 V⁻² |
| 记忆系数 | 0.005、0.003、0.001、0、0 |
| 比较器偏移范围 | 各级 ±10、±5、±3、0、0 mV |
| DAC 电平偏差范围 | 各级 ±2、±1、±0.5、0、0 mV |
| 输入热噪声 RMS | 5 LSB = 610.3515625 μV；14-bit、±1 V 定义 |
| 模型／信号／噪声种子 | 42／1101／2101 |

## 保存的实验

- 预处理：20% 文件级留出，40 组训练、10 组测试；100% 抽样、专业、全部 IGE/DAC 开启，补偿基准为初始参数合成。
- 粗校准：39 组训练采集用于拟合，1 组训练采集用于验收。验收 ENOB 为 6.968→7.778 bit，仅对应该组，不是最终十组测试的均值。
- KAN：18→5→1，窗口 3，grid 5，k 3，identity，共 1820 参数。
- 训练：20 轮，批大小 512，学习率 0.001，AdamW/MSE，cosine 周期 20、最低学习率 10⁻⁶，权重衰减 10⁻⁴，目标标准化开启，早停关闭，种子 1。
- 运行：设备与精度请求为自动，实际解析为 CUDA、float64。完成任务为“模型训练 02”，输出版本为 v002。
- 测试：同一 best.pt，10 组 raw_test 采集，32768 点周期 Hann 窗，0–500 MHz，指标协议 hann-physical-power/v2。

`best.pt` 按训练损失选择。记录未包含独立超参数选择过程、训练/测试性能对照或新噪声重复试验，因此不据此声明模型已达最小规模或完全无过拟合。

训练与测试文件编号互斥；粗校准拟合、验收均位于训练侧。分集属于文件级留出，不保证频率或幅度条件互斥。具体编号与检查点 SHA-256 见 [experiment.json](experiment.json)，全部逐组指标见 [test-results.csv](test-results.csv)。

![实际软件中的全部留出组指标。相同频率可能对应不同幅度，图中连线不表示同幅度频率响应。](../../assets/fullband50/all-test-metrics.png)

## 频谱与幅度归一化

实际频谱、训练损失和 SNDR/SFDR 总览均使用软件保存的 SVG 原图，文件内容与导出结果完全一致。PNG 只做格式转换，保留原图的坐标、指标和曲线；软件截图用于说明操作界面。

软件原图：[训练损失](../../assets/fullband50/training-loss.svg) · [SNDR](../../assets/fullband50/sndr-vs-frequency.svg) · [SFDR](../../assets/fullband50/sfdr-vs-frequency.svg)。

全部留出组频谱：[0015](../../assets/fullband50/capture_0015-spectrum.svg) · [0018](../../assets/fullband50/capture_0018-spectrum.svg) · [0027](../../assets/fullband50/capture_0027-spectrum.svg) · [0028](../../assets/fullband50/capture_0028-spectrum.svg) · [0029](../../assets/fullband50/capture_0029-spectrum.svg) · [0038](../../assets/fullband50/capture_0038-spectrum.svg) · [0040](../../assets/fullband50/capture_0040-spectrum.svg) · [0043](../../assets/fullband50/capture_0043-spectrum.svg) · [0046](../../assets/fullband50/capture_0046-spectrum.svg) · [0048](../../assets/fullband50/capture_0048-spectrum.svg)。

理论参照单独绘制，以 **1 V 峰值为 0 dBFS**。软件原图使用归一化码字重建值，其幅度基准与模拟输入电压不同。

六级名义重建权重为 `[1/4, 1/16, 1/64, 1/256, 1/1024, 1/8192]`。按允许码字范围计算的上下界为 -1.3330078125 和 1.3328857421875 V，故从软件归一化输出恢复电压的公式为：

```text
volts = normalized_output × 1.33294677734375 - 0.00006103515625
```

该换算已逐点核对：保存的 baseline 恢复后等于原始码字与名义权重的内积。三点窗口在中间 32766 点产生预测，软件完整 FFT 保留首尾两点的基准输出。幅度缩放约对应 2.50 dB，因此 -1 dBFS 的仿真输入在软件图中约显示 -3.49 dBFS。原图未实施上述换算；它用于解释幅度基准差，SNDR/SFDR 不受共同固定尺度改变影响。

理论参照取 0046 组生成时保存的 **理想正弦 + 同一次输入热噪声**，不含 ADC 量化与残余转换误差，也不是模型结果或训练标签。它展示随机输入噪声仍存在时的性能参照，不做幅度拟合、滤波、平滑或噪声扣除。

对于长度 N 的周期 Hann 窗 w，单边幅度谱使用 `2 |FFT(xw)| / sum(w)`，直流与奈奎斯特频点不倍增；绘图前去均值。普通频点的期望噪声功率对应谱线电平为：

```text
10 log10(4 σ² sum(w²) / sum(w)²) = -101.66 dBFS/bin
```

此值是期望线性功率转为 dB 的结果，不能与单次频谱的平均对数幅度混用。软件实际结果与理论参照使用相同 N=32768、fs=1 GHz 和周期 Hann 窗。参数、变换及数据散列见 [spectrum-provenance.json](spectrum-provenance.json)。

## English

The 50 files in `raw/` are the exact captures used by the completed experiment: ten frequencies, five amplitudes, 32768×6 signed integers each, at 1 GS/s. The saved 18→5→1 model has 1820 parameters and completed 20 CUDA/float64 epochs. All ten held-out captures are reported, with SNDR gains of 4.50–5.96 dB and SFDR gains of 20.12–28.89 dB.

Files in the training and test sets are disjoint; frequency/amplitude conditions may overlap. Coarse calibration uses training-side captures only. Its one-capture acceptance score is separate from the final ten-capture report. The record does not establish minimum model size or absence of overfitting.

Actual spectra, training loss and metric plots are unchanged application-exported SVG files; PNG copies are rasterized only for layout. The separately drawn theoretical reference uses the exact stored ideal sine plus original thermal noise for capture 0046, excluding quantization and residual distortion. The voltage conversion above explains the approximately 2.50 dB reference difference; it is not applied to the software figures. No additional inference, denoising, filtering, smoothing or amplitude fitting is performed. The expected thermal-noise bin level is -101.66 dBFS/bin under the stated Hann amplitude-spectrum convention.
