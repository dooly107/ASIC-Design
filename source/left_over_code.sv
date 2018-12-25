// $Id: $
// File name:   tb_ahb_to_can.sv
// Created:     11/14/2017
// Author:      Miguel Kulisic
// Lab Section: 1
// Version:     1.0  Initial Design Entry
// Description: test bench final project
`timescale 1ns / 10ps
module tb_ahb_to_can ();
   localparam CLK_PERIOD = 2.5;
//rengeral purpouse
   reg tb_clk;
   reg tb_n_rst;
   //

   //REGISTERS FOR AHB BUS
   reg [15:0] command_write_bus;//output data from master
   reg 	      ahb_bus_status;
   reg 	      ahb_bus_write_enable;
   //

   //Registers FOR CAN BUS
   reg 	      timer_data_transfer;
   reg 	      CAN_BUS_READ;
   reg 	      CAN_BUS_WRITE;
   string	      CAN_STATE;
   reg 	[15:0]	    shifted_data_reg;
   reg 		    CAN_READ;
   reg 	[14:0]	    CRC_CODE;
   localparam [66:0]example_data_string =67'b00101000000000100000000111100011010110000111111000011001101010010100;
   //
   
/*   //BIDERECTIONAL BUSES
   assign CAN_HIGH_BI = (CAN_READ) ? 'bz : CAN_bus_High_WRITE;
   assign CAN_HIGH_LOW = (CAN_READ) ? 'bz: CAN_bus_Low_WRITE;
   always ()
     begin
	CAN_bus_High_READ = CAN_HIGH_BI;
	CAN_bus_Low_READ = CAN_LOW_BI;
     end
   //*/
   
   //Timer Generator Block We need to slow this down by 100 to make it real
   always
     begin
	timer_data_transfer = 1'b0;
	#(CLK_PERIOD *99.5);
	timer_data_transfer = 1'b1;
	#(CLK_PERIOD/2);
     end
   //
   
   // Clock generation block
   always
     begin
	tb_clk = 1'b0;
	#(CLK_PERIOD/2.0);
	tb_clk = 1'b1;
	#(CLK_PERIOD/2.0);
     end
   //
   
   //send address task   
 /*  task send_data_ahb;//this task sends the address, data and hwrite
      input [15:0] data;
      input 	   hwrite;
      begin
	 $display("At the time %t, the transmision starts", $time);
	 ahb_bus_status = 1'b1;
	 (@negedge tb_clk);
	 comman_write_bus = data;
	 ahb_bus_write_enable = hwrite;
	 $display("At the time %t, The data %b was send with and HWRITE of %b", data, write);
	 (@negedge tb_clk);
	 comman_write_bus = 'z;
	 ahb_bus_write_enable =z;
	 $display("At the time %t, Command Write Bus was set To Hi-Z", $time);
      end
   endtask // send_data_ahb*/
   /*
   task compare_output_CAN;
      input [15:0] obtained_data;
      input [15:0] expected_data;
      begin
	 $display("At the time %t -> ", $time);
	 if(obtained_data == expected_data)
	   begin
	      $display("The result matches the expected result of %b", obtained_data);
	   end
	 else
	   begin
	      $display("Error: Expected Result = %b ----- Obtained Result = %b", expected_data, obtained_data);
	   end	 
      end
   endtask //compare_output_CAN*/
   
      //task to send data through the can bus
 /*  task send_data_can;
      input [15:0] data;
      begin
	 genvar i;
	 for(i = 0; i<15; i++)
	   begin
	      CAN_bus_High_WRITE = data[15-i];
	      CAN_bus_Low_WRITE = !CAN_bus_High;
	      $write("time = %t ; Can High = %b", $time, CAN_bus_High);
	      @(negedge timer_data_transfer);
	   end
      endtask //*/

   //shift register / takes the input from can high and shifts it into a 16 bit reg
/*   flex_stp_sr #(16,1) Shifted_data(tb_clk, tb_n_rst,timer_data_transfer, CAN_bus_High_READ, shifted_data_reg);*/
   //
   always
     begin
	int i;
	for(i = 0;i<68;i++)
	  begin
	     CAN_BUS_READ = example_data_string[67-i];
	     #(CLK_PERIOD*100);
	  end
     end
   
   //checks if the address send in the can matches any of the valid addresses for the producs.
   /*
   task address_match;
      input [15:0] data;
      output 	   match;
      begin
	 int i;
	 for(i = 0; i<5; i++)
	   begin
	      if(data == valid_addresses[i])
		begin
		   match = 1;
		   $display("At Time %t -> Address give: %b matches Address of %s", $time, data, valid_addresses_string[i]);
		end			    			  			   
	   end
      end	 
   endtask // for*/

   
   task CAN_PROTOCOL;
      input[31:0] data;
      input 	  read;
      output 	  read_write;
      begin
      reg [31:0]  data_read;
      reg 	  ack;
	 //Start of file
	 $display("    SOF started at Time: %t", $time);
	 CAN_STATE = "SOF";
	 CAN_BUS_WRITE = 0;
	 #(CLK_PERIOD *100);
	 $display("    SOF ended at Time: %t", $time);
	 //arbitration phase
	 arbitration(read);
	 //control phase
	 control_field(read);
	 //data phase
	 data_phase(data,read, data_read);
	 //crc send or receive
	 crc_sr(read, ack);
	 //ack bit
	 $display("    ACK cycle started at Time: %t", $time);
	 if(read == 0)
	   begin
	      CAN_BUS_WRITE = ack;
	      #(CLK_PERIOD * 100);
	   end
	 else
	   begin
	      if(CAN_BUS_READ == 1)
		begin
		   #(CLK_PERIOD * 100);
		   $display("    ACK cycle finished at Time: %t", $time);
		   $display("    Cycle failed and protocol is starting again at Time: %t", $time);
		    //CAN_PROTOCOL(data, read, read_write);
		   return;
		end
	      else
		#(CLK_PERIOD * 100);
	      $display("    ACK cycle finished reading at Time: %t", $time);
	   end // else: !if(read)
	 read_write = data_read[31];
	 $display("    EOF cycle started at Time: %t", $time);
	 if(read)
	   CAN_BUS_WRITE = 0;
	 #(CLK_PERIOD * 100);
	 $display("    EOF cycle finished at Time: %t", $time);	   
      end     
   endtask // arbitration
   
   task crc_sr;
      input read;
      output ack;
      begin
	 int i;
	 reg [14:0]crc_code_read ;
	 $display("    CRC cycle started at Time: %t", $time);
	 if(read)
	   begin
	      for(i = 0; i<15;i++)
		begin
		   crc_code_read[15-i] = CAN_BUS_READ;
		   #(CLK_PERIOD * 100);
		end
	      if(crc_code_read == CRC_CODE)
		ack = 0;
	      else
		ack = 1;
	      $display("    CRC cycle finished reading at Time: %t", $time);
	      $display("    Ack = %b", ack);
	   end
	 else
	   begin
	      for(i = 0; i<15; i++)
		begin
		   CAN_BUS_WRITE = CRC_CODE[15-i];
		   #(CLK_PERIOD * 100);
		end
	      $display("    CRC cycle writing reading at Time: %t", $time);
	      ack = 0;
	   end // else: !if(read)
      end
      endtask
	      
   task data_phase;
      input [31:0] data;
      input 	   read;
      output [31:0] data_read;
      begin
	 int i;
	 $display("    Data cycle started at Time: %t", $time);
	 if(read)
	   begin
	      for(i = 0; i<32; i++)
		begin
		   data_read[31-i] = CAN_BUS_READ;
		   #(CLK_PERIOD*100);
		end
	      $display("    Data cycle finihsed reading at Time: %t", $time);
	      $display("    Value read: %b", data_read);
	   end
	 else
	   begin
	      for(i = 0; i<32;i++)
		begin
		   CAN_BUS_WRITE = data[31-i];
		   #(CLK_PERIOD *100);
		end
	      $display("    Data cycle finihsed writing at Time: %t", $time);
	   end // else: !if(read)
      end
   endtask // if
	      
   task control_field;
      input read;
      begin
	 int i;
	 $display("    Control field started at Time: %t", $time);
	 if(read)
	   begin
	   #(CLK_PERIOD * 700);
	      $display("    Control field finished reading at Time: %t", $time);
	   end
	 else
	   begin
	      for(i = 0; i<7; i++)
		begin
		   if(i == 2)
		     CAN_BUS_WRITE = 1'b1;
		   else
		     CAN_BUS_WRITE = 0;
		   #(CLK_PERIOD *100);
		end
	      $display("    Control field finished writing at Time: %t", $time);
	   end // else: !if(read)
      end
   endtask // if
      
   task arbitration;
      input read;
      begin
	 int i;
	 static reg [10:0] low = 11'b01010111111;
	 static reg [11:0] high = 11'b01000000000;
	 $display("    Arbitration started at Time: %t", $time);
	 for(i = 0; i<11; i++)
	   begin
	      if(read)
		CAN_BUS_WRITE = low[10-i];
	      else
		CAN_BUS_WRITE = high[10-i];
	      #(CLK_PERIOD *100);
	   end
	 $display("    Arbitration Ended cycle Time: %t", $time);
      end
   endtask // for

//intial block to test
   initial
     begin
	int read_write;
	CAN_STATE = "READ";
	$display("Write cycle started at Time: %t", $time);
	CAN_PROTOCOL('0, 1, read_write);
	$display("Write cycle finshied at  Time: %t", $time);
	if(read_write == 0)
	  begin
	     CAN_STATE = "WRITE";
	     $display("Read cycle started at Time: %t", $time);
	     CAN_PROTOCOL(32'b10101100111100001001011011000011,0, read_write);
	     $display("Read cycle finished at Time: %t", $time);
	  end
	
     end
   
	
   
endmodule // tb_ahb_to_can








/*
module NodeA
#(parameter [15:0]address_assigned)(
	     input CAN_HIGH,clk, sof, output reg CAN_Write, input [31:0] shifted_data
	     );
   
   reg		   enable;
   reg 		   write_data;
   
   always//output logic
     begin
	if(enable)
	  CAN_Write = 1'b1;
	else
	  CAN_Write = write_data;
     end
  always//logic for the enable
    begin
       if(sof)
	 enable = 1'b0;
       if(CAN_HIGH != write_data)
	 enable = 1;
    end
   
endmodule // NodeA

module CAN_STATE_MACHINE(
			 input CAN_HIGH, clk,n_rst,
output reg sof, eof, crc, data, control, arbitration, ack);
   typedef enum bit [2:0] {SOF, ARBITRATION,CONTROL, DATA, CRC, ACK, EOF}stateType;
   stateType state;
   stateType next_state;
   reg [8:0] 	count;

   always_comb
     begin
	next_state = state;
       	sof = 0;
	eof = 0;
	crc = 0;
	data = 0;
	control = 0;
	arbitration = 0;
	ack = 0;
	case(state)
	  SOF:
	    begin
	       sof = 1;
	       if(count == 1)
		 next_state = ARBITRATION;
	       else
		 next_state = SOF;
	    end
	  ARBITRATION:
	    begin
	       arbitration = 1;
	       if(count == 12)
		 next_state = CONTROL;
	       else
		 next_state = ARBITRATION;
	    end
	  CONTROL:
	    begin
	       control = 0;
	       if(count == 18)
		 next_state = DATA;
	       else
		 next_state = CONTROL;
	    end
	  DATA:
	    begin
	       data = 1;
	       if(count == 40)
		 next_state = CRC;
	       else
		 next_state = DATA;
	    end
	  CRC:
	    begin
	       crc = 1;
	       if(count == 55)
		 next_state = ACK;
	       else
		 next_state = CRC;
	    end
	  ACK:
	    begin
	       ack = 1;
	       if(count == 57)
		 next_state = EOF;
	       else
		 next_state = ACK;
	    end
	  EOF:
	    begin
	       eof = 1;
	       if(count == 58)
		 next_state = SOF;
	       else
		 next_state = EOF;
	    end
	endcase // case (state)
	
	always_ff @(posedge clk, negedge n_rst)
	  begin
	     if(n_rst == 1'b0)
	       state <= SOF;
	     else
	       state<= next_state;
	  end
         
endmodule // CAN_STATE_MACHINE

   */
