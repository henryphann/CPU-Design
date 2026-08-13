LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY regi IS
    port( A        : in  std_logic_vector(7 downto 0);
            res, clk : in  std_logic;
            Q        : out std_logic_vector(7 downto 0));
END regi;

ARCHITECTURE behavior OF regi IS 
BEGIN
    PROCESS(res, clk)
    BEGIN
        IF (res = '0') THEN
            Q <= "00000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            Q <= A;
        END IF;
    END PROCESS;
END behavior;
