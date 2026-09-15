	PHY u0 (
		.rx_analogreset          (<connected-to-rx_analogreset>),          //          rx_analogreset.rx_analogreset
		.rx_cal_busy             (<connected-to-rx_cal_busy>),             //             rx_cal_busy.rx_cal_busy
		.rx_cdr_refclk0          (<connected-to-rx_cdr_refclk0>),          //          rx_cdr_refclk0.clk
		.rx_clkout               (<connected-to-rx_clkout>),               //               rx_clkout.clk
		.rx_control              (<connected-to-rx_control>),              //              rx_control.rx_control
		.rx_coreclkin            (<connected-to-rx_coreclkin>),            //            rx_coreclkin.clk
		.rx_digitalreset         (<connected-to-rx_digitalreset>),         //         rx_digitalreset.rx_digitalreset
		.rx_enh_data_valid       (<connected-to-rx_enh_data_valid>),       //       rx_enh_data_valid.rx_enh_data_valid
		.rx_enh_fifo_full        (<connected-to-rx_enh_fifo_full>),        //        rx_enh_fifo_full.rx_enh_fifo_full
		.rx_enh_fifo_rd_en       (<connected-to-rx_enh_fifo_rd_en>),       //       rx_enh_fifo_rd_en.rx_enh_fifo_rd_en
		.rx_is_lockedtodata      (<connected-to-rx_is_lockedtodata>),      //      rx_is_lockedtodata.rx_is_lockedtodata
		.rx_is_lockedtoref       (<connected-to-rx_is_lockedtoref>),       //       rx_is_lockedtoref.rx_is_lockedtoref
		.rx_parallel_data        (<connected-to-rx_parallel_data>),        //        rx_parallel_data.rx_parallel_data
		.rx_serial_data          (<connected-to-rx_serial_data>),          //          rx_serial_data.rx_serial_data
		.rx_seriallpbken         (<connected-to-rx_seriallpbken>),         //         rx_seriallpbken.rx_seriallpbken
		.tx_analogreset          (<connected-to-tx_analogreset>),          //          tx_analogreset.tx_analogreset
		.tx_cal_busy             (<connected-to-tx_cal_busy>),             //             tx_cal_busy.tx_cal_busy
		.tx_clkout               (<connected-to-tx_clkout>),               //               tx_clkout.clk
		.tx_control              (<connected-to-tx_control>),              //              tx_control.tx_control
		.tx_coreclkin            (<connected-to-tx_coreclkin>),            //            tx_coreclkin.clk
		.tx_digitalreset         (<connected-to-tx_digitalreset>),         //         tx_digitalreset.tx_digitalreset
		.tx_enh_data_valid       (<connected-to-tx_enh_data_valid>),       //       tx_enh_data_valid.tx_enh_data_valid
		.tx_enh_fifo_full        (<connected-to-tx_enh_fifo_full>),        //        tx_enh_fifo_full.tx_enh_fifo_full
		.tx_enh_fifo_pfull       (<connected-to-tx_enh_fifo_pfull>),       //       tx_enh_fifo_pfull.tx_enh_fifo_pfull
		.tx_parallel_data        (<connected-to-tx_parallel_data>),        //        tx_parallel_data.tx_parallel_data
		.tx_serial_clk0          (<connected-to-tx_serial_clk0>),          //          tx_serial_clk0.clk
		.tx_serial_data          (<connected-to-tx_serial_data>),          //          tx_serial_data.tx_serial_data
		.unused_rx_control       (<connected-to-unused_rx_control>),       //       unused_rx_control.unused_rx_control
		.unused_rx_parallel_data (<connected-to-unused_rx_parallel_data>), // unused_rx_parallel_data.unused_rx_parallel_data
		.unused_tx_control       (<connected-to-unused_tx_control>),       //       unused_tx_control.unused_tx_control
		.unused_tx_parallel_data (<connected-to-unused_tx_parallel_data>)  // unused_tx_parallel_data.unused_tx_parallel_data
	);

