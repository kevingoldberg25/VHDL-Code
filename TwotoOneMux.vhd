------------------------------------------------------------------------------------------------------
-- Course: ECE 332 - Digital System Design Lab
-- Author: Kevin Goldberg and George Zavala
-- 
-- Create Date: 
-- Experiment Name: Modulo-100 Counter in VHDL (using Structural design) 
-- Design Name: Lab_9_TwotoOneMux
-- Project Name: project_9 - Structural
-- Target Devices: xc7a35t-1cpg236c
--
-- Description: This is one of several components used in the design of the Modulo-100 Counter
--				This is the design of the 4-bit Two-to-One Multiplexer using a 'with Mux_selectect when' statement.
--				This design is based on the design for the 4-bit Four-to-One Mux from Lab #7. 
-- 
-- Basys 3 Board resources used to test this component:
-- 				8 slider switches for the data inputs to the multiplexer (4 each for input A and input B).
--				1 slider switch for the Mux_selectect input to the multiplexer.
------------------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TwotoOneMux is

port( 	MUX_a,MUX_b: in std_logic_vector(3 downto 0);
		Mux_select: in std_logic;
		MUX_out: out std_logic_vector(3 downto 0));

end TwotoOneMux;


architecture behavioral of TwotoOneMux is
begin
	MUX_out <= MUX_a when (Mux_select = '1') else MUX_b;
	
end behavioral;
