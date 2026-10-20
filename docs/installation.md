# Installation

[Home](../README.md) · [简体中文](installation.zh-CN.md) · [Quick start](quick-start.md)

## 1. Check the environment

Use Windows x64. Python and the required runtime libraries are bundled; separate Python, MATLAB and CUDA development toolkit installations are unnecessary.

**Use CUDA training whenever a compatible NVIDIA GPU is available.** Check the application's CUDA status and install a compatible NVIDIA driver if required. This CUDA distribution does not use AMD or Intel GPUs for training. The [change history](../CHANGELOG.md) records tested hardware; allow disk space for the archives, extracted application, data and results.

## 2. Download and verify

Open the [latest published release](https://github.com/UESTC-MSDC/auto-adc-calibration/releases/latest). Download every `Windows-x64.zip.*` part and `SHA256SUMS.txt` from the same version into one directory.

In PowerShell, run:

```powershell
Get-ChildItem -File 'Auto-ADC-Calibration-*-Windows-x64.zip.*' |
    Get-FileHash -Algorithm SHA256
```

Compare each digest with the matching checksum entry. GitHub's automatic **Source code** archives contain this documentation repository. Runnable application files are in the Windows x64 release assets.

## 3. Extract and launch

Open `.001` with a split-archive-capable tool and extract the entire package to a separate directory such as `D:/ADC-Tools/Workbench/`. Retain `KAN Workbench.exe`, `KAN Worker.exe`, `_internal/`, `configs/` and the other resources together.

Run `KAN Workbench.exe` from the extracted directory. Create a project in a separate writable location. In the floating-point training configuration, open runtime settings and select **Device: `cuda`**. Confirm the actual device when training starts; `auto` may fall back to CPU.

## 4. Get the current guides and samples

Choose **Code → Download ZIP** in [this repository](https://github.com/UESTC-MSDC/auto-adc-calibration). Extract it and locate the 20 CSV captures in `examples/tutorial/raw/`. Use these files with the current guide, even if the application's bundled documentation contains different examples.

Open `index.html` for offline reading or use the Chinese PDFs in `downloads/`. Continue with the [quick start](quick-start.md). External hardware tools and project migration are covered by the [reference](reference.zh-CN.md#hardware) and [user guide](user-guide.zh-CN.md#backup).
