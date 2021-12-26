library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity multiplier_e is
port(
num1:in std_logic_vector(2 downto 0);
num2:in std_logic_vector(2 downto 0);
prod:out std_logic_vector(5 downto 0)
);
end entity;

architecture multiplier_a of multiplier_e is
begin
process(num1,num2)
variable reg:std_logic_vector(5 downto 0);
variable add:std_logic_vector(3 downto 0);
begin
reg:="000"&num2;
for i in 1 to 3
loop
if reg(0)='1' then
add:=('0'&num1)+('0'&reg(5 downto 3));
reg:=add&reg(2 downto 1);
else
reg:='0'&reg(5 downto 1);
end if;
end loop;
prod<=reg;
end process;
end architecture;

