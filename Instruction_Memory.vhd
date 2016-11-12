library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use std.textio.all;

entity Instruction_Memory is
	port (	
			  address : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           outInstruction : out  STD_LOGIC_VECTOR (31 downto 0));
			 
end Instruction_Memory;
	 
architecture Behavioral of Instruction_Memory is

	type rom_type is array (0 to 63) of std_logic_vector (31 downto 0);
		
	impure function InitRomFromFile (RomFileName : in string) return rom_type is
		FILE RomFile : text open read_mode is RomFileName;
		variable RomFileLine : line;
		variable temp_bv : bit_vector(31 downto 0);
		variable temp_mem : rom_type;
		begin
			for I in rom_type'range loop
				readline (RomFile, RomFileLine);
				read(RomFileLine, temp_bv);
				temp_mem(i) := to_stdlogicvector(temp_bv);
			end loop;
		return temp_mem;
	end function;
	
	signal instructions : rom_type := InitRomFromFile("test-instructionMemory.txt");

begin

--reset,address, instructions)
	process(reset,address, instructions)--clk)
	begin
		--if(rising_edge(clk))then
			if(reset = '1')then
				outInstruction <= (others=>'0');
			else
				outInstruction <= instructions(conv_integer(address(5 downto 0)));
			end if;
		--end if;
	end process;	 
end Behavioral;

