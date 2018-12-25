// $Id: $
// File name:   Command_FIFO_storage.sv
// Created:     11/6/2017
// Author:      Vaibhav Ramachandran
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: 32-bit Command FIFO Storage Memory Design.

module Command_FIFO_storage
(
	input wire write_clk,
	input wire read_clk,
	input wire n_rst,
	input wire write_command,
	input wire read_command,
	input wire [31:0] write_data,
	output reg fifo_full,
	output reg fifo_empty,
	output reg [31:0] read_data
);

reg write_enable;
reg read_enable;
reg [3:0] write_pointer;
reg [3:0] read_pointer;
logic FIFO_write;
reg read_clear, read_corner_clear;
reg write_clear, write_corner_clear;

reg [7:0][31:0] data;

//Counters used to keep track of the pointers for reading and writing
flex_counter #(4) READ_COUNTER (.clk(read_clk), .n_rst(n_rst), .count_enable(read_enable), .rollover_val(4'd8), .count_out(read_pointer), .clear(read_clear | read_corner_clear));
flex_counter #(4) WRITE_COUNTER (.clk(write_clk), .n_rst(n_rst), .count_enable(write_enable), .rollover_val(4'd8), .count_out(write_pointer), .clear(write_clear | write_corner_clear));

always_comb begin
	write_enable = 0;
	if(write_command) begin
		if(!fifo_full | (fifo_full && ((write_pointer + 1) == read_pointer)))	//Taking care of corner cases should the need arise
			write_enable = 1;
		else
			write_enable = 0;
	end
end

always_comb begin
	read_enable = 0;
	if(read_command) begin
		if(!fifo_empty)
			read_enable = 1;
		else
			read_enable = 0;
	end
end

always_ff @(posedge write_clk) begin
	if(n_rst == 0) begin		//Removes inferred latches
		data[0] <= 32'h0;
		data[1] <= 32'h0;
		data[2] <= 32'h0;
		data[3] <= 32'h0;
		data[4] <= 32'h0;
		data[5] <= 32'h0;
		data[6] <= 32'h0;
		data[7] <= 32'h0;
	end
	else begin	
		if(FIFO_write)
			data[write_pointer] <= write_data;
	end
end

//This block takes care of the corner case where the starting point for the read and write pointers is no longer zero when the FIFO is empty.
always_comb begin
	fifo_empty = 0;
	read_corner_clear = 0;
	write_corner_clear = 0;
	if((read_pointer == write_pointer)) begin
		fifo_empty = 1;
		if(read_pointer != 0) begin
			read_corner_clear = 1;
			write_corner_clear = 1;
		end
	end
end

always_comb begin
	fifo_full = 0;
	if((write_pointer == 4'd8 && read_pointer == 0) || ((write_pointer + 1) == read_pointer))
		fifo_full = 1;
end

assign FIFO_write = !fifo_full;

always_comb begin
	read_clear = 0;
	write_clear = 0;
	if(write_pointer == 4'd8 && read_pointer != 4'd0)	//Takes care of the corner case where the write/read pointer points outside the scope of the array of registers
		write_clear = 1;
	if(read_pointer == 4'd8)
		read_clear = 1;
end

always_comb begin
	if(fifo_empty)
		read_data = 0;
	else
		read_data = data[read_pointer];
end

endmodule 
