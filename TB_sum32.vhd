
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_sum32 IS
END TB_sum32;
 
ARCHITECTURE behavior OF TB_sum32 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sumador_32b
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         SUM : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal SUM : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumador_32b PORT MAP (
          A => A,
          B => B,
          SUM => SUM
        );

   -- Clock process definitions
 
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
		A <= "00000000000000000000000000000010"; 
		B <= "00000000000000000000000000000011";

		wait for 10 ns;	
		A <= "00000000000000000000000000001000"; 
		B <= "00000000000000000000000000000100";

      wait;
   end process;

END;
