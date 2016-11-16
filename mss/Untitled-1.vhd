library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity four_bit_counter is
port(clock,reset : in bit;
     output : out std_logic_vector(3 downto 0));
end four_bit_counter;

architecture behavior of four_bit_counter is
signal counter_value : std_logic_vector( 3 downto 0):="0000";

begin
   process(clock,reset)
     variable previous_clock :bit:='0';
   begin
     if (reset = '1') then counter_value<= "0000" after 5 ns;
     end if;

     if ((reset = '0') and (clock = '1') and (clock /=previous_clock))
     then counter_value <= counter_value+1 after 5 ns;
     end if;
     previous_clock :=clock;
     output <= counter_value after 5 ns;
  end process;
end behavior;
