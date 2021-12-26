entity DFF is
port
(
CLK, D_bit: in bit;
Q_bit: out bit
);
end entity;

architecture Function_DFF of DFF is
constant gate_delay: time:=20 ns;
begin
process(CLK, D_bit)
begin
if (CLK'event and CLK='1')
 then
    Q_bit<=D_bit after gate_delay;
end if;
end process;
end architecture;

entity Register_DFF is
port
(
CLK:in bit;
D:in bit_vector(31 downto 0);
Q:out bit_vector(31 downto 0)
);
end entity;

architecture Function_Register of Register_DFF is
component DFF is
port
(
CLK, D_bit: in bit;
Q_bit: out bit
);
end component;
begin
DFF31: DFF port map (CLK,D(31), Q(31));
DFF30: DFF port map (CLK,D(30), Q(30));
DFF29: DFF port map (CLK,D(29), Q(29));
DFF28: DFF port map (CLK,D(28), Q(28));
DFF27: DFF port map (CLK,D(27), Q(27));
DFF26: DFF port map (CLK,D(26), Q(26));
DFF25: DFF port map (CLK,D(25), Q(25));
DFF24: DFF port map (CLK,D(24), Q(24));
DFF23: DFF port map (CLK,D(23), Q(23));
DFF22: DFF port map (CLK,D(22), Q(22));
DFF21: DFF port map (CLK,D(21), Q(21));
DFF20: DFF port map (CLK,D(20), Q(20));
DFF19: DFF port map (CLK,D(19), Q(19));
DFF18: DFF port map (CLK,D(18), Q(18));
DFF17: DFF port map (CLK,D(17), Q(17));
DFF16: DFF port map (CLK,D(16), Q(16));
DFF15: DFF port map (CLK,D(15), Q(15));
DFF14: DFF port map (CLK,D(14), Q(14));
DFF13: DFF port map (CLK,D(13), Q(13));
DFF12: DFF port map (CLK,D(12), Q(12));
DFF11: DFF port map (CLK,D(11), Q(11));
DFF10: DFF port map (CLK,D(10), Q(10));
DFF9: DFF port map (CLK,D(9), Q(9));
DFF8: DFF port map (CLK,D(8), Q(8));
DFF7: DFF port map (CLK,D(7), Q(7));
DFF6: DFF port map (CLK,D(6), Q(6));
DFF5: DFF port map (CLK,D(5), Q(5));
DFF4: DFF port map (CLK,D(4), Q(4));
DFF3: DFF port map (CLK,D(3), Q(3));
DFF2: DFF port map (CLK,D(2), Q(2));
DFF1: DFF port map (CLK,D(1), Q(1));
DFF0: DFF port map (CLK,D(0), Q(0));
end architecture;


