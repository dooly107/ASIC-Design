// $Id: $
// File name:   can_crc.sv
// Created:     11/30/2017
// Author:      Sang Hun Kim
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: can_crc test bench
`timescale 1ns / 10ps
module tb_acceptance_filter();
   localparam CLK_PERIOD = 10;
   reg tb_clk;
   localparam [10:0] id = 11'b10101010000;
   reg tb_n_rst;
   reg tb_rxd;
   reg tb_enable;
   reg tb_correct;
   reg [14:0] tb_crc_calculated ;
   
  
   
   
   /********************************************************/
                         //REMINDER//
             //DATA SEND BY CAN BUS (ENTIRE CYCLE)//
   // {SOF(1 bit), Arbitration(11 bits), 7 Control bits, Data (1 bit Write/Read, 15 bits address, 16 bits data, 14 bits padding), 15 CRC bits, Ack bit, EOF bit}
   /********************************************************/
   task send_data;
      input [14:0] rx_data;
      begin
	 int i;

	 
	 $display("START");

	 tb_enable = 1;
	 
	 for(i = 0;i< 15;i++)
	   begin
	      tb_rxd = rx_data[14-i]; 
	      #(CLK_PERIOD);
	   end
	 if(tb_correct)
	   $display("Correct CRC value at Time: %t", $time);
	 else
	   $display("Correct CRC value at Time: %t", $time);
	 
	 tb_enable = 0;
	 #(CLK_PERIOD);
	 
	 
      end
   endtask //

   acceptance_filter ARB (.clk(tb_clk), .n_rst(tb_n_rst), .rdx(tb_rxd), .enable(tb_enable), .correct(tb_correct),.crc_calculated(tb_crc_calculated));
  /* 
   wire[14:0] crc2;
   assign crc2 = tb_crc_calculated;
   */
	      
   
   always
     begin
	tb_clk = 1'b0;
	#(CLK_PERIOD/2);
	tb_clk = 1'b1;
	#(CLK_PERIOD/2);	
     end


   initial
     begin
	tb_n_rst = 0;
	#(CLK_PERIOD);
	
        
	
	tb_n_rst = 1;
	tb_crc_calculated = 15'b101011111111111;
	
	send_data(15'b101011111111111);
	tb_crc_calculated = '0;
	
	send_data(15'b100000000001111);
	tb_crc_calculated = 15'b100010100000101;
	
	send_data(15'b100010100000111);
	tb_crc_calculated = '0;
	
	send_data(15'b101111111111111);
	tb_crc_calculated = 15'b1010101010100111;
	
	send_data(15'b101010101010011);
	tb_crc_calculated = 15'b101000000001111;
	
	send_data(15'b101000000001111);
	
	
	
	
	
     end
   
      
   
endmodule // tb_can_crc


