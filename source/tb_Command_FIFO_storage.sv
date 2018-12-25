// $Id: $
// File name:   tb_Command_FIFO_storage.sv
// Created:     10/1/2017
// Author:      Vaibhav Ramachandran
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: FIFO storage file test bench.

`timescale 1ns/100ps

module tb_Command_FIFO_storage();

// Define parameters
	// basic test bench parameters
	localparam	CLK_PERIOD = 10; //100Mhz clk
	localparam	CHECK_DELAY = 2; // Check 2ns after the rising edge to allow for propagation delay
	
	// Shared Test Variables
	reg tb_clk;

	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end

	integer tb_test_num = 0;

	reg tb_n_rst;
	reg tb_read_enable;
	reg [31:0] tb_read_data;
	reg tb_fifo_empty;
	reg tb_fifo_full;
	reg tb_write_enable;
	reg [31:0] tb_write_data;

	Command_FIFO_storage DUT (.write_clk(tb_clk), .read_clk(tb_clk), .n_rst(tb_n_rst), .read_command(tb_read_enable), .write_command(tb_write_enable), .write_data(tb_write_data), .read_data(tb_read_data), .fifo_empty(tb_fifo_empty), .fifo_full(tb_fifo_full));

	initial begin
		tb_read_enable = 0;
		tb_write_enable = 0;
		tb_read_data = 32'h0;
		tb_write_data = 32'h0;

		//Test case 1: Reset Everything
		tb_test_num = tb_test_num + 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_n_rst = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_n_rst = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		#CHECK_DELAY
		assert(!tb_fifo_full && tb_fifo_empty)
		else $error("Test case 1 failed");

		//Test Case 2: Write data to the FIFO
		tb_test_num = tb_test_num + 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_n_rst = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_n_rst = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'h12345678;
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		assert(tb_read_data == 32'h12345678)
		else $error("Test case 2 failed");

		//Test case 3: Write multiple data bytes to the FIFO and read each one.
		tb_test_num = tb_test_num + 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_n_rst = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_n_rst = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'hAABB1133;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'h14725896;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'h53371830;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		
		assert(tb_read_data == 32'hAABB1133)
		else $error("Test case 3.1 failed");
		tb_read_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_read_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		
		@(posedge tb_clk)
		@(posedge tb_clk)
		assert(tb_read_data == 32'h14725896)
		else $error("Test case 3.2 failed");

		tb_read_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_read_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		
		@(posedge tb_clk)
		@(posedge tb_clk)
		assert(tb_read_data == 32'h53371830)
		else $error("Test case 3.3 failed");

		tb_read_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_read_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		
		@(posedge tb_clk)
		@(posedge tb_clk)
		assert(tb_read_data == 32'h0 && tb_fifo_empty)
		else $error("Test case 3.4 failed");

		//Test case 4: Fill the FIFO so that fifo_full = 1.
		tb_test_num = tb_test_num + 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_n_rst = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_n_rst = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'h10101010;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'hEFEFEFEF;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'hBADABADA;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'h45254525;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'hFFFF000F;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'h001F1EDA;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'hCAFE0BED;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'hDEADBEEF;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		assert(tb_fifo_full == 1'b1)
		else $error("Test case 4 failed");

		//Test case 5: Empty the FIFO once it's full.
		tb_test_num = tb_test_num + 1;
		#CHECK_DELAY
		tb_read_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_read_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		@(posedge tb_clk)
		@(posedge tb_clk)

		#CHECK_DELAY
		tb_read_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_read_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		@(posedge tb_clk)
		@(posedge tb_clk)

		#CHECK_DELAY
		tb_read_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_read_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		@(posedge tb_clk)
		@(posedge tb_clk)

		#CHECK_DELAY
		tb_read_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_read_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		@(posedge tb_clk)
		@(posedge tb_clk)

		#CHECK_DELAY
		tb_read_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_read_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		@(posedge tb_clk)
		@(posedge tb_clk)

		#CHECK_DELAY
		tb_read_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_read_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		@(posedge tb_clk)
		@(posedge tb_clk)

		#CHECK_DELAY
		tb_read_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_read_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		@(posedge tb_clk)
		@(posedge tb_clk)

		#CHECK_DELAY
		tb_read_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_read_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		@(posedge tb_clk)
		@(posedge tb_clk)

		@(posedge tb_clk)
		@(posedge tb_clk)

		assert(!tb_fifo_full && tb_fifo_empty)
		else $error("Test case 5 failed");

		//Test case 6: Write only 7 elements to the FIFO
		tb_test_num = tb_test_num + 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_n_rst = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_n_rst = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'h10101010;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'hEFEFEFEF;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'hBADABADA;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'h45254525;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'hFFFF000F;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'h001F1EDA;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'hCAFE0BED;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		assert(!tb_fifo_full)
		else $error("Failed test case 6");

		//Test case 7: Part 1: Write 3 times to the FIFO and then read 3 times from it. This offsets the start point of the next tests.
		tb_test_num = tb_test_num + 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_n_rst = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_n_rst = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'hAABB1133;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'h14725896;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'h53371830;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		
		assert(tb_read_data == 32'hAABB1133)
		else $error("Test case 7.1 failed");
		tb_read_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_read_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		
		@(posedge tb_clk)
		@(posedge tb_clk)
		assert(tb_read_data == 32'h14725896)
		else $error("Test case 7.2 failed");

		tb_read_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_read_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		
		@(posedge tb_clk)
		@(posedge tb_clk)
		assert(tb_read_data == 32'h53371830)
		else $error("Test case 7.3 failed");

		tb_read_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_read_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		
		@(posedge tb_clk)
		@(posedge tb_clk)
		assert(tb_read_data == 32'h0 && tb_fifo_empty)
		else $error("Test case 7.4 failed");

		//Test case 7: Part 2: Fill the FIFO so that fifo_full = 1.
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'h10101010;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'hEFEFEFEF;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'hBADABADA;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'h45254525;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'hFFFF000F;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'h001F1EDA;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'hCAFE0BED;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_data = 32'hDEADBEEF;
		#CHECK_DELAY
		tb_write_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_write_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		assert(tb_fifo_full == 1'b1)
		else $error("Test case 7.5 failed");

		//Test case 7: Part 3: Empty the FIFO once it's full.
		#CHECK_DELAY
		tb_read_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_read_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		@(posedge tb_clk)
		@(posedge tb_clk)

		#CHECK_DELAY
		tb_read_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_read_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		@(posedge tb_clk)
		@(posedge tb_clk)

		#CHECK_DELAY
		tb_read_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_read_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		@(posedge tb_clk)
		@(posedge tb_clk)

		#CHECK_DELAY
		tb_read_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_read_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		@(posedge tb_clk)
		@(posedge tb_clk)

		#CHECK_DELAY
		tb_read_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_read_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		@(posedge tb_clk)
		@(posedge tb_clk)

		#CHECK_DELAY
		tb_read_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_read_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		@(posedge tb_clk)
		@(posedge tb_clk)

		#CHECK_DELAY
		tb_read_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_read_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		@(posedge tb_clk)
		@(posedge tb_clk)

		#CHECK_DELAY
		tb_read_enable = 1;
		@(posedge tb_clk)
		#CHECK_DELAY
		tb_read_enable = 0;
		@(posedge tb_clk)
		#CHECK_DELAY
		@(posedge tb_clk)
		@(posedge tb_clk)

		@(posedge tb_clk)
		@(posedge tb_clk)

		assert(!tb_fifo_full && tb_fifo_empty)
		else $error("Test case 7.6 failed");

	end
endmodule
