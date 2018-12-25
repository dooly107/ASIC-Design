// $Id: $
// File name:   flex_pts_sr.sv
// Created:     9/5/2017
// Author:      Miguel Kulisic
// Lab Section: 1
// Version:     1.0  Initial Design Entry
// Description: pts
module flex_pts_sr
  #(
    parameter NUM_BITS =4,
    parameter SHIFT_MSB = 1'b1
    )
   (
    input wire 		      clk, n_rst, shift_enable, load_enable,
    input wire [NUM_BITS-1:0] parallel_in,
    output reg 		      serial_out
    );
   
   reg [NUM_BITS-1:0] 	      parallel;
   reg [NUM_BITS-1:0] 	      parallel_nxt;
   
   reg 			      serial;
   reg 			      x;
   
   always_comb
     begin
	if(load_enable)
	  begin
	     parallel_nxt = parallel_in;
	     serial_out = parallel_nxt[NUM_BITS - 1];
	  end
	else
	  begin
	     if(shift_enable)
	       begin
		  if(SHIFT_MSB ==1 )begin
		     parallel_nxt = {parallel[NUM_BITS-2:0],1'b1};
		     //  x = NUM_BITS-1;
		     serial_out = parallel[NUM_BITS-2];
		  end
		  else
		    begin
		       parallel_nxt= {1'b1,parallel[NUM_BITS-1:1]};
		       // x = 0;
		       serial_out = parallel[0];
		    end
	       end
	     else
	       begin
		  parallel_nxt = parallel;
		  serial_out = 1;
		  
	       end  
	  end
     end // always_comb
   


   always_ff @(posedge clk, negedge n_rst)
     begin
	if(n_rst == 0 )
	  begin
	     parallel <= '1;
	    // serial_out <= 1'b1;
	  end
	else
	  begin
	     parallel<= parallel_nxt;
	    // serial_out<= serial;
	  end
     end // always_ff @
   
   endmodule
		 
		  
