// $Id: $
// File name:   tx_sr.sv
// Created:     11/30/2017
// Author:      Sang Hun Kim
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: tx_sr

module tx_sr
  (
   input 	clk,
   input 	n_rst,
   input 	tx_enable,
   input 	load_enable,
   input [31:0] tx_data,
   output reg 	tx_out
   );

   flex_pts_sr #(32, 1) TX_SR
     (
      .clk(clk),
      .n_rst(n_rst),
      .shift_enable(tx_enable),
      .load_enable(load_enable),
      .parallel_in(tx_data),
      .serial_out(tx_out)
      );

endmodule // tx_sr
