# Auto ADC Calibration

面向 Windows 的 ADC 数字校准工作台。导入原始码字，完成数据预处理、GPU 模型训练与独立测试，比较校准前后的频谱、SNDR 和 SFDR。

[English](README.md) · [下载软件](https://github.com/UESTC-MSDC/auto-adc-calibration/releases/latest) · [快速上手](docs/quick-start.zh-CN.md) · [问题反馈](https://github.com/UESTC-MSDC/auto-adc-calibration/issues)

## 主要功能

- 数据输入：各级码字、最终输出码字；单音与双音；单通道与交织采集。
- 校准流程：数据检查、按完整采集自动划分测试集、模型训练、逐组独立评估。
- 模型优化：模型搜索、剪枝、位宽扫描与量化训练。
- 硬件评估：兼容模型的 RTL 导出、仿真与综合，以及使用独立扩展的 ASIC 流程。

本仓库提供公开文档、仿真样例和发行附件。应用源码保持非公开，软件采用[现有专有许可](LICENSE.txt)。

## 开始使用

1. 按[安装说明](docs/installation.zh-CN.md)下载 Windows x64 软件，完整解压后运行 `KAN Workbench.exe`。
2. 通过本仓库 **Code → Download ZIP** 获取当前文档及 `examples/fullband50/raw/` 样例。安装包内资料与仓库不一致时，以本仓库的教程和对应样例为一套使用。
3. 按[快速上手](docs/quick-start.zh-CN.md)设置 20% 测试集比例，完成预处理；有兼容的 NVIDIA GPU 时使用 `cuda` 训练。
4. 用预处理生成的 `raw_test` 入口评估留出采集，保存模型和完整测试报告。

无需另行安装 Python、MATLAB 或 CUDA 开发工具包。GPU 训练需要兼容的 NVIDIA 显卡及驱动；运行前按安装说明检查 CUDA 状态。

## 文档分类

<a id="documentation"></a>

| 类别 | 文档 | 内容 |
| --- | --- | --- |
| 1. 项目首页 | 本页 | 功能、下载与阅读入口 |
| 2. 安装说明 | [安装与运行](docs/installation.zh-CN.md) | 下载、校验、解压、GPU 检查 |
| 3. 快速上手 | [首次校准](docs/quick-start.zh-CN.md) | 跟随界面图完成预处理、小模型训练与独立测试 |
| 4. 用户手册 | [用户手册](docs/user-guide.zh-CN.md) | 自有数据校准、配置依据、结果判断、优化与复现 |
| 5. 配置与功能参考 | [配置参考](docs/reference.zh-CN.md) | 输入格式、参数、模型与硬件功能 |
| 6. 常见问题与排错 | [问题处理](docs/troubleshooting.zh-CN.md) | 安装、GPU、数据、训练与测试问题 |
| 7. 版本记录 | [CHANGELOG](CHANGELOG.md) | 软件变化和文档修订记录 |
| 8. 许可证 | [LICENSE](LICENSE.txt) | 软件使用范围与授权条款 |
| 9. 参与开发 | [CONTRIBUTING](CONTRIBUTING.md) | 文档贡献、缺陷报告和功能建议 |

[样例数据与验证记录](examples/README.md)是教程的配套材料；第三方许可资料见[第三方声明](THIRD_PARTY_NOTICES.md)。下载仓库后可打开 `index.html` 离线阅读，`downloads/` 中提供快速上手和用户手册 PDF。

## 许可与联系

使用范围以 [LICENSE](LICENSE.txt) 为准。软件问题提交 [Issue](https://github.com/UESTC-MSDC/auto-adc-calibration/issues)；授权或非公开事项联系 [644245542@qq.com](mailto:644245542@qq.com)。敏感问题按[安全报告说明](SECURITY.md)处理。

Copyright © 2026 电子科技大学模数混合与 SoC 芯片设计中心（MSDC） · 作者：陈梓函
