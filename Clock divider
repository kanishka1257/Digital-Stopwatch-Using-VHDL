library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.NUMERIC_STD.ALL; 
 
entity ClkDivider is 
    Port ( CLK : in STD_LOGIC; -- system clock 
           Divisor : in STD_LOGIC_VECTOR ( 31 downto 0 ); -- Divisor = ( system frequency / ( 2 * desired clock 
frequency ) ) 
           CLKOUT : out STD_LOGIC ); 
end ClkDivider; 
 
architecture Behavioral of ClkDivider is 
 
    signal CLKTOG : STD_LOGIC := '0'; 
begin 
 
    process ( CLK )     
        variable count : unsigned ( 31 downto 0 ) := x"00000000";       
    begin 
     
        if ( rising_edge ( CLK ) ) then 
            count := count + 1; 
            if ( STD_LOGIC_VECTOR ( count ) = Divisor ) then 
                CLKTOG <= NOT CLKTOG;
                count := x"00000000";                  
            end if;       
        end if; 
         
    end process; 
     
    CLKOUT <= CLKTOG;
 
end Behavioral;
