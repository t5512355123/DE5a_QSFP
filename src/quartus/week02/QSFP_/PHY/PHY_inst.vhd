	component PHY is
		port (
			rx_analogreset_ch0      : in  std_logic                      := 'X';             -- rx_analogreset
			rx_analogreset_ch1      : in  std_logic                      := 'X';             -- rx_analogreset
			rx_analogreset_ch2      : in  std_logic                      := 'X';             -- rx_analogreset
			rx_analogreset_ch3      : in  std_logic                      := 'X';             -- rx_analogreset
			rx_cal_busy_ch0         : out std_logic;                                         -- rx_cal_busy
			rx_cal_busy_ch1         : out std_logic;                                         -- rx_cal_busy
			rx_cal_busy_ch2         : out std_logic;                                         -- rx_cal_busy
			rx_cal_busy_ch3         : out std_logic;                                         -- rx_cal_busy
			rx_cdr_refclk0          : in  std_logic                      := 'X';             -- clk
			rx_clkout_ch0           : out std_logic;                                         -- clk
			rx_clkout_ch1           : out std_logic;                                         -- clk
			rx_clkout_ch2           : out std_logic;                                         -- clk
			rx_clkout_ch3           : out std_logic;                                         -- clk
			rx_control_ch0          : out std_logic_vector(7 downto 0);                      -- rx_control
			rx_control_ch1          : out std_logic_vector(7 downto 0);                      -- rx_control
			rx_control_ch2          : out std_logic_vector(7 downto 0);                      -- rx_control
			rx_control_ch3          : out std_logic_vector(7 downto 0);                      -- rx_control
			rx_coreclkin_ch0        : in  std_logic                      := 'X';             -- clk
			rx_coreclkin_ch1        : in  std_logic                      := 'X';             -- clk
			rx_coreclkin_ch2        : in  std_logic                      := 'X';             -- clk
			rx_coreclkin_ch3        : in  std_logic                      := 'X';             -- clk
			rx_digitalreset_ch0     : in  std_logic                      := 'X';             -- rx_digitalreset
			rx_digitalreset_ch1     : in  std_logic                      := 'X';             -- rx_digitalreset
			rx_digitalreset_ch2     : in  std_logic                      := 'X';             -- rx_digitalreset
			rx_digitalreset_ch3     : in  std_logic                      := 'X';             -- rx_digitalreset
			rx_is_lockedtodata_ch0  : out std_logic;                                         -- rx_is_lockedtodata
			rx_is_lockedtodata_ch1  : out std_logic;                                         -- rx_is_lockedtodata
			rx_is_lockedtodata_ch2  : out std_logic;                                         -- rx_is_lockedtodata
			rx_is_lockedtodata_ch3  : out std_logic;                                         -- rx_is_lockedtodata
			rx_is_lockedtoref_ch0   : out std_logic;                                         -- rx_is_lockedtoref
			rx_is_lockedtoref_ch1   : out std_logic;                                         -- rx_is_lockedtoref
			rx_is_lockedtoref_ch2   : out std_logic;                                         -- rx_is_lockedtoref
			rx_is_lockedtoref_ch3   : out std_logic;                                         -- rx_is_lockedtoref
			rx_parallel_data_ch0    : out std_logic_vector(63 downto 0);                     -- rx_parallel_data
			rx_parallel_data_ch1    : out std_logic_vector(63 downto 0);                     -- rx_parallel_data
			rx_parallel_data_ch2    : out std_logic_vector(63 downto 0);                     -- rx_parallel_data
			rx_parallel_data_ch3    : out std_logic_vector(63 downto 0);                     -- rx_parallel_data
			rx_serial_data_ch0      : in  std_logic                      := 'X';             -- rx_serial_data
			rx_serial_data_ch1      : in  std_logic                      := 'X';             -- rx_serial_data
			rx_serial_data_ch2      : in  std_logic                      := 'X';             -- rx_serial_data
			rx_serial_data_ch3      : in  std_logic                      := 'X';             -- rx_serial_data
			tx_analogreset_ch0      : in  std_logic                      := 'X';             -- tx_analogreset
			tx_analogreset_ch1      : in  std_logic                      := 'X';             -- tx_analogreset
			tx_analogreset_ch2      : in  std_logic                      := 'X';             -- tx_analogreset
			tx_analogreset_ch3      : in  std_logic                      := 'X';             -- tx_analogreset
			tx_cal_busy_ch0         : out std_logic;                                         -- tx_cal_busy
			tx_cal_busy_ch1         : out std_logic;                                         -- tx_cal_busy
			tx_cal_busy_ch2         : out std_logic;                                         -- tx_cal_busy
			tx_cal_busy_ch3         : out std_logic;                                         -- tx_cal_busy
			tx_clkout_ch0           : out std_logic;                                         -- clk
			tx_clkout_ch1           : out std_logic;                                         -- clk
			tx_clkout_ch2           : out std_logic;                                         -- clk
			tx_clkout_ch3           : out std_logic;                                         -- clk
			tx_control_ch0          : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- tx_control
			tx_control_ch1          : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- tx_control
			tx_control_ch2          : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- tx_control
			tx_control_ch3          : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- tx_control
			tx_coreclkin_ch0        : in  std_logic                      := 'X';             -- clk
			tx_coreclkin_ch1        : in  std_logic                      := 'X';             -- clk
			tx_coreclkin_ch2        : in  std_logic                      := 'X';             -- clk
			tx_coreclkin_ch3        : in  std_logic                      := 'X';             -- clk
			tx_digitalreset_ch0     : in  std_logic                      := 'X';             -- tx_digitalreset
			tx_digitalreset_ch1     : in  std_logic                      := 'X';             -- tx_digitalreset
			tx_digitalreset_ch2     : in  std_logic                      := 'X';             -- tx_digitalreset
			tx_digitalreset_ch3     : in  std_logic                      := 'X';             -- tx_digitalreset
			tx_enh_data_valid_ch0   : in  std_logic                      := 'X';             -- tx_enh_data_valid
			tx_enh_data_valid_ch1   : in  std_logic                      := 'X';             -- tx_enh_data_valid
			tx_enh_data_valid_ch2   : in  std_logic                      := 'X';             -- tx_enh_data_valid
			tx_enh_data_valid_ch3   : in  std_logic                      := 'X';             -- tx_enh_data_valid
			tx_err_ins_ch0          : in  std_logic                      := 'X';             -- tx_err_ins
			tx_err_ins_ch1          : in  std_logic                      := 'X';             -- tx_err_ins
			tx_err_ins_ch2          : in  std_logic                      := 'X';             -- tx_err_ins
			tx_err_ins_ch3          : in  std_logic                      := 'X';             -- tx_err_ins
			tx_parallel_data_ch0    : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- tx_parallel_data
			tx_parallel_data_ch1    : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- tx_parallel_data
			tx_parallel_data_ch2    : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- tx_parallel_data
			tx_parallel_data_ch3    : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- tx_parallel_data
			tx_serial_clk0_ch0      : in  std_logic                      := 'X';             -- clk
			tx_serial_clk0_ch1      : in  std_logic                      := 'X';             -- clk
			tx_serial_clk0_ch2      : in  std_logic                      := 'X';             -- clk
			tx_serial_clk0_ch3      : in  std_logic                      := 'X';             -- clk
			tx_serial_data_ch0      : out std_logic;                                         -- tx_serial_data
			tx_serial_data_ch1      : out std_logic;                                         -- tx_serial_data
			tx_serial_data_ch2      : out std_logic;                                         -- tx_serial_data
			tx_serial_data_ch3      : out std_logic;                                         -- tx_serial_data
			unused_rx_control       : out std_logic_vector(47 downto 0);                     -- unused_rx_control
			unused_rx_parallel_data : out std_logic_vector(255 downto 0);                    -- unused_rx_parallel_data
			unused_tx_control       : in  std_logic_vector(35 downto 0)  := (others => 'X'); -- unused_tx_control
			unused_tx_parallel_data : in  std_logic_vector(255 downto 0) := (others => 'X'); -- unused_tx_parallel_data
			rx_seriallpbken_ch0     : in  std_logic                      := 'X';             -- rx_seriallpbken
			rx_seriallpbken_ch1     : in  std_logic                      := 'X';             -- rx_seriallpbken
			rx_seriallpbken_ch2     : in  std_logic                      := 'X';             -- rx_seriallpbken
			rx_seriallpbken_ch3     : in  std_logic                      := 'X'              -- rx_seriallpbken
		);
	end component PHY;

	u0 : component PHY
		port map (
			rx_analogreset_ch0      => CONNECTED_TO_rx_analogreset_ch0,      --      rx_analogreset_ch0.rx_analogreset
			rx_analogreset_ch1      => CONNECTED_TO_rx_analogreset_ch1,      --      rx_analogreset_ch1.rx_analogreset
			rx_analogreset_ch2      => CONNECTED_TO_rx_analogreset_ch2,      --      rx_analogreset_ch2.rx_analogreset
			rx_analogreset_ch3      => CONNECTED_TO_rx_analogreset_ch3,      --      rx_analogreset_ch3.rx_analogreset
			rx_cal_busy_ch0         => CONNECTED_TO_rx_cal_busy_ch0,         --         rx_cal_busy_ch0.rx_cal_busy
			rx_cal_busy_ch1         => CONNECTED_TO_rx_cal_busy_ch1,         --         rx_cal_busy_ch1.rx_cal_busy
			rx_cal_busy_ch2         => CONNECTED_TO_rx_cal_busy_ch2,         --         rx_cal_busy_ch2.rx_cal_busy
			rx_cal_busy_ch3         => CONNECTED_TO_rx_cal_busy_ch3,         --         rx_cal_busy_ch3.rx_cal_busy
			rx_cdr_refclk0          => CONNECTED_TO_rx_cdr_refclk0,          --          rx_cdr_refclk0.clk
			rx_clkout_ch0           => CONNECTED_TO_rx_clkout_ch0,           --           rx_clkout_ch0.clk
			rx_clkout_ch1           => CONNECTED_TO_rx_clkout_ch1,           --           rx_clkout_ch1.clk
			rx_clkout_ch2           => CONNECTED_TO_rx_clkout_ch2,           --           rx_clkout_ch2.clk
			rx_clkout_ch3           => CONNECTED_TO_rx_clkout_ch3,           --           rx_clkout_ch3.clk
			rx_control_ch0          => CONNECTED_TO_rx_control_ch0,          --          rx_control_ch0.rx_control
			rx_control_ch1          => CONNECTED_TO_rx_control_ch1,          --          rx_control_ch1.rx_control
			rx_control_ch2          => CONNECTED_TO_rx_control_ch2,          --          rx_control_ch2.rx_control
			rx_control_ch3          => CONNECTED_TO_rx_control_ch3,          --          rx_control_ch3.rx_control
			rx_coreclkin_ch0        => CONNECTED_TO_rx_coreclkin_ch0,        --        rx_coreclkin_ch0.clk
			rx_coreclkin_ch1        => CONNECTED_TO_rx_coreclkin_ch1,        --        rx_coreclkin_ch1.clk
			rx_coreclkin_ch2        => CONNECTED_TO_rx_coreclkin_ch2,        --        rx_coreclkin_ch2.clk
			rx_coreclkin_ch3        => CONNECTED_TO_rx_coreclkin_ch3,        --        rx_coreclkin_ch3.clk
			rx_digitalreset_ch0     => CONNECTED_TO_rx_digitalreset_ch0,     --     rx_digitalreset_ch0.rx_digitalreset
			rx_digitalreset_ch1     => CONNECTED_TO_rx_digitalreset_ch1,     --     rx_digitalreset_ch1.rx_digitalreset
			rx_digitalreset_ch2     => CONNECTED_TO_rx_digitalreset_ch2,     --     rx_digitalreset_ch2.rx_digitalreset
			rx_digitalreset_ch3     => CONNECTED_TO_rx_digitalreset_ch3,     --     rx_digitalreset_ch3.rx_digitalreset
			rx_is_lockedtodata_ch0  => CONNECTED_TO_rx_is_lockedtodata_ch0,  --  rx_is_lockedtodata_ch0.rx_is_lockedtodata
			rx_is_lockedtodata_ch1  => CONNECTED_TO_rx_is_lockedtodata_ch1,  --  rx_is_lockedtodata_ch1.rx_is_lockedtodata
			rx_is_lockedtodata_ch2  => CONNECTED_TO_rx_is_lockedtodata_ch2,  --  rx_is_lockedtodata_ch2.rx_is_lockedtodata
			rx_is_lockedtodata_ch3  => CONNECTED_TO_rx_is_lockedtodata_ch3,  --  rx_is_lockedtodata_ch3.rx_is_lockedtodata
			rx_is_lockedtoref_ch0   => CONNECTED_TO_rx_is_lockedtoref_ch0,   --   rx_is_lockedtoref_ch0.rx_is_lockedtoref
			rx_is_lockedtoref_ch1   => CONNECTED_TO_rx_is_lockedtoref_ch1,   --   rx_is_lockedtoref_ch1.rx_is_lockedtoref
			rx_is_lockedtoref_ch2   => CONNECTED_TO_rx_is_lockedtoref_ch2,   --   rx_is_lockedtoref_ch2.rx_is_lockedtoref
			rx_is_lockedtoref_ch3   => CONNECTED_TO_rx_is_lockedtoref_ch3,   --   rx_is_lockedtoref_ch3.rx_is_lockedtoref
			rx_parallel_data_ch0    => CONNECTED_TO_rx_parallel_data_ch0,    --    rx_parallel_data_ch0.rx_parallel_data
			rx_parallel_data_ch1    => CONNECTED_TO_rx_parallel_data_ch1,    --    rx_parallel_data_ch1.rx_parallel_data
			rx_parallel_data_ch2    => CONNECTED_TO_rx_parallel_data_ch2,    --    rx_parallel_data_ch2.rx_parallel_data
			rx_parallel_data_ch3    => CONNECTED_TO_rx_parallel_data_ch3,    --    rx_parallel_data_ch3.rx_parallel_data
			rx_serial_data_ch0      => CONNECTED_TO_rx_serial_data_ch0,      --      rx_serial_data_ch0.rx_serial_data
			rx_serial_data_ch1      => CONNECTED_TO_rx_serial_data_ch1,      --      rx_serial_data_ch1.rx_serial_data
			rx_serial_data_ch2      => CONNECTED_TO_rx_serial_data_ch2,      --      rx_serial_data_ch2.rx_serial_data
			rx_serial_data_ch3      => CONNECTED_TO_rx_serial_data_ch3,      --      rx_serial_data_ch3.rx_serial_data
			tx_analogreset_ch0      => CONNECTED_TO_tx_analogreset_ch0,      --      tx_analogreset_ch0.tx_analogreset
			tx_analogreset_ch1      => CONNECTED_TO_tx_analogreset_ch1,      --      tx_analogreset_ch1.tx_analogreset
			tx_analogreset_ch2      => CONNECTED_TO_tx_analogreset_ch2,      --      tx_analogreset_ch2.tx_analogreset
			tx_analogreset_ch3      => CONNECTED_TO_tx_analogreset_ch3,      --      tx_analogreset_ch3.tx_analogreset
			tx_cal_busy_ch0         => CONNECTED_TO_tx_cal_busy_ch0,         --         tx_cal_busy_ch0.tx_cal_busy
			tx_cal_busy_ch1         => CONNECTED_TO_tx_cal_busy_ch1,         --         tx_cal_busy_ch1.tx_cal_busy
			tx_cal_busy_ch2         => CONNECTED_TO_tx_cal_busy_ch2,         --         tx_cal_busy_ch2.tx_cal_busy
			tx_cal_busy_ch3         => CONNECTED_TO_tx_cal_busy_ch3,         --         tx_cal_busy_ch3.tx_cal_busy
			tx_clkout_ch0           => CONNECTED_TO_tx_clkout_ch0,           --           tx_clkout_ch0.clk
			tx_clkout_ch1           => CONNECTED_TO_tx_clkout_ch1,           --           tx_clkout_ch1.clk
			tx_clkout_ch2           => CONNECTED_TO_tx_clkout_ch2,           --           tx_clkout_ch2.clk
			tx_clkout_ch3           => CONNECTED_TO_tx_clkout_ch3,           --           tx_clkout_ch3.clk
			tx_control_ch0          => CONNECTED_TO_tx_control_ch0,          --          tx_control_ch0.tx_control
			tx_control_ch1          => CONNECTED_TO_tx_control_ch1,          --          tx_control_ch1.tx_control
			tx_control_ch2          => CONNECTED_TO_tx_control_ch2,          --          tx_control_ch2.tx_control
			tx_control_ch3          => CONNECTED_TO_tx_control_ch3,          --          tx_control_ch3.tx_control
			tx_coreclkin_ch0        => CONNECTED_TO_tx_coreclkin_ch0,        --        tx_coreclkin_ch0.clk
			tx_coreclkin_ch1        => CONNECTED_TO_tx_coreclkin_ch1,        --        tx_coreclkin_ch1.clk
			tx_coreclkin_ch2        => CONNECTED_TO_tx_coreclkin_ch2,        --        tx_coreclkin_ch2.clk
			tx_coreclkin_ch3        => CONNECTED_TO_tx_coreclkin_ch3,        --        tx_coreclkin_ch3.clk
			tx_digitalreset_ch0     => CONNECTED_TO_tx_digitalreset_ch0,     --     tx_digitalreset_ch0.tx_digitalreset
			tx_digitalreset_ch1     => CONNECTED_TO_tx_digitalreset_ch1,     --     tx_digitalreset_ch1.tx_digitalreset
			tx_digitalreset_ch2     => CONNECTED_TO_tx_digitalreset_ch2,     --     tx_digitalreset_ch2.tx_digitalreset
			tx_digitalreset_ch3     => CONNECTED_TO_tx_digitalreset_ch3,     --     tx_digitalreset_ch3.tx_digitalreset
			tx_enh_data_valid_ch0   => CONNECTED_TO_tx_enh_data_valid_ch0,   --   tx_enh_data_valid_ch0.tx_enh_data_valid
			tx_enh_data_valid_ch1   => CONNECTED_TO_tx_enh_data_valid_ch1,   --   tx_enh_data_valid_ch1.tx_enh_data_valid
			tx_enh_data_valid_ch2   => CONNECTED_TO_tx_enh_data_valid_ch2,   --   tx_enh_data_valid_ch2.tx_enh_data_valid
			tx_enh_data_valid_ch3   => CONNECTED_TO_tx_enh_data_valid_ch3,   --   tx_enh_data_valid_ch3.tx_enh_data_valid
			tx_err_ins_ch0          => CONNECTED_TO_tx_err_ins_ch0,          --          tx_err_ins_ch0.tx_err_ins
			tx_err_ins_ch1          => CONNECTED_TO_tx_err_ins_ch1,          --          tx_err_ins_ch1.tx_err_ins
			tx_err_ins_ch2          => CONNECTED_TO_tx_err_ins_ch2,          --          tx_err_ins_ch2.tx_err_ins
			tx_err_ins_ch3          => CONNECTED_TO_tx_err_ins_ch3,          --          tx_err_ins_ch3.tx_err_ins
			tx_parallel_data_ch0    => CONNECTED_TO_tx_parallel_data_ch0,    --    tx_parallel_data_ch0.tx_parallel_data
			tx_parallel_data_ch1    => CONNECTED_TO_tx_parallel_data_ch1,    --    tx_parallel_data_ch1.tx_parallel_data
			tx_parallel_data_ch2    => CONNECTED_TO_tx_parallel_data_ch2,    --    tx_parallel_data_ch2.tx_parallel_data
			tx_parallel_data_ch3    => CONNECTED_TO_tx_parallel_data_ch3,    --    tx_parallel_data_ch3.tx_parallel_data
			tx_serial_clk0_ch0      => CONNECTED_TO_tx_serial_clk0_ch0,      --      tx_serial_clk0_ch0.clk
			tx_serial_clk0_ch1      => CONNECTED_TO_tx_serial_clk0_ch1,      --      tx_serial_clk0_ch1.clk
			tx_serial_clk0_ch2      => CONNECTED_TO_tx_serial_clk0_ch2,      --      tx_serial_clk0_ch2.clk
			tx_serial_clk0_ch3      => CONNECTED_TO_tx_serial_clk0_ch3,      --      tx_serial_clk0_ch3.clk
			tx_serial_data_ch0      => CONNECTED_TO_tx_serial_data_ch0,      --      tx_serial_data_ch0.tx_serial_data
			tx_serial_data_ch1      => CONNECTED_TO_tx_serial_data_ch1,      --      tx_serial_data_ch1.tx_serial_data
			tx_serial_data_ch2      => CONNECTED_TO_tx_serial_data_ch2,      --      tx_serial_data_ch2.tx_serial_data
			tx_serial_data_ch3      => CONNECTED_TO_tx_serial_data_ch3,      --      tx_serial_data_ch3.tx_serial_data
			unused_rx_control       => CONNECTED_TO_unused_rx_control,       --       unused_rx_control.unused_rx_control
			unused_rx_parallel_data => CONNECTED_TO_unused_rx_parallel_data, -- unused_rx_parallel_data.unused_rx_parallel_data
			unused_tx_control       => CONNECTED_TO_unused_tx_control,       --       unused_tx_control.unused_tx_control
			unused_tx_parallel_data => CONNECTED_TO_unused_tx_parallel_data, -- unused_tx_parallel_data.unused_tx_parallel_data
			rx_seriallpbken_ch0     => CONNECTED_TO_rx_seriallpbken_ch0,     --     rx_seriallpbken_ch0.rx_seriallpbken
			rx_seriallpbken_ch1     => CONNECTED_TO_rx_seriallpbken_ch1,     --     rx_seriallpbken_ch1.rx_seriallpbken
			rx_seriallpbken_ch2     => CONNECTED_TO_rx_seriallpbken_ch2,     --     rx_seriallpbken_ch2.rx_seriallpbken
			rx_seriallpbken_ch3     => CONNECTED_TO_rx_seriallpbken_ch3      --     rx_seriallpbken_ch3.rx_seriallpbken
		);

