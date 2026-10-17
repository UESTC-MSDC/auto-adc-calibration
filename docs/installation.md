# Install and launch

[Home](../README.md) · [简体中文](installation.zh-CN.md) · [Next: quick start](quick-start.md)

**Goal:** extract the complete application, open its main window and create a separate project. The basic workflow can run on CPU. Python, MATLAB and the CUDA development toolkit are not required.

## 1. Download one complete release

Open the [v3.3.1 application release](https://github.com/UESTC-MSDC/auto-adc-calibration/releases/tag/v3.3.1) and download these Windows x64 assets:

- `Auto-ADC-Calibration-v3.3.1-Windows-x64.zip.001`
- `Auto-ADC-Calibration-v3.3.1-Windows-x64.zip.002`
- `SHA256SUMS.txt`

Keep both parts in the same folder. GitHub's Source code archives contain the documentation repository, not the application.

## 2. Verify and extract

In PowerShell, from your download folder:

```powershell
Get-FileHash -Algorithm SHA256 -LiteralPath '.\Auto-ADC-Calibration-v3.3.1-Windows-x64.zip.001'
Get-FileHash -Algorithm SHA256 -LiteralPath '.\Auto-ADC-Calibration-v3.3.1-Windows-x64.zip.002'
```

Compare both hashes with their entries in the matching `SHA256SUMS.txt`. Use a tool supporting split archives, such as 7-Zip, to open `.001` and extract everything to a writable directory, for example `D:\ADC-Tools\Auto-ADC-Calibration\`.

**Check:** keep `KAN Workbench.exe`, `KAN Worker.exe`, `_internal`, `configs` and all supplied resources together. Do not copy only the main EXE.

## 3. Launch and create a project

Run the extracted `KAN Workbench.exe`. The application starts its Worker when needed. Create a project in a separate writable directory, such as `D:\ADC-Projects\Pipelined-Demo\`.

Keep original captures accessible: projects can reference external data. Follow the [quick start](quick-start.md) once the project opens.

> Get `examples/pipelined/` from the v3.4.1 documentation bundle described below. Existing v3.3.1 application assets contain the earlier examples; see [example data](../examples/README.md).

## 4. Choose a device

Use `cpu` for the first run. NVIDIA acceleration requires a compatible GPU and driver. When using `auto`, inspect the actual device at task start because it may fall back to CPU.

| Item | Known conditions |
| --- | --- |
| System | Windows x64; v3.3.1 was tested on Windows 11 Pro 10.0.26200 |
| Included runtime | Python, PyTorch 2.10.0, CUDA Runtime 12.8 and cuDNN 9.10.2 in v3.3.1 |
| GPU | Compatible hardware and driver; see the [tested environment](../CHANGELOG.md) |
| Resources | Allow space for downloads, extraction, projects and results; memory needs depend on the task |

These are recorded test conditions, not universal minimum requirements. See [troubleshooting · 中文](troubleshooting.zh-CN.md) for startup, runtime and device errors.

## 5. Add hardware tools only when needed

RTL simulation and synthesis require external tools. ASIC workflows use WSL2 and a separate extension; allow at least 20 GiB for installation plus space for task outputs. Run the extension's complete self-check. See the [hardware guide · 中文](hardware.zh-CN.md).

Before changing an existing installation, read [upgrades and backups · 中文](upgrade.zh-CN.md).


## Get the current tutorial and data

Download `Auto-ADC-Calibration-v3.4.1-Documentation.zip` and `SHA256SUMS.txt` from the [v3.4.1 documentation release](https://github.com/UESTC-MSDC/auto-adc-calibration/releases/tag/v3.4.1). Verify the ZIP with `Get-FileHash` as above, then extract it into a separate documentation directory. Open `index.html` for offline reading; `downloads/` contains the two Chinese PDFs and `examples/pipelined/` contains the six-column tutorial data.

**Check:** four files in `raw-train`, only capture 003 in `raw-test`. Documentation v3.4.1 and application v3.3.1 are separate downloads. The application's older two-column example is not the six-stage dataset. **Code → Download ZIP** also retrieves the repository documentation and examples, but does not include the application.
