# Simulation

目前從 Pain 匯入的來源樹沒有獨立、可直接執行的 simulation testbench。這個資料夾保留作為後續驗證入口。

建議優先建立：

- 64-bit per-lane increment/checker model
- Enhanced PCS tx_enh_fifo_pfull backpressure corner cases
- reset / lock / calibration sequence
- lane skew 與 deskew FIFO
- 兩台 DE5a encoder/decoder protocol model
