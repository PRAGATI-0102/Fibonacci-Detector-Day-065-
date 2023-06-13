library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FIB_DET is
    port (
        X : in std_logic_vector(9 downto 0);  -- Binary representation of the input number
        Y : out std_logic                     -- Output is a Fibonacci number
    );
end FIB_DET;

architecture behavioral of FIB_DET is

    constant fibonacci_limit : integer := 1024;  -- Maximum Fibonacci number limit

    -- function to check if a number is Fibonacci
	 
    function isFibonacciNumber(n : integer) return boolean is
	 
        variable prev, current, temp : integer := 1;
		  
    begin
	 
        if n <= 1 then
            return true;
        end if;

        while (current < n) loop
            temp := current;
            current := current + prev;
            prev := temp;
        end loop;

        if current = n then
            return true;
        else
            return false;
        end if;
		  
    end function;

begin
    process (X)
	 
        variable decimal_input : integer;
		  
    begin
        -- Convert binary input to decimal
		  
        decimal_input := to_integer(unsigned(X));

        if isFibonacciNumber(decimal_input) then
		  
            Y <= '1';  -- Input is a Fibonacci number
				
        else
		  
            Y <= '0';  -- Input is not a Fibonacci number
				
        end if;
    end process;
end behavioral;
