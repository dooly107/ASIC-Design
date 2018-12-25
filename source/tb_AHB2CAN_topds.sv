// $Id: $
// File name:   tb_ahb_to_can.sv
// Created:     11/14/2017
// Author:      Miguel Kulisic
// Lab Section: 1
// Version:     1.0  Initial Design Entry
// Description: test bench final project
`timescale 1ns / 10ps
module AHB2CAN_top ();
   localparam CLK_PERIOD = 10;
//rengeral purpouse
   reg tb_clk;
   reg tb_n_rst;
   //
   /************************************************************************************************/
   /************************************************************************************************/
   //REGISTERS FOR AHB BUS
   reg [31:0] command_write_bus;//output data from master
   reg 	      ahb_bus_status;
   reg 	      ahb_bus_write_enable;
   reg 	      start_transmition;
   reg [7:0][31:0] queued_input_ahb;
   reg [3:0] 		   AHB_COUNT;
   //
   /*************************************************************************************************/
   /************************************************************************************************/
   //Registers FOR CAN BUS
   reg 	      timer_data_transfer;
   wire       CAN_BUS_HIGH;
   wire       CAN_BUS_LOW;
   reg 	      CAN_BUS_READ;
   reg 	      CAN_BUS_WRITE;
   typedef enum bit [2:0]{SOF, ARBITRATION, CONTROL_FIELD, DATA_CYCLE, CRC, ACK, EOF}stateType;
   stateType stage;
   reg 	[14:0]	    CRC_CODE;
   localparam[15:0] crc_pol = 4'h4599;
   localparam [80:0]example_data_string =81'b00101000000000100000101100111100001001011011000011010000000000000010010001100;
   reg [31:0] 	    DATA_SEND_CAN;
   reg [7:0][31:0]  queued_input_can;
   reg [3:0] 		    CAN_COUNT;
   //
   /*************************************************************************************************/
    /************************************************************************************************/
    
   //Timer Generator Block We need to slow this down by 100 to make it real
   always
     begin
	timer_data_transfer = 1'b0;
	#(CLK_PERIOD/2);
	timer_data_transfer = 1'b1;
	#(CLK_PERIOD/2);
     end
   //

    /************************************************************************************************/
    /************************************************************************************************/
   
   // Clock generation block
   always
     begin
	tb_clk = 1'b0;
	#(CLK_PERIOD/2.0);
	tb_clk = 1'b1;
	#(CLK_PERIOD/2.0);
     end
   //
   
 /************************************************************************************************/
    /************************************************************************************************/
   
   always //only used for testing the test bench || SIMULATES CAN BUS OUTPUT
     begin
	int i;
	for(i = 2;i<81;i++)
	  begin
	     CAN_BUS_READ = example_data_string[80-i];
	     #(CLK_PERIOD);
	  end
     end

    /************************************************************************************************/
    /************************************************************************************************/
   
  task ahb_lite_process_master;//from ahb to command sensor
      //on the positive edge it will send the value and then reset them on the next clk cycle
      input HWRITE;
      input[14:0] HADDR;
      input [15:0] HWDATA;
      input [1:0] HTRANS ;
      input [2:0] HBURST;
      input [2:0] HSIZE;
      input 	  HSEL;
      begin
	 @(posedge tb_clk);
	 tb_HWRITE = HWRITE;
	 tb_HADDR = HADDR;
	 tb_HWDATA = HWDATA;
	 tb_HTRANS = HTRANS;
	 tb_HBURST = HBURST;
	 tb_HSIZE = HSIZE;
	 tb_HSEL = HSEL;
	 $display("|||||||||||||||");
	 $display("Data send from master at Time: $t", $time);
	 $display("HWRITE = %b", HWRITE);
	 $display("HWDATA = %b", HWDATA);
	 $diplay("HTRANS = %b", HTRANS);
	 $diplay("HBURST = %b", HBURST);
	 $display("HSIZE = %b", HSIZE);
	 $display("HSEL = %b", HSEL);
	 $dipsplay("||||||||||||||");
	 @(posedge tb_clk);
	 tb_HWRITE =0;
	 tb_HADDR = 0;
	 tb_HWDATA = 0;
	 tb_HTRANS = 0;
	 tb_HBURST = 0;
	 tb_HSIZE = 0;
	 tb_HSEL = 0;
	 	 	 
      end
   endtask //
    /************************************************************************************************/
    /************************************************************************************************/
   
   task CAN_PROTOCOL;
      input[45:0] data;
      input 	  write;
      output 	  read_write;
      begin
	 reg [45:0] data_read;
	 reg 	    ack;
	 //Start of file
         @(negedge timer_data_transfer);
	 if(write == 0)
	   $display("Read cycle started at Time: %tns", $time/1000);
	 else
	   $display("Write cycle started at Time: %tns", $time/1000);
	 $display("    SOF started at Time: %tns", $time/1000);
	 CAN_BUS_WRITE = 0;
	 stage = SOF;
	 @(negedge timer_data_transfer);
	 $display("    SOF ended at Time: %tns", $time/1000);
	 stage = ARBITRATION;
	 //arbitration phase
	 arbitration(write);
	 //control phase
	 stage = CONTROL_FIELD;
	 control_field(write);
	 //data phase
	 stage = DATA_CYCLE;
	 data_phase(data,write, data_read);
	 //crc send or receive
	 stage = CRC;
	 if(write)
	   crc_sr(data_read, write, ack);
	 else
	   crc_sr(data, write, ack);
	 
	 //ack bit
	 stage = ACK;
	 $display("    ACK cycle started at Time: %tns", $time/1000);
	 if(write == 1)
	   begin
	      CAN_BUS_WRITE = ack;
	      @(negedge timer_data_transfer);
	   end
	 else
	   begin
	      if(CAN_BUS_READ == 1)
		begin
		   @(negedge timer_data_transfer);
		   $display("    ACK cycle finished at Time: %tns", $time/1000);
		   $display("    Cycle failed and protocol is starting again at Time: %tns", $time/1000);
		    //CAN_PROTOCOL(data, read, read_write);
		   $display("***************************");
		   $display("***************************");
		   $display("***************************");
		   return;
		end
	      else
	        @(negedge timer_data_transfer);
	      $display("    ACK cycle finished reading at Time: %tns", $time/1000);
	   end // else: !if(read)
	 if(write)
	   read_write = data_read[31];
	 else
	   read_write = 0;
	 
	 $display("    EOF cycle started at Time: %tns", $time/1000);
	 stage = EOF;	 
	 if(write == 0)
	   begin	      
	      CAN_BUS_WRITE = 0;
	   end
	  @(negedge timer_data_transfer);
	 $display("    EOF cycle finished at Time: %tns", $time/1000);
	 
	 if(write == 0)
	   $display("Read cycle ended at Time: %tns", $time/1000);
	 else
	   $display("Write cycle ended at Time: %tns", $time/1000);

	 $display("---------------------------");
	 $display("---------------------------");
	 $display("---------------------------");
      end     
   endtask // arbitration

    /************************************************************************************************/
    /************************************************************************************************/
   
   task crc_code_generator;
      input [31:0] data_read;
      begin
	 int i;
	 CRC_CODE = 15'b000000000000000;
	 for(i=0; i<31; i++)
	   begin
	      CRC_CODE = {CRC_CODE[13:0], data_read[31-i]};
	      CRC_CODE = CRC_CODE^ crc_pol;	      
	   end
	 $display("    Code calculated %b , at Time:%tns", CRC_CODE, $time/1000); 
      end
   endtask //

    /************************************************************************************************/
    /************************************************************************************************/
   
   task crc_sr;
      input [31:0]data_read;
      input write;
      output ack;
          begin
	 int i;
	 reg [14:0]crc_code_read ;
	 $display("    CRC cycle started at Time: %tns", $time/1000);
	 crc_code_generator(data_read);
	 if(write)
	   begin
	      for(i = 0; i<15;i++)
		begin
		   crc_code_read[14-i] = CAN_BUS_READ;
		   @(negedge timer_data_transfer);
		end
	      if(crc_code_read == CRC_CODE)
		ack = 0;
	      else
		ack = 1;
	      $display("    CRC cycle finished reading (%b) at Time: %tns", crc_code_read, $time/1000);
	      $display("    Ack = %b", ack);
	   end
	 else
	   begin
	      for(i = 0; i<15; i++)
		begin
		   CAN_BUS_WRITE = CRC_CODE[14-i];
		   @(negedge timer_data_transfer);
		end
	      $display("    CRC cycle writing at Time: %tns", $time/1000);
	      ack = 0;
	   end // else: !if(read)
      end
   endtask //

    /************************************************************************************************/
    /************************************************************************************************/
	      
   task data_phase;
      input [31:0] data;
      input 	   write;
      output [31:0] data_read;
      begin
	 reg [31:0]data_ahb;
	 int i;
	 $display("    Data cycle started at Time: %tns", $time/1000);
	 if(write)
	   begin
	      for(i = 0; i<32; i++)
		begin
		   data_read[31-i] = CAN_BUS_READ;
		   @(negedge timer_data_transfer);
		end
	      data_dequeue_ahb(data_ahb);
	      if(data_ahb == data_read )
		begin
		   $display("    Data read correctly");
		end
	      else
		begin
		   $diplay("    Data was incorrect, Expected %b", data_ahb);
		end
	      
	      
	      $display("    Data cycle finihsed reading at Time: %tns", $time/1000);
	      $display("    Value read: %b", data_read);
	   end
	 else
	   begin
	      for(i = 0; i<32;i++)
		begin
		   CAN_BUS_WRITE = data[31-i];
		   @(negedge timer_data_transfer);
		end
	      $display("    Data cycle finihsed writing at Time: %tns", $time/1000);
	   end // else: !if(read)
      end
   endtask // if

    /************************************************************************************************/
    /************************************************************************************************/
	      
   task control_field;
      input write;
      begin
	 int i;
	 $display("    Control field started at Time: %tns", $time/1000);
	 if(write)
	   begin
	      for(int i = 0;i<8; i++)
		begin
		   @(negedge timer_data_transfer);
		end
	      $display("    Control field finished reading at Time: %tns", $time/1000);
	   end
	 else
	   begin
	      for(i = 0; i<8; i++)
		begin
		   if(i == 2)
		     CAN_BUS_WRITE = 1'b1;
		   else
		     CAN_BUS_WRITE = 0;
		   @(negedge timer_data_transfer);
		end
	      $display("    Control field finished writing at Time: %tns", $time/1000);
	   end // else: !if(read)
      end
   endtask // if

    /************************************************************************************************/
    /************************************************************************************************/
      
   task arbitration;
      input write;
      begin
	 int i;
	 static reg [10:0] low = 11'b01110111111;
	 static reg [11:0] high = 11'b01000000000;
	 $display("    Arbitration started at Time: %tns", $time/1000);
	 for(i = 0; i<11; i++)
	   begin
	      if(write)
		CAN_BUS_WRITE = low[10-i];
	      else
		CAN_BUS_WRITE = high[10-i];
	        @(negedge timer_data_transfer);
	   end
	 $display("    Arbitration Ended cycle Time: %tns", $time/1000);
      end
   endtask // for

    /************************************************************************************************/
    /************************************************************************************************/

   
always //the can must always run
  begin
     int read_write;
     DATA_SEND_CAN = '0;
     CAN_PROTOCOL({DATA_SEND_CAN,'0}, 1, read_write);
     DATA_SEND_CAN = 32'b10101100111100001001011011000011;
     if(read_write == 0)
       begin
	  CAN_PROTOCOL({DATA_SEND_CAN,'0},0, read_write);
	  data_send_can(DATA_SEND_CAN);
       end
     
  end

    /************************************************************************************************/
    /************************************************************************************************/
   
   task data_send_ahb;
      input [31:0] new_input;
      begin
	 queued_input_ahb[AHB_COUNT] = new_input;
	 AHB_COUNT = AHB_COUNT + 1;
      end
   endtask // for

    /************************************************************************************************/
    /************************************************************************************************/

   task data_dequeue_ahb;
      output [31:0] new_output;
      begin
	 new_output = queued_input_ahb[0];
	 for(int i = 0; i<7; i++)
	   begin
	      queued_input_ahb[i]= queued_input_ahb[i+1];
	   end
	 queued_input_ahb[7] = '0;
	 AHB_COUNT = AHB_COUNT-1;
      end
   endtask // for

    /************************************************************************************************/
    /************************************************************************************************/
   
   task data_send_can;
      input [31:0] new_input;
      begin
	 queued_input_can[CAN_COUNT] = new_input;
	 CAN_COUNT = CAN_COUNT + 1;
      end
   endtask // for

   /************************************************************************************************/
   /************************************************************************************************/
   
   task data_dequeue_can;
      output [31:0] new_output;
      begin
	 new_output = queued_input_can[0];
	 for(int i = 0; i<7; i++)
	   begin
	      queued_input_can[i]= queued_input_can[i+1];
	   end
	 queued_input_can[7] = '0;
	 CAN_COUNT = CAN_COUNT-1;
      end
   endtask // for
   
//intial block to test
     
   initial
     begin
	for(int i = 0;i<8;i++)
	  begin
	     queued_input_ahb[i] = '0;
	     queued_input_can[i] = '0;
	  end
	AHB_COUNT = 0;
	CAN_COUNT = 0;
	data_send_ahb(32'b00101100111100001001011011000011);
	data_send_ahb(32'b00101100111100001001011011000011);	
	ahb_lite_process_master('0,'0,'0,'0,'0,'0,'0);
     end
   
	
   
endmodule // tb_ahb_to_can






