# 來源、匯入與同步說明

## 來源位置

| 來源 | 用途 | 匯入位置 |
|---|---|---|
| C:\Users\zenbook\我的雲端硬碟\碩士班研究資料\02_QSFP 光傳輸 | 週次簡報、PDF、Google Slides shortcut、Guideline | docs/presentations/ 與 docs/sources/ |
| /home/b10504072/02_QSFP/ on Pain | Quartus project tree、HDL、QSYS、QSF、SDC、bitstream、編譯快照 | src/quartus/ |
| GitHub git@github.com:t5512355123/DE5a_QSFP.git | 版本控制 remote | Git remote origin |

## 匯入結果

Pain 原始樹匯入前後的 read-only inventory：

- files: 2,451
- bytes: 458,875,491
- top-level project roots:
  - week01/QSFP_TX_RX/QSFP_TX_RX.qpf
  - week02/QSFP_/QSFP.qpf
  - week03/QSFP_4PORT/QSFP_4PORT.qpf
  - week03/QSFP_JTAG/QSFP.qpf

src/quartus/ 內的每個 Quartus 專案保留原始的週次與專案資料夾名稱，沒有將 top-level HDL 改寫成新的統一命名。這樣做是為了降低重新開啟 .qpf 時相對路徑失效的風險。

本機 Google Drive 中的 `.gslides` 是 shortcut metadata。複製到新的 `02_QSFP_git/docs/presentations/` 後，Drive 對整理後的 shortcut 產生新的文件 ID；`docs/presentation-index.md` 同時記錄整理後與原始來源 ID，PPTX/PDF 則以檔案 hash 保留匯入時的內容。

## Git index 與完整 snapshot 的差異

本機與 Pain 的 02_QSFP_git 會保存完整的匯入樹，包含當時存在的 db、incremental_db、synth、report、.sof 與 SignalTap 產物。Git index 透過 .gitignore 排除主要的 Quartus cache、database、synthesis output 與重建報告，因為它們可以由 .qpf/.qsf/.qsys/.sdc 與 HDL 重建，而且將數千個中間檔放入 Git 會讓版本比較與 clone 變得困難。

以下會保留在 Git index：

- top-level 與自訂 HDL：.v、.sv、.vhd
- Quartus project/constraint/IP definition：.qpf、.qsf、.qsys、.sdc、.qip、.tcl、.sopcinfo
- debug/deployment deliverables：.stp、.sof
- 簡報與證據：.pptx、.pdf、.png、.jpg、Markdown、TXT

以下通常只保留在本機/Pain 的完整 snapshot，不進 Git index：

- src/quartus/**/db/
- src/quartus/**/incremental_db/
- src/quartus/**/synth/
- Quartus reports、maps、fit database、temporary qws/qmsg/cache files

## 同步原則

1. 先在本機檢查 Git status 與文件，再 push GitHub。
2. 本機與 Pain 的工作樹應以同一個 commit 作為文件與 HDL 的版本基準。
3. 若 Pain 直接修改 Quartus 專案，先把它拉回本機、建立 commit，再把新的完整樹同步回 Pain 的 02_QSFP_git。
4. 不要在 source tree 中手動刪除編譯產物來「清理」本機；清理規則已由 Git ignore 與文件說明分開管理。
