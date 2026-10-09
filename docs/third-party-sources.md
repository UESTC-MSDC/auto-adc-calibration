# 第三方源码与库替换 / Third-party sources and library replacement

[第三方声明](../THIRD_PARTY_NOTICES.md) · [组件清单](../component-inventory.json)

本页适用于随软件分发的 Qt、PySide6 与 Shiboken 6.9.3。应用使用独立动态库，未修改这些上游组件的源码。第三方源码按其自身许可提供；应用原创源码不在这些附件内。

## 对应源码

与软件同一 [Release](https://github.com/UESTC-MSDC/auto-adc-calibration/releases) 提供以下两个附件及 SHA-256 校验文件。下载或使用第三方源码无需另行购买本软件授权。

| 附件 | 内容 | 大小（字节） |
| --- | --- | --- |
| `qt-everywhere-src-6.9.3.tar.xz` | Qt 6.9.3 完整上游源码、许可和构建文件 | 1,102,876,596 |
| `pyside-setup-everywhere-src-6.9.3.tar.xz` | PySide6 / Shiboken 6.9.3 上游源码、许可和构建文件 | 16,663,380 |

[源码清单](../third-party/qt-sources.json) 记录上游地址、大小和 SHA-256。两份附件与上游文件一致，没有本项目补丁。完整 Qt 源码中包含未被应用采用的模块，不能从源码附件推断所有模块均已装入应用。

上游下载：[Qt 6.9.3](https://download.qt.io/archive/qt/6.9/6.9.3/single/) · [PySide6 6.9.3](https://download.qt.io/official_releases/QtForPython/pyside6/PySide6-6.9.3-src/)。若同版附件不可用，请通过 [644245542@qq.com](mailto:644245542@qq.com) 联系维护者取得对应材料。

## 自行构建与替换

1. 备份整个软件目录并关闭主程序及 Worker，在单独副本中操作。
2. 参考源码内的构建说明和 [Qt for Windows 构建指南](https://doc.qt.io/qt-6/windows-building.html)，使用兼容的 Windows x64 MSVC、CMake 与 Ninja 工具链。保持共享库构建；Qt 模块包括 Core、Gui、Widgets、Network、Svg 和 OpenGL，以及对应的 Windows 平台和图像插件。
3. 若修改 Python 绑定，按 [Qt for Python 构建指南](https://doc.qt.io/qtforpython-6/building_from_source/index.html) 构建 PySide6/Shiboken，保持版本 6.9.3、Windows x64 架构及 CPython 3.12 兼容性。以源码内的构建文件为准。
4. 将兼容的 Qt DLL 和插件替换到软件副本的 `_internal/PySide6/` 相应位置；绑定位于该目录，Shiboken 位于 `_internal/shiboken6/`。成组替换相关库，保留目录关系，避免混用不兼容的版本、架构或调试/发行构建。
5. 启动主程序，检查窗口、SVG 图表及一次样例任务。若自行构建的库不兼容，可恢复备份。发行包没有用于禁止兼容 LGPL 库替换的应用签名校验；校验清单用于辨别原始附件，修改后的文件散列自然会不同。

使用者保留 LGPL 所允许的修改、库替换和为调试修改后的库而进行必要逆向分析的权利。软件自身的非商业条款不削减这些权利。替换库的兼容性需要自行验证；官方测试记录针对随包上游二进制。

## English

The matching Qt and PySide6/Shiboken 6.9.3 source archives, including upstream build files, are offered alongside the Windows binary in the same Release. The archives are unmodified and verified against upstream SHA-256 values; this project applies no patches to these libraries. See the [source manifest](../third-party/qt-sources.json).

The application uses shared libraries. Back up the complete application, close both executables, build compatible Windows x64 release libraries using the upstream instructions, and replace the corresponding DLLs/plugins under `_internal/PySide6/` and bindings under `_internal/shiboken6/`. Keep Qt/PySide6/Shiboken versions and the CPython 3.12 ABI compatible. Test the modified copy before further use. LGPL modification, replacement and necessary debugging rights are preserved; the application's own noncommercial terms do not remove those rights.
