# Installation

[Home](../README.md) · [简体中文](installation.zh-CN.md) · [Quick start](quick-start.md)

## Requirements

| Item | Guidance |
| --- | --- |
| Operating system | 64-bit Windows; this version was tested on Windows 11 Pro, build 10.0.26200 |
| Python | The complete application bundle contains its runtime; a development environment is not required |
| Compute device | CPU execution is available; NVIDIA acceleration needs a supported GPU and compatible driver |
| CUDA | Bundled PyTorch 2.10.0, CUDA Runtime 12.8 and cuDNN 9.10.2; a separate CUDA development toolkit is not required |
| Storage | Allow space for the archive, extracted package, input data, checkpoints and reports |
| Memory | Depends on model size, rows per capture and batch size; a universal minimum is not claimed |
| Hardware tools | Required only for the relevant RTL or ASIC workflow |

Check the actual device reported by a running task. With `auto`, the application may fall back to CPU. A GPU model name alone does not establish runtime compatibility.

## Download and verify

Visit [official Releases](https://github.com/UESTC-MSDC/auto-adc-calibration/releases) and download the complete Windows application archive and its checksum file. GitHub's Source code archives contain repository documents, not the application.

For split archives, download every part of the same release. Compare each downloaded file with its published SHA-256 value:

```powershell
Get-FileHash -Algorithm SHA256 -LiteralPath 'path-to-downloaded-archive'
```

An archive checksum and a per-file checksum manifest inside the package cover different files. Use the matching entry.

## Extract and launch

Extract into a separate writable directory, for example `D:\ADC-Tools\Auto-ADC-Calibration\`. A short path is helpful when using external tools.

Keep `KAN Workbench.exe`, `KAN Worker.exe`, `_internal`, `configs` and the accompanying resources together. Launch `KAN Workbench.exe`; the application manages its Worker. Do not launch from an archive preview window.

If Windows blocks the application, check the official source, checksum and the specific message before proceeding. Do not disable system-wide protection to run an unknown or mismatched file.

## Create a project

Choose a separate writable project directory and retain original captures at their recorded locations. Projects may reference external data; moving a project does not automatically move those files.

Follow the [quick start](quick-start.md) using the [synthetic examples](../examples/README.md). CPU training and testing can be used without installing the optional ASIC extension.

## Optional hardware workflows

RTL simulation and synthesis need the corresponding external tools. ASIC workflows use a separate extension and require WSL2. Allow at least 20 GiB for an initial extension installation, plus project outputs. An older offline extension package may lack current simulator runtimes; rely on the component manager's self-test result.

See the [hardware guide · 中文](hardware.zh-CN.md), [troubleshooting · 中文](troubleshooting.zh-CN.md) and [upgrade guide · 中文](upgrade.zh-CN.md).
