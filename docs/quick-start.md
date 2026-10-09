# Quick start

[Home](../README.md) · [中文图解教程](quick-start.zh-CN.md) · [Installation](installation.md)

Start with preprocessing, floating-point training and model testing. Pruning, quantization and hardware assessment are optional later stages.

## 1. Prepare the example

Use `examples/output-codes/raw` from the [synthetic example](../examples/README.md). These are generated 14-bit unsigned, single-channel output codes at 1 GS/s. They are operation examples, not measured ADC data or a performance benchmark.

Create a new project. In the data page, select **final output codes** for the source and **output codes** for the model input. Choose 14 bits, unsigned decimal encoding, one channel and a single-tone signal. Select a 20% test split and run the data check, then preprocessing.

## 2. Configure a short training run

Use the prepared training root, not an inner role folder. Output-code mode may contain only `inputs` and `reference`; a separate `baseline` folder is not required.

| Setting | Tutorial starting value |
| --- | --- |
| Sampling rate | 1 GHz |
| Rows per capture | 32768; the example files are shorter |
| Model settings | Keep the initial defaults |
| Epochs / batch size / learning rate | 20 / 256 / 0.001 |
| Target normalization | Enabled |
| Device / numeric precision | auto / keep the default |

These settings are for a short first run. Use the on-screen compatibility checks when selecting a model for later operations.

## 3. Train and test

Start training. After completion, open model testing and choose the resulting model. Use `raw_test` or separate original captures. Check the signal mode and rows per capture, then start testing.

Review every capture and compare the spectra and SNDR / SFDR before and after calibration. A short training run confirms the workflow; no fixed improvement is promised for this synthetic dataset.

For reference, a completed 20-epoch CPU run of the supplied output-code example used held-out capture 004. SNDR changed from 39.77 to 63.95 dB and SFDR from 39.78 to 73.31 dB. These are synthetic demonstration results, not measurements of a physical ADC; another device or run may differ.

## 4. Optional compression

- **Pruning:** choose the tested model and acceptance data. Gain retention specifies retained calibration improvement, not the percentage of connections. Retest the result.
- **Quantization:** choose a model accepted by the compatibility check. Optionally scan widths, apply a selected plan, start quantization training, inspect final acceptance and retest.
- **Hardware:** use the corresponding accepted integer model and matching references. Generation alone is not completed validation. External tools are required for their respective checks.

Keep final test data separate from data used to select models, pruning settings or bit widths. See the [reference manual · 中文](user-guide.zh-CN.md) and [hardware guide · 中文](hardware.zh-CN.md) for details.

## If something fails

Check the task's error and source model first. Keep the complete distribution together; reduce batch size for memory pressure; retain original data and preprocessing metadata. See [troubleshooting · 中文](troubleshooting.zh-CN.md). Contact information and permitted use are in the [README](../README.md).
