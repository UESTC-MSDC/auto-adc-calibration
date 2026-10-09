# 合成演示数据 / Synthetic examples

这些数据由数学信号构造，仅用于练习软件操作，没有真实 ADC 采集、私人项目或训练好的模型。信号包含单音、小幅三次谐波和噪声；不用于证明校准精度或硬件性能。

These generated records illustrate operation. They contain no measured ADC captures and are not a performance benchmark. No fixed calibration improvement is promised.

| 示例 / Example | 配置 / Settings |
| --- | --- |
| `stage-codes/raw` | 2 列有符号十进制；两级各 4 bit；级间增益 16；单通道；单音；1 GHz |
| `output-codes/raw` | 单列最终输出码；14 bit；无符号十进制；单通道；单音；1 GHz |
| 记录 / Records | 每种模式 5 组，每组 8192 行；随机种子 20261009 |
| 建议划分 / Split | 测试集比例 20%；保留原始文件的位置 |

中文图解教程以各级码字示例为主；英文快速开始采用单列输出码字示例。两种输入不能使用相同的 ADC 参数。首次只要求完成预处理、训练和测试，结果因训练配置与设备而异。

For the stage-code example use two 4-bit stages with gain 16. For the final-code example use 14-bit unsigned output codes and no stage gains. Use only one raw directory per preprocessing run.

两套样例均已完成预处理、20 轮 CPU 训练及独立测试。各级码字示例保留采集 002，最终码字示例保留采集 004。操作设置与一次运行的参考结果见对应教程；运行结果不作为真实器件的性能指标。

CSV 无表头，一行一个采样点。`manifest.json` 记录来源性质、配置和文件 SHA-256。完整参考规则见 [数据格式](../docs/data-format.zh-CN.md)；操作见 [图解教程](../docs/quick-start.zh-CN.md) / [Quick start](../docs/quick-start.md)。

原始演示数据适用项目 [使用许可](../LICENSE.txt)。
