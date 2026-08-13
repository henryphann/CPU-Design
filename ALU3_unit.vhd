LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity ALU3_unit is -- ALU unit includes Reg. 3
	port ( clk : in std_logic ;
		Reg1, Reg2 : in std_logic_vector(7 downto 0); -- 8-bit inputs A & B from Reg. 1 & Reg. 2
			opcode : in std_logic_vector(7 downto 0); -- 8-bit opcode from Decoder
			student_id : in std_logic_vector(3 downto 0); -- 4 bit student_ID
			Result : out std_logic_vector(3 downto 0)); -- 8-bit result
end ALU3_unit ;

architecture calculation of ALU3_unit is
signal R1 : std_logic_vector(3 downto 0);
begin
	process (clk)
	begin
		if (clk'EVENT AND clk = '1') then
			case opcode is
				when "00000001" =>
				if(student_id(0) = '0') then
				R1 <= "0000"; -- means "y"
				else
				R1 <= "0001"; -- means "n"
				end if;
				
				when "00000010" =>
				if(student_id(0) = '0') then
				R1 <= "0000"; -- means "y"
				else
				R1 <= "0001"; -- means "n"
				end if;

				when "00000100" =>
				if(student_id(0) = '0') then
				R1 <= "0000"; -- means "y"
				else
				R1 <= "0001"; -- means "n"
				end if;

				when "00001000" =>
				if(student_id(0) = '0') then
				R1 <= "0000"; -- means "y"
				else
				R1 <= "0001"; -- means "n"
				end if;

				when "00010000" =>
				if(student_id(0) = '0') then
				R1 <= "0000"; -- means "y"
				else
				R1 <= "0001"; -- means "n"
				end if;

				when "00100000" =>
				if(student_id(0) = '0') then
				R1 <= "0000"; -- means "y"
				else
				R1 <= "0001"; -- means "n"
				end if;

				when "01000000" =>
				if(student_id(0) = '0') then
				R1 <= "0000"; -- means "y"
				else
				R1 <= "0001"; -- means "n"
				end if;

				when "10000000" =>
				if(student_id(0) = '0') then
				R1 <= "0000"; -- means "y"
				else
				R1 <= "0001"; -- means "n"
				end if;

				when others => -- Don’t care, do nothing
			end case ;
		end if;
	end process ;
	Result <= R1;
end calculation ;
