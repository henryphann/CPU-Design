LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity ALU2_unit is -- ALU unit includes Reg. 3
	port ( clk : in std_logic ;
		Reg1, Reg2 : in std_logic_vector(7 downto 0); -- 8-bit inputs A & B from Reg. 1 & Reg. 2
			opcode : in std_logic_vector(7 downto 0); -- 8-bit opcode from Decoder
			sign : out std_logic;
			R1 : out std_logic_vector(3 downto 0); -- first 4-bit of the result
			R2 : out std_logic_vector(3 downto 0)); -- second 4-bit of the result
end ALU2_unit ;

architecture calculation of ALU2_unit is
signal Result : std_logic_vector(7 downto 0);
begin
	process (clk)
	begin
		if (clk'EVENT AND clk = '1') then
			case opcode is
				when "00000001" =>
					sign <= '0';
					Result(0) <= Reg1(4); -- Swap the lower and upper 4 bits of A
					Result(1) <= Reg1(5);
					Result(2) <= Reg1(6);
					Result(3) <= Reg1(7);
					Result(4) <= Reg1(0);
					Result(5) <= Reg1(1);
					Result(6) <= Reg1(2);
					Result(7) <= Reg1(3);

				when "00000010" =>
					sign <= '0';
					Result <= (Reg1 OR Reg2);-- Result of ORing A and B
					
				when "00000100" =>
					if("00000101" > Reg2) then
						sign <= '1';
					else
						sign <= '0';
					end if; 		
						Result <= (Reg2 - "00000101"); -- Decrement B by 5
						
				when "00001000" =>
					sign <= '0';
					Result <= NOT(Reg1); -- Invert all bits of A
					
				when "00010000" =>
					sign <= '0';
					Result(0) <= reg1(7); -- Inverting the bit-significance of A
					Result(1) <= reg1(6);
					Result(2) <= reg1(5);
					Result(3) <= reg1(4);
					Result(4) <= reg1(3);
					Result(5) <= reg1(2);
					Result(6) <= reg1(1);
					Result(7) <= reg1(0);
					
				when "00100000" =>
					if(Reg2 > Reg1) then -- Finds the greater value of A and B
						sign <= '0';
						Result <= Reg2;
				  else
						sign <= '0';
						Result <= Reg1;
				  end if;
				  
				when "01000000" =>
					if(Reg2 > Reg1) then
						sign <= '1';
					else
						sign <= '0';
					end if;
					
					Result <= (Reg1 - Reg2); -- Do subtraction for Reg1 and Reg2
					
				when "10000000" =>
					sign <= '0';
					Result <= NOT(Reg1 XOR Reg2); -- Result of XNORing A and B
					
				when others => -- Don’t care, do nothing
			end case ;
		end if;
	end process;
	R1 <= Result(7 downto 4);
	R2 <= Result(3 downto 0);
end calculation ;
