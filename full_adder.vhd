------------------------------------------------------------------------------------------------------
-- Course: ECE 332 - Digital System Design Lab
-- Author: Kevin Goldberg and George Zavala
-- 
-- Create Date: 10/16/18
-- Experiment Name: Arithmetic Circuits in VHDL (Lab #6)
-- Design Name: Lab_6_1
-- Project Name: full_adder - Behavioral
-- Target Devices: xc7a35t-1cpg236c
--
-- Description:	Design a Full Adder using behavioral VHDL.
--				Assign a Boolean expression to each output (Sum and Cout).
-- 
-- Basys 3 Board resources used for this design:
-- 				3 slider switches for FA inputs (X, Y, Cin).
-- 				2 LEDs for FA outputs (Sum, Cout).
------------------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
 
Port(A,B, Cin: in STD_LOGIC;
	Cout, Sum: out STD_LOGIC);
 
end full_adder;


architecture behavioral of full_adder is

begin
	Sum <= A XOR B XOR Cin;
	Cout <= (A AND B) OR (A AND Cin) OR (B AND Cin);

end behavioral;
