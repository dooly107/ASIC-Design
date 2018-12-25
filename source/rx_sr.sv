// $Id: $
// File name:   rx_sr.sv
// Created:     11/30/2017
// Author:      Sang Hun Kim
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: rx_sr

module rx_sr
  (
   input 	     clk,
   input 	     n_rst,
   input 	     rx_enable,
   input wire 	     can_bus_data,
   output reg [31:0] rx_data
   );

   flex_stp_sr #(32, 1) RX_SR
     (
      .clk(clk),
      .n_rst(n_rst),
      .shift_enable(rx_enable),
      .serial_in(can_bus_data),
      .parallel_out(rx_data)
      );
   
endmodule // rx_sr

   
