entity shift_e is
port(
si,clr,clk:in bit;
so:out bit;
q:out bit_vector(3 downto 0)
);
end entity;

architecture shift_a of shift_e is
signal shift:bit_vector(0 to 3):="0001";
begin
process(clk,clr,si)
begin
if clr='1' then
shift<="0000";
elsif clk'event and clk='1' then
shift<=shift(1 to 3)&si;
end if;
so<=shift(0);
end process;
q<=shift;
end architecture;

