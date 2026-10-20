# 样例数据与实验记录

[快速上手](../docs/quick-start.zh-CN.md) · [English guide](../docs/quick-start.md)

## 当前教程：全频段 50 组

使用 **`fullband50/raw/`**：10 个频点覆盖约 1–499 MHz，每个频点含 -1、-3、-6、-9、-12 dBFS 五档幅度。每份 CSV 为 32768×6 有符号整数，无表头；采样率 1 GS/s。

数据包含同一流水线 ADC 的固定增益、DAC、比较器误差，以及三阶非线性、记忆效应和 5 LSB RMS 输入热噪声。数据由 MATLAB R2025a 按参考脚本生成，使用时无需 MATLAB。

已完成实验采用 20% 文件级测试比例、40/10 分集，以及 **18→5→1 KAN、1820 参数、20 轮训练**。全部十组测试的 SNDR 提升 4.50–5.96 dB，SFDR 提升 20.12–28.89 dB。独立采集文件的结果不等同于跨器件或全部未见工况的泛化证明。

| 材料 | 内容 |
| --- | --- |
| [数据清单](fullband50/manifest.json) | 精确频率、幅度、种子、失配、格式与 50 个 CSV 的 SHA-256 |
| [实验记录](fullband50/experiment.json) | 实际配置、40/10 分集、模型摘要与全部测试指标 |
| [结果 CSV](fullband50/test-results.csv) | 十组校准前后 SNDR/SFDR |
| [实验与频谱说明](fullband50/README.md) | 粗校准用途、归一化、理论噪声参照及结果限制 |
| [频谱参数](fullband50/spectrum-provenance.json) | 绘图定义、数据散列与输入电压换算 |

## 历史与格式样例

| 目录 | 用途 |
| --- | --- |
| `tutorial/raw/` | r09/r10 的 20 组低噪声、固定幅度样例；保留历史记录，不用于当前快速上手 |
| `pipelined/` | 早期五组流水线仿真，见[原数据清单](pipelined/manifest.json) |
| `stage-codes/raw/` | 两级码字格式：2 列、每级 4 bit、名义增益 16 |
| `output-codes/raw/` | 最终输出格式：1 列、14 bit、无符号十进制 |

历史数据各有独立配置与指标，不能与当前全频段实验混用。旧小模型结果见[历史验证](tutorial/model-validation.md)；其他格式见[格式样例清单](manifest.json)。

## English

Use **`fullband50/raw/`** for the current guide: 50 captures, ten frequencies spanning approximately 1–499 MHz, five amplitudes, and 32768×6 signed integers per file at 1 GS/s. The simulation includes fixed hardware mismatch, nonlinearity, memory and 5 LSB RMS input thermal noise.

The completed experiment uses a 40/10 capture split and an 18→5→1 KAN with 1820 parameters trained for 20 epochs. All ten held-out captures improve SNDR by 4.50–5.96 dB and SFDR by 20.12–28.89 dB. The linked records contain every result and the limits of interpretation. `tutorial/` retains the earlier r09/r10 experiment; its data and results do not apply to the current guide.
