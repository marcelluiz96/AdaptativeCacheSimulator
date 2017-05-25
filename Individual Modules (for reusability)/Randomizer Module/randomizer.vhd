-- Entidade de gerar números randômicos obtida na internet. Fonte no relatório

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity randomizer is 
	port (
      clk : in std_logic;
      random_num : out std_logic_vector (4 downto 0)   --output vector            
    );
end entity;

architecture Behavioral of randomizer is
begin
	process(clk)
		variable rand_temp : std_logic_vector(4 downto 0):=(4 => '1',others => '0');
		variable temp : std_logic := '0';
	begin
		if(rising_edge(clk)) then
			temp := rand_temp(4) xor rand_temp(3);
			rand_temp(4 downto 1) := rand_temp(3 downto 0);
			rand_temp(0) := temp;
		end if;
	random_num <= rand_temp;
end process;
end architecture;