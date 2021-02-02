<------------------------------------------------------------------------------------------------------
-- Course: ECE 332 - Digital System Design Lab
-- Author: Kevin Goldberg and George Zavala
-- 
-- Create Date:  10/16/2018
-- Experiment Name: Arithmetic Circuits in VHDL (Lab #6)
-- Design Name: Lab_6_2
-- Project Name: bitadder_4 - Behavioral
-- Target Devices: xc7a35t-1cpg236c
--
-- Description:	Design a 4-bit Adder and an Overflow circuit using behavioral VHDL.
-- 				Use the addition operator in a signal assignment statement to describe the 4-bit adder.
--				Assign the fifth bit of the result to the carry-out bit.
--				Use a Boolean expression to describe the overflow bit.
--
-- Basys 3 Board resources used for this design:
-- 				8 slider switches for the inputs (A and B) to the 4-bit adder.
--				1 seven-segment display to display the sum (decimal point is used for carry-out).
--				4 LEDs to display the sum.					
------------------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity bitadder_4 is

	Port(X,Y: in STD_LOGIC_VECTOR(3 downto 0);
	    a, b, c, d, e, f, g : out STD_LOGIC;
		sum: inout STD_LOGIC_VECTOR(3 downto 0);
		Cout, overflow: out STD_LOGIC;
		disp_right, disp_left, disp_midright, disp_midleft : out STD_LOGIC);

end bitadder_4;


architecture behavioral of bitadder_4 is

signal tempsum: STD_LOGIC_VECTOR(4 downto 0);
signal segments : STD_LOGIC_VECTOR(1 to 7);

begin
    tempsum <= ('0' & X) + Y;
	sum <= tempsum(3 downto 0);
	Cout <= tempsum(4);
	overflow <= tempsum(4) XOR (X(3) XOR Y(3) XOR tempsum(3));
	
-- Insert your code for the BCD to seven-segment converter (from Lab 4) here

	with sum select segments <=
    "0000001" when "0000",
	"1001111" when "0001",
	"0010010" when "0010",
	"0000110" when "0011",
	"1001100" when "0100",
	"0100100" when "0101",
	"0100000" when "0110",
	"0001111" when "0111",
	"0000000" when "1000",
	"0000100" when "1001",
	"0001000" when "1010",
    "1100000" when "1011",
    "0110001" when "1100",
    "1000010" when "1101",
    "0110000" when "1110",
    "0111000" when "1111",
	"1111111" when others;

	(a,b,c,d,e,f,g) <= segments;
							
	disp_left <= '1';		-- turn the seven-segment display off					
	disp_midleft <= '1';	-- turn the seven-segment display off 
	disp_midright <= '1';	-- turn the seven-segment display off
	disp_right <= '0';		-- turn the seven-segment display on

end behavioral;
