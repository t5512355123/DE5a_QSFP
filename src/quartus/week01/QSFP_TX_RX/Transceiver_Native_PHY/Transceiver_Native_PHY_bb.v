
module Transceiver_Native_PHY (
	rx_analogreset,
	rx_cal_busy,
	rx_cdr_refclk0,
	rx_clkout,
	rx_coreclkin,
	rx_datak,
	rx_digitalreset,
	rx_disperr,
	rx_errdetect,
	rx_is_lockedtodata,
	rx_is_lockedtoref,
	rx_parallel_data,
	rx_patterndetect,
	rx_polinv,
	rx_runningdisp,
	rx_serial_data,
	rx_syncstatus,
	tx_analogreset,
	tx_cal_busy,
	tx_clkout,
	tx_coreclkin,
	tx_datak,
	tx_digitalreset,
	tx_parallel_data,
	tx_serial_clk0,
	tx_serial_data,
	unused_rx_parallel_data,
	unused_tx_parallel_data,
	rx_seriallpbken);	

	input	[3:0]	rx_analogreset;
	output	[3:0]	rx_cal_busy;
	input		rx_cdr_refclk0;
	output	[3:0]	rx_clkout;
	input	[3:0]	rx_coreclkin;
	output	[7:0]	rx_datak;
	input	[3:0]	rx_digitalreset;
	output	[7:0]	rx_disperr;
	output	[7:0]	rx_errdetect;
	output	[3:0]	rx_is_lockedtodata;
	output	[3:0]	rx_is_lockedtoref;
	output	[63:0]	rx_parallel_data;
	output	[7:0]	rx_patterndetect;
	input	[3:0]	rx_polinv;
	output	[7:0]	rx_runningdisp;
	input	[3:0]	rx_serial_data;
	output	[7:0]	rx_syncstatus;
	input	[3:0]	tx_analogreset;
	output	[3:0]	tx_cal_busy;
	output	[3:0]	tx_clkout;
	input	[3:0]	tx_coreclkin;
	input	[7:0]	tx_datak;
	input	[3:0]	tx_digitalreset;
	input	[63:0]	tx_parallel_data;
	input	[3:0]	tx_serial_clk0;
	output	[3:0]	tx_serial_data;
	output	[399:0]	unused_rx_parallel_data;
	input	[439:0]	unused_tx_parallel_data;
	input	[3:0]	rx_seriallpbken;
endmodule
