// $Id: $
// File name:   can_crc.sv
// Created:     11/30/2017
// Author:      Sang Hun Kim
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: can_crc test bench
`timescale 1ns / 10ps
module tb_arbitration();
   localparam CLK_PERIOD = 10;
   reg tb_clk;
   localparam [10:0] id = 11'b10101010000;
   reg tb_n_rst;
   reg tb_rxd;
   reg tb_arbitration_start;
   reg tb_win;
   reg tb_loose;
   
   
   /********************************************************/
                         //REMINDER//
             //DATA SEND BY CAN BUS (ENTIRE CYCLE)//
   // {SOF(1 bit), Arbitration(11 bits), 7 Control bits, Data (1 bit Write/Read, 15 bits address, 16 bits data, 14 bits padding), 15 CRC bits, Ack bit, EOF bit}
   /********************************************************/
   task send_data;
      input [10:0] rx_data;
      begin
	 int i;
	 reg win;
	 reg loose;
	 
	 $display("START");

	 tb_arbitration_start = 1;
	 
	 for(i = 0;i< 11;i++)
	   begin
	      tb_rxd = rx_data[10-i];
	      
	      if(tb_win == 1)
		begin
		  
			$display("    Arbitration correctly won at time %t", $time);	 
		         
		end
	      if(tb_loose == 1)
		begin
        
			$display("    Arbitration correcly lost at time %t", $time);
		end	      
	      #(CLK_PERIOD);
	   end
	 tb_arbitration_start = 0;
	 #(CLK_PERIOD);
	 
	 
      end
   endtask //

   arbitration ARB (.clk(tb_clk), .n_rst(tb_n_rst), .rxd(tb_rxd), .arbitration_start(tb_arbitration_start), .win(tb_win), .loose(tb_loose));
   
	 
	      
   
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
	send_data(11'b10101111111);
	send_data(11'b10000000000);
	send_data(11'b10001010000);
	send_data(11'b10111111111);
	send_data(11'b10101010101);
	send_data(11'b10100000000);
	
	
	
	
	
     end
   
      
   
endmodule // tb_can_crc


