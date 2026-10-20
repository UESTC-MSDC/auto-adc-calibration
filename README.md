# Auto ADC Calibration

A Windows workbench for ADC digital calibration. Prepare raw codes, train a model on an NVIDIA GPU, and compare spectra, SNDR and SFDR on held-out captures.

[简体中文](README.zh-CN.md) · [Download](https://github.com/UESTC-MSDC/auto-adc-calibration/releases/latest) · [Quick start](docs/quick-start.md) · [Issues](https://github.com/UESTC-MSDC/auto-adc-calibration/issues)

## Features

- Stage-code and final-output-code input; single-tone and dual-tone captures; single-channel and interleaved ADCs.
- Input validation, automatic capture-level test splitting, model training and per-capture evaluation.
- Model search, pruning, bit-width selection and quantization-aware training.
- RTL export, simulation and synthesis, with a separate extension for ASIC workflows.

This repository distributes documentation, simulation examples and release assets. Application source remains private and the [existing proprietary license](LICENSE.txt) applies.

## Get started

1. Follow [installation](docs/installation.md) to download and extract the Windows x64 application, then run `KAN Workbench.exe`.
2. Use **Code → Download ZIP** to obtain the current documentation and `examples/tutorial/raw/`. Use these guides and their matching data together when the application's bundled documentation differs.
3. Follow the [quick start](docs/quick-start.md): set a 20% test fraction, preprocess all captures, and select `cuda` for training when a compatible NVIDIA GPU is available.
4. Test through the generated `raw_test` entry and retain the model and complete report.

No separate Python, MATLAB or CUDA development toolkit is needed. GPU execution requires a compatible NVIDIA GPU and driver.

## Documentation

| Category | Document | Scope |
| --- | --- | --- |
| 1. Project home | This page | Purpose, features and navigation |
| 2. Installation | [Installation](docs/installation.md) | Download, checksums, extraction and GPU checks |
| 3. Quick start | [First calibration](docs/quick-start.md) | A complete sample workflow |
| 4. Full tutorial | [User guide · 中文](docs/user-guide.zh-CN.md) | Own data, comparisons, optimization and backups |
| 5. Configuration and features | [Reference · 中文](docs/reference.zh-CN.md) | Data formats, settings and hardware workflows |
| 6. FAQ and troubleshooting | [Troubleshooting · 中文](docs/troubleshooting.zh-CN.md) | Installation, CUDA, data and training issues |
| 7. Change history | [CHANGELOG](CHANGELOG.md) | Application and documentation changes |
| 8. License | [LICENSE](LICENSE.txt) | Usage terms; [English translation](docs/license.en.md) |
| 9. Contributing | [CONTRIBUTING](CONTRIBUTING.md) | Documentation, bug reports and feature requests |

[Example data and recorded validation](examples/README.md) accompany the tutorial. See [third-party notices](THIRD_PARTY_NOTICES.md) for dependency materials. Open `index.html` for offline reading; the two Chinese guides are available as PDFs in `downloads/`.

## Contact

Use [Issues](https://github.com/UESTC-MSDC/auto-adc-calibration/issues) for product feedback and [644245542@qq.com](mailto:644245542@qq.com) for licensing or private inquiries. Follow the [security reporting instructions](SECURITY.md) for sensitive findings.

Copyright © 2026 Mixed-Signal and SoC Design Center (MSDC), UESTC · Author: Chen Zihan
