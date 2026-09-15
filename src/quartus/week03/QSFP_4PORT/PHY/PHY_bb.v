
module PHY (
	rx_analogreset,
	rx_cal_busy,
	rx_cdr_refclk0,
	rx_clkout,
	rx_control,
	rx_coreclkin,
	rx_digitalreset,
	rx_enh_data_valid,
	rx_enh_fifo_full,
	rx_enh_fifo_rd_en,
	rx_is_lockedtodata,
	rx_is_lockedtoref,
	rx_parallel_data,
	rx_serial_data,
	rx_seriallpbken,
	tx_analogreset,
	tx_cal_busy,
	tx_clkout,
	tx_control,
	tx_coreclkin,
	tx_digitalreset,
	tx_enh_data_valid,
	tx_enh_fifo_full,
	tx_enh_fifo_pfull,
	tx_parallel_data,
	tx_serial_clk0,
	tx_serial_data,
	unused_rx_control,
	unused_rx_parallel_data,
	unused_tx_control,
	unused_tx_parallel_data);	

	input	[3:0]	rx_analogreset;
	output	[3:0]	rx_cal_busy;
	input		rx_cdr_refclk0;
	output	[3:0]	rx_clkout;
	output	[7:0]	rx_control;
	input	[3:0]	rx_coreclkin;
	input	[3:0]	rx_digitalreset;
	output	[3:0]	rx_enh_data_valid;
	output	[3:0]	rx_enh_fifo_full;
	input	[3:0]	rx_enh_fifo_rd_en;
	output	[3:0]	rx_is_lockedtodata;
	output	[3:0]	rx_is_lockedtoref;
	output	[255:0]	rx_parallel_data;
	input	[3:0]	rx_serial_data;
	input	[3:0]	rx_seriallpbken;
	input	[3:0]	tx_analogreset;
	output	[3:0]	tx_cal_busy;
	output	[3:0]	tx_clkout;
	input	[7:0]	tx_control;
	input	[3:0]	tx_coreclkin;
	input	[3:0]	tx_digitalreset;
	input	[3:0]	tx_enh_data_valid;
	output	[3:0]	tx_enh_fifo_full;
	output	[3:0]	tx_enh_fifo_pfull;
	input	[255:0]	tx_parallel_data;
	input	[3:0]	tx_serial_clk0;
	output	[3:0]	tx_serial_data;
	output	[71:0]	unused_rx_control;
	output	[255:0]	unused_rx_parallel_data;
	input	[63:0]	unused_tx_control;
	input	[255:0]	unused_tx_parallel_data;
endmodule
