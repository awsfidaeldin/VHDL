library IEEE;
use IEEE.std_logic_1164.all;

entity ram_16x1s is
generic (init_val : string := "0000" );
port (O : out std_logic;
D : in std_logic;
A3, A2, A1, A0: in std_logic;
WE, CLK : in std_logic);
end ram_16x1s;

architecture xilinx of ram_16x1s is

attribute INIT: string;
attribute INIT of u1 : label is init_val;

component RAM16X1S is port (O : out std_logic;
D : in std_logic;
WE: in std_logic;
WCLK: in std_logic;
A0: in std_logic;
A1: in std_logic;
A2: in std_logic;
A3: in std_logic);
end component; 

begin

U1 : RAM16X1S port map (O => O, WE => WE, WCLK => CLK, D => D, A0 => A0, A1 => A1, 
A2 => A2, A3 => A3);

end xilinx;

library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.std_logic_unsigned.all;

entity ram_16x4s is
port (o: out std_logic_vector(3 downto 0);
we : in std_logic;
clk: in std_logic;
d: in std_logic_vector(3 downto 0);
a: in std_logic_vector(3 downto 0));
end ram_16x4s;

architecture xilinx of ram_16x4s is

component ram_16x1s
generic (init_val: string := "0000");
port (O : out std_logic;
D : in std_logic; 
A3, A2, A1, A0 : in std_logic;
WE, CLK : in std_logic);
end component;

begin

U0 : ram_16x1s generic map ("FFFF")
port map (O => o(0), WE => we, CLK => clk, D => d(0), A0 => a(0), A1 => a(1), A2 => a(2), A3 => a(3));
U1 : ram_16x1s generic map ("ABCD")
port map (O => o(1), WE => we, CLK => clk, D => d(1), A0 => a(0), A1 => a(1), A2 => a(2), A3 => a(3));
U2 : ram_16x1s generic map ("BCDE")
port map (O => o(2), WE => we, CLK => clk, D => d(2), A0 => a(0), A1 => a(1), A2 => a(2), A3 => a(3));
U3 : ram_16x1s generic map ("CDEF")
port map (O => o(3), WE => we, CLK => clk, D => d(3), A0 => a(0), A1 => a(1), A2 => a(2), A3 => a(3));

end xilinx; 
