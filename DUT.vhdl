-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
-- FIB_DET.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(9 downto 0);
       	output_vector: out std_logic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is
   component FIB_DET is
     port(X      : in std_logic_vector(9 downto 0);
		    Y      : out std_logic);
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: FIB_DET 
			port map (
					

					X(9)   => input_vector(9),
					X(8)   => input_vector(8),
					X(7)   => input_vector(7),
					X(6)   => input_vector(6),
					X(5)   => input_vector(5),
					
					X(4)   => input_vector(4),
					X(3)   => input_vector(3),
					X(2)   => input_vector(2),
					X(1)   => input_vector(1),
					X(0)   => input_vector(0),
					
					
					Y   => output_vector(0));

end DutWrap;

