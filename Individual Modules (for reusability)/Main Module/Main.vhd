library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Main is
	port(
		clk: in std_logic;
		reset: in std_logic;
		Adress: in std_logic_vector(4 downto 0);
		Miss_Ratio: in std_logic_vector(6 downto 0); --- 0,703125% é o limite 1011010
		Actual_State: out std_logic_vector(1 downto 0);
		OUT_Cache_Position: out std_logic_vector(3 downto 0);
		OUT_Cache_Value: out std_logic_vector(31 downto 0);
		OUT_Block_Selector: out std_logic_vector (3 downto 0)
		
	);
end entity;

architecture arc of Main is

-----------------------components------------------------------
component Registers
	port (
		clk: in std_logic;
		Address_sel: in std_logic_vector(4 downto 0);
		reg_out: out std_logic_vector(31 downto 0)
	);
end component;
----
component Operator
	port (
		clk: in std_logic;
		Address: in std_logic_vector(4 downto 0); -- Posição do Registrador
		State_Number: in std_logic_vector(1 downto 0); -- Estado atual
		result: out std_logic_vector(3 downto 0) -- Posição/Bloco da Cache selecionada
	);
end component;
----
component cache
	port (
		clk: in std_logic;
		P_sel: in std_logic_vector(3 downto 0); -- Position selector
		data: in std_logic_vector(31 downto 0);
		--P_sel_out:out std_logic_vector(3 downto 0);
		Final_Pos_out: out std_logic_vector(3 downto 0);
		state_number: in std_logic_vector(1 downto 0)
	);
end component;
---------------------End components--------------------------------------------------
----------
signal Reg_Out: std_logic_vector(31 downto 0);
signal Op_Out: std_logic_vector(3 downto 0);
signal Cache_Out: std_logic_vector(3 downto 0);
Signal State_S: std_logic_vector(1 downto 0);
---------------------------------FSM------------------------------------------------
type state_type is (Dm, Bk4, Bk8, Fa);
signal State : State_type;
	begin
	R1: Registers port map (clk, Adress, Reg_out);
	O1: Operator port map (clk, Adress, State_S, Op_Out);
	C1: Cache port map( clk, Op_Out, Reg_out, cache_Out, State_S);
	
		process(clk, reset)
		
		begin
		if reset = '1' then
			state <= Dm;
		elsif (rising_edge(clk)) then
			case state is
				when Dm =>
					Actual_State <= "00";
					State_S <= "00";
					OUT_Cache_Position <= cache_Out;
					OUT_Cache_Value <= reg_Out;
					if (miss_Ratio >= "1011010") then
						State <= Bk4;
					end if;
					
				when Bk4 =>
					State_S <= "01";
					Actual_State <= "01";
					OUT_Cache_Position <= cache_Out;
					OUT_Cache_Value <= reg_Out;
					OUT_Block_Selector <= OP_Out;
					if (miss_Ratio >= "1011010") then
						State <= Bk8;
					end if;
					
				when Bk8 =>
					State_S <= "10";
					Actual_State <= "10";
					OUT_Cache_Position <= cache_Out;
					OUT_Cache_Value <= reg_Out;
					OUT_Block_Selector <= OP_Out;
					if (miss_Ratio >= "1011010") then
						State <= Fa;
					end if;
					
				when Fa =>
					State_S <= "11";
					Actual_State <= "11";
					OUT_Cache_Position <= cache_Out;
					OUT_Cache_Value <= reg_Out;
					OUT_Block_Selector <= OP_Out;
					if (miss_Ratio >= "1011010") then
						State <= Dm;
					end if;
					
			end case;	
		end if;
		end process;	
end architecture;