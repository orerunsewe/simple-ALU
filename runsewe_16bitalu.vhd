library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity runsewe_16bitalu is
	port(
	OP_A: in std_logic_vector(15 downto 0);
	OP_B: in std_logic_vector(15 downto 0);
	sel: in std_logic_vector(1 downto 0);
	OP_Q: out std_logic_vector(15 downto 0)
	);
end runsewe_16bitalu;

architecture sel_arch of runsewe_16bitalu is
	signal S_D: std_logic_vector(15 downto 0);

begin
	with sel select
	S_D <= 

		OP_A + OP_B when "00",
		not OP_A when "01",
		OP_A and OP_B when "10",
		OP_A or OP_B when others;

OP_Q <= S_D;
end sel_arch;
