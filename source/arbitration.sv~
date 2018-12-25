// $Id: $
// File name:   arbitration.sv
// Created:     12/1/2017
// Author:      Sang Hun Kim
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: arbitration

`timescale 1ns / 10ps

module arbitration
  #(localparam [10:0] id = 11'b10101010000)
  (
   input wire clk,
   input wire n_rst,
   input wire rxd,
   input wire arbitration_start,
   output reg win,
   output reg loose 	     
   );

   //Variables for FLEX_COUNTER to 10
   reg 		     clear;
   wire     count_enable;
   reg 	[3:0]	     count_out;
   reg 		     rollover_flag;

   reg 		     tracking;
   

   assign count_enable = (arbitration_start && !tracking);
   

   flex_counter FLEX_COUNTER 
   (
    .clk(clk),
    .n_rst(n_rst),
    .clear(clear),
    .count_enable(count_enable),
    .rollover_val(4'b1010),
    .count_out(count_out),
    .rollover_flag(rollover_flag)
    );

   reg 		     winph;
   reg 		     looseph;
   reg 		     trackingph;
   
always_comb
  begin
     winph = win;
     looseph = loose;
     trackingph = tracking;
     clear = 0;
     
     if(arbitration_start)
       begin
     if(id[10-count_out] != rxd && tracking ==0)
       begin
	  if(id[10-count_out] == 1)
	    begin
	       trackingph = 1;
	       looseph = 1;
	       clear = 1;
	       
	    end
	  else if(rxd == 1)
	    begin
	       trackingph = 1;
	       winph = 1;
	       clear = 1;
	       
	    end
	  
       end
     if(tracking ==1)
       begin
	  winph = 0;
	  looseph = 0;
	  clear = 1;
	  
       end
       end // if (arbitration_start)

     else
       begin
	  trackingph = 0;
       end // else: !if(arbitration_start)
          
  end
   
   always_ff @ (posedge clk, negedge n_rst)
     begin
	if(n_rst == 0)
	  begin
	     win <=0;
	     loose<=0;
	     tracking<=0;
	     
	  end
	else
	  begin
	     win<=winph;
	     loose<=looseph;
	     tracking<=trackingph;
	  end // else: !if(n_rst == 0)
	
	
     end // always_ff @
endmodule // arbitration

	     
