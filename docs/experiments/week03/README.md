# Week 03 - Cable delay、multi-port 與 P2P exploration

研究重點：

- 以 internal 26-cycle baseline 與 external 27-cycle observation 推導銅線額外 delay 約 6.2 ns。
- 保存 QSFP_4PORT 與 QSFP_JTAG/BRAM 兩個週 03 Quartus project。
- 比較 Riffa/Standard DMA 與 SPDK + VFIO P2P 方向。
- FPGA 端延伸到 Avalon、BRAM、JTAG debug。

主要專案：

- [QSFP_4PORT.qpf](../../../src/quartus/week03/QSFP_4PORT/QSFP_4PORT.qpf)
- [QSFP JTAG.qpf](../../../src/quartus/week03/QSFP_JTAG/QSFP.qpf)

主要紀錄：[experiment-log.md 的週 03](../../experiment-log.md#週-03---qsfp-p2p-arch-424)  
簡報：[QSFP-4-24.pptx](../../presentations/week03/QSFP-4-24.pptx)
