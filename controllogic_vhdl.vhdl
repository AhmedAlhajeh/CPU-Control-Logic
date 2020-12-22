library ieee;
use ieee.std_logic_1164.all;
use work.opcodes.all;
use ieee.numeric_std.all;

ENTITY controllogic_vhdl is
PORT ( 
	CLK : IN STD_LOGIC;
	RESET : IN STD_LOGIC;
	MBUSY		: IN STD_LOGIC;
	IR		: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	D		: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	
	RD		: OUT STD_LOGIC;
	WR		: OUT STD_LOGIC;
	LOAD_MAR : OUT STD_LOGIC;
	
	SEL_A_REG : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	OEA_REG : OUT STD_LOGIC;
	SEL_B_REG : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	OEB_REG : OUT STD_LOGIC;
	SEL_D_REG : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	LOAD_REG : OUT STD_LOGIC;
	
	OE_PC : OUT STD_LOGIC;
	LOAD_PC : OUT STD_LOGIC;
	LOAD_IR : OUT STD_LOGIC;
	ALU_OP : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
);
END controllogic_vhdl;

ARCHITECTURE RTL of controllogic_vhdl IS
TYPE State_type IS 
(
	Zero,
	Fetch_1,
	Fetch_2,
	Fetch_3,
	Decode,
	LDC_1,
	LDC_2,
	LD_1,
	ST_1,
	JAL_1,
	BRANCH
	
);

	SIGNAL CLUState : State_type;

