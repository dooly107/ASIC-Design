// $Id: $
// File name:   flex_stp_sr.sv
// Created:     9/8/2017
// Author:      Sang Hun Kim
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: flex_stp_sr

`timescale 1ns/10ps

module flex_stp_sr
  #(
    parameter NUM_BITS = 4,
    parameter SHIFT_MSB = 1
    )
  (
   input wire clk,
   input wire n_rst,
   input wire shift_enable,
   input wire serial_in,
   output reg [(NUM_BITS-1):0] parallel_out
   );

   integer 		       i;
   

   always_ff @ (posedge clk, negedge n_rst)
     begin
	if (n_rst == 1'b0)
	  begin
	     for (i = 0; i < NUM_BITS; i = i + 1)
	       begin
		  parallel_out[i] <= 1;
	       end
	  end
	else
	  begin
             if (shift_enable == 1)
	       begin
		  if (SHIFT_MSB == 1)
		    begin
		       for (i = (NUM_BITS - 1); i > 0; i = i - 1)
			 begin
			    parallel_out[i] <= parallel_out[i - 1];
			 end
		       parallel_out[0] <= serial_in;
		    end
		  else
		    begin
		       for (i = 0; i < (NUM_BITS - 1); i = i + 1)
			 begin
			    parallel_out[i] <= parallel_out[i + 1];
			 end
		       parallel_out[NUM_BITS - 1] <= serial_in;
		    end
	       end // if (shift_enable == 1)
	  end // else: !if(n_rst == 0)
     end // always_ff @
   

endmodule // flex_stp_sr

	     
	
