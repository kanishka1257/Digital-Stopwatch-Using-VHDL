 
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; -- required libraries 
use IEEE.NUMERIC_STD.ALL; 
 
entity SSDDriver is 
    Port ( D0 : in STD_LOGIC_VECTOR (3 downto 0);  
           D1 : in STD_LOGIC_VECTOR (3 downto 0); 
           D2 : in STD_LOGIC_VECTOR (3 downto 0); 
           D3 : in STD_LOGIC_VECTOR (3 downto 0);
           CLK : in STD_LOGIC; -- input clock 
 
           DP : out STD_LOGIC; -- output for the decimal point 
           Anodes : out STD_LOGIC_VECTOR (3 downto 0); 
           temp : out STD_LOGIC_VECTOR (3 downto 0)); 
end SSDDriver; 
 
architecture Behavioral of SSDDriver is 
 
begin 
    process (CLK)  
     
        variable SEL : unsigned (1 downto 0) := "00"; 
         
    begin 
     
        if (rising_edge(CLK)) then -- multiplexer 
            case SEL is 
             
                when "00" => temp <= D0;  
                    Anodes <= "1110";
                    DP <= '1'; 
                    SEL := SEL + 1; 
                     
                when "01" => temp <= D1; 
                    Anodes <= "1101";
                    DP <= '1'; 
                    SEL := SEL + 1;  
                         
                when "10" => temp <= D2;  
                    Anodes <= "1011";  
                    DP <= '0'; 
                    SEL := SEL + 1; p 
                     
                when others => temp <= D3;  
                    Anodes <= "0111"; 
                    DP <= '1';
                    SEL := "00";  
            end case; 
             
        end if; 
         
    end process; 
 
end Behavioral;
