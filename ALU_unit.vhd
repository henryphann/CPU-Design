LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity ALU_unit is -- ALU unit includes Reg. 3
	port ( clk : in std_logic ;
		Reg1, Reg2 : in std_logic_vector(7 downto 0); -- 8-bit inputs A & B from Reg. 1 & Reg. 2
			opcode : in std_logic_vector(7 downto 0); -- 8-bit opcode from Decoder
			sign : out std_logic;
			R1 : out std_logic_vector(3 downto 0); -- first 4-bit of the result
			R2 : out std_logic_vector(3 downto 0)); -- second 4-bit of the result
end ALU_unit ;

architecture calculation of ALU_unit is
signal Result : std_logic_vector(7 downto 0);
begin
	process ( clk )
	begin
		if (clk'EVENT AND clk = '1') then
			case opcode is
				when "00000001" =>
					sign <= '0';
					Result <= (Reg1 + Reg2); -- Do addition for Reg1 and Reg2
				when "00000010" =>
				if(Reg2 > Reg1) then
					sign <= '1';
				else
					sign <= '0';
				end if; 
				
				Result <= (Reg1 - Reg2); -- Do subtraction for Reg1 and Reg2
				
				when "00000100" =>
					sign <= '0';
					Result <= NOT(Reg1); -- Do inverse
				when "00001000" =>
					sign <= '0';
					Result <= NOT(Reg1 AND Reg2);-- Do Boolean NAND
				when "00010000" =>
					sign <= '0';
					Result <= NOT(Reg1 OR Reg2);-- Do Boolean NOR
				when "00100000" =>
					sign <= '0';
					Result <= (Reg1 AND Reg2);-- Do Boolean AND
				when "01000000" =>
					sign <= '0';
					Result <= (Reg1 XOR Reg2);-- Do Boolean XOR
				when "10000000" =>
					sign <= '0';
					Result <= (Reg1 OR Reg2);-- Do Boolean OR
				when others => -- Don’t care, do nothing
			end case ;
		end if;
	end process;
	R1 <= Result(7 downto 4);
	R2 <= Result(3 downto 0);
end calculation ;
