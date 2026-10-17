# Auto ADC Calibration

面向 Windows 的 ADC 数字校准工作台：导入 ADC 码字，完成预处理、模型训练与独立测试，比较校准前后的频谱、SNDR 和 SFDR。

[English](README.md) · [安装](docs/installation.zh-CN.md) · [图解教程](docs/quick-start.zh-CN.md) · [使用手册](docs/user-guide.zh-CN.md) · [问题反馈](SUPPORT.md)

适合使用单音或双音采集开展校准实验的学生与研究人员。支持各级码字和最终输出码字；基础流程可用 CPU 运行。已有基准模型后，可继续进行模型搜索、剪枝、量化，以及按需配置的 RTL / ASIC 评估。

本仓库公开文档、仿真样例与发行附件。**应用源码未公开，软件采用专有许可**；允许的使用范围见[软件使用许可](LICENSE.txt)。

## 开始使用

1. **安装软件。** 按[安装说明](docs/installation.zh-CN.md)下载并完整解压 [Windows 软件 v3.3.1](https://github.com/UESTC-MSDC/auto-adc-calibration/releases/tag/v3.3.1)，运行 `KAN Workbench.exe`。
2. **获取配套样例。** 下载[文档 v3.4.1](https://github.com/UESTC-MSDC/auto-adc-calibration/releases/tag/v3.4.1)的资料包，其中包含离线网页、PDF 和 `examples/pipelined/`。
3. **完成一次校准。** 跟随[图解教程](docs/quick-start.zh-CN.md)，用四组流水线 ADC 仿真采集训练，再独立测试 003 组。

完成后，你会得到一套预处理数据、一个训练模型和一份逐组测试报告。教程从六列 CSV 的含义讲起，再解释每项设置、频谱和保存方法，不需要编写代码。

**版本说明：** v3.4.1 更新的是文档与样例，不含新应用程序。可下载的软件仍为 v3.3.1；其原有软件压缩包附带旧版文档。GitHub 的 **Source code (zip / tar.gz)** 是本资料仓库的快照，不能用来启动应用。

## 工作流程

| 步骤 | 准备什么 | 得到什么 |
| --- | --- | --- |
| 预处理 | 原始 ADC 码字与采集参数 | 数据检查结果、训练输入及参考 |
| 训练 | 预处理数据集与训练设置 | 训练曲线和已保存模型 |
| 独立测试 | 模型与未参与训练的原始采集 | 校准前后频谱、逐组 SNDR / SFDR |
| 可选优化 | 基准模型及方案选择数据 | 搜索、剪枝或量化结果 |
| 可选硬件评估 | 兼容模型与外部工具 | 对应阶段的 RTL / ASIC 报告 |

仿真样例用于学习流程。实际评估需要保留独立采集，记录版本、采样率、读取范围和模型，并比较各组结果。软件校准、RTL 仿真和实测芯片验证分别有自己的适用范围。

## 文档导航

| 你现在要做什么 | 阅读这里 |
| --- | --- |
| 第一次使用 | [安装与运行](docs/installation.zh-CN.md) → [Pipelined ADC 图解教程](docs/quick-start.zh-CN.md) |
| 查参数或继续已有项目 | [使用手册](docs/user-guide.zh-CN.md) |
| 导入自己的采集 | [数据格式](docs/data-format.zh-CN.md) · [样例说明](examples/README.md) |
| 使用硬件功能 | [硬件说明](docs/hardware.zh-CN.md) |
| 解决问题或升级 | [故障排查](docs/troubleshooting.zh-CN.md) · [升级与备份](docs/upgrade.zh-CN.md) |
| 提出问题或改进文档 | [获取帮助](SUPPORT.md) · [贡献指南](CONTRIBUTING.md) |
| 查版本与引用 | [版本记录](CHANGELOG.md) · [引用信息](CITATION.cff) |

## 许可与联系

允许个人非商业和非商业学术使用。商业用途及企业资助研究须取得单独书面授权，包括高校承担的企业资助项目。可分享官方链接；对外转发软件包、提供镜像或重新打包须另行授权。完整条款见[中文许可](LICENSE.txt)及[英文译文](docs/license.en.md)。第三方组件保留各自许可赋予的权利，见[第三方声明](THIRD_PARTY_NOTICES.md)。

普通使用问题可提交 [Issue](https://github.com/UESTC-MSDC/auto-adc-calibration/issues)。涉及未公开数据或安全问题，请先阅读[反馈说明](SUPPORT.md)和[安全问题报告](SECURITY.md)。

Copyright © 2026 电子科技大学模数混合与SoC芯片设计中心（MSDC）

作者：陈梓函 · 使用与授权咨询：[644245542@qq.com](mailto:644245542@qq.com)
