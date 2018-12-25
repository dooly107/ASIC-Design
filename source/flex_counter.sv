// $Id: $
// File name:   flex_counter.sv
// Created:     9/9/2017
// Author:      Sang Hun Kim
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: flex_counter

`timescale 1ns/10ps

module flex_counter
  #(
    parameter NUM_CNT_BITS = 4
    )
  (
   input wire 			   clk,
   input wire 			   n_rst,
   input wire 			   clear,
   input wire 			   count_enable,
   input wire [(NUM_CNT_BITS-1):0] rollover_val,
   output reg [(NUM_CNT_BITS-1):0] count_out,
   output reg 			   rollover_flag
   );

   reg [(NUM_CNT_BITS-1):0] temp_count_out;
   reg 			    temp_rollover_flag;
			    
   
   

   always_ff @ (posedge clk, negedge n_rst)
     begin
	if (n_rst == 1'b0) //ASYNC_RESET IS ASSERTED
	  begin
	     count_out <= '0;
	     rollover_flag <= 1'b0;
	  end
	else
	  begin
	     count_out <= temp_count_out;
	     rollover_flag <= temp_rollover_flag;
	     
	  end
     end // always_ff @
   

   always_comb
     begin
	temp_count_out = count_out;
	if (clear == 1'b1)
	  begin
	     temp_count_out = '0;
	  end
	else
	  begin
	     if (count_enable == 1'b1)
	       begin
		  temp_count_out = temp_count_out + 1'b1;
		  if (temp_count_out > rollover_val)
		    begin
		       temp_count_out = 1'b1;
		    end
	       end
	  end // else: !if(clear == 1'b1)
     end // always_comb


   always_comb
     begin
	temp_rollover_flag = rollover_flag;
	if (clear == 1'b1)
	  begin
	     temp_rollover_flag = 1'b0;
	  end
	else
	  begin
	     if (temp_count_out == rollover_val)
	       begin
		  temp_rollover_flag = 1'b1;
	       end
	     else
	       begin
		  temp_rollover_flag = 1'b0;
	       end
	  end // else: !if(clear == 1'b1)
     end // always_comb
endmodule // flex_counter

