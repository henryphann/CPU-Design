LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY ssegModified IS
    PORT (
        bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        leds_magnitude : OUT STD_LOGIC_VECTOR(1 TO 7));
END ssegModified;

ARCHITECTURE Behavior OF ssegModified IS
BEGIN
    PROCESS (bcd)
    BEGIN
        CASE bcd IS
            WHEN "0000" => leds_magnitude <= not("0111011");  -- Display Y
            WHEN "0001" => leds_magnitude <= not("0010101");  -- Display N
            WHEN OTHERS => leds_magnitude <= not("0000000");
        END CASE;
    END PROCESS;
END Behavior;
