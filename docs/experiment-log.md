# QSFP+ 實驗紀錄

## 紀錄範圍與閱讀方式

本文件依照本機研究簡報的週次重建開發過程。原始研究材料只有週 01、週 02、週 03 的投影片與 Pain 上的 Quartus 專案，因此凡是沒有 raw log 或獨立重跑證據的地方，都標成「來源記錄」或「待補測」，不把簡報中的 future work 寫成已完成。

研究板卡：Terasic DE5a，核心器件為 Arria 10 GX 10AX115N2F45E1SG。  
研究目標：在 DE5a 的 QSFP+ 介面上建立四 lane TX/RX datapath，先完成板間傳輸與資料驗證，再延伸到多 port、JTAG/BRAM debug 與 SSD-to-FPGA P2P。

## 開發演進總覽

    週 01 Standard PCS baseline
        |
        | 兩台 DE5a 同步失敗，資料丟包
        | 調整 TX pre-emphasis first post-tap = 18
        v
    週 02 Enhanced PCS + 64-bit path
        |
        | 66-bit framing 造成 Tx FIFO 週期性滿載
        | 使用 tx_enh_fifo_pfull 施加 backpressure
        v
    週 03 cable delay / lane skew / multi-port / P2P exploration

## 週 01 - QSFP+ 4/10

### 目標

- Survey QSFP/QSFP+ 與 DE5a 能支援的模式。
- 用 Terasic System Builder 建立 top-level wrapper。
- 完成 Si5340A clock configuration、ATX PLL、PHY Reset Controller 與 Transceiver Native PHY。
- 先以 Basic/Custom Standard PCS 建立 10G-class 單 lane TX/RX。

### 架構與速率

簡報記錄 Si5340A 產生 644.53125 MHz reference clock。ATX PLL 由此產生 5156.25 MHz serial clock，PHY 以 DDR serializer 方式形成約 10.3125 Gb/s 的單 lane line rate。QSFP+ 四 lane 的名義 aggregate line rate 為 4 x 10.3125 = 41.25 Gb/s。

對應的 Quartus 原始專案：

- [QSFP_TX_RX.qpf](../src/quartus/week01/QSFP_TX_RX/QSFP_TX_RX.qpf)
- [QSFP_TX_RX.v](../src/quartus/week01/QSFP_TX_RX/QSFP_TX_RX.v)
- [QSFP_TX_RX.qsf](../src/quartus/week01/QSFP_TX_RX/QSFP_TX_RX.qsf)
- [週 01 簡報](presentations/week01/QSFP-4-10.pptx)

### 問題：兩台 DE5a 無法同步

簡報指出兩台 DE5a 透過外部實體線路時，接收資料持續丟包。投影片將問題連結到實體線路過長與電壓衰減。這是當時的硬體觀察與分析，沒有附上可重算的示波器/BER raw log。

### 修正

QSFP-A 四條 TX lane 的 Quartus assignment 將 Transmitter Pre-Emphasis First Post-Tap Magnitude 設為 18：

