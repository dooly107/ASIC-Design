// $Id: $
// File name:   can_crc.sv
// Created:     11/30/2017
// Author:      Sang Hun Kim
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: can_crc test bench
`timescale 1ns / 10ps
module tb_can_crc();
   localparam CLK_PERIOD = 10;
   reg tb_clk;
   reg tb_n_rst;
   reg crc_enable;
   reg [14:0] result;
   localparam [15:0]crc_pol =15'b0100010110011001;
   reg 	      input_value_crc;
   reg [31:0]	      test_DATA;
   logic [14:0]       crc_out;
   
   /********************************************************/
                         //REMINDER//
             //DATA SEND BY CAN BUS (ENTIRE CYCLE)//
   // {SOF(1 bit), Arbitration(11 bits), 7 Control bits, Data (1 bit Write/Read, 15 bits address, 16 bits data, 14 bits padding), 15 CRC bits, Ack bit, EOF bit}
   /********************************************************/
   can_crc CRC_TEST (.clk(tb_clk), .n_rst(tb_n_rst), .crc_en(crc_enable), .data(input_value_crc), .crc_out(result));
   //fix the order or names
   
   always
     begin
	tb_clk = 1'b0;
	#(CLK_PERIOD/2);
	tb_clk = 1'b1;
	#(CLK_PERIOD/2);	
     end

     reg [14:0] expected_crc;
   task crc_protocol; //input the data plus the padding bits and the 
      input [45:0] input_data;
      begin
	 
	 int 	    i;	 

	 for(i =0;i<32;i++)
	   begin
	       expected_crc = {expected_crc[13:0], input_data[31-i]};
	      expected_crc = expected_crc ^ crc_pol;
	      #(CLK_PERIOD);
	      
	   end
	 
	  crc_enable = 1;
	 for( i = 0; i<32;i++)
	   begin
	      input_value_crc = input_data[31-i];//pump values one at a time most significant bit first
	      #(CLK_PERIOD);
	   end	 
	 $display("Expected CRC code: %b , at Time: %t", expected_crc , $time);
	 $display("Calculated CRC code: %b, at Time: %t", result, $time);
	 if(result == expected_crc)
	   $display("Correct CRC Code");
	 else
	   $display("Incorrect CRC Code");
	 crc_enable = 0;//turn off the enable
      end
   endtask //

   initial
     begin
	//add task calls here
	tb_n_rst = 0;
	#(CLK_PERIOD*1.5);
	
	
	tb_n_rst = 1;
	crc_out = '0;
	expected_crc ='0;
	
	test_DATA ={32'b10000000000000010000000010000101};		 
	crc_protocol(test_DATA);
		tb_n_rst = 0;
	#(CLK_PERIOD);
	tb_n_rst = 1;
	
	expected_crc ='0;
	test_DATA ={'0,'1};		 
	crc_protocol('1);
	
     end
   
      
   
endmodule // tb_can_crc


