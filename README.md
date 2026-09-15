# DE5a QSFP+ 光傳輸

本 repository 整合了本機「02_QSFP 光傳輸」與 Pain 上「/home/b10504072/02_QSFP/」的研究資料，目標是讓沒有參與過本專案的人可以從實驗動機、硬體架構、版本差異、量測證據一路追到目前進度。

專案名稱：DE5a_QSFP  
GitHub remote：git@github.com:t5512355123/DE5a_QSFP.git  
本機整理位置：C:\Users\zenbook\我的雲端硬碟\碩士班研究資料\02_QSFP_git  
Pain 整理位置：/home/b10504072/02_QSFP_git  
本次整理日期：2026-09-15  
來源資料最新研究紀錄：週 03 簡報 QSFP+, P2P Arch. 4/24

## 先看這裡

1. [目前完成度與未完成工作](STATUS.md)
2. [完整實驗時間線](docs/experiment-log.md)
3. [硬體與資料路徑](docs/architecture.md)
4. [驗證矩陣與證據位置](docs/verification-matrix.md)
5. [簡報、PDF、Google Slides 索引](docs/presentation-index.md)

## Debug 流程：Q/A 問題速查

先依照「時脈/lock → 同步 → 丟包 → latency → lane skew → 多 port/JTAG → host P2P」的順序排查。下面的 `Qxx` 是曾經遇到的現象，`Axx` 是當時採用的處理方式；括號中的狀態用來區分「來源已記錄」與「本專案已重新驗證」。

### Q01：兩台 DE5a 透過外部 QSFP+ 線路時無法同步，還會持續丟包

