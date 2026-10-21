# Auto ADC Calibration

面向 Windows 的 ADC 数字校准工作台：导入原始码字，完成预处理、模型训练与独立测试，比较校准前后的频谱、SNDR 和 SFDR；按需使用模型搜索、剪枝、量化与硬件评估。

[English](README.md) · [下载软件](https://github.com/UESTC-MSDC/auto-adc-calibration/releases/latest) · [快速上手](docs/quick-start.zh-CN.md) · [问题反馈](https://github.com/UESTC-MSDC/auto-adc-calibration/issues)

当前发行版：**0.0.0**。Windows x64 软件采用原生编译保护；本仓库提供公开文档和仿真样例，应用源码保持非公开。使用范围以[许可证](LICENSE.txt)为准。

## 开始使用

1. 按[安装说明](docs/installation.zh-CN.md)下载 Windows x64 软件，完整解压后运行 `KAN Workbench.exe`。
2. 打开解压目录中的 `Documentation/index.html`。软件包内已配齐离线网页、经审阅的快速上手和用户手册 PDF，以及对应样例数据。
3. 按[快速上手](docs/quick-start.zh-CN.md)完成第一次校准，再按[用户手册](docs/user-guide.zh-CN.md)处理自己的 ADC 数据。

无需另行安装 Python、MATLAB 或 CUDA 开发工具包。GPU 训练需要兼容的 NVIDIA 显卡及驱动；运行前按安装说明检查 CUDA 状态。

## 使用文档

<a id="documentation"></a>

| 文档 | 用途 |
| --- | --- |
| [安装说明](docs/installation.zh-CN.md) | 下载、校验、解压与启动 |
| [快速上手](docs/quick-start.zh-CN.md) | 按配套样例完成第一次校准 |
| [用户手册](docs/user-guide.zh-CN.md) | 自有数据校准、效果判断、模型优化与复现 |
| [配置参考](docs/reference.zh-CN.md) | 输入格式、参数和硬件功能 |
| [常见问题](docs/troubleshooting.zh-CN.md) | 安装、GPU、数据与训练排错 |
| [样例与实验记录](examples/README.md) | 配套数据、生成脚本、配置与结果 |

Git 仓库保留 Markdown 和配套素材；离线网页与保持原内容的手册 PDF 随软件及文档发行包提供。版本变化见 [CHANGELOG](CHANGELOG.md)，依赖许可与对应源码入口见[第三方声明](THIRD_PARTY_NOTICES.md)。

## 许可与联系

软件问题提交 [Issue](https://github.com/UESTC-MSDC/auto-adc-calibration/issues)，参与改进见[反馈与贡献说明](CONTRIBUTING.md)；授权或非公开事项联系 [644245542@qq.com](mailto:644245542@qq.com)。敏感问题按[安全报告说明](.github/SECURITY.md)处理。

Copyright © 2026 电子科技大学模数混合与 SoC 芯片设计中心（MSDC） · 作者：陈梓函
