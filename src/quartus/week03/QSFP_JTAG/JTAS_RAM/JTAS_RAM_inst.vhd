	component JTAS_RAM is
		port (
			clk_clk                        : in  std_logic                     := 'X';             -- clk
			reset_reset_n                  : in  std_logic                     := 'X';             -- reset_n
			onchip_memory2_0_s2_address    : in  std_logic_vector(8 downto 0)  := (others => 'X'); -- address
			onchip_memory2_0_s2_chipselect : in  std_logic                     := 'X';             -- chipselect
			onchip_memory2_0_s2_clken      : in  std_logic                     := 'X';             -- clken
			onchip_memory2_0_s2_write      : in  std_logic                     := 'X';             -- write
			onchip_memory2_0_s2_readdata   : out std_logic_vector(63 downto 0);                    -- readdata
			onchip_memory2_0_s2_writedata  : in  std_logic_vector(63 downto 0) := (others => 'X'); -- writedata
			onchip_memory2_0_s2_byteenable : in  std_logic_vector(7 downto 0)  := (others => 'X')  -- byteenable
		);
	end component JTAS_RAM;

	u0 : component JTAS_RAM
		port map (
			clk_clk                        => CONNECTED_TO_clk_clk,                        --                 clk.clk
			reset_reset_n                  => CONNECTED_TO_reset_reset_n,                  --               reset.reset_n
			onchip_memory2_0_s2_address    => CONNECTED_TO_onchip_memory2_0_s2_address,    -- onchip_memory2_0_s2.address
			onchip_memory2_0_s2_chipselect => CONNECTED_TO_onchip_memory2_0_s2_chipselect, --                    .chipselect
			onchip_memory2_0_s2_clken      => CONNECTED_TO_onchip_memory2_0_s2_clken,      --                    .clken
			onchip_memory2_0_s2_write      => CONNECTED_TO_onchip_memory2_0_s2_write,      --                    .write
			onchip_memory2_0_s2_readdata   => CONNECTED_TO_onchip_memory2_0_s2_readdata,   --                    .readdata
			onchip_memory2_0_s2_writedata  => CONNECTED_TO_onchip_memory2_0_s2_writedata,  --                    .writedata
			onchip_memory2_0_s2_byteenable => CONNECTED_TO_onchip_memory2_0_s2_byteenable  --                    .byteenable
		);

