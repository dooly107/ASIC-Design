// $Id: $
// File name:   tb_ahb_to_can.sv
// Created:     11/14/2017
// Author:      Miguel Kulisic
// Lab Section: 1
// Version:     1.0  Initial Design Entry
// Description: test bench final project
`timescale 1ns / 10ps
module tb_AHB2CAN_top ();

 
   
   
   
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
   reg 			   tb_HWRITE;
   reg 			   tb_HSEL;
   reg [31:0] 		   tb_HADDR;
   reg [31:0] 		   tb_HWDATA;
   reg [1:0] 		   tb_HTRANS ;
   reg [2:0] 		   tb_HBURST;
   reg [2:0] 		   tb_HSIZE;
   reg [31:0] 		   HRESP;
   reg 			   tb_HREADYOUT;
   reg [31:0] 		   tb_HRDATA;
   reg 			   tb_HRESP;
   
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
   localparam [15:0]crc_pol =15'b0100010110011001;
   localparam [80:0]example_data_string =81'b00101000000000100000101100111100001001011011000011010000000000000010010001100;
   reg [31:0] 	    DATA_SEND_CAN;
   reg [7:0][31:0]  queued_input_can;
   reg [3:0] 		    CAN_COUNT;
   reg 			    FIRST_RUN;
   reg [7:0][31:0] 	 INPUTS_CAN;
   reg[3:0] 			 COUNTER_CAN;
   

   
   //
   /*************************************************************************************************/
    /************************************************************************************************/

     AHB2CAN_top TEST(.HCLK(tb_clk), 
		    .HRESETn(tb_n_rst), 
		    .HWRITE(tb_HWRITE),
		    .HSEL(tb_HSEL),
		    .HADDR(tb_HADDR),
		    .HWDATA(tb_HWDATA),
		    .HTRANS(tb_HTRANS),
		    .HBURST(tb_HBURST),
		    .HSIZE(tb_HSIZE),
		    .HRDATA(tb_HRDATA),
		    .HRESP(tb_HRESP),
		    .HREADYOUT(tb_HREADYOUT),
		    .rx_data(CAN_BUS_WRITE),
		    .tx_data(CAN_BUS_READ));
    
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
   /*
   always //only used for testing the test bench || SIMULATES CAN BUS OUTPUT
     begin
	int i;
	for(i = 2;i<81;i++)
	  begin
	     CAN_BUS_READ = example_data_string[80-i];
	     #(CLK_PERIOD);
	  end
     end
*/
    /************************************************************************************************/
    /************************************************************************************************/
   
  task ahb_lite_process_master;//from ahb to command sensor
      //on the positive edge it will send the value and then reset them on the next clk cycle
      input HWRITE;
      input[31:0] HADDR;
      input [31:0] HWDATA;
      input [1:0] HTRANS ;
      input [2:0] HBURST;
      input [2:0] HSIZE;
      input 	  HSEL;
     begin
	@(posedge tb_clk);
	tb_HSEL = HSEL;
	tb_HWRITE = HWRITE;
	//
	tb_HADDR = HADDR;
	tb_HWDATA = HWDATA;
	tb_HTRANS = HTRANS;
	
	tb_HBURST = HBURST;
	tb_HSIZE = HSIZE;
	//@(posedge tb_clk); 	 
	$display("|||||||||||||||");
	$display("Data send from master at Time : %tps", $time);
	$display("HWRITE = %b", HWRITE);
	$display("HWDATA = %b", HWDATA);
	$display("HTRANS = %b", HTRANS);
	$display("HBURST = %b", HBURST);
	$display("HSIZE = %b", HSIZE);
	$display("HSEL = %b", HSEL);
	$display("HADDR = %b", HADDR);
	$display("||||||||||||||");

	
	 @(posedge tb_clk);
	
	 //busy

	 @(posedge tb_clk);
	tb_HTRANS = 2'b00;
	tb_HSEL = 0;
	@(posedge tb_clk);
	#(CLK_PERIOD/2);
	tb_HSEL = 0;
	
	/*
	 tb_HWRITE =0;
	 tb_HADDR = 0;
	 tb_HWDATA = 0;
	 tb_HTRANS = 0;
	 tb_HBURST = 0;
	 tb_HSIZE = 0;
	 tb_HSEL = 0;
	 */	 	 
      end
   endtask //
    /************************************************************************************************/
    /************************************************************************************************/
   
   task CAN_PROTOCOL;
      input[31:0] data;
      input 	  write;
      output 	  read_write;
      begin
	 reg [31:0] data_read;
	 reg 	    ack;

	 
	 //Start of file
	 FIRST_RUN = 0;
	 
	 if(write == 0)
	   $display("Read cycle started at Time: %tps", $time);
	 else
	   $display("Write cycle started at Time: %tps", $time);
	 $display("    SOF started at Time: %tps", $time);
	 CAN_BUS_WRITE = 0;
	 stage = SOF;
	 @(posedge timer_data_transfer);
	 $display("    SOF ended at Time: %tps", $time);
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
	 FIRST_RUN = 0;
	 
	 $display("    ACK cycle started at Time: %tps", $time/1000);
	 if(write == 1)
	   begin
	      CAN_BUS_WRITE = ack;
	      @(posedge timer_data_transfer);
	   end
	 else
	   begin
	      if(CAN_BUS_READ == 1)
		begin
		   @(posedge timer_data_transfer);
		   $display("    ACK cycle finished at Time: %tps", $time);
		   //$display("    Cycle failed and protocol is starting again at Time: %tns", $time/1000);
		    //CAN_PROTOCOL(data, read, read_write);
		   $display("***************************");
		   $display("***************************");
		   $display("***************************");
		   
		end
	      else
	        @(posedge timer_data_transfer);
	      $display("    ACK cycle finished reading at Time: %tps", $time);
	   end // else: !if(read)
	 if(write)
	   read_write = data_read[31];
	 else
	   read_write = 0;
	 
	 $display("    EOF cycle started at Time: %tps", $time);
	 stage = EOF;	 
	 if(write == 0)
	   begin	      
	      CAN_BUS_WRITE = 0;
	   end
	  @(posedge timer_data_transfer);
	 $display("    EOF cycle finished at Time: %tps", $time);
	 
	 if(write == 0)
	   $display("Read cycle ended at Time: %tps", $time);
	 else
	   $display("Write cycle ended at Time: %tps", $time);

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
	 for(i=0; i<32; i++)
	   begin
	      CRC_CODE = {CRC_CODE[13:0], data_read[31-i]};
	      CRC_CODE = CRC_CODE ^ crc_pol;
	   end
	 $display("    Code calculated %b , at Time:%tps", CRC_CODE, $time); 
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

	 reg [14:0] crc_code_read ;
	 $display("    CRC cycle started at Time: %tps", $time);
	 crc_code_generator(data_read);
	 if(write)
	   begin
	      for(i = 0; i<15;i++)
		begin
		   @(posedge timer_data_transfer);
		   crc_code_read[14-i] = CAN_BUS_READ;
		   
		end
	      if(crc_code_read == CRC_CODE)
		ack = 0;
	      else
		ack = 1;
	      $display("    CRC cycle finished reading (%b) at Time: %tps", crc_code_read, $time/1000);
	      $display("    Ack = %b", ack);
	   end
	 else
	   begin
	      for(i = 0; i<15; i++)
		begin
		   @(posedge timer_data_transfer);
		   CAN_BUS_WRITE = CRC_CODE[14-i];
		   
		end
	      $display("    CRC cycle writing at Time: %tps", $time);
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
	 $display("    Data cycle started at Time: %tps", $time);
	 if(write)
	   begin
	      for(i = 0; i<32; i++)
		begin
		   @(posedge timer_data_transfer);
		   data_read[31-i] = CAN_BUS_READ;
		   
		end
	      data_dequeue_ahb(data_ahb);
	      if(data_ahb == data_read )
		begin
		   $display("    Data read correctly");
		end
	      else
		begin
		   $display("    Data was incorrect, Expected %b", data_ahb);
		end
	      
	      
	      $display("    Data cycle finihsed writing at Time: %tps", $time);
	      $display("    Value read: %b", data_read);
	   end
	 else
	   begin
	      for(i = 0; i<32;i++)
		begin
		   
		   CAN_BUS_WRITE = data[31-i];
		   @(posedge timer_data_transfer);
		end
	      $display("    Data cycle finihsed reading at Time: %tps", $time);
	      $display("    Data read %h", data);
	   end // else: !if(read)
      end
   endtask // if

    /************************************************************************************************/
    /************************************************************************************************/
	      
   task control_field;
      input write;
      begin
	 int i;
	 $display("    Control field started at Time: %tps", $time);
	 if(write)
	   begin
	      for(int i = 0;i<8; i++)
		begin
		   @(posedge timer_data_transfer);
		end
	      $display("    Control field finished reading at Time: %tps", $time);
	   end
	 else
	   begin
	      for(i = 0; i<8; i++)
		begin
		   if(i == 2)
		     CAN_BUS_WRITE = 1'b1;
		   else
		     CAN_BUS_WRITE = 0;
		   @(posedge timer_data_transfer);
		end
	      $display("    Control field finished writing at Time: %tps", $time);
	   end // else: !if(read)
      end
   endtask // if

    /************************************************************************************************/
    /************************************************************************************************/
      
   task arbitration;
      input write;
      begin
	 int i;
	 static reg [10:0] low = 11'b10101111111;
	 static reg [10:0] high = 11'b10100000000;
	 $display("    Arbitration started at Time: %tps", $time);
	 for(i = 0; i<11; i++)
	   begin
	      if(write)
		CAN_BUS_WRITE = low[10-i];
	      else
		CAN_BUS_WRITE = high[10-i];
	        @(posedge timer_data_transfer);
	   end
	 if(write)
	    $display("    Arbitration is won");
	 else
	    $display("    Arbitration is lost");
	 $display("    Arbitration Ended cycle Time: %tps", $time);
      end
   endtask // for

    /************************************************************************************************/
    /************************************************************************************************/

   
always //the can must always run
  begin
     int read_write;
  
     DATA_SEND_CAN = '0;
	  CAN_PROTOCOL({DATA_SEND_CAN,'0}, 1, read_write);
	 
	  if(read_write == 0)
	    begin
	        DATA_SEND_CAN = INPUTS_CAN[COUNTER_CAN];
	       COUNTER_CAN = COUNTER_CAN+1;
	       if(COUNTER_CAN == 8)
		 COUNTER_CAN = 0;
	       
	       CAN_PROTOCOL({DATA_SEND_CAN},0, read_write);
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
	 queued_input_ahb[7] = '1;
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
	 queued_input_can[7] = '1;
	 CAN_COUNT = CAN_COUNT-1;
      end
   endtask // for
   
//intial block to test
     
   initial
     begin
	INPUTS_CAN [0] = 32'b10000000000110011001111000000000;
	INPUTS_CAN[1] =  32'b10000000000110011001111000000011;
	INPUTS_CAN[2] =  32'b10011000000110011001111000000011;
	INPUTS_CAN[3] =  32'b10000000000110011000011000000011;
	INPUTS_CAN[4] =  32'b10001110000110011000011000000011;
	INPUTS_CAN[5] =  32'b10000011001100110000110000000111;
	INPUTS_CAN[6] =  32'b10000000000110011000011011100011;
	INPUTS_CAN[7] =  32'b10000111110110011000011000000011;
	COUNTER_CAN = 0;
	
	FIRST_RUN = 1;
	
	for(int i = 0;i<8;i++)
	  begin
	     queued_input_ahb[i] = '1;
	     queued_input_can[i] = '1;
	  end
	AHB_COUNT = 0;
	CAN_COUNT = 0;
	tb_n_rst = 0;
        #(CLK_PERIOD/2);
	//FIRST_RUN = 0;
	
	tb_n_rst = 1;

	/*
	//SIMPLE WRITE CYCLE RUN FOR 685 ns
	 data_send_ahb(32'b10000000000000011010101010101010);	
	ahb_lite_process_master(1,32'b10000000000000000000000000000001,32'b00000000000000001010101010101010, 2'b10,'0,3'b010,1);
        #(CLK_PERIOD*5);
        */
/*
	
	// COMPLEX WRITE CYCLE (8 STACKED VALUES ON COMMAND FIFO) RUN FOR 6300ns
	data_send_ahb(32'b10000000000000011010101010101010);	
	ahb_lite_process_master(1,32'b10000000000000000000000000000001,32'b00000000000000001010101010101010, 2'b10,'0,3'b010,1);
        #(CLK_PERIOD*5);
	data_send_ahb(32'b10000000000000011000011101010110);
	ahb_lite_process_master(1,32'b10000000000000000000000000000001,32'b00000000000000001000011101010110, 2'b10,'0,3'b010,1);
	#(CLK_PERIOD*5);
	data_send_ahb(32'b10000000000000011001111000110111);
	ahb_lite_process_master(1,32'b10000000000000000000000000000001,32'b00000000000000001001111000110111, 2'b10,'0,3'b010,1);
	#(CLK_PERIOD*5);
	data_send_ahb(32'b10000000000001111001101000110101);
	ahb_lite_process_master(1,32'b10000000000000000000000000000111,32'b00000000000000001001101000110101, 2'b10,'0,3'b010,1);
	#(CLK_PERIOD*5);
	data_send_ahb(32'b10000000000100011001111000000111);
	ahb_lite_process_master(1,32'b10000000000000000000000000010001,32'b00000000000000001001111000000111, 2'b10,'0,3'b010,1);
	//
	#(CLK_PERIOD*5);
	data_send_ahb(32'b10000000000110011001111000000000);
	ahb_lite_process_master(1,32'b10000000000000000000000000011001,32'b00000000000000001001111000000000, 2'b10,'0,3'b010,1);
	//
	#(CLK_PERIOD*5);
	data_send_ahb(32'b10000000000100111000011000000111);
	ahb_lite_process_master(1,32'b10000000000000000000000000010011,32'b00000000000000001000011000000111, 2'b10,'0,3'b010,1);
	//
	#(CLK_PERIOD*5);
	data_send_ahb(32'b10000000000000011010101010101010);	
	ahb_lite_process_master(1,32'b10000000000000000000000000000001,32'b00000000000000001010101010101010, 2'b10,'0,3'b010,1);
        #(CLK_PERIOD*30);
	data_send_ahb(32'b10000000000000011010101010100000);	
	ahb_lite_process_master(1,32'b10000000000000000000000000000001,32'b00000000000000001010101010100000, 2'b10,'0,3'b010,1);
        #(CLK_PERIOD*30);
	 
*/
/*
	
//	SIMPLE READ CYCLE RUN FOR 6200ns
	 //#(CLK_PERIOD*5);
	 data_send_ahb(32'b00000000000111111001111000110111);
	 ahb_lite_process_master(1,32'b00000000000000000000000000011111,32'b00000000000000001001111000110111, 2'b10,'0,3'b010,1);
	 #(CLK_PERIOD*600);
	 ahb_lite_process_master(0,32'b00000000000000000000000000011111,32'b00000000000000001001111000110111, 2'b10,'0,3'b010,1);
	 $display("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||VALUE RETRIEVED AT TIME %t is %h",$time, tb_HRDATA);

*/		

	//COMPLEX read CYCLE RUN FOR 14000ns
	data_send_ahb(32'b00000000000000011010101010101010);	
	ahb_lite_process_master(1,32'b00000000000000000000000000000001,32'b00000000000000001010101010101010, 2'b10,'0,3'b010,1);
        #(CLK_PERIOD*5);

	data_send_ahb(32'b00000000000100111000011000000111);
	ahb_lite_process_master(1,32'b00000000000000000000000000010011,32'b00000000000000001000011000000111, 2'b10,'0,3'b010,1);
	//
	#(CLK_PERIOD*5);
	data_send_ahb(32'b00000000000111111001111000110111);
	ahb_lite_process_master(1,32'b00000000000000000000000000011111,32'b00000000000000001001111000110111, 2'b10,'0,3'b010,1);
	
	
	#(CLK_PERIOD*5);
	data_send_ahb(32'b00000000000111111001111000110110);
	ahb_lite_process_master(1,32'b00000000000000000000000000011111,32'b00000000000000001001111000110110, 2'b10,'0,3'b010,1);
	
	#(CLK_PERIOD*5);
	data_send_ahb(32'b00000000000111111001111000110111);
	ahb_lite_process_master(1,32'b00000000000000000000000000011111,32'b00000000000000001001111000110111, 2'b10,'0,3'b010,1);
	
	#(CLK_PERIOD*5);
	data_send_ahb(32'b00000000000111111001111000110110);
	ahb_lite_process_master(1,32'b00000000000000000000000000011111,32'b00000000000000001001111000110110, 2'b10,'0,3'b010,1);
	
	#(CLK_PERIOD*5);	
	data_send_ahb(32'b00000000000111111001111000110111);
	ahb_lite_process_master(1,32'b00000000000000000000000000011111,32'b00000000000000001001111000110111, 2'b10,'0,3'b010,1);
		
	#(CLK_PERIOD*5);	
	data_send_ahb(32'b00000000000111111000000000110111);
	ahb_lite_process_master(1,32'b00000000000000000000000000011111,32'b00000000000000001000000000110111, 2'b10,'0,3'b010,1);
//retrieve values
	#(CLK_PERIOD*600);
	ahb_lite_process_master(0,32'b00000000000000000000000000011111,32'b00000000000000001001111000110111, 2'b10,'0,3'b010,1);
	$display("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||VALUE RETRIEVED AT TIME %t is %h",$time, tb_HRDATA);
	#(CLK_PERIOD*100);
	
	ahb_lite_process_master(0,32'b00000000000000000000000000011111,32'b00000000000000001001111000110111, 2'b10,'0,3'b010,1);
	$display("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||VALUE RETRIEVED AT TIME %t is %h",$time, tb_HRDATA);
	#(CLK_PERIOD*100);

	ahb_lite_process_master(0,32'b00000000000000000000000000011111,32'b00000000000000001001111000110111, 2'b10,'0,3'b010,1);
	$display("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||VALUE RETRIEVED AT TIME %t is %h",$time, tb_HRDATA);
	#(CLK_PERIOD*100);
	
	ahb_lite_process_master(0,32'b00000000000000000000000000011111,32'b00000000000000001001111000110111, 2'b10,'0,3'b010,1);
	$display("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||VALUE RETRIEVED AT TIME %t is %h",$time, tb_HRDATA);	
	#(CLK_PERIOD*100);
	
	ahb_lite_process_master(0,32'b00000000000000000000000000011111,32'b00000000000000001001111000110111, 2'b10,'0,3'b010,1);
	$display("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||VALUE RETRIEVED AT TIME %t is %h", $time,tb_HRDATA);
	#(CLK_PERIOD*100);
	
	ahb_lite_process_master(0,32'b00000000000000000000000000011111,32'b00000000000000001001111000110111, 2'b10,'0,3'b010,1);
	$display("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||VALUE RETRIEVED AT TIME %t is %h", $time, tb_HRDATA);
	#(CLK_PERIOD*100);
	
	ahb_lite_process_master(0,32'b00000000000000000000000000011111,32'b00000000000000001001111000110111, 2'b10,'0,3'b010,1);
	$display("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||VALUE RETRIEVED AT TIME %t is %h", $time, tb_HRDATA);
	#(CLK_PERIOD*100);
	
	ahb_lite_process_master(0,32'b00000000000000000000000000011111,32'b00000000000000001001111000110111, 2'b10,'0,3'b010,1);	
	$display("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||VALUE RETRIEVED AT TIME %t is %h", $time, tb_HRDATA);
	//
     
     end
   
	
   
endmodule // tb_ahb_to_can






