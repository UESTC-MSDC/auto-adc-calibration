# Installation

[Home](../README.md) · [简体中文](installation.zh-CN.md) · [Quick start](quick-start.md)

## 1. Check the environment

Use Windows x64. Python and the required runtime libraries are bundled; separate Python, MATLAB and CUDA development toolkit installations are unnecessary.

**Use CUDA training whenever a compatible NVIDIA GPU is available.** Check the application's CUDA status and install a compatible NVIDIA driver if required. This CUDA distribution does not use AMD or Intel GPUs for training. The [change history](../CHANGELOG.md) records tested hardware; allow disk space for the archives, extracted application, data and results.

## 2. Download and verify

Open the [latest published release](https://github.com/UESTC-MSDC/auto-adc-calibration/releases/latest). Download the single `Auto-ADC-Calibration-…-Windows-x64.7z` application archive and `SHA256SUMS.txt`. The application already includes documentation, PDFs and examples; the separate `…-Documentation.zip` is optional for reading or storing the materials without the application.

The current application uses one archive. If a future release provides split archives, download every part listed there with the same filename prefix; do not mix versions.

In PowerShell, run:

```powershell
Get-ChildItem -File 'Auto-ADC-Calibration-*-Windows-x64.7z' |
    Get-FileHash -Algorithm SHA256
```

Compare each digest with the matching checksum entry. GitHub's automatic **Source code** archives contain this documentation repository. Runnable application files are in the Windows x64 release assets.

## 3. Extract and launch

Open the `.7z` archive with [7-Zip](https://www.7-zip.org/) and extract the entire application to a separate directory such as `D:/ADC-Tools/Workbench/`. Do not run an EXE from inside the archive. Retain `KAN Workbench.exe`, `KAN Worker.exe`, `_internal/`, `configs/` and the other resources together.

Run `KAN Workbench.exe` from the extracted directory. Create a project in a separate writable location. In the floating-point training configuration, open runtime settings and select **Device: `cuda`**. Confirm the actual device when training starts; `auto` may fall back to CPU.

## 4. Get the current guides and samples

The application's `Documentation/` directory contains the offline site, PDFs and matching examples. This tutorial uses the 50 CSV captures under `examples/fullband50/raw/` within that documentation directory.

The separate `…-Documentation.zip` is optional; it is unnecessary if you already downloaded the application package. Both packages retain the reviewed guide PDFs and supporting materials. Keep each guide with its matching dataset.

Within the application's `Documentation/` folder or the separate documentation package, open `index.html` for offline reading or use the Chinese PDFs in `downloads/`. GitHub's **Code → Download ZIP** contains Markdown, figures and examples, without generated HTML or PDFs. Continue with the [quick start](quick-start.md). External hardware tools and project migration are covered by the [reference](reference.zh-CN.md#hardware) and [user guide](user-guide.zh-CN.md#backup).
