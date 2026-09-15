# 證據圖索引

這些圖片從原始 PPTX 的指定 slide picture object 抽出，保留作為快速閱讀與 README 附圖。完整上下文仍以 docs/presentations/ 下的原始 PPTX/PDF 為準。

## 速率與硬體設定

| 圖片 | 內容 | 來源 |
|---|---|---|
| [week01 slide 07](source/week01/slide-07-image-01.png) | DE5a System Builder 與 644.53125 MHz QSFP reference clock | QSFP+ 4/10 slide 7 |
| [week01 slide 08](source/week01/slide-08-image-01.png) | DE5a board / QSFP+ configuration context | QSFP+ 4/10 slide 8 |
| [rate-path.mmd](rate-path.mmd) | Si5340A -> ATX PLL -> PHY -> QSFP+ 的速率圖源 | 本次依來源數值整理 |

## 問題定位與修正

| 圖片 | 內容 | 來源 |
|---|---|---|
| [week01 slide 21 image 01](source/week01/slide-21-image-01.png) | 兩台 DE5a 正常/不同步的投影片截圖 | QSFP+ 4/10 slide 21 |
| [week01 slide 23](source/week01/slide-23-image-01.png) | Assignment Editor 中 pre-emphasis first post-tap = 18 | QSFP+ 4/10 slide 23 |
| [week02 slide 10](source/week02/slide-10-image-01.png) | SignalTap/資料驗證畫面 | QSFP+ 4/17 slide 10 |

## Latency、skew 與線材 delay

| 圖片 | 內容 | 來源 |
|---|---|---|
| [week02 slide 12](source/week02/slide-12-image-02.png) | internal loopback counter/latency evidence | QSFP+ 4/17 slide 12 |
| [week02 slide 13](source/week02/slide-13-image-01.png) | external connection latency evidence | QSFP+ 4/17 slide 13 |
| [week02 slide 15](source/week02/slide-15-image-01.jpg) | lane clock skew evidence | QSFP+ 4/17 slide 15 |
| [week03 slide 04](source/week03/slide-04-image-01.png) | 0x5D 與 0x42 counter difference，外部 27 cycles | QSFP+, P2P Arch. 4/24 slide 4 |

## 使用限制

- 圖片是研究簡報中的 evidence crop，不是重新量測或重新繪圖。
- 圖片上的文字與數值應回到相應 slide 交叉閱讀。
- 若要做論文或正式報告，請補上量測時間、儀器/板卡資訊與 raw log，而不是只引用 screenshot。
