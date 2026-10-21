# 安装说明

[首页](../README.zh-CN.md) · [English](installation.md) · [快速上手](quick-start.zh-CN.md)

## 1. 检查运行环境

使用 Windows x64。软件包自带 Python 和必要运行库，无需安装 Python、MATLAB 或 CUDA 开发工具包。

**有兼容的 NVIDIA GPU 时，使用 CUDA 训练。** 打开软件后检查设置页的 CUDA 信息；设备未识别时按[GPU 排错](troubleshooting.zh-CN.md#gpu)处理。AMD、Intel GPU 不属于本 CUDA 发行包的训练设备。

下载、解压、原始数据和训练结果分别占用空间，按 Release 附件大小及数据规模预留磁盘空间。实测环境记录见[CHANGELOG](../CHANGELOG.md)，不代表已覆盖所有硬件组合。

## 2. 下载并校验

打开[最新正式发行版](https://github.com/UESTC-MSDC/auto-adc-calibration/releases/latest)，下载一个 `Auto-ADC-Calibration-…-Windows-x64.7z` 软件包及 `SHA256SUMS.txt`。软件包已包含文档、PDF 和样例；只有需要单独阅读或保存资料时，才需另下载可选的 `…-Documentation.zip`。

当前软件使用单个压缩包。若以后某个发行页提供分卷，按该页说明下载同一套文件名的全部分卷，不混用不同版本的附件。

在下载目录打开 PowerShell：

```powershell
Get-ChildItem -File 'Auto-ADC-Calibration-*-Windows-x64.7z' |
    Get-FileHash -Algorithm SHA256
```

将每个文件的散列与该套附件对应的校验清单逐项对照。GitHub 自动生成的 **Source code (zip / tar.gz)** 是文档仓库快照；Windows 程序位于命名为 `Windows-x64` 的发行附件中。

## 3. 完整解压并启动

使用 [7-Zip](https://www.7-zip.org/) 打开 `.7z` 软件包，将整套程序完整解压到独立目录，例如 `D:/ADC-Tools/Workbench/`。不要在压缩包内直接运行 EXE。解压后应包含：

```text
KAN Workbench.exe
KAN Worker.exe
_internal/
configs/
Documentation/
```

保持文件相对位置，在解压目录运行 `KAN Workbench.exe`。Worker 由主程序调用。

新建项目时选择另外的可写目录，例如 `D:/ADC-Projects/Tutorial/`。在 **配置 → 浮点模型 → 模型训练 → 运行设置** 中将 **计算设备** 设为 `cuda`；任务开始后核对实际设备。`auto` 可能选择 CPU，教程使用明确的 `cuda` 设置。

## 4. 获取当前文档和样例

软件目录的 `Documentation/` 提供离线网页、PDF 与配套样例。本教程使用该文档目录下 `examples/fullband50/raw/` 中的 50 份 CSV。

单独的 `…-Documentation.zip` 是可选附件；已经下载软件包时，无需重复下载。软件和文档包均保留经审阅的快速上手、用户手册 PDF 及其配套素材；将同一份文档与对应样例作为一套使用。

在软件的 `Documentation/` 或单独文档包中，打开 `index.html` 阅读离线网页，或使用 `downloads/` 内的 PDF。GitHub 仓库中的 **Code → Download ZIP** 提供 Markdown、图片和样例，不包含生成的网页和 PDF。按[快速上手](quick-start.zh-CN.md)完成第一次校准。

RTL/ASIC 功能另需相应工具；准备条件见[配置与功能参考](reference.zh-CN.md#hardware)。已有项目的升级与备份见[用户手册](user-guide.zh-CN.md#backup)。
