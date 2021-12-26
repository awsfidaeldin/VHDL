library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity ROM_E is
port(
address:in std_logic_vector(2 downto 0);
data_out:out std_logic_vector(31 downto 0)
);
end entity;

architecture ROM_A of ROM_E is
type mem_array is array(0 to 7) of std_logic_vector(31 downto 0);
signal mem:mem_array;
begin
process(address)
variable index: integer range 0 to 7:=0;
begin
mem(0)<=x"00000001";
mem(1)<=x"00000002";
mem(2)<=x"00000003";
mem(3)<=x"00000004";
mem(4)<=x"00000005";
mem(5)<=x"00000006";
mem(6)<=x"00000007";
mem(7)<=x"00000008";

index:=conv_integer(address(2 downto 0));
data_out<=mem(index);
end process;
end architecture;
