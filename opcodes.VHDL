library ieee;
use ieee.std_logic_1164.all;

PACKAGE opcodes IS

	constant ADD : std_logic_vector(3 downto 0) := "0000";
	constant SUBTRACT : std_logic_vector(3 downto 0) := "0001";
	constant INCREMENT : std_logic_vector(3 downto 0) := "0010";
	constant SHL : std_logic_vector(3 downto 0) := "0011";
	constant SHR_L : std_logic_vector(3 downto 0) := "0100";
	constant SHR_A : std_logic_vector(3 downto 0) := "0101";
	constant NOP : std_logic_vector(3 downto 0) := "0110";
	constant LD : std_logic_vector(3 downto 0) := "0111";
	constant LD_C : std_logic_vector(3 downto 0) := "1000";
	constant ST : std_logic_vector(3 downto 0) := "1001";
	constant BEQ : std_logic_vector(3 downto 0) := "1010";
	constant BLT : std_logic_vector(3 downto 0) := "1011";
	constant BLE : std_logic_vector(3 downto 0) := "1100";
	constant JAL : std_logic_vector(3 downto 0) := "1101";
	constant HALT : std_logic_vector(3 downto 0) := "1110";

end PACKAGE opcodes;