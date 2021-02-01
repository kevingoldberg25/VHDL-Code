library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity lab1_tb is
end lab1_tb;

architecture Behavioral of lab1_tb is

--INPUTS--
signal A, B: STD_LOGIC_VECTOR(3 downto 0);
signal OP: STD_LOGIC_VECTOR(2 downto 0);
-- OUTPUTS --
signal X, Y: STD_LOGIC_VECTOR(3 downto 0);
signal C, V: STD_LOGIC;

type test_data_type is record
    A: STD_LOGIC_VECTOR(3 downto 0);
    B: STD_LOGIC_VECTOR(3 downto 0);
    OP: STD_LOGIC_VECTOR(2 downto 0);
    X: STD_LOGIC_VECTOR(3 downto 0);
    Y: STD_LOGIC_VECTOR(3 downto 0);
    C: STD_LOGIC;
    V: STD_LOGIC;
end record;

type test_data_array_type is array(natural range<>) of test_data_type;

constant OPCODE_LIST: test_data_array_type := (
    (x"0",x"C","000",x"3",x"0",'0','0'),
    (x"1",x"4","000",x"A",x"0",'0','0'),
    (x"2",x"3","001",x"D",x"0",'0','0'),
    (x"3",x"A","001",x"D",x"0",'0','0'),
    (x"4",x"7","010",x"3",x"0",'0','0'),
    (x"5",x"9","010",x"C",x"0",'0','0'),
    (x"6",x"9","011",x"F",x"0",'0','0'),
    (x"7",x"A","011",x"1",x"0",'1','0'),
    (x"8",x"7","100",x"F",x"0",'0','0'),
    (x"9",x"8","100",x"1",x"0",'0','1'),
    (x"A",x"B","101",x"F",x"0",'0','0'),    
    (x"B",x"D","101",x"E",x"0",'0','0'),
    (x"C",x"4","110",x"0",x"3",'0','0'),
    (x"D",x"2","110",x"A",x"1",'0','0'),
    (x"E",x"E","111",x"4",x"0",'0','0'),
    (x"F",x"F","111",x"1",x"0",'0','0')
    );
 
signal test_vector_index: integer range 0 to OPCODE_LIST'length-1 := 0;
constant PERIOD: time := 10 ns;

BEGIN
duv: entity work.ALU
-- uut: ALU 
port map(
            A => A,
            B => B,
            OPCODE => OP,
            X => X,
            Y => Y,
            C => C,
            V => V
            );

ALU_test_1: process
variable debug_line: line;
begin
    for i in OPCODE_LIST'range loop
        A <= OPCODE_LIST(i).A;
        B <= OPCODE_LIST(i).B;
        OP <= OPCODE_LIST(i).OP;

        test_vector_index <= i;
        wait for PERIOD;
    end loop;
end process;

ALU_response: process
variable debug_line: line;
begin
    wait on test_vector_index;
    
    wait for PERIOD/2;
    
    if X /= OPCODE_LIST(test_vector_index).X then
            write(debug_line, string'("Error -- X = "));
            write(debug_line, X);
            write(debug_line, string'("EXPECTED -- X = "));
            write(debug_line, OPCODE_LIST(test_vector_index).X);
            writeline(output, debug_line);
            report "SIMULATION FAILED"
            severity WARNING;
        end if;
        
    if Y /= OPCODE_LIST(test_vector_index).Y then
            write(debug_line, string'("Error -- Y = "));
            write(debug_line, Y);
            write(debug_line, string'("EXPECTED -- Y = "));
            write(debug_line, OPCODE_LIST(test_vector_index).Y);
            writeline(output, debug_line);
            report "SIMULATION FAILED"
            severity WARNING;
        end if;
        
    if C /= OPCODE_LIST(test_vector_index).C then
            write(debug_line, string'("Error -- C = "));
            write(debug_line, C);
            write(debug_line, string'("EXPECTED -- C = "));
            write(debug_line, OPCODE_LIST(test_vector_index).C);
            writeline(output, debug_line);
            report "SIMULATION FAILED"
            severity WARNING;
        end if;
        
    if V /= OPCODE_LIST(test_vector_index).V then
            write(debug_line, string'("Error -- V = "));
            write(debug_line, V);
            write(debug_line, string'("EXPECTED -- V = "));
            write(debug_line, OPCODE_LIST(test_vector_index).V);
            writeline(output, debug_line);
            report "SIMULATION FAILED"
            severity WARNING;
        end if;
wait for 10 ns;
end process;  

end Behavioral;
