# 安装与运行

[返回首页](../README.zh-CN.md) · [English](installation.md) · [图解教程](quick-start.zh-CN.md)

## 1. 准备运行环境

| 项目 | 要求与说明 |
| --- | --- |
| 系统 | 64 位 Windows；本版实测 Windows 11 专业版，版本 10.0.26200 |
| Python | 完整发行包自带应用运行所需组件，正常使用无需安装开发环境 |
| CPU / GPU | 可以使用 CPU；NVIDIA GPU 加速需要兼容显卡及驱动 |
| CUDA | 随包 PyTorch 2.10.0 + CUDA Runtime 12.8、cuDNN 9.10.2；正常使用无需另装 CUDA 开发工具包 |
| 磁盘 | 为压缩包、解压内容、项目及训练输出分别留空间；任务数据量越大，需求越高 |
| 内存 / 显存 | 取决于模型、读取行数和批大小；本次资料未声明覆盖所有设备的最低配置 |
| 可选工具 | RTL 仿真/综合需相关外部工具；ASIC 流程使用独立扩展，见[硬件说明](hardware.zh-CN.md) |

显卡型号或 CUDA Runtime 版本不能单独证明 GPU 路径可用。启动任务后检查实际运行设备；选择 `auto` 时软件可能回退到 CPU。

## 2. 下载与校验

打开[官方 Releases](https://github.com/UESTC-MSDC/auto-adc-calibration/releases)，阅读所选版本的说明，下载 Windows 软件附件和对应校验文件。

如提供分卷，下载同一版本的全部分卷后再解压。不要混用不同版本的分卷，也不要将文档仓库的 Source code 压缩包当作应用安装包。

在 PowerShell 中可查看本地附件散列：

```powershell
Get-FileHash -Algorithm SHA256 -LiteralPath '实际下载的压缩包路径'
```

把输出与该附件公开的 SHA-256 值逐字核对。压缩包校验文件与包内逐文件校验清单用途不同，应检查与当前文件对应的记录。

## 3. 完整解压并启动

解压到具有写入权限的独立目录，例如 `D:\ADC-Tools\Auto-ADC-Calibration\`。首次运行建议使用简短路径，减少外部工具的路径兼容问题。

保留 `KAN Workbench.exe`、`KAN Worker.exe`、`_internal`、`configs` 和附带资源的原有相对位置。双击 `KAN Workbench.exe`；Worker 由主程序调度。不要直接在压缩包预览窗口中运行。

Windows 若阻止启动，先核对文件来源、散列与提示原因。未知来源或校验失败的文件不要继续运行；不要为安装本软件全局关闭系统防护。

## 4. 新建项目

选择一个单独的可写项目目录。原始采集可放在其他位置，但需长期保留：项目会引用原文件，移动项目并不会自动搬走这些外部数据。

第一次建议使用[合成样例](../examples/README.md)。完成软件流程后，再按真实 ADC 参数配置自己的数据。

## 5. 可选硬件环境

基础校准、训练和测试不要求安装 ASIC 扩展。只有运行相关硬件流程时，才配置外部工具或扩展。

ASIC 扩展需要 WSL2 及相应工具环境。当前软件对扩展安装预留空间进行检查，首次至少准备 20 GiB，项目产物另计。旧离线扩展包可能缺少当前仿真运行时，须以管理器的自检结果判断是否可用。

遇到启动或设备问题，查看[故障排查](troubleshooting.zh-CN.md)。升级现有安装时先阅读[升级与备份](upgrade.zh-CN.md)。
