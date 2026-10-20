# 安装说明

[首页](../README.zh-CN.md) · [English](installation.md) · [快速上手](quick-start.zh-CN.md)

## 1. 检查运行环境

使用 Windows x64。软件包自带 Python 和必要运行库，无需安装 Python、MATLAB 或 CUDA 开发工具包。

**有兼容的 NVIDIA GPU 时，使用 CUDA 训练。** 打开软件后检查设置页的 CUDA 信息；设备未识别时按[GPU 排错](troubleshooting.zh-CN.md#gpu)处理。AMD、Intel GPU 不属于本 CUDA 发行包的训练设备。

下载、解压、原始数据和训练结果分别占用空间，按 Release 附件大小及数据规模预留磁盘空间。实测环境记录见[CHANGELOG](../CHANGELOG.md)，不代表已覆盖所有硬件组合。

## 2. 下载并校验

打开[最新正式发行版](https://github.com/UESTC-MSDC/auto-adc-calibration/releases/latest)，下载同一版本、同一套文件名的全部 Windows x64 分卷及对应的 SHA-256 校验文件。分卷数量以该页为准；将 `.zip.001`、`.zip.002` 等分卷放在同一目录，不混用不同版本或文档修订包的分卷。

在下载目录打开 PowerShell：

```powershell
Get-ChildItem -File 'Auto-ADC-Calibration-*-Windows-x64.zip.*' |
    Get-FileHash -Algorithm SHA256
```

将每个文件的散列与该套附件对应的校验清单逐项对照。GitHub 自动生成的 **Source code (zip / tar.gz)** 是文档仓库快照；Windows 程序位于命名为 `Windows-x64` 的发行附件中。

## 3. 完整解压并启动

使用支持分卷的工具打开 `.001`，解压到独立目录，例如 `D:/ADC-Tools/Workbench/`。解压后应包含：

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

若较早下载的包内没有这套文档和样例，可下载发行页提供的文档修订包，或在[本仓库](https://github.com/UESTC-MSDC/auto-adc-calibration)选择 **Code → Download ZIP**。将同一份文档及其样例作为一套使用；历史样例保留各自配置和验证记录。

打开 `index.html` 阅读离线文档，或使用 `downloads/` 内的 PDF。按[快速上手](quick-start.zh-CN.md)完成第一次校准。

RTL/ASIC 功能另需相应工具；准备条件见[配置与功能参考](reference.zh-CN.md#hardware)。已有项目的升级与备份见[用户手册](user-guide.zh-CN.md#backup)。
