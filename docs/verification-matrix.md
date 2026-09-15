# 驗證矩陣

本表把來源簡報的觀察與 HDL/QSF 可查核設定分開。狀態「來源記錄」代表數值來自投影片或 Guideline，尚未在本次整理中重新執行。

| ID | 測試/檢查 | 條件 | 預期 | 來源結果 | 狀態 | 證據 |
|---|---|---|---|---|---|---|
| V01 | QSFP clock chain | Si5340A -> 644.53125 MHz -> ATX PLL 5156.25 MHz | PHY lock and serial clock present | 週 01 至週 03 都沿用 | 已建立 | top-level HDL、QSYS |
| V02 | Standard PCS baseline | 週 01，Basic/Custom Standard PCS | 單 lane TX/RX 可工作 | 曾出現板間同步與丟包問題 | baseline | [week01 project](../src/quartus/week01/QSFP_TX_RX/QSFP_TX_RX.qpf) |
| V03 | Pre-emphasis correction | QSFP-A TX lanes, first post-tap = 18 | 改善兩台 DE5a 同步 | 簡報記錄調整後可同步 | 來源記錄 | [QSF lines 361-364](../src/quartus/week01/QSFP_TX_RX/QSFP_TX_RX.qsf#L361) |
| V04 | Enhanced PCS framing | 64-bit input plus 2-bit header | 不因 framing 落差丟包 | 初始會約每 32 cycles 使 Tx FIFO full | 問題已定位 | [week02 log](experiment-log.md#週-02---qsfp-417) |
| V05 | Tx backpressure | tx_enh_fifo_pfull controls valid | FIFO pfull 時暫停送 data | 簡報記錄 Tx FIFO full 不再拉高 | 來源記錄 | [QSFP.v control](../src/quartus/week02/QSFP_/QSFP.v#L258) |
| V06 | Four-lane data checker | Tx lanes add lane-specific value; Rx compares | counter continues on correct data | 簡報記錄成功率 100% | 來源記錄 | [week02 deck](presentations/week02/QSFP-4-17.pptx) |
| V07 | Internal loopback latency | rx_seriallpbken = 4'b1111 | measure steady-state path | 26 cycles, about 161.2 ns | 已量測於來源 | [week02 evidence](figures/source/week02/slide-12-image-02.png) |
| V08 | External link latency | two devices plus external cable | separate link and reset costs | 3,895,059 cycles, about 24.15 ms | 定義需拆分 | [week02 deck](presentations/week02/QSFP-4-17.pptx) |
| V09 | Cable delay | external 27 cycles minus internal 26 cycles | incremental cable delay | 1 cycle, about 6.2 ns | 來源記錄 | [week03 evidence](figures/source/week03/slide-04-image-01.png) |
| V10 | Lane skew | observe Tx/Rx per-lane clocks | quantify and align lanes | Tx lane 2 one cycle faster, Rx lanes differ | 未完成 | [week02 deck](presentations/week02/QSFP-4-17.pptx) |
| V11 | Four QSFP ports | week03 QSFP_4PORT | all A/B/C/D link and checker | .sof/build artifacts exist; no full matrix | 待補測 | [4PORT project](../src/quartus/week03/QSFP_4PORT/QSFP_4PORT.qpf) |
| V12 | JTAG/BRAM debug | week03 QSFP_JTAG | read/write debug path | design and build artifacts exist | 待實機確認 | [JTAG project](../src/quartus/week03/QSFP_JTAG/QSFP.qpf) |
| V13 | End-to-end host path | PC -> encoder -> QSFP -> decoder -> PC | application data round-trip | future work only | 未完成 | [week02 deck](presentations/week02/QSFP-4-17.pptx) |
| V14 | P2P/VFIO | SSD/FPGA mapping on empty server | direct PCIe data path | architecture discussion only | 未完成 | [week03 deck](presentations/week03/QSFP-4-24.pptx) |

## 測試紀錄格式

後續每次實驗請至少新增一個 Markdown 或 CSV record，包含：

- date/time、board serial/hostname、Quartus version、project commit
- module/port/lane、QSFP module、線材與 loopback mode
- reset/lock/calibration 狀態
- input pattern、packet/word count、valid/error counter
- measured latency 的起點與終點
- raw artifact 路徑與產生方式
- 結論、異常與下一步
