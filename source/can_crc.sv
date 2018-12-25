// $Id: $
// File name:   can_crc.sv
// Created:     11/30/2017
// Author:      Sang Hun Kim
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: can_crc
/*
module can_crc
  (
   input wire	     data,
   input wire	     crc_en,
   input wire	     clk,
   input wire 	     n_rst,
   output reg [14:0] crc_out
   );

   wire 	 crc_next;
   wire [14:0] 	 crc_temp;
/*
   assign crc_next = data ^ crc_out[14];
   assign crc_temp = {crc_out[13:0],1'b0};*/
/*
   assign crc_temp[0] = data ^ crc_out[14];
   assign crc_temp[1] = crc_out[0];
   assign crc_temp[2] = crc_out[1];
   assign crc_temp[3] = crc_out[2];
   assign crc_temp[4] = crc_out[3] ^ crc_out[14];
   assign crc_temp[5] = crc_out[4] ^ crc_out[14];
   assign crc_temp[6] = crc_out[5];
   assign crc_temp[7] = crc_out[6];
   assign crc_temp[8] = crc_out[7] ^ crc_out[14];
   assign crc_temp[9] = crc_out[8]^crc_out[14];
   assign crc_temp[10] = crc_out[9];
   assign crc_temp[11] = crc_out[10] ^ crc_out[14];
   assign crc_temp [12]= crc_out [11];
   assign crc_temp[13] = crc_out[12];
   assign crc_temp[14] = crc_out[13] ^ crc_out[14];
   

   always_ff @ (posedge clk, negedge n_rst)
     begin
	if (n_rst == 1'b0)
	  begin
	     crc_out <= '0;
	  end
	else if (crc_en)
	  begin
	       crc_out <= crc_temp;
	  end
     end // always_ff @
endmodule // can_crc

	*/       
module can_crc
  (
   input wire	     data,
   input wire	     crc_en,
   input wire	     clk,
   input wire 	     n_rst,
   output reg [14:0] crc_out
   );

   wire 	 crc_next;
   wire [14:0] 	 crc_temp;

   //assign crc_next = data ^ crc[14];
   assign crc_temp = {crc_out[13:0],data};

   always_ff @ (posedge clk, negedge n_rst)
     begin
	if (n_rst == 1'b0)
	  begin
	     crc_out <= '0;
	  end
	else if (crc_en)
	  begin	 
	       crc_out <= crc_temp ^ 15'b0100010110011001;
	  end
     end // always_ff @
endmodule // can_crc
