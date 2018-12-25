// $Id: $
// File name:   tb_can_register.sv
// Created:     12/2/2017
// Author:      Miguel Kulisic
// Lab Section: 1
// Version:     1.0  Initial Design Entry
// Description: test bench for the control module
`timescale 1ns / 10ps
module tb_can_register();
   //inputs
   reg tb_clk;
   reg tb_n_rst;
   reg [31:0] command;
   reg 	      tb_rxd;
   reg 	      tb_txd;
   //outputs
   reg 	      tb_write_fifo;
   reg 	      tb_read_fifo;
   reg [31:0] tb_send_data;
   localparam CLK_PERIOD = 10;
   
   always
     begin
	tb_clk = 1'b0;
	#(CLK_PERIOD/2);
	tb_clk = 1'b1;
	#(CLK_PERIOD/2);	
     end
   
endmodule // tb_can_register

