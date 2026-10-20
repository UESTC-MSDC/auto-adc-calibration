# 示例数据：从 pipelined ADC 开始

[图解教程](../docs/quick-start.zh-CN.md) · [数据格式](../docs/data-format.zh-CN.md) · [English quick start](../docs/quick-start.md)

本目录的数据均为仿真或数学合成，不包含实测 ADC 采集。推荐从新增的 pipelined 例子开始；原有两套合成数据保留，方便复查旧教程。

## 主例：pipelined ADC 仿真

**随 v3.5.0 软件的 `Documentation/` 及独立资料包提供。** 5 个 2.5-bit 级加一个 4-bit 后端，采用固定器件误差与输入白噪声；总采样率 1 GS/s，单音输入峰值 −3 dBFS。输入噪声分布的标准差设为 5 LSB，不表示各文件噪声波形或测得 RMS 完全相同。

| 文件 | 频率约值 | 用途 |
| --- | ---: | --- |
| [capture_001.csv](pipelined/raw-train/capture_001.csv) | 50.171 MHz | 训练 |
| [capture_002.csv](pipelined/raw-train/capture_002.csv) | 150.024 MHz | 训练 |
| [capture_003.csv](pipelined/raw-test/capture_003.csv) | 250.122 MHz | 独立测试 |
| [capture_004.csv](pipelined/raw-train/capture_004.csv) | 349.976 MHz | 训练 |
| [capture_005.csv](pipelined/raw-train/capture_005.csv) | 449.829 MHz | 训练 |

每份文件 **8192 行、6 列有符号十进制整数，无表头**。前 5 列对应 2.5-bit 级，末列对应 4-bit 后端；名义级间增益均为 4。

1. 数据页面选 `pipelined/raw-train`，测试集比例填 **0%**。
2. 训练时选择预处理生成的完整数据集。
3. 测试页面选 `pipelined/raw-test`，只测 003。

逐文件 SHA-256、精确频率、格式及固定划分见[pipelined 清单](pipelined/manifest.json)。运行例子不需要 MATLAB；CSV 已随本版文档准备好。

## 保留的两套数学合成数据

| 目录 | 数据形式 | 配置要点 |
| --- | --- | --- |
| `stage-codes/raw` | 5 份，每份 8192 行、2 列整数 | 两级均 4 bit，第一级到下一级增益 16；有符号十进制 |
| `output-codes/raw` | 5 份，每份 8192 行、单列整数 | 最终输出码字，14 bit，无符号十进制 |

这两套由正弦、谐波与噪声构造，采样率均为 1 GHz。两列样例用于演示文件格式，不是六级 pipelined 模型的输出。原文件散列见[旧样例清单](manifest.json)。

单列数据的练习：新建项目，选择 `output-codes/raw`，按表设置来源与编码，可用 20% 自动保留一组测试采集，再完成预处理、训练和独立测试。不要沿用六级 ADC 的设置。

## English

The new tutorial uses five simulated pipelined ADC captures: four in `pipelined/raw-train` and capture 003 in `pipelined/raw-test`. Each contains 8192 rows and six signed decimal stage codes. Use stage widths 2.5, 2.5, 2.5, 2.5, 2.5, 4 and five nominal gains of 4. Set the preprocessing test fraction to 0% because the test capture is already separate. The sample rate is 1 GHz.

This dataset is included in the v3.5.0 application's `Documentation/` directory and the separate documentation bundle. MATLAB is not required to use the CSV files. The older two-column and single-column mathematical examples remain available. Simulation results are teaching examples, not measured ADC performance or promised calibration gains.
