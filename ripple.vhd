
ENTITY myAdd32S IS
  PORT (
    a,b:IN BIT_VECTOR (31 DOWNTO 0);
    cin:IN BIT;
    sum:OUT BIT_VECTOR (31 DOWNTO 0);
    cout:OUT BIT
  );
END myAdd32S;
ARCHITECTURE behMyAdd32S OF myAdd32S IS
SIGNAL car: BIT_VECTOR (32 DOWNTO 0);
BEGIN 
  car(0) <= cIn;
  PROCESS (a,b,car)
  BEGIN
    FOR i IN 0 to 31 LOOP
      sum(i) <= a(i) XOR b(i) xor car(i);
      car(i+1) <= (a(i) and b(i)) or (car(i) and (a(i) xor b(i)));
    END LOOP;
  END PROCESS;
  cout <= car(32);
END ARCHITECTURE;


