# 維護腳本

verify_structure.ps1 只做 read-only 結構檢查，確認必要文件、Quartus project roots 與簡報材料仍存在。

在 PowerShell 中執行：

    powershell -ExecutionPolicy Bypass -File .\scripts\verify_structure.ps1
