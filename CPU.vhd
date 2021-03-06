-- 8-bit Opcode Processor Design.
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.std_logic_unsigned.all; -- needed for CONV_INTEGER()

ENTITY ctrl IS PORT (
  clk_ctrl  : IN std_logic;
  rst_ctrl  : IN std_logic );
END ctrl;

ARCHITECTURE fsm OF ctrl IS

TYPE state_type IS (S1,S2,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20);
SIGNAL state: state_type;
SIGNAL AC_state: std_logic_vector(7 DOWNTO 0);

-- Instructions
-- memory operand instructions
CONSTANT ADD : std_logic_vector(3 DOWNTO 0) := "0001";
CONSTANT LDA : std_logic_vector(3 DOWNTO 0) := "0010";
CONSTANT STA : std_logic_vector(3 DOWNTO 0) := "0011";
CONSTANT BUN : std_logic_vector(3 DOWNTO 0) := "0100";

-- register operand instructions
CONSTANT CLA : std_logic_vector(3 DOWNTO 0) := "0101";
CONSTANT INC : std_logic_vector(3 DOWNTO 0) := "0110";
CONSTANT SPA : std_logic_vector(3 DOWNTO 0) := "0111";
CONSTANT SNA : std_logic_vector(3 DOWNTO 0) := "1000";
CONSTANT SZA : std_logic_vector(3 DOWNTO 0) := "1001";
CONSTANT SHR : std_logic_vector(3 DOWNTO 0) := "1010";

TYPE PM_BLOCK IS ARRAY(0 TO 31) OF std_logic_vector(7 DOWNTO 0);
TYPE DM_BLOCK IS ARRAY(0 TO 15) OF std_logic_vector(7 DOWNTO 0);

BEGIN
  PROCESS (rst_ctrl,clk_ctrl)
  VARIABLE PM : PM_BLOCK;
  VARIABLE DM : DM_BLOCK;
  VARIABLE IR : std_logic_vector(7 DOWNTO 0);
  VARIABLE OPCODE : std_logic_vector(3 DOWNTO 0);
  VARIABLE AC : std_logic_vector(7 DOWNTO 0);
  VARIABLE PC : integer RANGE 0 TO 31;
  VARIABLE AR : integer RANGE 0 TO 15; 
  VARIABLE zero_flag, positive_flag: std_logic;
BEGIN
IF (rst_ctrl='1') THEN
PC := 0;
state <= S1;

-- load program memory with statements
-- COUNTER PROGRAM 

PM(0) := "00100000"; -- LDA A,0
PM(1) := "01100000"; -- INCA
PM(2) := "00110000"; -- STA A,0
PM(3) := "01000000"; -- BUN 0001
PM(4) := "00000001"; -- 00001 Address to branch
PM(5) := "00000000"; -- 
PM(6) := "00000000"; -- 
PM(7) := "00000000"; -- 
PM(8) := "00000000"; -- 
PM(9) := "00000000"; -- 

-- load data memory with constants
-- 
DM(0) := "00000000"; -- Constant 0

ELSIF (clk_ctrl'event and clk_ctrl = '1') THEN
CASE state IS
WHEN S1 => -- fetch instruction
  IR := PM(PC);
  AR := CONV_INTEGER(IR(3 DOWNTO 0));
  OPCODE := IR(7 DOWNTO 4);
  PC := PC + 1;
  state <= S2;

WHEN S2 => -- decode instruction
  CASE OPCODE IS
    WHEN ADD => state <= S11;
    WHEN LDA => state <= S12;
    WHEN STA => state <= S13;
    WHEN BUN => state <= S14;
    WHEN CLA => state <= S15;
    WHEN INC => state <= S16;
    WHEN SPA => state <= S17;
    WHEN SNA => state <= S18;
    WHEN SZA => state <= S19;
    WHEN SHR => state <= S20;    
  END CASE;

WHEN S11 => -- ADD
  AC := AC + DM(AR);
  AC_state <= AC;
  state <= S1;

WHEN S12 => -- LDA
  AC := DM(AR);
  AC_state <= AC;
  IF (AC = "00000000") THEN
    zero_flag := '0';
  END IF;
  state <= S1;

WHEN S13 => -- STA
  DM(AR) := AC;
  AC_state <= AC;
  state <= S1;

WHEN S14 => -- BUN
  PC := CONV_INTEGER(PM(PC));
  state <= S1;
  
WHEN S15 => -- CLA
  AC := "00000000";
  AC_state <= AC;
  state <= S1;

WHEN S16 => -- INC
  AC := AC + 1;
  AC_state <= AC;
  IF (AC = "00000000") THEN
    zero_flag := '0';
  END IF;
  state <= S1;

WHEN S17 => -- SPA
  IF (AC(7) = '0') THEN
    PC := PC + 1;
  END IF;
  state <= S1;

WHEN S18 => -- SNA
  IF (AC(7) = '1') THEN
    PC := PC + 1;
  END IF;
  state <= S1;

WHEN S19 => -- SZA
  IF (AC = "00000000") THEN
    PC := PC + 1;
  END IF;
  state <= S1;

WHEN S20 => -- SHR
  AC := '0' & AC(7 downto 1);
  AC_state <= AC;
  state <= S1;

END CASE;

END IF;

END PROCESS;

END fsm;


-- ----------------------------------------------------------
-- The inputs will be in DirectVHDL
 
-- force clk_ctrl 0 0, 1 100 -repeat 200
-- force rst_ctrl 1 0, 0 300
-- run 1000 ns
 
-- Now you can press the simulate big arrow to see results.
-- ----------------------------------------------------------