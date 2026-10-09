# 公开版本记录 / Public release history

## 3.3.1 · 首次软件发行 / First binary distribution

Auto ADC Calibration 面向个人非商业与非商业学术使用，提供 Windows x64 软件、两套合成样例、简明手册、图解教程和离线网页资料。应用原创源码不公开。

### 本版内容

- 支持 ADC 数据预处理、浮点训练、独立测试，以及按需使用的剪枝、量化与硬件评估流程。
- 修复 Windows 深目录中的输入归档与项目迁移问题。首次使用仍建议简短安装路径，外部工具可能有各自限制。
- 程序采用原生保护构建，提高实现恢复门槛；不能保证完全防逆向。
- 图解教程采用随附合成样例的实际测试结果，保留简洁的操作说明。
- 提供对应第三方许可、Qt/PySide6 源码附件及库替换说明。

### 实测环境

| 项目 | 记录 |
| --- | --- |
| 操作系统 | Windows 11 专业版 x64，10.0.26200 |
| 图形设备 | NVIDIA GeForce RTX 5090 D v2 |
| NVIDIA 驱动 | 610.88 |
| 运行环境 | Python 3.12.14、PyTorch 2.10.0 + CUDA Runtime 12.8、cuDNN 9.10.2 |
| 界面 | PySide6 / Qt 6.9.3 |

这些是验收环境记录，并非最低配置。软件包自带 Python 与必要运行库；GPU 加速需要兼容驱动。附件大小和 SHA-256 随同版 Release 提供。

### 验证范围与已知限制

已完成源码全量回归、原生模块重点回归、GUI 启动，以及随附样例的预处理、训练和独立测试。CPU 与 CUDA 运行均有实际记录。条件跳过的外部 HDL/硬件测试不计为通过。

- 当前记录来自一台 Windows 主机，尚未覆盖新装 Windows、所有显卡或驱动组合。
- 两套演示数据均为合成数据；教程指标不是实际 ADC 测量或硬件性能承诺。
- RTL/ASIC 需要另行配置外部工具；本版演示验收未运行完整布局布线或实物硬件测试。
- 程序暂未使用商业代码签名证书；下载后请核对官方来源和 SHA-256。出现系统提示时按[故障排查](docs/troubleshooting.zh-CN.md)处理。
- 升级请采用独立目录并备份项目，见[升级说明](docs/upgrade.zh-CN.md)。

### English

This first binary distribution includes the Windows application, synthetic examples, Chinese product guides, English installation/quick-start pages, offline documentation, third-party notices and matching Qt/PySide6 source archives. It repairs deep-path input archiving and project migration, and uses native application modules to raise the cost of reverse engineering.

Validation covers source regression, focused native-module regression, GUI startup and example workflows on CPU and CUDA. The tested host is Windows 11 Pro 10.0.26200 with an NVIDIA GeForce RTX 5090 D v2 and driver 610.88. Clean-machine coverage, other GPU/driver combinations and complete physical hardware flows remain outside this validation. Synthetic results are not measured ADC performance. The executables are currently unsigned.
