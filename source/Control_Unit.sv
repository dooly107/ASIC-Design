// $Id: $
// File name:   Control_Unit.sv
// Created:     11/30/2017
// Author:      Vaibhav Ramachandran
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: The main control unit for the AHB Lite to CAN bus interface module.

module Control_Unit
(
	input clk, n_rst,
	//Interface signals with the AHB-Lite Module
	input logic [15:0] command_data, address,
	input logic renable, wenable,
	input logic [2:0] data_size, burst_size,
	output logic [31:0] sensor_data,
	output logic slave_wait,

	//Interface signals with the Sensor and Command FIFOs
	input logic sensor_fifo_full, sensor_fifo_empty,
	output logic sensor_read, sensor_write,
	input logic command_fifo_full, command_fifo_empty,
	output logic command_read, command_write,
	input logic [31:0] command_rdata, sensor_rdata,
	output logic [31:0] command_wdata, sensor_wdata,
	//Interface signals with the CAN bus Module
	input logic [31:0] rx_data,
	input logic read_fifo,
	input logic write_fifo,
	output logic [31:0] tx_data
);

localparam CAN_BUS_READY = 1'b1;
localparam CAN_BUS_BUSY = 1'b0;

typedef enum bit [3:0] {IDLE, CHECK_SENSOR_FIFO, CHECK_COMMAND_FIFO, READ_SENSOR, WRITE_SENSOR, READ_COMMAND, WRITE_COMMAND, NO_SENSOR_DATA, NO_COMMAND_DATA, COMMAND_FULL, WAIT_STATE} stateType;
stateType state, next_state, current, next;

always_ff @ (posedge clk, negedge n_rst) begin
	if(n_rst == 1'b0) begin
		state <= IDLE;
		current <= IDLE;
	end
	else begin
		current <= next;
		state <= next_state;
	end
end

always_comb begin

	tx_data = 32'hFFFFFFFF;
	command_read = 0;
	command_write = 0;
	sensor_read = 0;
	sensor_write = 0;
	sensor_data = 32'h0;
	slave_wait = 1;
	command_wdata = 32'h0;
	sensor_wdata = 32'h0;
	next_state = state;
	next = current;

	case(state)
		IDLE: begin
			if(write_fifo)
				next_state = WRITE_SENSOR;
			else if(read_fifo)
				next_state = CHECK_COMMAND_FIFO;
			else begin
				next_state = IDLE;
				slave_wait = 1;
			end
		end
		CHECK_COMMAND_FIFO: begin
			slave_wait = 0;
			if(command_fifo_empty)
				next_state = NO_COMMAND_DATA;
			else
				next_state = READ_COMMAND;
		end
		/*CHECK_SENSOR_FIFO: begin
			slave_wait = 0;
			if(sensor_fifo_full)
				next_state = WRITE_SENSOR;
			else
				next_state = WRITE_SENSOR;
		end*/
		NO_COMMAND_DATA: begin
			next_state = IDLE;
			command_read = 0;
			slave_wait = 0;
		end
		READ_COMMAND: begin
			command_read = 1;
			tx_data = command_rdata;
			next_state = WAIT_STATE;
		end
		WRITE_SENSOR: begin
			sensor_write = 1;
			sensor_wdata = rx_data;
			next_state = WAIT_STATE;
		end
		WAIT_STATE: begin
			if(!read_fifo)
				next_state = IDLE;
			else
				next_state = WAIT_STATE;
			slave_wait = 0;
		end
	endcase
	
	case(current)
		IDLE: begin
			slave_wait = 0;
			if(wenable)
				next = CHECK_COMMAND_FIFO;
			else if(renable)
				next = CHECK_SENSOR_FIFO;
			else
				next = IDLE;
		end
		CHECK_COMMAND_FIFO: begin
			if(command_fifo_full) begin
				slave_wait = 1;
				next = COMMAND_FULL;
			end
			else
				next = WRITE_COMMAND;
		end
		CHECK_SENSOR_FIFO: begin
			if(sensor_fifo_empty) begin
				slave_wait = 1;
				next = NO_SENSOR_DATA;
			end
			else 
				next = READ_SENSOR;
		end
		COMMAND_FULL: begin
			command_write = 0;
			slave_wait = 1;
			if(renable)
				next = CHECK_SENSOR_FIFO;
			else
				next = IDLE;
		end
		WRITE_COMMAND: begin
			command_write = 1;
			command_wdata = {address, command_data};
			if(renable)
				next = CHECK_SENSOR_FIFO;
			else
				next = IDLE;
			slave_wait = 1;
		end
		NO_SENSOR_DATA: begin
			sensor_read = 0;
			slave_wait = 1;
			if(wenable)
				next = CHECK_COMMAND_FIFO;
			else
				next = IDLE;
		end
		READ_SENSOR: begin
			sensor_read = 1;
			slave_wait = 1;
			sensor_data = sensor_rdata;
			if(wenable)
				next = CHECK_COMMAND_FIFO;
			else
				next = IDLE;
		end	
		/*WAIT_STATE: begin
			if(
			next = IDLE;
			slave_wait = 1;
		end*/
	endcase
end
endmodule 