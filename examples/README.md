# 样例数据与验证记录

[快速上手](../docs/quick-start.zh-CN.md) · [完整教程](../docs/user-guide.zh-CN.md) · [配置参考](../docs/reference.zh-CN.md)

## 教程样例

使用 `tutorial/raw/` 中的 20 份 CSV。每份 8192 行、6 列有符号整数，无表头。全部采集放在同一目录，预处理设置 **20% 测试集比例**，由软件自动划分为 16 组训练和 4 组独立测试。

| 项目 | 条件 |
| --- | --- |
| 数据性质 | 受控流水线 ADC 仿真，无实测采集 |
| 级结构 | 5 个 2.5-bit 级和一个 4-bit 后端 |
| 名义级间增益 | 4、4、4、4、4 |
| 实际级间增益 | 3.88、4.04、3.96、4.02、4.00 |
| 信号 | 单音，1 GS/s，模拟输入峰值固定为 -3 dBFS；各采集频率和相位不同 |
| 固定误差 | 级间增益误差、比较器偏移、DAC 电平偏差和小幅三阶余量非线性 |
| 随机噪声 | 输入白高斯噪声 RMS 0.25 LSB，LSB 按 14 bit 与 ±1 V 满量程定义 |
| 未包含 | 记忆效应、抖动、温漂和跨器件变化 |

该样例用于观察系统误差的校准过程。低噪声与固定输入幅度有利于展示效果；不同幅度和实际噪声条件需要另行验证。输入 -3 dBFS 是模拟源相对 Vref 的设置，报告幅度使用程序的码字重建尺度。

[数据清单](tutorial/manifest.json)记录完整误差参数、随机种子、精确频率、相位、生成规则及每个 CSV 的 SHA-256。无需 MATLAB 即可使用数据。

## 实际验证结果

<a id="results"></a>

验证日期：2026-10-20；应用：**3.5.0 Windows 打包 GUI 与 Worker**；设备：**CUDA / NVIDIA GeForce RTX 5090 D v2**。当前图解教程使用 **6→2→1、214 参数**，窗口 1、grid 1、k 2、identity、float64、种子 1、120 轮、批大小 256、学习率 0.001、cosine 周期 120、目标标准化开启。

先在外层 16 个训练文件内划分 12 个拟合组和 4 个验证组，选择小结构，再固定配置、使用全部 16 组重新训练。本次最终测试为 **006、009、012、013**，不参与本轮结构、轮次与检查点选择。自动划分的编号可能因运行而不同。

| 采集 | SNDR 前 | SNDR 后 | 提升 | SFDR 前 | SFDR 后 | 提升 |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| 006 | 46.19 | 76.15 | +29.97 | 53.13 | 86.13 | +33.00 |
| 012 | 46.19 | 76.13 | +29.94 | 53.08 | 86.51 | +33.43 |
| 013 | 46.18 | 76.05 | +29.86 | 53.09 | 86.39 | +33.29 |
| 009 | 46.18 | 76.10 | +29.92 | 53.03 | 86.16 | +33.13 |

单位：dB，包含全部四组最终测试采集。完整设置与逐步操作见[快速上手](../docs/quick-start.zh-CN.md)，参数筛选、训练/测试诊断及物理噪声对照见[小模型验证与噪声核查](tutorial/model-validation.md)。

![小网络在全部四组留出采集上的实际 SNDR 对比。](../assets/tutorial-walkthrough/all-test-metrics.png)

[当前 GUI 验证记录](tutorial/walkthrough-validation.json)包含精确指标、原始数据散列、配置与分集。SNDR 使用同一 8192 点周期 Hann 窗和 0–500 MHz 带宽。新噪声对照的输入噪声传递系数约 **1.0009**；输入随机噪声与量化误差没有被当作可消除的理想目标。

此前 r09 的 12 节点运行保留在[历史验证记录](tutorial/validation.json)，其分集和结果属于旧配置，不作为当前 214 参数教程的结果。所有这些 CSV 都是公开教学样例，不能代替新硬件或新工况的独立测试。

## 其他配套示例

| 目录 | 用途 |
| --- | --- |
| `stage-codes/raw` | 两级码字格式示例：2 列、每级 4 bit、名义增益 16 |
| `output-codes/raw` | 最终输出格式示例：1 列、14 bit、无符号十进制 |
| `pipelined` | 五组较高噪声流水线仿真，保留既有记录的复查入口 |

这些数据各有独立配置，不使用本教程的训练/测试目录设置。既有清单见[格式样例清单](manifest.json)和[流水线数据清单](pipelined/manifest.json)。

## English

Use the 20 CSV files in `tutorial/raw/` with a 20% automatic capture-level test split. The controlled six-stage simulation has fixed hardware errors, fixed -3 dBFS analog input amplitude and 0.25 LSB input noise. It has no memory, jitter or temperature variation.

The current illustrated guide uses a 6→2→1 KAN with 214 parameters, window 1, grid 1, order 2 and 120 CUDA/float64 epochs. All four final test captures improve SNDR by 29.86–29.97 dB and SFDR by 33.00–33.43 dB. Model selection uses separate training-side validation captures; final test captures are excluded from tuning. The noise diagnostic gives an input-noise transfer coefficient of about 1.0009. Known-parameter inversion retains input noise and backend quantization error. See the linked records for all candidates, splits, hashes, metrics and limitations. The older `validation.json` describes the historical r09 12-node model.
