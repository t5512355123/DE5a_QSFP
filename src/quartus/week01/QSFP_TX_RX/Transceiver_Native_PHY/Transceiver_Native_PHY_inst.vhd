	component Transceiver_Native_PHY is
		port (
			rx_analogreset          : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- rx_analogreset
			rx_cal_busy             : out std_logic_vector(3 downto 0);                      -- rx_cal_busy
			rx_cdr_refclk0          : in  std_logic                      := 'X';             -- clk
			rx_clkout               : out std_logic_vector(3 downto 0);                      -- clk
			rx_coreclkin            : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- clk
			rx_datak                : out std_logic_vector(7 downto 0);                      -- rx_datak
			rx_digitalreset         : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- rx_digitalreset
			rx_disperr              : out std_logic_vector(7 downto 0);                      -- rx_disperr
			rx_errdetect            : out std_logic_vector(7 downto 0);                      -- rx_errdetect
			rx_is_lockedtodata      : out std_logic_vector(3 downto 0);                      -- rx_is_lockedtodata
			rx_is_lockedtoref       : out std_logic_vector(3 downto 0);                      -- rx_is_lockedtoref
			rx_parallel_data        : out std_logic_vector(63 downto 0);                     -- rx_parallel_data
			rx_patterndetect        : out std_logic_vector(7 downto 0);                      -- rx_patterndetect
			rx_polinv               : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- rx_polinv
			rx_runningdisp          : out std_logic_vector(7 downto 0);                      -- rx_runningdisp
			rx_serial_data          : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- rx_serial_data
			rx_syncstatus           : out std_logic_vector(7 downto 0);                      -- rx_syncstatus
			tx_analogreset          : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- tx_analogreset
			tx_cal_busy             : out std_logic_vector(3 downto 0);                      -- tx_cal_busy
			tx_clkout               : out std_logic_vector(3 downto 0);                      -- clk
			tx_coreclkin            : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- clk
			tx_datak                : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- tx_datak
			tx_digitalreset         : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- tx_digitalreset
			tx_parallel_data        : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- tx_parallel_data
			tx_serial_clk0          : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- clk
			tx_serial_data          : out std_logic_vector(3 downto 0);                      -- tx_serial_data
			unused_rx_parallel_data : out std_logic_vector(399 downto 0);                    -- unused_rx_parallel_data
			unused_tx_parallel_data : in  std_logic_vector(439 downto 0) := (others => 'X'); -- unused_tx_parallel_data
			rx_seriallpbken         : in  std_logic_vector(3 downto 0)   := (others => 'X')  -- rx_seriallpbken
		);
	end component Transceiver_Native_PHY;

	u0 : component Transceiver_Native_PHY
		port map (
			rx_analogreset          => CONNECTED_TO_rx_analogreset,          --          rx_analogreset.rx_analogreset
			rx_cal_busy             => CONNECTED_TO_rx_cal_busy,             --             rx_cal_busy.rx_cal_busy
			rx_cdr_refclk0          => CONNECTED_TO_rx_cdr_refclk0,          --          rx_cdr_refclk0.clk
			rx_clkout               => CONNECTED_TO_rx_clkout,               --               rx_clkout.clk
			rx_coreclkin            => CONNECTED_TO_rx_coreclkin,            --            rx_coreclkin.clk
			rx_datak                => CONNECTED_TO_rx_datak,                --                rx_datak.rx_datak
			rx_digitalreset         => CONNECTED_TO_rx_digitalreset,         --         rx_digitalreset.rx_digitalreset
			rx_disperr              => CONNECTED_TO_rx_disperr,              --              rx_disperr.rx_disperr
			rx_errdetect            => CONNECTED_TO_rx_errdetect,            --            rx_errdetect.rx_errdetect
			rx_is_lockedtodata      => CONNECTED_TO_rx_is_lockedtodata,      --      rx_is_lockedtodata.rx_is_lockedtodata
			rx_is_lockedtoref       => CONNECTED_TO_rx_is_lockedtoref,       --       rx_is_lockedtoref.rx_is_lockedtoref
			rx_parallel_data        => CONNECTED_TO_rx_parallel_data,        --        rx_parallel_data.rx_parallel_data
			rx_patterndetect        => CONNECTED_TO_rx_patterndetect,        --        rx_patterndetect.rx_patterndetect
			rx_polinv               => CONNECTED_TO_rx_polinv,               --               rx_polinv.rx_polinv
			rx_runningdisp          => CONNECTED_TO_rx_runningdisp,          --          rx_runningdisp.rx_runningdisp
			rx_serial_data          => CONNECTED_TO_rx_serial_data,          --          rx_serial_data.rx_serial_data
			rx_syncstatus           => CONNECTED_TO_rx_syncstatus,           --           rx_syncstatus.rx_syncstatus
			tx_analogreset          => CONNECTED_TO_tx_analogreset,          --          tx_analogreset.tx_analogreset
			tx_cal_busy             => CONNECTED_TO_tx_cal_busy,             --             tx_cal_busy.tx_cal_busy
			tx_clkout               => CONNECTED_TO_tx_clkout,               --               tx_clkout.clk
			tx_coreclkin            => CONNECTED_TO_tx_coreclkin,            --            tx_coreclkin.clk
			tx_datak                => CONNECTED_TO_tx_datak,                --                tx_datak.tx_datak
			tx_digitalreset         => CONNECTED_TO_tx_digitalreset,         --         tx_digitalreset.tx_digitalreset
			tx_parallel_data        => CONNECTED_TO_tx_parallel_data,        --        tx_parallel_data.tx_parallel_data
			tx_serial_clk0          => CONNECTED_TO_tx_serial_clk0,          --          tx_serial_clk0.clk
			tx_serial_data          => CONNECTED_TO_tx_serial_data,          --          tx_serial_data.tx_serial_data
			unused_rx_parallel_data => CONNECTED_TO_unused_rx_parallel_data, -- unused_rx_parallel_data.unused_rx_parallel_data
			unused_tx_parallel_data => CONNECTED_TO_unused_tx_parallel_data, -- unused_tx_parallel_data.unused_tx_parallel_data
			rx_seriallpbken         => CONNECTED_TO_rx_seriallpbken          --         rx_seriallpbken.rx_seriallpbken
		);

