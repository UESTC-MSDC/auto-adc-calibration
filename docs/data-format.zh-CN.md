# 数据格式

数据格式、编码、交织顺序和训练/测试目录已统一收录在[配置与功能参考：输入格式与数据目录](reference.zh-CN.md#data)。

使用最终输出码字时，每行提供一个十进制整数或固定 N 位二进制字符串。程序自动拆成 N 列位输入，使用自定义列权重，按“检查数据 → 扫描初始权重 → 开始预处理”操作；填写范围和例子见[最终输出码字](reference.zh-CN.md#final-output-codes)。

首次使用见[快速上手](quick-start.zh-CN.md)，迁移自有采集见[用户手册](user-guide.zh-CN.md#data)。
