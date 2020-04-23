LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.MATH_REAL.ALL;
 
ENTITY Kalkulator_Digital IS
	PORT
	(
		A   		: INOUT SIGNED    (3 DOWNTO 0);
		B   		: IN   SIGNED    (3 DOWNTO 0);
		CHOOSE	: IN   STD_LOGIC_VECTOR (2 DOWNTO 0);
		X   		: INOUT  SIGNED    (7 DOWNTO 0)
	);
END Kalkulator_Digital;
 
ARCHITECTURE Digital_Calc OF Kalkulator_Digital IS
	SIGNAL	TEMP	:	INTEGER	:=0;

BEGIN

	Kalkulator : PROCESS(A, B, CHOOSE, TEMP)
	BEGIN
		CASE CHOOSE IS
			WHEN "000" =>								-- Penjumlahan / Adder
				X<=("0000" & A) + ("0000" & B);
			WHEN "001" =>								-- Pengurangan / Subtractor
				X<=("0000" & A) - ("0000" & B);
			WHEN "010" =>								-- Perkalian / Multiplier
				X<=A * B;
			WHEN "011" =>								-- Pembagian / Divider
				X<=("0000" & A) / ("0000" & B);
			WHEN "100" =>								-- Pangkat / Power (Maksimal * bit biner output)
				TEMP	<=	TO_INTEGER(A) ** TO_INTEGER(B);
				X		<=	TO_SIGNED(TEMP, 8);
			WHEN OTHERS =>
			NULL;
		END CASE;

	END PROCESS Kalkulator;

END Digital_Calc;