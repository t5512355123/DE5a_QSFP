# Changelog

## 2026-09-15 - Initial project consolidation

- 建立 02_QSFP_git 本機專案目錄。
- 將 Pain /home/b10504072/02_QSFP/ 的 2,451 個檔案完整匯入 src/quartus/，保留 week 01 至 week 03 與 Quartus 原始相對路徑。
- 匯入本機週 01、週 02、週 03 的 PPTX、週 02 PDF 與 Google Slides shortcut。
- 從簡報抽取關鍵硬體與 SignalTap 圖片到 docs/figures/source/。
- 建立實驗時間線、架構、速率推導、驗證矩陣、目前狀態與來源追溯文件。
- 建立 .gitignore 與 .gitattributes，將可由 Quartus 重建的中間檔排除於 Git index，並用 Git LFS 管理簡報、PDF、bitstream 與證據圖片。
