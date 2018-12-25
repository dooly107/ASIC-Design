// $Id: $
// File name:   tb_AHB_Slave.sv
// Created:     11/14/2017
// Author:      Vaibhav Ramachandran
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: AHB Slave module test bench
`timescale 1ns / 10ps
module tb_AHB_Slave();

	localparam CLK_PERIOD = 10;
	localparam CHECK_DELAY = 2;
	reg tb_clk;
	reg tb_n_rst;
	localparam IDLE_TRANS = 2'b00;
	localparam BUSY_TRANS = 2'b01;
	localparam NONSEQ_TRANS = 2'b10;
	localparam SEQ_TRANS = 2'b11;
	//HBURST is always SINGLE_BURST
	localparam SINGLE_BURST = 3'b000;
	localparam INCR_BURST = 3'b001;
	localparam WRAP4_BURST = 3'b010;
	localparam INCR4_BURST = 3'b011;
	localparam WRAP8_BURST = 3'b100;
	localparam INCR8_BURST = 3'b101;
	localparam WRAP16_BURST = 3'b110;
	localparam INCR16_BURST = 3'b111;
	//HRESP signals
	localparam SLAVE_OKAY = 1'b0;
	localparam SLAVE_ERROR = 1'b1;
	//HREADYOUT signals
	localparam SLAVE_READY = 1'b1;
	localparam SLAVE_NOTREADY = 1'b0;
	//inputs
	reg tb_HWRITE;
	reg tb_HSEL;
	reg [31:0] tb_HADDR;
	reg [31:0] tb_HWDATA;
	reg [1:0] tb_HTRANS ;
	reg [2:0] tb_HBURST;
	reg [2:0] tb_HSIZE;
	reg tb_HREADYOUT;
	
	reg [31:0] tb_sensor_data;
	reg tb_slave_wait;
	//outputs
	reg [31:0] tb_HRDATA;
	reg tb_HRESP;
	reg [15:0] tb_command_data, tb_address;
	reg tb_renable, tb_wenable;
	reg [2:0] tb_data_size, tb_burst_size;
	
	integer tb_test_num;

AHB_Slave DUT  (.HCLK(tb_clk), 
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
		.sensor_data(tb_sensor_data),
		.slave_wait(tb_slave_wait),
		.command_data(tb_command_data),
		.address(tb_address),
		.renable(tb_renable),
		.wenable(tb_wenable),
		.data_size(tb_data_size),
		.burst_size(tb_burst_size));
   

always
	begin
	tb_clk = 1'b0;
	#(CLK_PERIOD/2.0);
	tb_clk = 1'b1;
	#(CLK_PERIOD/2.0);
end

initial begin
	tb_HSEL = 0;
	tb_HADDR = 32'h0;
	tb_HWRITE = 1;
	tb_HWDATA = 32'h0;
	tb_HTRANS = 2'b0;
	tb_HBURST = 3'b0;
	tb_HSIZE = 3'b010;
	tb_sensor_data = 32'h0;
	tb_slave_wait = 1;
	tb_test_num = 0;
	
	//Test case 1: Reset everything and HSEL = 0 meaning the slave module is not selected.
	tb_test_num = tb_test_num + 1;
	$display("Test Case %d: Reset everything and HSEL = 0 meaning the slave module is not selected.", tb_test_num);
	@(posedge tb_clk)
	#CHECK_DELAY
	tb_n_rst = 0;
	@(posedge tb_clk)
	#CHECK_DELAY
	tb_n_rst = 1;
	@(posedge tb_clk)
	#CHECK_DELAY
	#CHECK_DELAY
	
	assert(tb_HRESP == SLAVE_OKAY)
	else $error("HRESP error in the design");
	assert(tb_HRDATA == tb_sensor_data)
	else $error("HRDATA error in the design");
	assert(tb_command_data == tb_HWDATA[15:0])
	else $error("Command data error in the design");
	assert(tb_HREADYOUT == SLAVE_NOTREADY)
	else $error("HREADYOUT error in the design");
	assert(tb_address == {tb_HADDR[31], tb_HADDR[14:0]})
	else $error("Address error in the design");
	assert(tb_renable == 0)
	else $error("Read enable error in the design");
	assert(tb_wenable == 0)
	else $error("Write enable error in the design");
	assert(tb_burst_size == 3'b0)
	else $error("Burst size transfer error in the design");
	assert(tb_data_size == 3'b010)
	else $error("Data size transfer error in the design");
	
	//Test case 2: Enable HSEL and set sensor data to some value but set HWRITE high so that renable is low and wenable is high and data on HADDR and HWDATA gets written into the design.
	tb_test_num = tb_test_num + 1;
	$display("Test Case %d: Enable HSEL and set sensor data to some value but set HWRITE high so that renable is low and wenable is high and data on HADDR and HWDATA gets written into the design.", tb_test_num);
	@(posedge tb_clk)
	#CHECK_DELAY
	tb_n_rst = 0;
	@(posedge tb_clk)
	#CHECK_DELAY
	tb_n_rst = 1;
	@(posedge tb_clk)
	#CHECK_DELAY
	#CHECK_DELAY
	tb_HSEL = 1;
	tb_HTRANS = NONSEQ_TRANS;	
	tb_HWRITE = 1;
	tb_HADDR = 32'h8000001F;
	tb_HWDATA = 32'h0000F397;	
	@(posedge tb_clk)
	tb_sensor_data = 32'hDEAF0CAB;
	@(posedge tb_clk)
	tb_HTRANS = IDLE_TRANS;
	tb_HSEL = 0;
	assert(tb_wenable == 1)
	else $error("Write enable error in the design");
	@(posedge tb_clk)
	#CHECK_DELAY
	tb_slave_wait = 0;
	#CHECK_DELAY	
	
	assert(tb_HRESP == SLAVE_OKAY)
	else $error("HRESP error in the design");
	assert(tb_HRDATA == tb_sensor_data)
	else $error("HRDATA error in the design");
	assert(tb_command_data == tb_HWDATA[15:0])
	else $error("Command data error in the design");
	assert(tb_HREADYOUT == SLAVE_READY)
	else $error("HREADYOUT error in the design");
	assert(tb_address == {tb_HADDR[31], tb_HADDR[14:0]})
	else $error("Address error in the design");
	assert(tb_renable == 0)
	else $error("Read enable error in the design");
	assert(tb_wenable == 0)
	else $error("Write enable error in the design");
	assert(tb_burst_size == 3'b0)
	else $error("Burst size transfer error in the design");
	assert(tb_data_size == 3'b010)
	else $error("Data size transfer error in the design");
	
	//Test case 3: Enable HSEL and set sensor data to some value but set HADDR to greater than the maximum available address so that the slave returns an error on HRESP.
	tb_test_num = tb_test_num + 1;
	$display("Test Case %d: Enable HSEL and set sensor data to some value but set HADDR to greater than the maximum available address so that the slave returns an error on HRESP.", tb_test_num);
	@(posedge tb_clk)
	#CHECK_DELAY
	tb_n_rst = 0;
	@(posedge tb_clk)
	#CHECK_DELAY
	tb_n_rst = 1;
	@(posedge tb_clk)
	#CHECK_DELAY
	#CHECK_DELAY
	tb_slave_wait = 1;
	tb_HSEL = 1;
	tb_HWRITE = 1;
	tb_HTRANS = NONSEQ_TRANS;
	tb_HADDR = 32'h00000A1F;
	tb_HWDATA = 32'h0000DEC2;	
	@(posedge tb_clk)	
	tb_sensor_data = 32'hDEAF0CAB;
	@(posedge tb_clk)
	tb_HTRANS = IDLE_TRANS;
	tb_HSEL = 0;
	assert(tb_HRESP == SLAVE_ERROR)
	else $error("HRESP error in the design");
	@(posedge tb_clk)
	assert(tb_wenable == 0)
	else $error("Write enable error in the design");
	assert(tb_HREADYOUT == SLAVE_NOTREADY)
	else $error("HREADYOUT error in the design");
	tb_slave_wait = 0;
	#CHECK_DELAY	
	
	assert(tb_HRDATA == tb_sensor_data)
	else $error("HRDATA error in the design");
	assert(tb_command_data == tb_HWDATA[15:0])
	else $error("Command data error in the design");
	assert(tb_HREADYOUT == SLAVE_READY)
	else $error("HREADYOUT error in the design");
	assert(tb_address == {tb_HADDR[31], tb_HADDR[14:0]})
	else $error("Address error in the design");
	assert(tb_renable == 0)
	else $error("Read enable error in the design");
	assert(tb_wenable == 0)
	else $error("Write enable error in the design");
	assert(tb_burst_size == 3'b0)
	else $error("Burst size transfer error in the design");
	assert(tb_data_size == 3'b010)
	else $error("Data size transfer error in the design");

	//Test case 4: Enable HSEL and set sensor data to some value. Set HADDR to some legal value and set HWRITE to low so that a read happens. Check renable (should be high) and wenable (should be low) in the end.
	tb_test_num = tb_test_num + 1;
	$display("Test Case %d: Enable HSEL and set sensor data to some value. Set HADDR to some legal value and set HWRITE to low so that a read happens. Check renable (should be high) and wenable (should be low) in the end.", tb_test_num);
	@(posedge tb_clk)
	#CHECK_DELAY
	tb_n_rst = 0;
	@(posedge tb_clk)
	#CHECK_DELAY
	tb_n_rst = 1;
	@(posedge tb_clk)
	#CHECK_DELAY
	#CHECK_DELAY
	tb_slave_wait = 1;
	tb_HSEL = 1;
	tb_HWRITE = 0;
	tb_HTRANS = NONSEQ_TRANS;
	tb_HADDR = 32'h00000009;
	tb_HWDATA = 32'h0000B0DE;
	@(posedge tb_clk)	
	tb_sensor_data = 32'hDEAF0CAB;
	@(posedge tb_clk)
	tb_HTRANS = IDLE_TRANS;
	tb_HSEL = 0;
	assert(tb_renable == 1)
	else $error("Read enable error in the design");
	assert(tb_HRESP == SLAVE_OKAY)
	else $error("HRESP error in the design");
	@(posedge tb_clk)
	assert(tb_HREADYOUT == SLAVE_NOTREADY)
	else $error("HREADYOUT error in the design");
	tb_slave_wait = 0;
	#CHECK_DELAY	
	
	assert(tb_HRDATA == tb_sensor_data)
	else $error("HRDATA error in the design");
	assert(tb_command_data == tb_HWDATA[15:0])
	else $error("Command data error in the design");
	assert(tb_HREADYOUT == SLAVE_READY)
	else $error("HREADYOUT error in the design");
	assert(tb_address == {tb_HADDR[31], tb_HADDR[14:0]})
	else $error("Address error in the design");
	assert(tb_renable == 0)
	else $error("Read enable error in the design");
	assert(tb_wenable == 0)
	else $error("Write enable error in the design");
	assert(tb_burst_size == 3'b0)
	else $error("Burst size transfer error in the design");
	assert(tb_data_size == 3'b010)
	else $error("Data size transfer error in the design");
	
	//Test case 5: Enable HSEL and set sensor data to some value. Set HADDR to some legal value and set HWRITE to low and then high so that a read followed by a write happens. Check renable and wenable at appropriate times.
	tb_test_num = tb_test_num + 1;
	$display("Test Case %d: Enable HSEL and set sensor data to some value. Set HADDR to some legal value and set HWRITE to low and then high so that a read followed by a write happens. Check renable and wenable at appropriate times.", tb_test_num);
	@(posedge tb_clk)
	#CHECK_DELAY
	tb_n_rst = 0;
	@(posedge tb_clk)
	#CHECK_DELAY
	tb_n_rst = 1;
	@(posedge tb_clk)
	#CHECK_DELAY
	#CHECK_DELAY
	tb_slave_wait = 1;
	tb_HSEL = 1;
	tb_HWRITE = 0;
	tb_HTRANS = NONSEQ_TRANS;
	tb_HADDR = 32'h8000001E;
	tb_HWDATA = 32'h00009618;	
	@(posedge tb_clk)
	tb_sensor_data = 32'hFEEDABAD;
	@(posedge tb_clk)
	tb_HTRANS = NONSEQ_TRANS;
	tb_HWRITE = 1;
	assert(tb_renable == 1)
	else $error("Read enable error in the design");
	assert(tb_HRESP == SLAVE_OKAY)
	else $error("HRESP error in the design");
	@(posedge tb_clk)
	#(CHECK_DELAY/2.0)
	assert(tb_wenable == 1)
	else $error("Write enable error in the design");
	assert(tb_renable == 0)
	else $error("Read enable error in the design");
	assert(tb_HREADYOUT == SLAVE_NOTREADY)
	else $error("HREADYOUT error in the design");
	@(posedge tb_clk)
	tb_slave_wait = 0;
	tb_HTRANS = IDLE_TRANS;
	tb_HSEL = 0;	
	@(posedge tb_clk)
	#CHECK_DELAY
	assert(tb_HRDATA == tb_sensor_data)
	else $error("HRDATA error in the design");
	assert(tb_command_data == tb_HWDATA[15:0])
	else $error("Command data error in the design");
	assert(tb_HREADYOUT == SLAVE_READY)
	else $error("HREADYOUT error in the design");
	assert(tb_address == {tb_HADDR[31], tb_HADDR[14:0]})
	else $error("Address error in the design");
	assert(tb_renable == 0)
	else $error("Read enable error in the design");
	assert(tb_wenable == 0)
	else $error("Write enable error in the design");
	assert(tb_burst_size == 3'b0)
	else $error("Burst size transfer error in the design");
	assert(tb_data_size == 3'b010)
	else $error("Data size transfer error in the design");
	
	//Test case 6: Enable HSEL and set sensor data to some value. Set HADDR to some legal value and set HWRITE to high and then low so that a write followed by a read happens. Check renable and wenable at appropriate times.
	tb_test_num = tb_test_num + 1;
	$display("Test Case %d: Enable HSEL and set sensor data to some value. Set HADDR to some legal value and set HWRITE to high and then low so that a write followed by a read happens. Check renable and wenable at appropriate times.", tb_test_num);
	@(posedge tb_clk)
	#CHECK_DELAY
	tb_n_rst = 0;
	@(posedge tb_clk)
	#CHECK_DELAY
	tb_n_rst = 1;
	@(posedge tb_clk)
	#CHECK_DELAY
	#CHECK_DELAY
	tb_slave_wait = 1;
	tb_HSEL = 1;
	tb_HWRITE = 1;
	tb_HTRANS = NONSEQ_TRANS;
	tb_HADDR = 32'h00000007;
	tb_HWDATA = 32'h00002208;	
	@(posedge tb_clk)
	tb_sensor_data = 32'hECE00BAD;
	@(posedge tb_clk)
	tb_HTRANS = NONSEQ_TRANS;
	tb_HWRITE = 0;
	assert(tb_wenable == 1)
	else $error("Read enable error in the design");
	assert(tb_HRESP == SLAVE_OKAY)
	else $error("HRESP error in the design");
	@(posedge tb_clk)
	#(CHECK_DELAY/2.0)
	assert(tb_renable == 1)
	else $error("Write enable error in the design");
	assert(tb_wenable == 0)
	else $error("Read enable error in the design");
	assert(tb_HREADYOUT == SLAVE_NOTREADY)
	else $error("HREADYOUT error in the design");
	@(posedge tb_clk)
	tb_slave_wait = 0;
	tb_HTRANS = IDLE_TRANS;
	tb_HSEL = 0;	
	@(posedge tb_clk)
	#CHECK_DELAY
	assert(tb_HRDATA == tb_sensor_data)
	else $error("HRDATA error in the design");
	assert(tb_command_data == tb_HWDATA[15:0])
	else $error("Command data error in the design");
	assert(tb_HREADYOUT == SLAVE_READY)
	else $error("HREADYOUT error in the design");
	assert(tb_address == {tb_HADDR[31], tb_HADDR[14:0]})
	else $error("Address error in the design");
	assert(tb_renable == 0)
	else $error("Read enable error in the design");
	assert(tb_wenable == 0)
	else $error("Write enable error in the design");
	assert(tb_burst_size == 3'b0)
	else $error("Burst size transfer error in the design");
	assert(tb_data_size == 3'b010)
	else $error("Data size transfer error in the design");

	end
   
endmodule 
