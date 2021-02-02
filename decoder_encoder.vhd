------------------------------------------------------------------------------------------------------
-- Course: ECE 332 - Digital System Design Lab
-- Author: Kevin Goldberg and George Zavala
-- 
-- Create Date: 10/30/18
-- Experiment Name: Multiplexers, Decoders, and Encoders in VHDL (Lab #7)
-- Design Name: Lab_7_2 (Decoder and Encoder)
-- Project Name: project_7 - Behavioral
-- Target Devices: xc7a35t-1cpg236c
--
-- Description:	Design a 3-to-8 Decoder with Enable and an 8-to-3 Priority Encoder using behavioral VHDL.
-- 				Use a 'with select when' statement to describe the decoder.
-- 				Use a 'when else' statement to describe the encoder.  Append a '0' to the 
--				3-bit encoder output and use the resulting 4-bit value as the input to the 
-- 				BCD to Seven-segment converter.  Use the valid bit (output from encoder) to
-- 				turn the seven-segment display on/off.
-- 
-- Basys 3 Board resources used for this design:
-- 				3 slider switches for the decoder inputs.
-- 				1 slider switch for the decoder enable.
-- 				8 slider switches for the encoder inputs.
-- 				8 LEDs for the decoder output.
-- 				1 Seven-segment display for the encoder output.
------------------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity enc_dec is

PORT(DEC_in: in STD_LOGIC_VECTOR(2 downto 0);
        DEC_enable: in STD_LOGIC;
        DEC_out: out STD_LOGIC_VECTOR(7 downto 0);
        ENC_in: in STD_LOGIC_VECTOR(7 downto 0);
        dp: out STD_LOGIC;
        disp_right, disp_left, disp_midright, disp_midleft: out STD_LOGIC;
        a, b, c, d, e, f, g: out STD_LOGIC);

end enc_dec;


architecture behavioral of enc_dec is
signal DEC_temp: STD_LOGIC_VECTOR(3 downto 0);
signal ENC_out: STD_LOGIC_VECTOR(2 downto 0);
signal Z: STD_LOGIC;
signal segments: STD_LOGIC_VECTOR(6 downto 0); 

begin

	-- Insert your code for the 3-to-8 Decoder.  Enable is active-high.  Outputs are active-high.
	DEC_temp <= DEC_enable & DEC_in;
	with DEC_temp select
	DEC_out <= "10000000" when "1000",
	           "01000000" when "1001",
	           "00100000" when "1010",
	           "00010000" when "1011",
	           "00001000" when "1100",
	           "00000100" when "1101",
	           "00000010" when "1110",
	           "00000001" when "1111",
	           "00000000" when others;
	           
	-- Insert your code for the 8-to-3 Priority Encoder.  Assume that input 7 has the highest priority.
    ENC_out <=  "111" when ENC_in(7) = '1' else
                "110" when ENC_in(6) = '1' else
                "101" when ENC_in(5) = '1' else
                "100" when ENC_in(4) = '1' else
                "011" when ENC_in(3) = '1' else
                "010" when ENC_in(2) = '1' else
                "001" when ENC_in(1) = '1' else
                "000" when ENC_in(0) = '1' else
                "000";
    
	-- Insert your code for the BCD to seven-segment converter (from Lab 4) here (to display the encoder output).
    dp <= '0' when ENC_in = "00000000" else '1';
    
    with ENC_out select segments <=            
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

	-- Code to control the seven-segment displays
	disp_left <= '1';				-- turn the seven-segment display off					
	disp_midleft <= '1';			-- turn the seven-segment display off 
	disp_midright <= '1';			-- turn the seven-segment display off
	disp_right <= '0';					-- Insert your code to control the right-most seven-segment display.

end behavioral;