- [QSFP_TX_RX.qsf:361](../src/quartus/week01/QSFP_TX_RX/QSFP_TX_RX.qsf#L361)
- [QSFP_TX_RX.qsf:362](../src/quartus/week01/QSFP_TX_RX/QSFP_TX_RX.qsf#L362)
- [QSFP_TX_RX.qsf:363](../src/quartus/week01/QSFP_TX_RX/QSFP_TX_RX.qsf#L363)
- [QSFP_TX_RX.qsf:364](../src/quartus/week01/QSFP_TX_RX/QSFP_TX_RX.qsf#L364)
- [pre-emphasis 證據圖](figures/source/week01/slide-23-image-01.png)

週 01 的研究結論是「調整後可以讓兩台 DE5a PHY 同步」。後續工作寫為使用更強的除頻器，因為自寫 PE 可能因時脈過快而 violation；此項未在來源中看到完成記錄。

## 週 02 - QSFP+ 4/17

### 目標與設計變更

- 改用 Enhanced PCS。
- 將 TOP-level TX/RX data path 改成 64-bit parallel data。
- Tx 四條 lane 使用不同累加量，Rx 逐 lane 檢查新資料是否等於舊資料加上 lane-specific 數字。
- 將除頻後的核心操作時脈記錄為約 161 MHz。

對應的 Quartus 原始專案：

- [QSFP.qpf](../src/quartus/week02/QSFP_/QSFP.qpf)
- [QSFP.v](../src/quartus/week02/QSFP_/QSFP.v)
- [Enhanced PCS QSYS](../src/quartus/week02/QSFP_/PHY_enhance_PCS.qsys)
- [週 02 PPTX](presentations/week02/QSFP-4-17.pptx)
- [週 02 PDF](presentations/week02/QSFP-4-17.pdf)

### 問題：64-bit input 與 66-bit framing 的落差

TOP-level 每個 cycle 打入 64-bit，但 Enhanced PCS 在 PHY 內部加入 2-bit header，實際 framing 變成 66-bit。在傳輸線每 cycle 只能消化 64-bit parallel data 的條件下，簡報記錄 Tx FIFO 約每 32 個 cycle 會滿，造成資料丟包。

### 修正：Tx FIFO backpressure

HDL 將 PHY 的 tx_enh_fifo_pfull 接回送資料控制邏輯。當 pfull 拉高時，保持資料不變並將 tx_enh_data_valid 清為 0，讓 PHY 先補 header；pfull 清除後才恢復送 data。可直接從 [QSFP.v:258](../src/quartus/week02/QSFP_/QSFP.v#L258) 與 [QSFP.v:266](../src/quartus/week02/QSFP_/QSFP.v#L266) 看到這段控制。

週 02 簡報記錄該測試成功率為 100%。這個結果代表當時四 lane increment/checker 案例沒有觀察到錯誤，不代表已完成長時間 BER 或應用層 throughput characterization。

### Latency 量測

| 條件 | counter 差值 | 時脈週期 | 換算結果 | 備註 |
|---|---:|---:|---:|---|
| 內部 serial loopback，rx_seriallpbken = 4'b1111 | 26 cycles | 6.2 ns/cycle | 約 161.2 ns | 不經外部銅線 |
| 外部接線 | 3,895,059 cycles | 6.2 ns/cycle | 約 24.15 ms | 包含設備 reset time 與銅線 delay |

證據在 [週 02 簡報第 12、13 張](presentations/week02/QSFP-4-17.pptx) 與 [SignalTap 圖](figures/source/week02/slide-12-image-02.png)。若要把外部 latency 當成可比較的傳輸延遲，下一版必須把 reset、link training、clock lock 與 steady-state data path 分開量測。

### Lane skew

週 02 觀察到 Tx lane 2 比較快 1 cycle，Rx 每條 lane 的時脈相位也不同。這是週 02 已知的設計風險，並在週 02 future work 提出在 TOP-level 增加 FIFO 處理 clock-domain crossing 或 lane alignment。來源沒有顯示該 FIFO 已完成。

## 週 03 - QSFP+, P2P Arch. 4/24

### 線材 delay

週 03 將外部量測 counter 差值記為 0x5D - 0x42 = 27 cycles，和週 02 的內部 loopback baseline 26 cycles 相減，得到銅線額外 delay 1 cycle。Guideline 將 1 cycle 換算為 6.2 ns，因此來源記錄的 cable delay 為約 6.2 ns。

- [週 03 PPTX](presentations/week03/QSFP-4-24.pptx)
- [0x5D / 0x42 量測圖](figures/source/week03/slide-04-image-01.png)
- [原始 Guideline](sources/guideline-original.txt)

這個數字是「外部條件減內部基準」的結果，不能解讀成光纖/銅線的獨立 VNA 或示波器 propagation-delay characterization。

### Multi-port 與 JTAG/BRAM

Pain 上的週 03 有兩個專案：

- [QSFP_4PORT.qpf](../src/quartus/week03/QSFP_4PORT/QSFP_4PORT.qpf)：加入 QSFP-A/B/C/D 四個外部 port。QSF 對 QSFP-B 啟用 pre-emphasis 20，A/C/D 的同一組 assignment 在檔案中標成 disable，這是目前版本的重要差異。
- [QSFP.qpf](../src/quartus/week03/QSFP_JTAG/QSFP.qpf)：保留單 QSFP-A Enhanced PCS，並加入 JTAS_RAM、JTAG、In-System Sources and Probes，作為 debug/BRAM 方向。

兩個專案都有 .sof 與編譯報告快照，但來源簡報沒有提供四 port 的完整硬體通道矩陣，因此「已有可燒錄產出」與「四 port 已完成驗證」必須分開描述。

### SSD -> FPGA 與 P2P 研究方向

週 03 後半討論 Standard DMA/Riffa 與 P2P DMA 的差異，並記錄 SPDK + VFIO 方向。投影片提到 Riffa 2.2.2、PCIe Gen2 x8、SSD Gen4 x4 限制，也提出在空 server 上測試 VFIO。這些內容屬於架構研究與 future work，不是本 repository 已完成的 QSFP throughput 實測。

## 目前尚未完成的實驗

1. 把 lane skew 轉成可重現的量測：每 lane 同時記錄 valid、sequence number、lock、error counter。
2. 確認 TOP-level FIFO/CDC 是否必要，並用 testbench 驗證 reset、lock、calibration、skew、backpressure 的邊界條件。
3. 建立兩台 DE5a 的 encoder/decoder end-to-end：PC -> upstream encoder -> QSFP+ -> downstream decoder -> PC。
4. 增加長時間資料流、BER、packet loss、error-free seconds 與有效 payload throughput 紀錄。
5. 在不影響唯一工作碟的前提下完成 SSD/FPGA VFIO/P2P proof of concept。

## 證據可信度註記

- 週次成果與數值主要來自簡報與 Guideline，已保留原始檔。
- HDL/QSF 設定可以直接查核，重要行號已在文件中連結。
- 本次整理沒有重新編譯或重新燒錄，因此不宣稱當前環境已重新通過硬體測試。
- 簡報中出現的理論速率、Riffa/SPDK 比較與 P2P 架構圖，應與實際量測結果分開引用。
