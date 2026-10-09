# Auto ADC Calibration

**Automated neural-network-based digital calibration for ADCs**

[简体中文](README.zh-CN.md) · [Installation](docs/installation.md) · [Quick start](docs/quick-start.md) · [User guide · 中文](docs/user-guide.zh-CN.md)

![Auto ADC Calibration — MSDC](assets/banner.svg)

A Windows desktop workbench for ADC data preparation, neural-network calibration, independent evaluation, pruning, quantization and optional hardware assessment. Projects keep models, settings and reports together so that experiments can be reviewed and compared.

## Get started

1. Obtain the complete Windows package from [official Releases](https://github.com/UESTC-MSDC/auto-adc-calibration/releases) and read the notes for that version.
2. Follow the [installation guide](docs/installation.md), extract the entire package and launch `KAN Workbench.exe`.
3. Use the [synthetic examples](examples/README.md) to complete preprocessing, floating-point training and model testing.

This repository contains distribution information and documentation. GitHub's **Source code (zip / tar.gz)** downloads are snapshots of this documentation repository. Download the Windows application asset from Releases.

## Workflow

| Stage | Purpose | Main outputs |
| --- | --- | --- |
| Preprocessing | Select captures and configure the ADC and data format | Prepared data and training/test splits |
| Training / model search | Fit a correction model or search candidate configurations | Checkpoints, training curves and acceptance results |
| Model testing | Evaluate a frozen model on original captures | Spectra and per-capture SNDR / SFDR |
| Pruning / quantization | Prepare a smaller model or a quantized model | Acceptance results and model comparisons |
| RTL / ASIC | Export compatible models and assess hardware with external tools | Functional, area, timing and activity-based power reports |

Hardware workflows require the relevant tools or optional extensions. See the [hardware guide · 中文](docs/hardware.zh-CN.md) for supported paths and evidence limits.

## Documentation

- [Installation](docs/installation.md) and [quick start](docs/quick-start.md).
- [Illustrated tutorial · 中文](docs/quick-start.zh-CN.md) and [reference manual · 中文](docs/user-guide.zh-CN.md).
- [Data format · 中文](docs/data-format.zh-CN.md), [troubleshooting · 中文](docs/troubleshooting.zh-CN.md) and [upgrade guide · 中文](docs/upgrade.zh-CN.md).
- [Version history](CHANGELOG.md), [software license](LICENSE.txt) and [third-party notices](THIRD_PARTY_NOTICES.md).

## Permitted use

Free use is granted for personal noncommercial purposes and noncommercial academic work. Commercial use and enterprise-sponsored research require separate written authorization, including enterprise-sponsored university projects. Share official download links; redistribution, mirroring or repackaging requires separate authorization.

The authoritative terms are in the [Chinese software license](LICENSE.txt); an [English translation](docs/license.en.md) is provided for convenience. Third-party components retain their own license rights. Application source code is not published. This is proprietary software, not an open-source project.

## Interpreting results

Keep final test data separate and report the sampling rate, read range, model and settings. Software evaluation and synthetic examples do not establish measured ADC performance. Functional RTL checks, synthesis estimates, physical implementation results and measured silicon results are distinct forms of evidence.

## Attribution

Copyright © 2026 电子科技大学模数混合与SoC芯片设计中心（MSDC）

Author: 陈梓函 · Contact: [644245542@qq.com](mailto:644245542@qq.com)

For academic work, please record the software version and cite this project. See [CITATION.cff](CITATION.cff).
