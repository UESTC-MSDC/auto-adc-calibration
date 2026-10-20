# 公开版本记录 / Public release history

## 文档 2026.10-r17 · 2026-10-20

- 通用页面去掉固定的软件版本和修订页脚，许可证明确区分协议修订与软件版本。
- 安装说明统一为下载同一发行版的全部分卷；第三方源码说明支持发行页列出的复用链接。
- 用户手册、配置参考和数据格式同步最终码字自动拆位、自定义权重及原始单位损失显示。
- 更新软件引用信息、版本说明入口、网页、PDF 和完整文件校验清单，保留历史实验的真实验证版本。

This documentation revision aligns generic installation and licensing pages, citation metadata, current data-input and loss-display instructions, offline pages, PDFs and checksums. Historical experiments retain their original software versions.

## 3.5.1 · 2026-10-20 · 软件更新 / Application update

- 损失卡片、训练曲线和导出图默认显示原始单位损失，悬停可查看标准化损失。
- 改善输入区域收起时的频谱滚轮切换流畅度。
- 最终输出码字支持固定 N 位二进制和十进制，自动拆成 N 列位输入，支持自定义权重扫描。
- 无效权重导入会保留原有配置；拒绝非有限位宽、增益等无效 ADC 参数。

操作细节见[软件版本说明](RELEASE-3.5.1.zh-CN.md)，附件和验证结果见[对应 Release](https://github.com/UESTC-MSDC/auto-adc-calibration/releases/tag/v3.5.1)。软件仍采用原生编译保护，应用源码保持非公开。

This application update displays loss in original units, improves spectrum scrolling, expands final output codes into per-bit model inputs with custom weights, and rejects invalid configurations without partially changing the UI. See the version notes and matching Release for details.

## 文档 2026.10-r16 · 2026-10-20

- 用户手册按九章重写，围绕自有 ADC 数据的准备、预处理、训练、独立测试、效果改进、模型优化、复现迁移与排错组织操作说明。
- 补充模型搜索、剪枝、量化及 RTL/ASIC 流程的用途与验收指标，加入手动剪枝和各点位宽界面图，说明 ASIC 工艺库需另行下载。
- 增加高清数据样例和软件配置截图，实际频谱采用软件导出的 SVG 原图；同步手册网页、PDF、文档入口和排错说明。
- 合并最新快速上手及可复现的全频段 MATLAB 数据生成脚本，保留现有软件发行包与许可。

The nine-chapter user manual now covers independent ADC calibration, evaluation, model optimization and hardware workflows, with high-resolution interface figures and matching web/PDF editions. This publication also includes the latest quick-start guide and reproducible MATLAB example generator.

## 文档 2026.10-r11 · 2026-10-20

- 快速上手改以已完成的全频段 50 组实验为基础，说明数据规格、40/10 分集、粗校准用途、18→5→1 网络与 20 轮训练流程。
- 提供对应 50 份原始 CSV、真实界面截图及软件导出的训练损失、频谱和指标原图；全部十组测试结果完整保留，理论噪声参照单独绘制。
- 区分输入幅度与软件归一化幅度，明确随机噪声、过拟合及泛化结论的适用范围。
- 同步中英文教程、样例入口、离线网页和 PDF；保留旧实验记录供复查。软件 Release、EXE 与许可不变。

This revision documents the completed 50-capture experiment, its 40/10 split, 1820-parameter model, 20 training epochs, all held-out results and a thermal-noise reference. Matching raw captures, bilingual guides, offline pages and PDFs are included; application binaries and licensing are unchanged.

## 文档 2026.10-r10 · 2026-10-20

- 快速上手补全 demo 数据含义、预处理、训练、独立测试的操作顺序、配置原因和完成检查，加入实际界面截图。
- 教程网络缩为 6→2→1、grid 1、k 2，共 214 参数；公开训练侧验证选择过程与全部四组最终测试结果。
- 增加训练/测试效果对照、新噪声实现检查和保留输入噪声、量化误差的已知参数反演频谱，说明误差校准与降噪的区别。
- 同步中英文快速上手、完整教程、配置参考、离线网页、PDF 和文件散列。软件 Release、EXE、版本标签与许可证保持不变。

This documentation revision adds a reproducible illustrated demo, a validated 214-parameter model, all held-out results, overfitting diagnostics and a physical noise reference. Application release assets and licensing are unchanged.

## 文档 2026.10-r09 · 2026-10-20

- 按项目首页、安装、快速上手、完整教程、配置参考、排错、版本记录、许可证和参与开发整理九类导航。
- 快速上手改为 CUDA 训练和预处理 20% 自动分集，删除重复说明与旧版本操作提示。
- 提供 20 份低噪声、固定幅度的六级 ADC 仿真采集；参数固定后使用应用 3.5.0 打包 Worker 在 GPU 上验证，全部 4 组独立测试的 SNDR 提升 34.15-34.38 dB，SFDR 提升 49.16-50.93 dB。
- 补充完整样例生成参数、散列、分集与测试记录，公开全部留出组的数值和频谱。
- 同步中英文入口、离线网页和两份 PDF；数据格式与硬件说明归入配置参考，备份与迁移归入完整教程，保留原链接入口。

本次为文档与教程数据修订，不改变应用版本、安装包、软件许可或源码发布范围。应用更新和既有发行记录保留如下。

This documentation revision reorganizes nine document categories, uses CUDA and automatic capture splitting, and replaces the primary tutorial with a controlled simulation validated on all held-out captures. It includes matching offline pages, PDFs, data hashes and complete result provenance. No application binary or license change is included.

## 3.5.0 · 2026-10-20 · 软件与配套资料 / Application and documentation

- 新增按位拆列的补码二进制输入，支持预处理、原始采集测试及 RTL 校验，并提示疑似编码选错的情况。
- 改进自定义列权重初始化和扫描，包含专业档联合权重与基波频率恢复，以及单列十进制预处理和单音拟合确认等改进。
- 预处理使用有内存上限的任务内缓存，减少重复读码；异常首行数据会直接报错，不再误作表头丢弃。
- 修复 Windows 深路径下已归档浮点参照被误判缺失，导致模型校验或 RTL 导出失败的问题。
- 发布 Windows x64 CUDA 原生保护包；完整软件包在 `Documentation/` 内提供六级流水线 ADC 样例、离线网页、两份 PDF 和第三方许可资料。现有许可及源码保护保持不变。

该软件发行时随附教程使用 2026-10-17 的演示记录；当前教程修订与验证条件见本文件上方的文档记录。v3.5.0 的发行验证结果见同版 Release。安装到新目录并备份既有项目；CPU 可运行基础流程，CUDA 加速需要兼容的 NVIDIA GPU 和驱动。

The v3.5.0 Windows application adds two's-complement bit-column input, improves initial-weight scanning and preprocessing reuse, rejects malformed first data rows, and fixes archived floating-point references under deep Windows paths. Its complete archive includes the six-stage examples and matching offline documentation. The proprietary license and native source protection remain in place. The bundled tutorial retained its original validation provenance; current documentation updates are recorded above. See the application release notes for binary validation.

## 3.4.1 · 2026-10-18 · 文档与样例更新 / Documentation update

- 用六级 pipelined ADC 仿真贯穿图解教程，补充级结构与 CSV 对应、预处理数据角色、逐步检查、频谱解读和完整实验保存。
- 提供五份 8192×6 CSV，固定四组训练和 003 组独立测试，附 SHA-256 与已验证的实跑条件。
- 重组中英文 README、安装、教程和操作参考，统一离线网页与 PDF 的阅读样式。
- 新增帮助、文档贡献与安全问题报告说明，以及 GitHub 问题模板。

这是资料版本，未发布新应用程序。Windows 软件仍从 v3.3.1 下载，旧软件压缩包保留原内容；本版资料包提供替代阅读材料和新样例。v3.4.0 为开发版本，不是本仓库的软件附件版本。CITATION.cff 继续对应公开软件 v3.3.1；研究中请记录实际使用的软件版本。

This release updates documentation and examples only. It adds the six-stage tutorial, five CSV captures, recorded validation conditions, offline pages, PDFs and contribution/reporting guides. The Windows application remains v3.3.1. Existing application archives retain their original contents; use this documentation bundle for the updated guides and data. Citation metadata continues to describe the public application release.

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
