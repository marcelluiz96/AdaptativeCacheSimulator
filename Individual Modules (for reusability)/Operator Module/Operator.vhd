library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Operator is
	port (
		clk: in std_logic;
		Address: in std_logic_vector(4 downto 0); -- Posição do Registrador
		State_Number: in std_logic_vector(1 downto 0); -- Estado atual
		result: out std_logic_vector(3 downto 0) -- Posição/Bloco da Cache selecionada
	);
end entity;

architecture Structural of Operator is
component Randomizer
	port (
		clk: in std_logic;
		random_num: out std_logic_vector(4 downto 0)
	);
end component;

signal Random_SR: std_logic_vector(4 downto 0);
signal Address_S: std_logic_vector(4 downto 0);
signal Corrige: std_logic_vector (4 downto 0);

	begin
		R1: Randomizer port map(clk, Random_SR);
		process(clk)
		begin
			if (clk = '1' and clk'event) then
				case State_Number is
					when "00" =>
						Corrige <= std_logic_vector(unsigned(Address) mod 16);
						result <= Corrige(3 downto 0);
					when "01" => 
						Corrige <= std_logic_vector(unsigned(Address) mod 4);
						result <= Corrige(3 downto 0);
					when "10" =>
						Corrige <= std_logic_vector(unsigned(Address) mod 2);
						result <= Corrige(3 downto 0);
					when "11" =>
						Corrige <= std_logic_vector(unsigned(Random_SR) mod 16);
						result <= Corrige(3 downto 0);
				end case;
		end if;
	end process;
end architecture;	