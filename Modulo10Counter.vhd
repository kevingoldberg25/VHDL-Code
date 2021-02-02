------------------------------------------------------------------------------------------------------
-- Course: ECE 332 - Digital System Design Lab
-- Author: Kevin Goldberg and George Zavala
-- 
-- Create Date:  
-- Experiment Name: Modulo-100 Counter in VHDL (using Structural design) 
-- Design Name: Lab_9_Modulo10Counter
-- Project Name: project_9 - Structural
-- Target Devices: xc7a35t-1cpg236c
--
-- Description: This is the primary component used in the design of the Modulo-100 Counter.
--				This is the design of the Modulo-10 counter.  
--				The design uses a PROCESS statement to describe the counter.
--				Two Modulo-10 counters are needed in the design of the Modulo-100 Counter.
-- 
-- Basys 3 Board resources used to test this component:
--				1 slider switch for the counter enable input.
--				1 push button switch for the counter clock input.
------------------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.all;

entity Modulo10Counter is
PORT( 	CNT_Clk, CNT_En: in std_logic;
		cnt_out: out std_logic_vector(3 downto 0);
		cnt_inc_nxt_digit: out std_Logic);

end Modulo10Counter;


architecture behavioral of Modulo10Counter is

signal cnt_out_temp: std_logic_vector(3 downto 0) := "0000";
signal cnt_inc_nxt_digit_temp: std_logic := '0';

begin

	process(cnt_clk, cnt_out_temp)
	begin
		if (cnt_clk'event) and (cnt_clk = '1') then
			if cnt_en = '1' then cnt_out_temp <= cnt_out_temp + 1;
			end if;
		end if;
		
		if(cnt_out_temp = "1001") then cnt_inc_nxt_digit_temp <= '1';
		end if;
		
		if(cnt_out_temp = "1010") then cnt_out_temp <= "0000";
		end if;
		
	end process;
	
	cnt_inc_nxt_digit <= cnt_inc_nxt_digit_temp;
	cnt_out <= cnt_out_temp;

end behavioral;
