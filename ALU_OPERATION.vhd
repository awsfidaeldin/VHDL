library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

ENTITY alu16bit IS
        port(a, b : in std_logic_vector(15 downto 0);        -- a and b are busses
                op : in std_logic_vector(3 downto 0);
                SB : in std_logic;
            f : out std_logic_vector(15 downto 0));
END alu16bit;

architecture behavioral of alu16bit is
begin
        process(op)
        variable temp: std_logic_vector(15 downto 0):="0000000000000000";
        begin
        case op is
                when "0000" =>
                        temp := a + b;
                when "0001" =>
                        temp := a + 2;
                when "0010" =>
                        temp := a - b;
                when "0011" =>
                        temp := a - 3;
                when "0100" =>
                        if a < b then
                        temp := a;
                        else
                        temp := b;
                        end if;
                when "0101" =>
                        if a < b then
                        temp := b;
                        else
                        temp := a;
                        end if;
                when "0110" =>
   temp := a and b;
  when "0111" =>
   temp := a or b;
  when "1000" =>
   temp(14 downto 0) := a(15 downto 1);
   temp(15) := a(0);
  when "1001" =>
   temp(15 downto 1) := a(14 downto 0);
   temp(0) := a(15);
  when "1010" =>
   temp(14 downto 0) := a(15 downto 1);
   temp(15) := '0';
  when "1011" =>
   temp(15 downto 1) := a(14 downto 0);
   temp(0) := '0';
  when "1100" =>
   temp(14 downto 0) := a(15 downto 1);
   temp(15) := SB;
  when "1101" =>
   temp(15 downto 1) := a(14 downto 0);
   temp(0) := SB;
  when others =>
   temp := temp;
  end case;
   f <= temp;
  end process;
end behavioral;