BEGIN
	-- The next state logic is in the PROCESS block
	PROCESS (CLK,RESET)
	BEGIN
		IF (RESET = '1') THEN
			CLUState <= Zero;
		
		ELSIF rising_edge(CLK) THEN
			CASE CLUState IS
				WHEN  Zero =>
					CLUState <= Fetch_1;
				WHEN Fetch_1 =>
					CLUState <= Fetch_2;
				WHEN Fetch_2 =>
					CLUState <= Fetch_3;
				WHEN Fetch_3 =>
					CLUState <= Decode;
				
				
				WHEN Decode =>
					CASE IR (15 downto 12) IS
						WHEN LD_C =>
							CLUState <= LDC_1;
						WHEN LD =>
							CLUState <= LD_1;
						WHEN ST =>
							CLUState <= ST_1;
						WHEN JAL =>
							CLUState <= JAL_1;
						WHEN ADD =>
							CLUState <= Fetch_1;
						WHEN SUBTRACT =>
							CLUState <= Fetch_1;
						WHEN INCREMENT =>
							CLUState <= Fetch_1;
						WHEN SHL =>
							CLUState <= Fetch_1;
						WHEN SHR_L =>
							CLUState <= Fetch_1;
						WHEN SHR_A =>
							CLUState <= Fetch_1;
						WHEN NOP =>
							CLUState <= Fetch_1;
						WHEN BEQ =>
							IF (to_integer(signed(D)) = 0) THEN
								CLUState <= BRANCH;
							ELSE	
								CLUState <= Fetch_1;
							END IF;
						WHEN BLT =>
							IF (to_integer(signed(D)) <  0) THEN
								CLUState <= BRANCH;
							ELSE
								CLUState <= Fetch_1;
							END IF;
						WHEN BLE =>
							IF (to_integer(signed(D)) <=  0) THEN
								CLUState <= BRANCH;
							ELSE
								CLUState <= Fetch_1;
							END IF;
						
					--Reloop 
						WHEN HALT =>
							CLUState <= Decode;
						WHEN OTHERS =>
					END CASE;
					
					
				WHEN LDC_1 =>
					CLUState <= LDC_2;
				WHEN LDC_2 =>
					CLUState <= Fetch_1;
					
				WHEN LD_1 =>
					CLUState <= Fetch_1;
					
				WHEN ST_1 =>
					CLUState <= Fetch_1;
					
				WHEN JAL_1 =>
					CLUState <= Fetch_1;
					
				WHEN OTHERS =>
					CLUState <= Zero;
			END CASE;
		END IF;
	END PROCESS;
	
	-- Output logic starts here
	PROCESS (CLUState, IR)
	BEGIN	
		-- Default values for the outputs are set outside the CASE statement
		RD <= '0';
		WR	<= '0';
		LOAD_MAR <= '0';
		
		SEL_A_REG <= "000";
		OEA_REG <= '0';
		SEL_B_REG <= "000";
		OEB_REG <= '0';
		SEL_D_REG <= "000";
		LOAD_REG <= '0';		
		OE_PC <= '0';
		LOAD_PC <= '0';
		LOAD_IR <= '0';
		ALU_OP <= NOP (2 DOWNTO 0);

		CASE CLUState IS
			WHEN  Zero =>
			WHEN Fetch_1 =>
				OE_PC <= '1';
				OEB_REG <= '1';
				SEL_B_REG <= "000";
				ALU_OP <= ADD (2 downto 0);
				LOAD_MAR <= '1';
			WHEN Fetch_2 =>
				RD <= '1';
				LOAD_IR <='1';
			WHEN Fetch_3 =>
				OE_PC <= '1';
				ALU_OP <= INCREMENT (2 downto 0);
				LOAD_PC <= '1';
			WHEN Decode =>
				CASE IR(15 downto 12) IS
				
				--Load Code Instruction (OPCODE 8)
					WHEN LD_C =>
						OE_PC <= '1';
						OEB_REG <= '1';
						SEL_B_REG <= "000";
						ALU_OP <= ADD (2 downto 0);
						LOAD_MAR <= '1';
				--Add instruction (OPCODE 0)
					WHEN ADD =>
						OEA_REG <= '1';
						SEL_A_REG <= IR (6 downto 4);
						OEB_REG <= '1';
						SEL_B_REG <= IR (2 downto 0);
						LOAD_REG <= '1';
						SEL_D_REG <= IR (10 downto 8);
						ALU_OP <= ADD (2 downto 0);
				--Subtract Instruction (OPCODE 1)
				   WHEN SUBTRACT =>
						OEA_REG <= '1';
						SEL_A_REG <= IR (6 downto 4);
						OEB_REG <= '1';
						SEL_B_REG <= IR (2 downto 0);
						LOAD_REG <= '1';
						SEL_D_REG <= IR (10 downto 8);
						ALU_OP <= SUBTRACT (2 downto 0);
				--Increment Instruction (OPCODE 2)
					WHEN INCREMENT =>
						OEA_REG <= '1';
						SEL_A_REG <= IR (10 downto 8);
						LOAD_REG <= '1';
						SEL_D_REG <= IR (10 downto 8);
						ALU_OP <= INCREMENT (2 downto 0);
				--Shift left Instruction (OPCODE 3)
					WHEN SHL =>
						OEA_REG <= '1';
						SEL_A_REG <= IR (6 downto 4);
						OEB_REG <= '1';
						SEL_B_REG <= IR (2 downto 0);
						LOAD_REG <= '1';
						SEL_D_REG <= IR (10 downto 8);
						ALU_OP <= SHL (2 downto 0);
				--Shift right (logical) Instruction (OPCODE 4)
					WHEN SHR_L =>
						OEA_REG <= '1';
						SEL_A_REG <= IR (6 downto 4);
						OEB_REG <= '1';
						SEL_B_REG <= IR (2 downto 0);
						LOAD_REG <= '1';
						SEL_D_REG <= IR (10 downto 8);
						ALU_OP <= SHR_L (2 downto 0);
				--Shift right (arithmetic) Instruction (OPCODE 5)
					WHEN SHR_A =>
						OEA_REG <= '1';
						SEL_A_REG <= IR (6 downto 4);
						OEB_REG <= '1';
						SEL_B_REG <= IR (2 downto 0);
						LOAD_REG <= '1';
						SEL_D_REG <= IR (10 downto 8);
						ALU_OP <= SHR_A (2 downto 0);
				--No operation Instruction (OPCODE 6)
					WHEN NOP =>
						ALU_OP <= NOP (2 downto 0);
				--Load Instruction (OPCODE 7)
					WHEN LD =>
				      OEA_REG <= '1';
						SEL_A_REG <= IR (6 downto 4);
						OEB_REG <= '1';
						SEL_B_REG <= IR (2 downto 0);
						ALU_OP <= ADD (2 downto 0);
						LOAD_MAR <= '1';
				--Store Instruction (OPCODE 9)
					WHEN ST =>
				      OEA_REG <= '1';
						SEL_A_REG <= IR (6 downto 4);
						OEB_REG <= '1';
						SEL_B_REG <= IR (2 downto 0);
						ALU_OP <= ADD (2 downto 0);
						LOAD_MAR <= '1';
				--Jump and link Instruction (OPCODE 13)
					WHEN JAL =>
						OE_PC <= '1';
						OEB_REG <= '1';
						SEL_B_REG <= "000";
						ALU_OP <= ADD (2 downto 0);
						LOAD_REG <= '1';
						SEL_D_REG <= IR (6 downto 4);
					
				
						
						
					WHEN OTHERS =>
				END CASE;
			WHEN LDC_1 =>
				RD <= '1';
				LOAD_REG <= '1';
				SEL_D_REG <= IR(10 downto 8);
			WHEN LDC_2 =>
				OE_PC <='1';
				ALU_OP <= INCREMENT (2 downto 0);
				LOAD_PC <= '1';
				
			WHEN LD_1 =>
				RD <= '1';
				LOAD_REG <= '1';
				SEL_D_REG <= IR(10 downto 8);
				
			WHEN ST_1 =>
				OEA_REG <= '1';
				SEL_A_REG <= IR (10 downto 8);
				OEB_REG <= '1';
				SEL_B_REG <= "000";
				WR <= '1';
				ALU_OP <= ADD (2 downto 0);
				
			WHEN BRANCH =>
				OE_PC <='1';
				OEB_REG <= '1';
				SEL_B_REG <= IR (6 downto 4);
				ALU_OP <= ADD (2 downto 0);
				LOAD_PC <= '1';
				
				
			WHEN JAL_1 =>
				OEA_REG <= '1';
				SEL_A_REG <= IR (10 downto 8);
				OEB_REG <= '1';
				SEL_B_REG <= "000";
				ALU_OP <= ADD (2 downto 0);
				LOAD_PC <= '1';
				
				
				
				
			WHEN OTHERS  =>
		END CASE;
	END PROCESS;
END ARCHITECTURE RTL;