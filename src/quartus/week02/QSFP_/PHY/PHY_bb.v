
module PHY (
	rx_analogreset_ch0,
	rx_analogreset_ch1,
	rx_analogreset_ch2,
	rx_analogreset_ch3,
	rx_cal_busy_ch0,
	rx_cal_busy_ch1,
	rx_cal_busy_ch2,
	rx_cal_busy_ch3,
	rx_cdr_refclk0,
	rx_clkout_ch0,
	rx_clkout_ch1,
	rx_clkout_ch2,
	rx_clkout_ch3,
	rx_control_ch0,
	rx_control_ch1,
	rx_control_ch2,
	rx_control_ch3,
	rx_coreclkin_ch0,
	rx_coreclkin_ch1,
	rx_coreclkin_ch2,
	rx_coreclkin_ch3,
	rx_digitalreset_ch0,
	rx_digitalreset_ch1,
	rx_digitalreset_ch2,
	rx_digitalreset_ch3,
	rx_is_lockedtodata_ch0,
	rx_is_lockedtodata_ch1,
	rx_is_lockedtodata_ch2,
	rx_is_lockedtodata_ch3,
	rx_is_lockedtoref_ch0,
	rx_is_lockedtoref_ch1,
	rx_is_lockedtoref_ch2,
	rx_is_lockedtoref_ch3,
	rx_parallel_data_ch0,
	rx_parallel_data_ch1,
	rx_parallel_data_ch2,
	rx_parallel_data_ch3,
	rx_serial_data_ch0,
	rx_serial_data_ch1,
	rx_serial_data_ch2,
	rx_serial_data_ch3,
	tx_analogreset_ch0,
	tx_analogreset_ch1,
	tx_analogreset_ch2,
	tx_analogreset_ch3,
	tx_cal_busy_ch0,
	tx_cal_busy_ch1,
	tx_cal_busy_ch2,
	tx_cal_busy_ch3,
	tx_clkout_ch0,
	tx_clkout_ch1,
	tx_clkout_ch2,
	tx_clkout_ch3,
	tx_control_ch0,
	tx_control_ch1,
	tx_control_ch2,
	tx_control_ch3,
	tx_coreclkin_ch0,
	tx_coreclkin_ch1,
	tx_coreclkin_ch2,
	tx_coreclkin_ch3,
	tx_digitalreset_ch0,
	tx_digitalreset_ch1,
	tx_digitalreset_ch2,
	tx_digitalreset_ch3,
	tx_enh_data_valid_ch0,
	tx_enh_data_valid_ch1,
	tx_enh_data_valid_ch2,
	tx_enh_data_valid_ch3,
	tx_err_ins_ch0,
	tx_err_ins_ch1,
	tx_err_ins_ch2,
	tx_err_ins_ch3,
	tx_parallel_data_ch0,
	tx_parallel_data_ch1,
	tx_parallel_data_ch2,
	tx_parallel_data_ch3,
	tx_serial_clk0_ch0,
	tx_serial_clk0_ch1,
	tx_serial_clk0_ch2,
	tx_serial_clk0_ch3,
	tx_serial_data_ch0,
	tx_serial_data_ch1,
	tx_serial_data_ch2,
	tx_serial_data_ch3,
	unused_rx_control,
	unused_rx_parallel_data,
	unused_tx_control,
	unused_tx_parallel_data,
	rx_seriallpbken_ch0,
	rx_seriallpbken_ch1,
	rx_seriallpbken_ch2,
	rx_seriallpbken_ch3);	

	input		rx_analogreset_ch0;
	input		rx_analogreset_ch1;
	input		rx_analogreset_ch2;
	input		rx_analogreset_ch3;
	output		rx_cal_busy_ch0;
	output		rx_cal_busy_ch1;
	output		rx_cal_busy_ch2;
	output		rx_cal_busy_ch3;
	input		rx_cdr_refclk0;
	output		rx_clkout_ch0;
	output		rx_clkout_ch1;
	output		rx_clkout_ch2;
	output		rx_clkout_ch3;
	output	[7:0]	rx_control_ch0;
	output	[7:0]	rx_control_ch1;
	output	[7:0]	rx_control_ch2;
	output	[7:0]	rx_control_ch3;
	input		rx_coreclkin_ch0;
	input		rx_coreclkin_ch1;
	input		rx_coreclkin_ch2;
	input		rx_coreclkin_ch3;
	input		rx_digitalreset_ch0;
	input		rx_digitalreset_ch1;
	input		rx_digitalreset_ch2;
	input		rx_digitalreset_ch3;
	output		rx_is_lockedtodata_ch0;
	output		rx_is_lockedtodata_ch1;
	output		rx_is_lockedtodata_ch2;
	output		rx_is_lockedtodata_ch3;
	output		rx_is_lockedtoref_ch0;
	output		rx_is_lockedtoref_ch1;
	output		rx_is_lockedtoref_ch2;
	output		rx_is_lockedtoref_ch3;
	output	[63:0]	rx_parallel_data_ch0;
	output	[63:0]	rx_parallel_data_ch1;
	output	[63:0]	rx_parallel_data_ch2;
	output	[63:0]	rx_parallel_data_ch3;
	input		rx_serial_data_ch0;
	input		rx_serial_data_ch1;
	input		rx_serial_data_ch2;
	input		rx_serial_data_ch3;
	input		tx_analogreset_ch0;
	input		tx_analogreset_ch1;
	input		tx_analogreset_ch2;
	input		tx_analogreset_ch3;
	output		tx_cal_busy_ch0;
	output		tx_cal_busy_ch1;
	output		tx_cal_busy_ch2;
	output		tx_cal_busy_ch3;
	output		tx_clkout_ch0;
	output		tx_clkout_ch1;
	output		tx_clkout_ch2;
	output		tx_clkout_ch3;
	input	[7:0]	tx_control_ch0;
	input	[7:0]	tx_control_ch1;
	input	[7:0]	tx_control_ch2;
	input	[7:0]	tx_control_ch3;
	input		tx_coreclkin_ch0;
	input		tx_coreclkin_ch1;
	input		tx_coreclkin_ch2;
	input		tx_coreclkin_ch3;
	input		tx_digitalreset_ch0;
	input		tx_digitalreset_ch1;
	input		tx_digitalreset_ch2;
	input		tx_digitalreset_ch3;
	input		tx_enh_data_valid_ch0;
	input		tx_enh_data_valid_ch1;
	input		tx_enh_data_valid_ch2;
	input		tx_enh_data_valid_ch3;
	input		tx_err_ins_ch0;
	input		tx_err_ins_ch1;
	input		tx_err_ins_ch2;
	input		tx_err_ins_ch3;
	input	[63:0]	tx_parallel_data_ch0;
	input	[63:0]	tx_parallel_data_ch1;
	input	[63:0]	tx_parallel_data_ch2;
	input	[63:0]	tx_parallel_data_ch3;
	input		tx_serial_clk0_ch0;
	input		tx_serial_clk0_ch1;
	input		tx_serial_clk0_ch2;
	input		tx_serial_clk0_ch3;
	output		tx_serial_data_ch0;
	output		tx_serial_data_ch1;
	output		tx_serial_data_ch2;
	output		tx_serial_data_ch3;
	output	[47:0]	unused_rx_control;
	output	[255:0]	unused_rx_parallel_data;
	input	[35:0]	unused_tx_control;
	input	[255:0]	unused_tx_parallel_data;
	input		rx_seriallpbken_ch0;
	input		rx_seriallpbken_ch1;
	input		rx_seriallpbken_ch2;
	input		rx_seriallpbken_ch3;
endmodule
