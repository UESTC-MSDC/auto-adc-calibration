# 参与开发与文档改进

[首页](README.zh-CN.md) · [问题列表](https://github.com/UESTC-MSDC/auto-adc-calibration/issues)

本仓库接受文档纠错、翻译、公开样例改进、软件缺陷报告和功能建议。应用源码不在本仓库中；源码访问与软件授权通过维护者另行沟通。

## 提交问题

搜索已有 Issue 后，选择缺陷、功能建议或文档模板。缺陷报告应包含：

- 实际软件版本、Windows 版本、GPU 型号和驱动。
- 最短复现步骤、预期结果、实际结果及错误文本。
- 数据类型、相关设置和训练/测试划分；优先使用公开样例复现。

截图与日志去除凭据、私有数据和个人路径。敏感问题使用[安全报告渠道](.github/SECURITY.md)。

## 修改文档

1. 根据[首页文档入口](README.zh-CN.md#documentation)选择页面。快速上手只保留必要步骤，详细流程写入用户手册，参数定义写入配置参考。
2. 使用准确、简洁的专业表述；控件名对应界面，数值带单位，步骤说明输入与产物。
3. 操作说明保持版本中立。功能变化记录在 CHANGELOG，验证记录注明实际应用版本和设备。
4. 教程优先使用 CUDA 和预处理自动分集。性能记录覆盖全部留出采集，附数据散列、参数与验证条件。
5. 同步检查中英文页面、相对链接、离线网页和 PDF；保留既有链接的有效入口。

Pull Request 写明修改目的、涉及页面、验证方法和未覆盖范围。小型修订可直接提交；较大的功能流程调整先说明依据。发布用的网页、PDF 和散列清单由维护者统一生成。

## 样例与许可

仅提交有权公开的仿真数据或已获授权的数据。明确标注数据来源与模拟假设，避免把演示结果当作实测硬件表现。软件安装包、训练输出、大型模型、凭据和私有采集不进入文档仓库。

许可修改需维护者单独处理，现有 [LICENSE](LICENSE.txt) 与第三方权利继续适用。授权及非公开事项联系 [644245542@qq.com](mailto:644245542@qq.com)。

## English

Contributions cover documentation, translations, public examples, bug reports and feature requests. Application source is private. Submit focused pull requests with the reason, affected pages, validation and remaining gaps.

Keep the home-page documentation links, concise task instructions, accurate interface names and units. Record software changes in the changelog and actual versions in validation evidence. Prefer CUDA and automatic capture-level splits in tutorials; report every held-out capture with reproducible data and settings. Synchronize translations and generated documents, preserve working links, and exclude confidential data, credentials, application packages and training outputs.
