library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Cache is
	port (
			clk: in std_logic;
			P_sel: in std_logic_vector(3 downto 0); -- Position selector
			data: in std_logic_vector(31 downto 0);
			P_sel_out:out std_logic_vector(3 downto 0);
			Final_Pos_out: out std_logic_vector(3 downto 0);
			state_number: in std_logic_vector(1 downto 0)
	);
end entity;

architecture behavior of Cache is
	------------------COMPONENT---------------------------------------------------------
	component randomizer 
		port(
			clk: in std_logic;
			random_num :out std_logic_vector(4 downto 0)				
		);
	end component;
	
	signal random_value: std_logic_vector(4 downto 0);
	signal Final_Pos: std_logic_vector(3 downto 0);
	signal Corrige: std_logic_vector(4 downto 0);
	
---
	signal cache0: std_logic_vector (31 downto 0) := "00000000000000000000000000000000";		
	signal cache1: std_logic_vector (31 downto 0) := "00000000000000000000000000000000";		
	signal cache2: std_logic_vector (31 downto 0) := "00000000000000000000000000000000";		
	signal cache3: std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
---	
	signal cache4: std_logic_vector (31 downto 0) := "00000000000000000000000000000000";		
	signal cache5: std_logic_vector (31 downto 0) := "00000000000000000000000000000000";		
	signal cache6: std_logic_vector (31 downto 0) := "00000000000000000000000000000000";		
	signal cache7: std_logic_vector (31 downto 0) := "00000000000000000000000000000000";		
---
	signal cache8: std_logic_vector (31 downto 0) := "00000000000000000000000000000000";		
	signal cache9: std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
	signal cache10: std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
	signal cache11: std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
---	
	signal cache12: std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
	signal cache13: std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
	signal cache14: std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
	signal cache15: std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
begin
	R1: Randomizer port map (clk, Random_value);
	process(clk)
		begin
		if(clk = '1' and clk'event) then
			if (state_number = "11" or state_number = "00") then
				case P_sel is
					when "0000"  =>  cache0 <= data;
					when "0001"  =>  cache1 <= data;
					when "0010"  =>  cache2 <= data;
					when "0011"  =>  cache3 <= data;
					when "0100"  =>  cache4 <= data;
					when "0101"  =>  cache5 <= data;
					when "0110"  =>  cache6 <= data;
					when "0111"  =>  cache7 <= data;
					when "1000"  =>  cache8 <= data;
					when "1001"  =>  cache9 <= data;
					when "1010"  =>  cache10<= data;
					when "1011"  =>  cache11<= data;
					when "1100"  =>  cache12<= data;
					when "1101"  =>  cache13<= data;
					when "1110"  =>  cache14<= data;
					when "1111"  =>  cache15<= data;
				end case;

			elsif(state_number = "01") then
				case P_sel is
					when "0000" =>

						Corrige <= std_logic_vector(unsigned(random_value) mod 4);
						Final_Pos <= Corrige(3 downto 0);
					when "0001" =>
						Corrige <= std_logic_vector(unsigned(random_value) mod 4);
						Final_Pos <= std_logic_vector(unsigned(Corrige(3 downto 0)) +(4));
					when "0010" =>
						Corrige <= std_logic_vector(unsigned(random_value) mod 4);
						Final_Pos <= std_logic_vector(unsigned(Corrige(3 downto 0)) +(8));
					when "0011" =>
						Corrige <= std_logic_vector(unsigned(random_value) mod 4);
						Final_Pos <= std_logic_vector(unsigned(Corrige(3 downto 0)) +(12));
					when others =>
					
				end case;
				
				case Final_Pos is
					when "0000"  =>  cache0 <= data;
					when "0001"  =>  cache1 <= data;
					when "0010"  =>  cache2 <= data;
					when "0011"  =>  cache3 <= data;
					when "0100"  =>  cache4 <= data;
					when "0101"  =>  cache5 <= data;
					when "0110"  =>  cache6 <= data;
					when "0111"  =>  cache7 <= data;
					when "1000"  =>  cache8 <= data;
					when "1001"  =>  cache9 <= data;
					when "1010"  =>  cache10<= data;
					when "1011"  =>  cache11<= data;
					when "1100"  =>  cache12<= data;
					when "1101"  =>  cache13<= data;
					when "1110"  =>  cache14<= data;
					when "1111"  =>  cache15<= data;
				end case;
-----------
			elsif(state_number = "10") then
				case P_sel is
					when "0000" =>
						Corrige <= std_logic_vector(unsigned(random_value) mod 8);
						Final_Pos <= Corrige(3 downto 0);
					when "0001" =>
						Corrige <= std_logic_vector(unsigned(random_value) mod 8);
						Final_Pos <= std_logic_vector(unsigned(Corrige(3 downto 0)) +(8));
					when others =>
				end case;
				
				case Final_Pos is
					when "0000"  =>  cache0 <= data;
					when "0001"  =>  cache1 <= data;
					when "0010"  =>  cache2 <= data;
					when "0011"  =>  cache3 <= data;
					when "0100"  =>  cache4 <= data;
					when "0101"  =>  cache5 <= data;
					when "0110"  =>  cache6 <= data;
					when "0111"  =>  cache7 <= data;
					when "1000"  =>  cache8 <= data;
					when "1001"  =>  cache9 <= data;
					when "1010"  =>  cache10<= data;
					when "1011"  =>  cache11<= data;
					when "1100"  =>  cache12<= data;
					when "1101"  =>  cache13<= data;
					when "1110"  =>  cache14<= data;
					when "1111"  =>  cache15<= data;
				end case;
			end if;

			if (state_number = "11" or state_number = "00") then Final_Pos_out <= P_sel; --P_sel_out <= P_Sel;
			else Final_Pos_out <= Final_Pos;
			end if;


		end if;
	end process;
end architecture;