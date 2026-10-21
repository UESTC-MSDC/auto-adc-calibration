# Auto ADC Calibration

A Windows workbench for ADC digital calibration: prepare raw codes, train models, and compare spectra, SNDR and SFDR on held-out captures. Optional workflows cover model search, pruning, quantization and hardware evaluation.

[简体中文](README.zh-CN.md) · [Download](https://github.com/UESTC-MSDC/auto-adc-calibration/releases/latest) · [Quick start](docs/quick-start.md) · [Issues](https://github.com/UESTC-MSDC/auto-adc-calibration/issues)

Current release: **0.0.0**. The Windows x64 application uses native compiled modules to protect its implementation. This repository contains public documentation and simulation examples; application source remains private. Usage is governed by the [license](LICENSE.txt).

## Get started

1. Follow [installation](docs/installation.md) to download and extract the Windows x64 application, then run `KAN Workbench.exe`.
2. Open `Documentation/index.html` in the extracted directory. The package includes offline pages, the reviewed quick-start and user-guide PDFs, and matching sample data.
3. Follow the [quick start](docs/quick-start.md) for your first calibration, then use the [user guide](docs/user-guide.zh-CN.md) for your own ADC data.

No separate Python, MATLAB or CUDA development toolkit is needed. GPU execution requires a compatible NVIDIA GPU and driver.

## Documentation

| Document | Purpose |
| --- | --- |
| [Installation](docs/installation.md) | Download, verify and launch |
| [Quick start](docs/quick-start.md) | Complete the supplied calibration example |
| [User guide · 中文](docs/user-guide.zh-CN.md) | Calibrate and evaluate your own ADC data |
| [Reference · 中文](docs/reference.zh-CN.md) | Input formats, settings and hardware workflows |
| [Troubleshooting · 中文](docs/troubleshooting.zh-CN.md) | Resolve installation, GPU, data and training issues |
| [Examples and experiment records](examples/README.md) | Matching data, generator, settings and results |

Git keeps Markdown and its supporting materials. Offline HTML and the unchanged guide PDFs are distributed in the application and documentation release packages. See the [change history](CHANGELOG.md), [English license translation](docs/license.en.md) and [third-party notices](THIRD_PARTY_NOTICES.md).

## Contact

Use [Issues](https://github.com/UESTC-MSDC/auto-adc-calibration/issues) for product feedback and [644245542@qq.com](mailto:644245542@qq.com) for licensing or private inquiries. See [contribution guidance](CONTRIBUTING.md) and [security reporting](.github/SECURITY.md).

Copyright © 2026 Mixed-Signal and SoC Design Center (MSDC), UESTC · Author: Chen Zihan
