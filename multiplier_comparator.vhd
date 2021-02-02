------------------------------------------------------------------------------------------------------
-- Course: ECE 332 - Digital System Design Lab
-- Author: Kevin Goldberg and George Zavala
-- 
-- Create Date: October 16
-- Experiment Name: Arithmetic Circuits in VHDL (Lab #6)
-- Design Name: Lab_6_3
-- Project Name: multi_comp - Behavioral
-- Target Devices: xc7a35t-1cpg236c
--
-- Description: Design a 4-bit Multiplier and a 4-bit Comparator using behavioral VHDL.
-- 				Use the multiplication operator in a signal assignment statement to describe the 4-bit multiplier.
-- 				Use the appropriate relational operators in 'when else' statements to describe the 4-bit comparator.
--
-- Basys 3 Board resources used for this design:
-- 				8 slider switches for the inputs (A and B) to the 4-bit multiplier and comparator.
--				8 LEDs to display the product.
--				3 LEDs to display EQ, GT, and LT (comparator outputs).						
------------------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_signed.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity multi_comp is
    Port(A,B: in STD_LOGIC_VECTOR(3 downto 0);
        Product: out STD_LOGIC_VECTOR(7 downto 0);
        GT,EQ,LT: out STD_LOGIC);
end multi_comp;

architecture behavioral of multi_comp is

begin
  
   Product <= (A * B);
   EQ <= '1' when A = B else '0';
   GT <= '1' when A > B else '0';
   LT <= '1' when A < B else '0';
    
end behavioral;