**A01：解法**：先檢查線路長度與電壓衰減，再調整 QSFP-A TX 四條 lane 的 `Transmitter Pre-Emphasis First Post-Tap Magnitude`。週 01 的有效設定是 `18`，簡報記錄調整後兩台 PHY 可以同步。這是來源實驗紀錄，尚未在本次整理重新量測；對應 [週 01 QSF](src/quartus/week01/QSFP_TX_RX/QSFP_TX_RX.qsf#L361) 與 [pre-emphasis 證據圖](docs/figures/source/week01/slide-23-image-01.png)。（來源記錄：已解決）

### Q02：為什麼 reference clock、PLL clock、QSFP 線速看起來不一樣

**A02：解法**：按照 clock chain 檢查，不要把不同層級的頻率混在一起：`Si5340A 644.53125 MHz → ATX PLL 5156.25 MHz → DDR 10.3125 Gb/s/lane → 4 lanes = 41.25 Gb/s raw line rate`。週 02 記錄的 parallel datapath 是約 `161 MHz × 64 bits × 4 lanes = 41.216 Gb/s`，不是應用層有效吞吐量；完整推導在 [硬體架構與速率](docs/architecture.md)。（已建立，未重新編譯）

### Q03：Enhanced PCS 送 64-bit data，為什麼 Tx FIFO 約每 32 cycles 就滿並造成丟包

**A03：解法**：PHY 的 Enhanced PCS 會在 64-bit data 外加入 2-bit header，不能無條件每 cycle 持續送資料。監看每個 lane 的 `tx_enh_fifo_pfull`；拉高時將 `phy_tx_enh_data_valid_w[i]` 拉低、保持 data，送 control/idle，FIFO 回到可接受水位後再恢復 valid。對應 [week 02 QSFP.v 背壓邏輯](src/quartus/week02/QSFP_/QSFP.v#L258) 與 [Enhanced PCS 實驗紀錄](docs/experiment-log.md#週-02---qsfp-417)。（來源記錄：已定位並記錄 100% 成功案例）

### Q04：內部 loopback 與外部接線的 latency 為什麼差很多

**A04：解法**：先分開量測 steady-state datapath 與 reset/link training。內部 serial loopback `rx_seriallpbken = 4'b1111` 的來源結果是 `26 cycles ≈ 161.2 ns`；外部接線曾記錄 `3,895,059 cycles ≈ 24.15 ms`，但包含設備 reset time 與銅線 delay，不能直接當成純傳輸 latency。量測定義與建議分拆方式見 [實驗紀錄 latency 段落](docs/experiment-log.md#latency-量測)。（來源記錄：已量測，但外部定義需拆分）

### Q05：如何從 counter 差值判斷銅線額外 delay

**A05：解法**：用相同條件的外部 counter 減去內部 loopback baseline：`0x5D - 0x42 = 27 cycles`，`27 - 26 = 1 cycle`；Guideline 將 1 cycle 換算為約 `6.2 ns`。這只能表示「外部條件相對內部基準多出的差值」，不是獨立的示波器或 VNA 線材 propagation-delay characterization。對應 [週 03 delay 證據圖](docs/figures/source/week03/slide-04-image-01.png)。（來源記錄：已量測）

### Q06：為什麼不同 lane 的 clock/資料不同步，Tx lane 2 還快 1 cycle

**A06：解法**：不要只調整單一 lane 的資料值；先為每個 lane 記錄 valid、sequence number、lock、error counter，再在 TOP-level 加 FIFO/CDC 或 deskew alignment。週 02 只觀察到 Tx lane 2 快 1 cycle、Rx lanes 相位不同，提出了 FIFO 方向但沒有完成紀錄。對應 [lane skew 實驗紀錄](docs/experiment-log.md#lane-skew)。（待補測）

### Q07：有 `QSFP_4PORT` 專案和 `.sof`，是不是代表四個 QSFP port 都驗證完成

**A07：解法**：分開「有編譯/燒錄產出」與「四 port 實機驗證」。目前 week03 4PORT 的 QSF 只啟用 QSFP-B 那組 pre-emphasis assignment，A/C/D 標成 disable；要宣稱完成，仍須逐一記錄 A/B/C/D 的 lock、valid、error、packet 與線材條件。先開啟 [QSFP_4PORT.qpf](src/quartus/week03/QSFP_4PORT/QSFP_4PORT.qpf)，再依 [驗證矩陣](docs/verification-matrix.md) 補測。（待補測）

### Q08：需要觀察 PHY、BRAM 或 JTAG 內部訊號時，要開哪個版本

**A08：解法**：使用 week03 的 `QSFP_JTAG` 版本；它保留單 QSFP-A Enhanced PCS，並加入 `JTAS_RAM`、JTAG 與 In-System Sources and Probes。搭配 `.stp`/SignalTap 觀察 reset、lock、FIFO pfull、lane counter，並把 raw export 與 screenshot 一起放到 `results/`。對應 [QSFP_JTAG.qpf](src/quartus/week03/QSFP_JTAG/QSFP.qpf)。（已有設計與編譯產出，待實機確認）

### Q09：SSD → FPGA 的 P2P、SPDK、VFIO 是否已經是 QSFP 的完成結果

**A09：解法**：目前不是。週 03 只有 Standard DMA/Riffa、P2P DMA、SPDK/VFIO 的架構比較與 future work，沒有可重算的 host throughput 或 VFIO 實測。要繼續時，請在有替代磁碟的空 server 先做非破壞性 proof of concept，不要把唯一工作碟拿來測試。對應 [週 03 P2P 紀錄](docs/experiment-log.md#ssd---fpga-與-p2p-研究方向)。（未完成）

### Q10：從 GitHub clone 後大型 `.pptx`、`.pdf`、`.sof` 或圖片看起來不完整

**A10：解法**：本專案用 Git LFS 管理大型檔案；clone 後先執行 `git lfs install`，再執行 `git lfs pull`。Quartus 的 `db/`、`incremental_db/`、`synth/` 與 reports 則是可重建產物，沒有放入 Git index；原始完整快照仍保留在本機與 Pain。詳見 [.gitattributes](.gitattributes)、[來源與匯入說明](docs/source-provenance.md)。（本機/GitHub 已驗證；Pain 目前尚未安裝 git-lfs）

## 目前可確認的成果

- DE5a 使用 Arria 10 GX，器件為 10AX115N2F45E1SG。
- QSFP+ 以 4 lanes、每 lane 10.3125 Gb/s 的名義線速運作，四 lane 名義 aggregate line rate 為 41.25 Gb/s。
- 設計中記錄的 parallel datapath 為約 161 MHz x 64 bits x 4 lanes = 41.216 Gb/s。這是資料路徑寬度與時脈的推導值，不等同於已量測的應用層吞吐量。
- 週 01 找到兩台 DE5a 連線丟包的修正方向，QSFP-A 四條 TX lane 的 Transmitter Pre-Emphasis First Post-Tap Magnitude 設為 18。
- 週 02 改用 Enhanced PCS，處理 64-bit 資料與 PHY 66-bit framing 的落差，使用 tx_enh_fifo_pfull 暫停送資料；簡報記錄的驗證成功率為 100%。
- 週 02 記錄內部 serial loopback latency 為 26 cycles、約 161.2 ns；外部接線條件記錄為 3,895,059 cycles、約 24.15 ms。外部數值包含不同設備 reset time 與銅線 delay，不能直接當作純線材 propagation delay。
- 週 03 以 26-cycle 內部基準與 27-cycle 外部量測相減，記錄銅線額外 delay 為 1 cycle、約 6.2 ns。
- Pain 上已保存四個 Quartus 專案版本：週 01 TX/RX、週 02 Enhanced PCS、週 03 4-port、週 03 JTAG/BRAM。

「100%」只代表週 02 簡報所述的硬體資料驗證案例；目前沒有在來源資料中找到長時間 BER、原始 packet log、PC-to-PC application throughput 或完整 lane deskew 驗證。因此這些項目仍列為後續工作。

## 資料夾結構

    02_QSFP_git/
    ├── README.md                         專案入口與快速導覽
    ├── STATUS.md                         最新狀態、限制與下一步
    ├── CHANGELOG.md                      本 repository 的整理與版本紀錄
    ├── .gitignore                        Quartus 暫存與可重建產物規則
    ├── .gitattributes                    Git LFS 與文字檔換行規則
    ├── docs/
    │   ├── architecture.md               硬體方塊、時脈與速率推導
    │   ├── experiment-log.md             週 01 至週 03 完整實驗敘事
    │   ├── verification-matrix.md        測試條件、結果與證據
    │   ├── presentation-index.md         PPTX、PDF、Google Slides 對照
    │   ├── source-provenance.md          來源、匯入與同步說明
    │   ├── experiments/                  每週可獨立閱讀的摘要
    │   ├── figures/                      從簡報抽出的證據圖與速率圖源
    │   ├── presentations/                原始研究簡報、PDF 與 Slides shortcut
    │   └── sources/                      原始 Guideline 與來源備份
    ├── results/
    │   ├── measurements/                 預留 raw measurement、SignalTap export
    │   └── plots/                        預留整理後的圖與統計
    ├── scripts/                          結構檢查與維護腳本
    └── src/
        ├── quartus/                      Pain 原始 Quartus 樹，保留相對路徑
        │   ├── week01/QSFP_TX_RX/
        │   ├── week02/QSFP_/
        │   └── week03/QSFP_4PORT/、QSFP_JTAG/
        └── simulation/                   目前尚無獨立 simulation testbench

## 如何選擇 Quartus 專案

| 目的 | 建議開啟的專案 | 說明 |
|---|---|---|
| 回看最初的 Standard PCS TX/RX | src/quartus/week01/QSFP_TX_RX/QSFP_TX_RX.qpf | 週 01 baseline，含 18 pre-emphasis 設定 |
| 重現目前最完整的單 QSFP-A datapath | src/quartus/week02/QSFP_/QSFP.qpf | Enhanced PCS、64-bit parallel、FIFO backpressure |
| 查看四個 QSFP 外部 port 整合 | src/quartus/week03/QSFP_4PORT/QSFP_4PORT.qpf | 四 port 結構，4-port 硬體結果需補測 |
| 查看 JTAG/BRAM debug 版本 | src/quartus/week03/QSFP_JTAG/QSFP.qpf | Enhanced PCS 加上 JTAS_RAM 與 In-System Sources and Probes |

每個專案內的 .qpf、.qsf、.qsys、.sdc 與 top-level HDL 都保留原位置。可以在相應專案資料夾直接用 Quartus 開啟 .qpf，不要從 repository 根目錄猜測相對路徑。

## Toolchain 與重建原則

Pain 的已配置 Quartus 執行檔為 /mnt/ds1515/opt/intelFPGA/17.0/quartus/bin/quartus。重建時應優先使用相容的 Quartus Prime 17.0 與對應 Arria 10 IP library。

原始匯入樹保留完整的 db、incremental_db、synth 與報告檔，以便在本機與 Pain 還原當時狀態。Git index 會依 .gitignore 排除可由 Quartus 重新產生的中間檔，但會保留 HDL、QSF/QPF/QSYS/SDC、SignalTap 設定、簡報證據與現成 .sof bitstream。詳情見 [source provenance](docs/source-provenance.md)。

## 速率圖與證據圖

速率推導的 Mermaid 圖源在 [docs/figures/rate-path.mmd](docs/figures/rate-path.mmd)。從簡報抽出的硬體畫面與 SignalTap/Assignment Editor 證據在 [docs/figures/README.md](docs/figures/README.md)。

```mermaid
flowchart LR
  A["Si5340A<br/>50 MHz control / I2C"] --> B["QSFP reference<br/>644.53125 MHz"]
  B --> C["ATX PLL<br/>5156.25 MHz"]
  C --> D["Native PHY<br/>DDR serializer"]
  D --> E["QSFP+ 4 lanes<br/>10.3125 Gb/s each"]
  E --> F["RX CDR / deserializer<br/>64-bit parallel"]
  F --> G["~161 MHz x 64 bits x 4 lanes<br/>documented parallel datapath"]
```

![QSFP reference-clock setup evidence](docs/figures/source/week01/slide-07-image-01.png)

![Pre-emphasis setting recorded in week 01](docs/figures/source/week01/slide-23-image-01.png)

## 版本控制原則

- 每次修改 HDL、QSF、QSYS 或 SDC 前先建立清楚的 commit。
- commit message 使用「scope: change」格式，例如「week02: gate TX on enhanced PCS FIFO pfull」。
- 硬體結果要同時記錄測試條件、板卡/線材、時間、成功判定方式與原始檔案位置。
- 新增的 raw log 不要只放截圖，優先保存 CSV/JSON/TXT，再放可讀圖。
- 若修改的是簡報內容，保留原始研究檔並在 presentation-index.md 更新版本對照。

## 完整性與限制

本次只整理與補文件，沒有重新編譯 Quartus、重新燒錄 DE5a 或重新執行 P2P/VFIO。文件中的硬體數值來自本機簡報、原始 Guideline 與 Pain 上的 HDL/QSF 設定，並在各節標明「已驗證」、「來源記錄」或「待補測」。
