# Auto ADC Calibration

A Windows desktop workbench for ADC digital calibration. Import ADC codes, prepare data, train a model, and compare spectra, SNDR and SFDR on independent captures.

[简体中文](README.zh-CN.md) · [Install](docs/installation.md) · [Tutorial](docs/quick-start.md) · [User guide · 中文](docs/user-guide.zh-CN.md) · [Get help](SUPPORT.md)

For students and researchers running calibration experiments with single-tone or dual-tone captures. The application accepts stage codes or final output codes, and the basic workflow runs on CPU. Optional workflows include model search, pruning, quantization and RTL / ASIC assessment with external tools.

This repository contains documentation, simulation examples and release assets. **Application source code is not published; the software uses a proprietary license.** See the [license](LICENSE.txt) and [English translation](docs/license.en.md) for permitted uses.

## Get started

1. **Install the application.** Follow the [installation guide](docs/installation.md), extract the [v3.3.1 Windows application](https://github.com/UESTC-MSDC/auto-adc-calibration/releases/tag/v3.3.1), and run `KAN Workbench.exe`.
2. **Get the tutorial data.** Download the [v3.4.1 documentation bundle](https://github.com/UESTC-MSDC/auto-adc-calibration/releases/tag/v3.4.1), including offline pages, PDFs and `examples/pipelined/`.
3. **Complete one calibration.** Follow the [pipelined ADC tutorial](docs/quick-start.md): train on four simulated captures, then test capture 003 kept separate.

You will obtain a prepared dataset, a saved model and a per-capture test report. The tutorial explains the six CSV columns, the settings, the spectra and the files to keep. No Python or MATLAB installation is needed.

**Version note:** v3.4.1 updates documentation and examples; it does not contain a new application build. The downloadable application remains v3.3.1, whose archives contain older documentation. GitHub's **Source code (zip / tar.gz)** files are snapshots of this documentation repository, not runnable applications.

## Workflow

| Step | Input | Output |
| --- | --- | --- |
| Preprocess | Raw ADC codes and capture settings | Checked data, model inputs and references |
| Train | Prepared dataset and training settings | Training curves and a saved model |
| Test independently | Saved model and unseen raw captures | Spectra and per-capture SNDR / SFDR |
| Optimize, if needed | Baseline model and model-selection data | Search, pruning or quantization results |
| Assess hardware, if needed | Compatible model and external tools | Reports for completed RTL / ASIC stages |

Simulation examples teach the workflow. For measured ADC evaluation, retain independent captures and record the application version, sample rate, read range and model. Software evaluation, RTL simulation and measured silicon results have different scopes.

## Documentation

| Task | Guide |
| --- | --- |
| First experiment | [Installation](docs/installation.md) → [Pipelined ADC tutorial](docs/quick-start.md) |
| Follow screenshots or look up settings | [Illustrated tutorial · 中文](docs/quick-start.zh-CN.md) · [User guide · 中文](docs/user-guide.zh-CN.md) |
| Import captures | [Data format · 中文](docs/data-format.zh-CN.md) · [Examples](examples/README.md) |
| Assess hardware | [Hardware · 中文](docs/hardware.zh-CN.md) |
| Fix a problem or upgrade | [Troubleshooting · 中文](docs/troubleshooting.zh-CN.md) · [Upgrades · 中文](docs/upgrade.zh-CN.md) |
| Ask a question or improve a guide | [Support](SUPPORT.md) · [Contributing](CONTRIBUTING.md) |
| Check versions or cite the software | [Changelog](CHANGELOG.md) · [Citation metadata](CITATION.cff) |

## License and contact

Personal noncommercial use and noncommercial academic work are permitted. Commercial use and enterprise-sponsored research, including enterprise-sponsored university projects, require separate written authorization. Share official links; redistribution, mirroring or repackaging requires separate authorization. The [Chinese license](LICENSE.txt) is authoritative; an [English translation](docs/license.en.md) is provided. Third-party components retain their own license rights; see [third-party notices](THIRD_PARTY_NOTICES.md).

For ordinary questions, open an [issue](https://github.com/UESTC-MSDC/auto-adc-calibration/issues). Read [Support](SUPPORT.md) before sharing data, and report security concerns privately as described in [Security](SECURITY.md).

Copyright © 2026 电子科技大学模数混合与SoC芯片设计中心（MSDC）

Author: 陈梓函 · Use and licensing enquiries: [644245542@qq.com](mailto:644245542@qq.com)
