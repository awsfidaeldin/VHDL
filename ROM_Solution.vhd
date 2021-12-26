library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity rom_e is
port  (
	data_out: out std_logic_vector(15 downto 0);
	address: in std_logic_vector(3 downto 0)
);
end entity;

architecture rom_a of rom_e is
	type mem_array is array(0 to 15) of std_logic_vector(15 downto 0);
	signal mem: mem_array;

begin
read: process(address)
	-- index is an index into the array
	variable index: integer range 0 to 15 := 0; -- initialize index to 0
	begin
		-- initialize the ROM contents
		mem(0) <= x"0000";
		mem(1) <= x"1111";
		mem(2) <= x"2222";
		mem(3) <= x"3333";
		mem(4) <= x"4444";
		mem(5) <= x"5555";
		mem(6) <= x"6666";
		mem(7) <= x"7777";
        mem(8) <= x"8888";
		mem(9) <= x"9999";
		mem(10) <= x"AAAA";
		mem(11) <= x"BBBB";
		mem(12) <= x"CCCC";
		mem(13) <= x"DDDD";
		mem(14) <= x"EEEE";
		mem(15) <= x"FFFF";

		-- The conv_integer function is in the .std_logic_arith package
		-- Convert the address vector into an integer to access array element
		index := conv_integer( address(3 downto 0));
		data_out <= mem(index);
	end process;
end architecture;

