# 参与文档改进 / Contributing

[首页](README.zh-CN.md) · [反馈入口](SUPPORT.md)

本仓库接受公开文档的纠错、翻译与操作说明改进，也可通过 Issue 提出软件问题或功能建议。应用源码不在本仓库内，因此没有面向应用源码的安装、开发或测试流程。

## 提交之前

先搜索已有 Issue，避免重复。小型错字或链接修复可直接提交 Pull Request；涉及操作流程、许可文字或较大重写时，先在 Issue 中说明问题和拟调整范围，便于确认事实与适用版本。

## 文档修订怎样写

1. 一次修订围绕一个具体问题，说明读者在哪一步遇到困难。
2. 使用普通 Markdown，保持现有标题层级和相对链接。操作名称对应软件界面，参数写清单位。
3. 教程中补充可观察的完成结果。测试指标附软件版本、数据、设置和来源；未实际运行的流程不要写成已验证。
4. 修改共享操作步骤时，同步检查中英文页面。只修改一处语言时，在 PR 中说明另一处需要同步的内容。
5. 检查预览、链接、截图可读性和敏感内容。截图使用仿真项目；只提交有权公开的原创内容或具有适用授权的材料。

在 Pull Request 中写明修改原因、涉及页面、核对方式与未验证的范围。生成的网页和 PDF 由维护者统一更新，不需要上传本地构建目录或软件包。

## 交流与许可

请使用尊重、具体的表达，围绕事实和可复现步骤讨论；不要公开他人私人信息。文档反馈不会改变[现有软件许可](LICENSE.txt)或第三方权利。使用与授权问题请通过[联系入口](SUPPORT.md)沟通。

## English

Documentation corrections, translations and clearer instructions are welcome. Application source is not part of this repository, so application-code build and development instructions do not apply here. Use an issue for software bugs or feature requests.

Search existing issues first. Submit small typo or link fixes directly; discuss workflow changes, license wording or substantial rewrites before preparing a large PR. Keep changes focused, use standard Markdown and relative links, match interface labels, include units and observable completion checks, and check both languages when steps are shared. Identify the data, version and settings behind any reported result.

Describe the problem, changed pages, checks performed and remaining verification gaps in your PR. Maintainers regenerate offline pages and PDFs. Do not include generated application packages, confidential data or content you do not have permission to share. Communicate respectfully and preserve the existing license scope.
