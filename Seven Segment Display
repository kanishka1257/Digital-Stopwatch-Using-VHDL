library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
 
entity SevSegmentDisplayModule is 
    Port ( digit : in STD_LOGIC_VECTOR (3 downto 0); 
           Segs : out STD_LOGIC_VECTOR (6 downto 0)); 
end SevSegmentDisplayModule; 
 
architecture Behavioral of SevSegmentDisplayModule is 
begin 
    process ( digit ) -- encoder 
   
    begin 
     
 
        case ( digit ) is  
            when "0000" => Segs <= "0000001";  
            when "0001" => Segs <= "1001111"; 
            when "0010" => Segs <= "0010010"; 
            when "0011" => Segs <= "0000110"; 
            when "0100" => Segs <= "1001100"; 
            when "0101" => Segs <= "0100100";  
            when "0110" => Segs <= "0100000";  
            when "0111" => Segs <= "0001111";  
            when "1000" => Segs <= "0000000";  
            when others => Segs <= "0000100"; 
             
        end case; 
         
    end process; 
 
end Behavioral; 
