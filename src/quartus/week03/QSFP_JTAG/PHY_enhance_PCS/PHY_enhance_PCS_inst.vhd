	component PHY_enhance_PCS is
		port (
			rx_analogreset          : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- rx_analogreset
			rx_cal_busy             : out std_logic_vector(3 downto 0);                      -- rx_cal_busy
			rx_cdr_refclk0          : in  std_logic                      := 'X';             -- clk
			rx_clkout               : out std_logic_vector(3 downto 0);                      -- clk
			rx_control              : out std_logic_vector(7 downto 0);                      -- rx_control
			rx_coreclkin            : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- clk
			rx_digitalreset         : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- rx_digitalreset
			rx_enh_data_valid       : out std_logic_vector(3 downto 0);                      -- rx_enh_data_valid
			rx_enh_fifo_full        : out std_logic_vector(3 downto 0);                      -- rx_enh_fifo_full
			rx_is_lockedtodata      : out std_logic_vector(3 downto 0);                      -- rx_is_lockedtodata
			rx_is_lockedtoref       : out std_logic_vector(3 downto 0);                      -- rx_is_lockedtoref
			rx_parallel_data        : out std_logic_vector(255 downto 0);                    -- rx_parallel_data
			rx_serial_data          : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- rx_serial_data
			rx_seriallpbken         : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- rx_seriallpbken
			tx_analogreset          : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- tx_analogreset
			tx_cal_busy             : out std_logic_vector(3 downto 0);                      -- tx_cal_busy
			tx_clkout               : out std_logic_vector(3 downto 0);                      -- clk
			tx_control              : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- tx_control
			tx_coreclkin            : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- clk
			tx_digitalreset         : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- tx_digitalreset
			tx_enh_data_valid       : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- tx_enh_data_valid
			tx_enh_fifo_full        : out std_logic_vector(3 downto 0);                      -- tx_enh_fifo_full
			tx_enh_fifo_pfull       : out std_logic_vector(3 downto 0);                      -- tx_enh_fifo_pfull
			tx_parallel_data        : in  std_logic_vector(255 downto 0) := (others => 'X'); -- tx_parallel_data
			tx_serial_clk0          : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- clk
			tx_serial_data          : out std_logic_vector(3 downto 0);                      -- tx_serial_data
			unused_rx_control       : out std_logic_vector(71 downto 0);                     -- unused_rx_control
			unused_rx_parallel_data : out std_logic_vector(255 downto 0);                    -- unused_rx_parallel_data
			unused_tx_control       : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- unused_tx_control
			unused_tx_parallel_data : in  std_logic_vector(255 downto 0) := (others => 'X'); -- unused_tx_parallel_data
			rx_enh_fifo_rd_en       : in  std_logic_vector(3 downto 0)   := (others => 'X')  -- rx_enh_fifo_rd_en
		);
	end component PHY_enhance_PCS;

	u0 : component PHY_enhance_PCS
		port map (
			rx_analogreset          => CONNECTED_TO_rx_analogreset,          --          rx_analogreset.rx_analogreset
			rx_cal_busy             => CONNECTED_TO_rx_cal_busy,             --             rx_cal_busy.rx_cal_busy
			rx_cdr_refclk0          => CONNECTED_TO_rx_cdr_refclk0,          --          rx_cdr_refclk0.clk
			rx_clkout               => CONNECTED_TO_rx_clkout,               --               rx_clkout.clk
			rx_control              => CONNECTED_TO_rx_control,              --              rx_control.rx_control
			rx_coreclkin            => CONNECTED_TO_rx_coreclkin,            --            rx_coreclkin.clk
			rx_digitalreset         => CONNECTED_TO_rx_digitalreset,         --         rx_digitalreset.rx_digitalreset
			rx_enh_data_valid       => CONNECTED_TO_rx_enh_data_valid,       --       rx_enh_data_valid.rx_enh_data_valid
			rx_enh_fifo_full        => CONNECTED_TO_rx_enh_fifo_full,        --        rx_enh_fifo_full.rx_enh_fifo_full
			rx_is_lockedtodata      => CONNECTED_TO_rx_is_lockedtodata,      --      rx_is_lockedtodata.rx_is_lockedtodata
			rx_is_lockedtoref       => CONNECTED_TO_rx_is_lockedtoref,       --       rx_is_lockedtoref.rx_is_lockedtoref
			rx_parallel_data        => CONNECTED_TO_rx_parallel_data,        --        rx_parallel_data.rx_parallel_data
			rx_serial_data          => CONNECTED_TO_rx_serial_data,          --          rx_serial_data.rx_serial_data
			rx_seriallpbken         => CONNECTED_TO_rx_seriallpbken,         --         rx_seriallpbken.rx_seriallpbken
			tx_analogreset          => CONNECTED_TO_tx_analogreset,          --          tx_analogreset.tx_analogreset
			tx_cal_busy             => CONNECTED_TO_tx_cal_busy,             --             tx_cal_busy.tx_cal_busy
			tx_clkout               => CONNECTED_TO_tx_clkout,               --               tx_clkout.clk
			tx_control              => CONNECTED_TO_tx_control,              --              tx_control.tx_control
			tx_coreclkin            => CONNECTED_TO_tx_coreclkin,            --            tx_coreclkin.clk
			tx_digitalreset         => CONNECTED_TO_tx_digitalreset,         --         tx_digitalreset.tx_digitalreset
			tx_enh_data_valid       => CONNECTED_TO_tx_enh_data_valid,       --       tx_enh_data_valid.tx_enh_data_valid
			tx_enh_fifo_full        => CONNECTED_TO_tx_enh_fifo_full,        --        tx_enh_fifo_full.tx_enh_fifo_full
			tx_enh_fifo_pfull       => CONNECTED_TO_tx_enh_fifo_pfull,       --       tx_enh_fifo_pfull.tx_enh_fifo_pfull
			tx_parallel_data        => CONNECTED_TO_tx_parallel_data,        --        tx_parallel_data.tx_parallel_data
			tx_serial_clk0          => CONNECTED_TO_tx_serial_clk0,          --          tx_serial_clk0.clk
			tx_serial_data          => CONNECTED_TO_tx_serial_data,          --          tx_serial_data.tx_serial_data
			unused_rx_control       => CONNECTED_TO_unused_rx_control,       --       unused_rx_control.unused_rx_control
			unused_rx_parallel_data => CONNECTED_TO_unused_rx_parallel_data, -- unused_rx_parallel_data.unused_rx_parallel_data
			unused_tx_control       => CONNECTED_TO_unused_tx_control,       --       unused_tx_control.unused_tx_control
			unused_tx_parallel_data => CONNECTED_TO_unused_tx_parallel_data, -- unused_tx_parallel_data.unused_tx_parallel_data
			rx_enh_fifo_rd_en       => CONNECTED_TO_rx_enh_fifo_rd_en        --       rx_enh_fifo_rd_en.rx_enh_fifo_rd_en
		);

