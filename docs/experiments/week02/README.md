# Week 02 - Enhanced PCS 與 FIFO backpressure

研究重點：

- 改用 Enhanced PCS，資料路徑改成 64-bit。
- 發現 64-bit input 與 66-bit PHY framing 造成 Tx FIFO 週期性滿載。
- 以 tx_enh_fifo_pfull 暫停 data valid，來源簡報記錄測試成功率 100%。
- 量測 internal loopback 26 cycles / 約 161.2 ns。
- 觀察外部接線 latency 與每 lane clock skew。

主要專案：[QSFP.qpf](../../../src/quartus/week02/QSFP_/QSFP.qpf)  
主要紀錄：[experiment-log.md 的週 02](../../experiment-log.md#週-02---qsfp-417)  
簡報：[QSFP-4-17.pptx](../../presentations/week02/QSFP-4-17.pptx)  
PDF：[QSFP-4-17.pdf](../../presentations/week02/QSFP-4-17.pdf)
