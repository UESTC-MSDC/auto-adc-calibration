# Calibrate a pipelined ADC example

[Install](installation.md) · [Illustrated tutorial · 中文](quick-start.zh-CN.md) · [Example data](../examples/README.md)

Use one six-stage ADC simulation to learn the complete workflow: understand the raw codes, prepare four captures, train a model, test a fifth capture, and save the experiment. The example runs on CPU without Python or MATLAB.

Use `Documentation/examples/pipelined/` from the v3.5.0 application, or `examples/pipelined/` from the [v3.5.0 documentation bundle](https://github.com/UESTC-MSDC/auto-adc-calibration/releases/tag/v3.5.0). Screenshots come from the local v3.4.0 interface; the workflow was also exercised with the public v3.3.1 Worker.

## 1. Understand one row

A pipeline stage makes a coarse decision and passes the remaining signal, or residue, to the next stage. This example has five 2.5-bit stages and a 4-bit backend. One row contains the six decisions for one aligned input sample, not six channels or six successive samples.

The first row of `raw-test/capture_003.csv` is `2,2,0,-2,1,-3`. The first five columns contain integers from -4 to 4; the backend contains integers from -8 to 7. The 2.5-bit label describes the stage specification, not fractional-valued codes. Do not sum the stage labels to infer effective resolution.

The simulation includes fixed gain, comparator and DAC errors, nonlinearity, memory and input noise. All five captures share the same device parameters but use different tone frequencies. The experiment asks whether a model trained on four frequencies improves a fifth, unseen capture.

## 2. Keep training and testing separate

| Folder and file | Approximate tone frequency | Purpose |
| --- | ---: | --- |
| `raw-train/capture_001.csv` | 50.171 MHz | Train |
| `raw-train/capture_002.csv` | 150.024 MHz | Train |
| `raw-test/capture_003.csv` | 250.122 MHz | Test |
| `raw-train/capture_004.csv` | 349.976 MHz | Train |
| `raw-train/capture_005.csv` | 449.829 MHz | Train |

Each CSV has 8192 rows and six signed decimal columns, with no header. The sample rate is 1 GS/s, entered as **1 GHz** in the interface. Do not confuse sample rate with the input tone frequency. Exact frequencies, hashes and simulation conditions are in the [manifest](../examples/pipelined/manifest.json).

**Check:** four files in `raw-train`, only 003 in `raw-test`. Set the preprocessing test fraction to 0% because the test capture is already separate, not because testing is omitted.

## 3. Create a project and select input

Create a project named “Pipelined tutorial” in a writable location separate from the application. In the data page, select `examples/pipelined/raw-train`, not its parent directory. Keep raw CSV files intact.

| Setting | Value |
| --- | --- |
| Source / model input | Stage codes / stage codes |
| Encoding / output format | Signed decimal / CSV |
| Channels / signal | 1 / single tone |
| Test fraction | 0% |

**Check:** only the four training files are selected. Six columns mean six stages of one channel.

## 4. Set ADC parameters and preprocess

| Setting | Value |
| --- | --- |
| Stages | 6 |
| Stage widths | 2.5, 2.5, 2.5, 2.5, 2.5, 4 |
| Nominal interstage gains | 4, 4, 4, 4, 4; none after the final stage |
| Code reconstruction | From interstage gains |
| Baseline | Initial parameters |
| Sample fraction / calibration quality | 100% / Fast |

Use the nominal gain of 4, not the perturbed simulation gain. Run **Check data**, then **Start preprocessing**. Wait for completion and locate the output root.

Preprocessing produces `inputs` (model input), `baseline` (comparison baseline) and `reference` (training reference). For this example the reference is fitted from the training capture's single tone; it is not a separate ideal simulation voltage file. Matching capture numbers identify related files. Keep the complete output root and its saved recipe.

**Check:** four captures were processed, all three role directories exist, and no automatic `raw_test` directory was created. Use the supplied `raw-test` for testing later.

## 5. Train a first model

Open **Configuration → Floating-point model → Model training**. Use the new project's default model settings and the automatically linked dataset, or select the complete preprocessing root. Name the experiment “Pipelined baseline”.

| Setting | Value |
| --- | --- |
| Signal / total sample rate | Single tone / 1 GHz |
| Rows per capture | 8192 |
| Epochs / batch size | 20 / 256 |
| Learning rate / target normalization | 0.001 / enabled |
| Device / precision | cpu / float64 |

Start training and inspect progress on the training page. Loss helps track training error; it need not decrease every epoch and does not establish spectral improvement. Twenty epochs are an introductory run, not an optimization target.

**Check:** the task completed and its model can be selected. Keep the whole task directory, including its checkpoint such as `checkpoints/best.pt`. A file left by a cancelled task is not proof of completion.

## 6. Test capture 003

On the test page, select this experiment's model and `examples/pipelined/raw-test`. Set single-tone mode and 8192 rows. The sample rate comes from the model; verify it is 1 GHz, then start testing. The saved model recipe handles the raw stage codes.

**Check:** results contain only capture 003. If training captures appear, select `raw-test`. If a recipe is missing, restore the complete training task. Do not select the prepared training root or an `inputs` folder as raw test data.

## 7. Read the spectrum and metrics

First confirm capture 003 and the test conditions. Its main tone is near 250.12 MHz; the one-sided spectrum extends to approximately 500 MHz. Look outside the main tone for spurs and the noise background, then compare the numerical metrics.

One run recorded on 2026-10-17 with the v3.3.1 Worker, CPU, 20 epochs and 8192 rows produced:

| Metric | Before | After | Change |
| --- | ---: | ---: | ---: |
| SNDR | 53.37 dB | 55.86 dB | +2.50 dB |
| SFDR | 60.53 dB | 61.96 dB | +1.43 dB |

SNDR measures signal relative to noise plus distortion; SFDR compares it with the largest spur. Higher values are better under the same conditions. Changes are calculated before rounding; see the [full-precision record](../examples/pipelined/manifest.json).

Do not read the per-bin noise-floor level as SNDR. FFT length and analysis conditions affect that visual level. Also distinguish the generator's -3 dBFS relative to its reference voltage from the screenshot's amplitude reference of a peak value of 1 in software input units.

**Check:** you can identify the main tone and describe both metrics. These results demonstrate one simulated test case, not guaranteed gains across frequencies, amplitudes or physical ADCs. If your result differs, check data, model, settings and version before changing parameters.

## 8. Save a reproducible experiment

Use **Open directory** to locate results, then back up the complete project and its external raw data after tasks finish or stop normally. Keep all five CSV files, the complete preprocessing output, the training task and the 003 test report. Record the application and dataset versions, file split, model, CPU, 20 epochs, 1 GHz and 8192 rows.

**Check:** open the project copy and locate its model, raw data and report. Moving a project may not move externally referenced data. Screenshots illustrate a result but do not replace saved task files.

## 9. Use your own captures

Create a new project and reserve final test captures first. Confirm columns, encoding, aligned pipeline stages, tone mode and sample rate. Start with a small dataset and repeat steps 3–8. Final-output-code data and interleaved captures require their own settings; do not reuse this example's six-stage configuration automatically.

Keep the baseline task when trying model search, pruning, quantization or hardware assessment. If capture 003 is used to choose settings, it becomes model-selection data; reserve new captures for final evaluation. Exporting RTL, passing simulation and validating silicon are different stages.

Continue with the [user guide · 中文](user-guide.zh-CN.md), [data format · 中文](data-format.zh-CN.md) or [support guide](../SUPPORT.md).
