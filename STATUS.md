# 目前狀態

最後更新：2026-09-15  
最新研究證據：週 03，簡報標題為 QSFP+, P2P Arch. 4/24  
本次整理：將本機與 Pain 的來源合併到 02_QSFP_git，建立 Git 專案文件與可追溯目錄。

## 完成度摘要

| 工作項目 | 狀態 | 判定依據 |
|---|---|---|
| DE5a Arria 10 GX / QSFP+ 基本架構 | 已建立 | 週 01 簡報、四個 .qsf 的 device 與 top-level entity |
| Si5340A 產生 644.53125 MHz reference clock | 已建立於 HDL | QSFP top-level 中的 SI5340A 設定與 PLL 連接 |
| ATX PLL 產生 5156.25 MHz serial clock | 已建立於 HDL | 週 01 至週 03 top-level 註解與 QSYS |
| Standard PCS 基本 TX/RX | 週 01 已完成 baseline | QSFP_TX_RX 專案與週 01 實驗記錄 |
| 兩台 DE5a 同步與丟包修正 | 來源記錄為已解決 | QSFP-A 四 lane pre-emphasis first post-tap = 18 |
| Enhanced PCS、64-bit parallel path | 已建立 | 週 02/03 HDL 連接與 PHY_enhance_PCS.qsys |
| Tx FIFO header overhead 問題 | 來源記錄為已解決 | tx_enh_fifo_pfull 造成暫停送資料，簡報記錄成功率 100% |
| 內部 loopback latency | 已量測 | 26 cycles、約 161.2 ns |
| 外部接線 latency | 已記錄但量測定義混合 | 3,895,059 cycles、約 24.15 ms，含 reset time |
| 銅線額外 delay | 已量測於來源簡報 | 27 - 26 = 1 cycle、約 6.2 ns |
| 四個 QSFP port 的 Quartus 專案 | 已有編譯產出，硬體結果待補測 | QSFP_4PORT.qpf 與 .sof 存在，來源沒有完整四 port 測試表 |
| JTAG/BRAM debug path | 已有設計與編譯產出 | QSFP_JTAG 專案含 JTAS_RAM、JTAG 與 In-System Sources and Probes |
| lane clock skew compensation | 未完成 | 週 02 已觀察 Tx lane 2 快 1 cycle、Rx lane 間不同 |
| 兩台 DE5a encoder/decoder 協作測試 | 未完成 | 週 02 future work |
| SSD -> FPGA P2P、SPDK、VFIO | 研究方向，未完成 | 週 03 為架構比較與環境說明，尚無實測 |
| 長時間 BER / raw packet log / application throughput | 未完成 | 來源資料未提供可重算的原始 log |

## 最新可交付結果

目前最適合用來回看單 QSFP-A Enhanced PCS 資料路徑的是：

    src/quartus/week02/QSFP_/QSFP.qpf

目前最適合用來研究四 port 與 debug 擴充的是：

    src/quartus/week03/QSFP_4PORT/QSFP_4PORT.qpf
    src/quartus/week03/QSFP_JTAG/QSFP.qpf

## 接續工作順序

1. 補上兩台 DE5a 的固定測試條件與長時間計數 log。
2. 在每個 lane 加上可匯出的 error counter、valid counter 與 sequence number。
3. 釐清 lane skew 是否需要 TOP-level FIFO，並建立可重現的 CDC/deskew testbench。
4. 完成 PC -> encoder -> QSFP -> decoder -> PC 的 end-to-end 測試。
5. 在有可用 SSD 的空 server 上再驗證 VFIO/P2P，不要把唯一工作碟直接拿來做破壞性實驗。
