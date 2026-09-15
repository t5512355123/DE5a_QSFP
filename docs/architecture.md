# 硬體架構與速率

## 系統概念

DE5a 的 Arria 10 GX 透過 Si5340A、ATX PLL 與 Arria 10 Native PHY 形成 QSFP+ 四 lane TX/RX。PHY 內部包含 PCS 數位處理與 PMA 類比收發。週 01 使用 Standard PCS baseline；週 02 起主要版本改用 Enhanced PCS，並由 top-level HDL 管理 64-bit data valid 與 FIFO backpressure。

## 資料與時脈路徑

    Si5340A
        |
        | I2C configuration from 50 MHz control clock
        v
    644.53125 MHz QSFP reference clock
        |
        v
    ATX PLL -> 5156.25 MHz serial clock
        |
        v
    Native PHY
        |  Enhanced PCS: 64-bit data + 2-bit header framing
        |  PMA: serializer / CDR / deserializer
        v
    QSFP+ lane 0..3, nominally 10.3125 Gb/s per lane
        |
        v
    RX parallel data, per-lane clock, valid and lock status
        |
        v
    Increment/checker, counters, LEDs, SignalTap/JTAG

可渲染的速率圖源在 [rate-path.mmd](figures/rate-path.mmd)。

## 速率表

| 層級 | 計算或來源記錄 | 數值 | 意義 |
|---|---|---:|---|
| Si5340A reference | 來源簡報與 HDL 註解 | 644.53125 MHz | 給 ATX PLL 與 CDR 參考 |
| ATX PLL output | 來源簡報與 HDL 註解 | 5156.25 MHz | TX serial clock |
| 單 lane line rate | 5156.25 MHz x DDR 2 | 10.3125 Gb/s | QSFP+ 每 lane 名義線速 |
| 四 lane line rate | 10.3125 x 4 | 41.25 Gb/s | raw serial aggregate |
| Parallel datapath | 週 02 簡報；約 161 MHz x 64 bits x 4 | 約 41.216 Gb/s | TOP-level parallel datapath 記錄 |
| 64b/66b payload estimate | 41.25 x 64/66 | 約 40.00 Gb/s | 只是假設連續有效資料、無 stall 的理論推導 |

最後一列是數學推導，不是簡報中宣稱的應用層量測。實際有效吞吐還會受 valid/stall、reset、alignment、lane skew、packet framing 與上層介面影響。

## Enhanced PCS 的背壓點

週 02/03 top-level 的核心控制概念如下：

1. 每個 lane 預備 64-bit parallel data。
2. PHY 內部將資料包裝成 66-bit framing。
3. 當 tx_enh_fifo_pfull 拉高，top-level 暫停送 data，保持 data 不變並送 idle/control。
4. FIFO 下降到可接受水位後，恢復 tx_enh_data_valid。

對應的來源：

- [週 02 QSFP.v](../src/quartus/week02/QSFP_/QSFP.v)
- [週 03 QSFP_JTAG QSFP.v](../src/quartus/week03/QSFP_JTAG/QSFP.v)
- [週 03 QSFP_4PORT QSFP_4PORT.v](../src/quartus/week03/QSFP_4PORT/QSFP_4PORT.v)

## Board / project variants

| 版本 | Top-level | PHY | 外部 port | 額外功能 |
|---|---|---|---|---|
| week01 | QSFP_TX_RX | Transceiver_Native_PHY | QSFP-A | Standard PCS baseline、雙 Si5340 controller |
| week02 | QSFP | PHY_enhance_PCS + PHY | QSFP-A | 64-bit path、FIFO pfull、四 lane checker |
| week03 4PORT | QSFP_4PORT | PHY | QSFP-A/B/C/D | 多 port 結構，需補四 port 硬體驗證 |
| week03 JTAG | QSFP | PHY_enhance_PCS + PHY | QSFP-A | JTAS_RAM、JTAG、In-System Sources and Probes |

## 重要設定差異

週 01 的 QSFP-A 四 lane pre-emphasis first post-tap 設為 18，見 [week01 QSF](../src/quartus/week01/QSFP_TX_RX/QSFP_TX_RX.qsf#L361)。週 02 與週 03 單 QSFP-A 版本記錄為 20，見 [week02 QSF](../src/quartus/week02/QSFP_/QSFP.qsf#L154) 與 [week03 JTAG QSF](../src/quartus/week03/QSFP_JTAG/QSFP.qsf#L154)。週 03 4-port 版本則只對 QSFP-B 的 assignment 啟用，A/C/D 在 QSF 中標為 disable，見 [week03 4PORT QSF](../src/quartus/week03/QSFP_4PORT/QSFP_4PORT.qsf#L1649)。
