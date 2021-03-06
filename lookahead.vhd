ENTITY myAdd32 IS
  PORT (
    A,B:IN BIT_VECTOR (31 DOWNTO 0);
    Cin:IN BIT;
    Sum:OUT BIT_VECTOR (31 DOWNTO 0);
    Cout:OUT BIT
  );
END Entity;

ARCHITECTURE behAdd32 OF myAdd32 IS
SIGNAL Gen: BIT_VECTOR (31 DOWNTO 0);
SIGNAL Pro: BIT_VECTOR (31 DOWNTO 0);
SIGNAL Carry: BIT_VECTOR (32 DOWNTO 0);
BEGIN
  Gen <= A AND B;
  Pro <= A XOR B;
  Carry(0) <= Cin;
  PROCESS (Gen,Pro,Carry)
  BEGIN
    FOR i IN 1 to 32 LOOP
      Carry(i) <= Gen(i-1) OR (Pro(i-1) AND Carry(i-1));
    END LOOP;
  END PROCESS;
  Sum <= Pro XOR Carry(31 DOWNTO 0);
END ARCHITECTURE;   


