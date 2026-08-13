LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY sseg IS
    PORT (
        bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        sign : IN STD_LOGIC;
        leds_magnitude : OUT STD_LOGIC_VECTOR(1 TO 7);
        leds_sign : OUT STD_LOGIC_VECTOR(1 TO 7)
    );
END sseg;

ARCHITECTURE Behavior OF sseg IS
BEGIN
    PROCESS (bcd, sign)
    BEGIN
        IF sign = '1' THEN
            leds_sign <= not("0000001");  
        ELSE
            leds_sign <= "1111111";  
        END IF;

        CASE bcd IS
            WHEN "0000" => leds_magnitude <= not("1111110");  -- Display 0
            WHEN "0001" => leds_magnitude <= not("0110000");  -- Display 1
            WHEN "0010" => leds_magnitude <= not("1101101");  -- Display 2
            WHEN "0011" => leds_magnitude <= not("1111001");  -- Display 3
            WHEN "0100" => leds_magnitude <= not("0110011");  -- Display 4
            WHEN "0101" => leds_magnitude <= not("1011011");  -- Display 5
            WHEN "0110" => leds_magnitude <= not("1011111");  -- Display 6
            WHEN "0111" => leds_magnitude <= not("1110000");  -- Display 7
            WHEN "1000" => leds_magnitude <= not("1111111");  -- Display 8
            WHEN "1001" => leds_magnitude <= not("1111011");  -- Display 9
            WHEN "1010" => leds_magnitude <= not("1110111");  -- Display A
            WHEN "1011" => leds_magnitude <= not("0011111");  -- Display B
            WHEN "1100" => leds_magnitude <= not("1001110");  -- Display C
            WHEN "1101" => leds_magnitude <= not("0111101");  -- Display D
            WHEN "1110" => leds_magnitude <= not("1001111");  -- Display E
            WHEN "1111" => leds_magnitude <= not("1000111");  -- Display F
            WHEN OTHERS => leds_magnitude <= not("0000000");
        END CASE;
    END PROCESS;
END Behavior;
