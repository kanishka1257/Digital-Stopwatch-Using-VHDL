 
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.NUMERIC_STD.ALL; 
 
entity Digits is 
    Port ( S : in STD_LOGIC; 
           RST : in STD_LOGIC;  
           CLK : in STD_LOGIC; 
           N : out STD_LOGIC; 
           D : out STD_LOGIC_VECTOR ( 3 downto 0 ) );
end Digits; 
 
architecture Behavioral of Digits is 
 
    signal X : STD_LOGIC := '1'; 
 
begin 
 
    process ( S, CLK ) 
     
        variable count : unsigned ( 3 downto 0 ) := x"0"; 
     
    begin 
         
        if RST = '1' then 
            count := x"0";  
            X <= '1'; 
         
        elsif ( S = '1' and rising_edge ( CLK ) ) then 
            count := count + 1; --counting up 
            if ( STD_LOGIC_VECTOR ( count ) = x"A" ) then 
                count := x"0"; 
                X <= NOT X; 
                     
            elsif ( STD_LOGIC_VECTOR ( count ) = x"5" ) then 
                X <= NOT X;  
                     
            end if; 
             
        end if 
 
        D <= STD_LOGIC_VECTOR ( count ); 
        N <= X; 
    end process; 
 
end Behavioral; 
