# Week 01 - Standard PCS baseline

研究重點：

- 建立 DE5a QSFP+ 基本 TX/RX。
- 完成 Si5340 controller、ATX PLL、PHY reset、Native PHY。
- 以 Standard PCS、16-bit parallel path 做初始 10G-class lane。
- 發現兩台 DE5a 外部連線不同步與丟包。
- 將 QSFP-A TX 四 lane 的 first post-tap 設為 18，來源簡報記錄同步改善。

主要專案：[QSFP_TX_RX.qpf](../../../src/quartus/week01/QSFP_TX_RX/QSFP_TX_RX.qpf)  
主要紀錄：[experiment-log.md 的週 01](../../experiment-log.md#週-01---qsfp-410)  
簡報：[QSFP-4-10.pptx](../../presentations/week01/QSFP-4-10.pptx)
