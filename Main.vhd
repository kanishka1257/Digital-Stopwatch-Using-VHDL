library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.NUMERIC_STD.ALL; 
 
entity Stopwatch_main is 
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           segments : out STD_LOGIC_VECTOR ( 6 downto 0 ); 
           Anodes : out STD_LOGIC_VECTOR ( 3 downto 0 );
           DP : out STD_LOGIC );
end Stopwatch_main; 
architecture Behavioral of Stopwatch_main is 
    component ClkDivider port ( CLK: in STD_LOGIC; 
                                Divisor : in STD_LOGIC_VECTOR ( 31 downto 0 ); 
                                CLKOUT : out STD_LOGIC ); 
    end component; 
     
 
    component SSDDriver port ( D0, D1, D2, D3 : in STD_LOGIC_VECTOR ( 3 downto 0 ); 
                               CLK : in STD_LOGIC; 
                               DP : out STD_LOGIC; 
                               Anodes, temp : out STD_LOGIC_VECTOR ( 3 downto 0 ) ); 
    end component; 
     
   
    component Digits port ( S, RST, CLK : in STD_LOGIC; 
                            N : out STD_LOGIC; 
                            D : out STD_LOGIC_VECTOR ( 3 downto 0 ) ); 
    end component; 
     
   
    component SevSegmentDisplayModule port ( digit : in STD_LOGIC_VECTOR ( 3 downto 0 ); 
                                             Segs : out STD_LOGIC_VECTOR ( 6 downto 0 ) ); 
    end component;    
    signal CLKINA, CLKIN0, S10, N0, N1, N2, N3 : STD_LOGIC := '0'; 
    signal temp, D0, D1, D2, D3 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
begin    
    process ( CLKINA )     
    begin 
 
        if ( rising_edge ( CLKINA ) ) then 
            if S1 = '1' then  
                S10 <= '1';  
                 
            elsif S2 = '1' then 
                S10 <= '0'; 
                 
            end if;         
 
        end if; 
     
    end process; 
     
    ClkA : ClkDivider port map ( CLK => CLK, Divisor => x"000186A0", CLKOUT => CLKINA );    
    Clk0 : ClkDivider port map ( CLK => CLK, Divisor => x"0007A120", CLKOUT => CLKIN0 ); 
    Digit0 : Digits port map ( CLK => CLKIN0, RST => RST, S => S10, D => D0, N => N1 ); 
    Digit1 : Digits port map ( CLK => N1, RST => RST, S => S10, D => D1, N => N2 ); 
    Digit2 : Digits port map ( CLK => N2, RST => RST, S => S10, D => D2, N => N3 ); 
    Digit3 : Digits port map ( CLK => N3, RST => RST, S => S10, D => D3, N => N0 ); -
     
    Driver : SSDDriver port map ( D0 => D0, D1 => D1, D2 => D2, D3 => D3, CLK => CLKINA, DP => DP, 
Anodes => Anodes, temp => temp );
    Display : SevSegmentDisplayModule port map ( digit => temp, Segs => segments ); 
     
end Behavioral; 
