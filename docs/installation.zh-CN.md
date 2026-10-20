# 安装与运行

[首页](../README.zh-CN.md) · [English](installation.md) · [下一步：图解教程](quick-start.zh-CN.md)

**目标：** 完整解压软件，打开主界面，准备一个独立项目。基础训练和测试可使用 CPU，无需安装 Python、MATLAB 或 CUDA 开发工具包。

## 1. 下载同一版本的完整软件

打开[软件 v3.5.0](https://github.com/UESTC-MSDC/auto-adc-calibration/releases/tag/v3.5.0)，下载以下 Windows x64 附件：

- `Auto-ADC-Calibration-v3.5.0-Windows-x64.zip.001`
- `Auto-ADC-Calibration-v3.5.0-Windows-x64.zip.002`
- `SHA256SUMS.txt`

将两卷放在同一目录。GitHub 的 Source code 压缩包仅包含文档仓库内容，不能启动应用。

## 2. 校验并完整解压

在下载目录打开 PowerShell，分别计算两卷的 SHA-256：

```powershell
Get-FileHash -Algorithm SHA256 -LiteralPath '.\Auto-ADC-Calibration-v3.5.0-Windows-x64.zip.001'
Get-FileHash -Algorithm SHA256 -LiteralPath '.\Auto-ADC-Calibration-v3.5.0-Windows-x64.zip.002'
```

对照同版 `SHA256SUMS.txt` 中的对应文件记录。两卷都一致后，用支持分卷的解压工具（例如 7-Zip）打开 `.001`，解压到独立可写目录，如 `D:\ADC-Tools\Auto-ADC-Calibration\`。

**完成检查：** 目录中有 `KAN Workbench.exe`、`KAN Worker.exe`、`_internal`、`configs` 和配套资源。保留它们的相对位置，不单独拷贝 EXE。

## 3. 启动并创建项目

双击解压后的 `KAN Workbench.exe`，不要在压缩包预览窗口中运行。Worker 由主程序调用。

选择 **新建**，使用与软件目录分开的项目位置，如 `D:\ADC-Projects\Pipelined-Demo\`。原始采集也要长期保存，项目可能引用这些外部文件。

**完成检查：** 主界面打开，项目创建成功。接着按[图解教程](quick-start.zh-CN.md)完成一次小规模流程。

### 获取本教程的数据与文档

打开[文档 v3.5.0](https://github.com/UESTC-MSDC/auto-adc-calibration/releases/tag/v3.5.0)，下载 `Auto-ADC-Calibration-v3.5.0-Documentation.zip` 和同页的 `SHA256SUMS.txt`。按上面的方法核对该 ZIP 的 SHA-256，再解压到一个独立的资料目录。

双击资料目录中的 `index.html` 可离线阅读；`downloads/` 中是两份 PDF，`examples/pipelined/` 中是本教程的六列 CSV。运行例子不需要 MATLAB。也可通过仓库的 **Code → Download ZIP** 获取文档与样例，但该快照不包含应用程序。

**完成检查：** `examples/pipelined/raw-train` 中有四份文件，`raw-test` 中只有 003。完整软件包已在 `Documentation/` 中包含同版资料和本教程数据；独立资料包为可选下载。

## 4. 选择 CPU 或 GPU

首次可用 `cpu` 确认流程。使用 NVIDIA GPU 时选择 `auto` 或可用的 CUDA 设备，并在任务开始后确认实际设备；`auto` 可能回退到 CPU。

| 项目 | 已知条件 |
| --- | --- |
| 系统 | Windows x64；v3.5.0 实测 Windows 11 专业版 10.0.26200 |
| 运行库 | v3.5.0 随包提供 Python、PyTorch 2.10.0、CUDA Runtime 12.8、cuDNN 9.10.2 |
| GPU | 需要兼容显卡与驱动；实测设备见[版本记录](../CHANGELOG.md) |
| 资源 | 为下载、解压、项目及训练结果分别留空间；内存/显存随数据与模型变化 |

这些是实测条件，不是覆盖所有设备的最低配置。出现缺 DLL、启动拦截或 CUDA 问题时，按[故障排查](troubleshooting.zh-CN.md)处理。

## 5. 按需准备硬件工具

RTL 仿真与综合需要相应外部工具；ASIC 使用 WSL2 和独立扩展。扩展安装至少预留 20 GiB，任务产物另计，安装后执行完整自检。详见[硬件说明](hardware.zh-CN.md)。

已有项目需要升级时，先阅读[升级与备份](upgrade.zh-CN.md)。
