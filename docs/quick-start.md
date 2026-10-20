# Quick start: calibrate a simulated ADC

[Installation](installation.md) · [简体中文](quick-start.zh-CN.md) · [Full guide · 中文](user-guide.zh-CN.md)

Use the 20 six-stage pipelined ADC captures in `examples/tutorial/raw/`. Each CSV has 8192 rows. Keep all files in this directory and let preprocessing split complete captures automatically. Use a compatible NVIDIA GPU for training.

## 1. Create a project

Run `KAN Workbench.exe`, create a project in a writable directory, and select `examples/tutorial/raw/` on the data page.

## 2. Preprocess and split

| Setting | Value |
| --- | --- |
| Source / model input | Stage codes / stage codes |
| Encoding / output | Signed decimal / CSV |
| Channels / signal | 1 / single tone |
| Stages / widths | 6 / 2.5, 2.5, 2.5, 2.5, 2.5, 4 bits |
| Interstage gains | 4, 4, 4, 4, 4 |
| Reconstruction / baseline | From interstage gains / initial parameters |
| Sample fraction / calibration quality | 100% / Fast |
| Test fraction | **20%** |

Select **Check data**, then **Start preprocessing**. The result contains `train_16`, `test_4` and `raw_test`. Four complete captures are held out at random; their IDs can change between splits. Keep the original CSV files because `raw_test` references them.

## 3. Train on GPU

Open floating-point model training and confirm that its dataset is `train_16`.

| Setting | Value |
| --- | --- |
| Sample rate / rows per capture | 1 GHz / 8192 |
| Window size / hidden layer | 1 / 12 |
| Grid / spline order / base function | 3 / 2 / identity |
| Epochs / batch size | 120 / 256 |
| Optimizer / learning rate / weight decay | AdamW / 0.001 / 0.0001 |
| Scheduler / cosine horizon / minimum rate | cosine / 120 / 0.000001 |
| Target normalization / early stopping | Enabled / disabled |
| Device / precision / seed | **cuda** / float64 / 1 |

Start training and confirm that its actual device is CUDA. Resolve GPU detection problems before training; see [troubleshooting · 中文](troubleshooting.zh-CN.md#gpu).

## 4. Test the held-out captures

On the test page, select the saved model and the generated **`raw_test`** directory. Confirm single-tone mode, 1 GHz and 8192 rows, then start testing. The report should contain four held-out captures.

The recorded run improved SNDR by **34.15-34.38 dB** and SFDR by **49.16-50.93 dB** across all held-out captures. See the [complete results](../examples/README.md#results). These controlled simulations use low noise and fixed device errors; they do not establish performance on measured ADC data.

## 5. Save the experiment

Keep the project, complete model task, raw captures and test reports together. Continue with the [full guide · 中文](user-guide.zh-CN.md) for your own data, model optimization and project migration.
