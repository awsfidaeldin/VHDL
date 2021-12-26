library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity counter is
  port(CLK, CLR : in  std_logic;
       Result : out std_logic_vector(6 downto 0)
        );
end counter;
architecture archi of counter is 
   signal bcd : std_logic_vector(3 downto 0):="0000";
   signal leds: std_logic_vector(6 downto 0);
  begin 
      process (CLK,CLR,bcd)
        begin 
          if (CLR='1') then 
            bcd <= "0000"; 
          elsif (CLK'event and CLK='1') then 
            bcd <= bcd + 1;
          end if; 
		CASE bcd IS 					-- abcdefg
			WHEN "0000" 	=> leds 	<= 	"1111110" ;
			WHEN "0001" 	=> leds 	<= 	"0110000" ;
			WHEN "0010" 	=> leds 	<= 	"1101101" ;
			WHEN "0011" 	=> leds 	<= 	"1111001" ;
			WHEN "0100" 	=> leds 	<= 	"0110011" ;
			WHEN "0101" 	=> leds 	<= 	"1011011" ;
			WHEN "0110" 	=> leds 	<= 	"1011111" ;
			WHEN "0111" 	=> leds 	<= 	"1110000" ;
			WHEN "1000" 	=> leds 	<=	"1111111" ;
			WHEN "1001" 	=> leds 	<=	"1110011" ;
			WHEN OTHERS 	=> leds 	<=	"-------" ;
		END CASE ;
		Result <= not (leds);
 end process;
end archi;