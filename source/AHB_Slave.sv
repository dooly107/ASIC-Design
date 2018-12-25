// $Id: $
// File name:   AHB_Slave.sv
// Created:     11/14/2017
// Author:      Vaibhav Ramachandran
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: AHB Slave module.
module AHB_Slave
#(
	parameter BASE_ADDRESS = 32'h0,
	parameter NUMBER_OF_ADDRESSES = 32
)
(
	//AHB-Lite interface signals
	input logic HCLK, HRESETn, HWRITE, HSEL,
	input logic [31:0] HADDR, HWDATA,
	input logic [1:0] HTRANS,
	input logic [2:0] HBURST, HSIZE,
	output logic [31:0] HRDATA,
	output logic HRESP, HREADYOUT,
	//Control module interface signals
	input logic [31:0] sensor_data,
	input logic slave_wait,
	output logic [15:0] command_data, address,
	//output logic rwait, wwait, 
	output logic renable, wenable,
	output logic [2:0] data_size, burst_size
	//output logic [4:0] current_count
);

localparam ADDRESS_MAX = BASE_ADDRESS + NUMBER_OF_ADDRESSES - 1;

//Types of Transfers possible in AHB protocol
localparam IDLE_TRANS = 2'b00;
localparam BUSY_TRANS = 2'b01;
localparam NONSEQ_TRANS = 2'b10;
localparam SEQ_TRANS = 2'b11;

//Types of Burst transfers possible in AHB protocol
//HBURST is always SINGLE_BURST
localparam SINGLE_BURST = 3'b000;
localparam INCR_BURST = 3'b001;
localparam WRAP4_BURST = 3'b010;
localparam INCR4_BURST = 3'b011;
localparam WRAP8_BURST = 3'b100;
localparam INCR8_BURST = 3'b101;
localparam WRAP16_BURST = 3'b110;
localparam INCR16_BURST = 3'b111;

localparam SLAVE_OKAY = 1'b0;
localparam SLAVE_ERROR = 1'b1;

localparam SLAVE_READY = 1'b1;
localparam SLAVE_NOTREADY = 1'b0;

typedef enum bit [2:0] {IDLE, READ, WRITE, FIRST_ERROR, SECOND_ERROR} stateType;
stateType state, next_state;

logic [4:0] burst_counter; //Tracker for the current iteration in the burst sequence

always_ff @ (posedge HCLK, negedge HRESETn) begin
	if(HRESETn == 0) begin
		state <= IDLE;
		burst_counter <= 0;
	end
	else begin
		state <= next_state;
		if(HTRANS == NONSEQ_TRANS)
			burst_counter <= 1;
		else if(HTRANS == SEQ_TRANS)
			burst_counter <= burst_counter + 1;
		else
			burst_counter <= burst_counter;
	end
end

always_comb begin
	next_state = state;
	case(state)
		IDLE: begin
			if(HSEL) begin
				if((HADDR[14:0] > ADDRESS_MAX) || (HTRANS != NONSEQ_TRANS))
					next_state = FIRST_ERROR;
				else if(HWRITE)
					next_state = WRITE;
				else 
					next_state = READ;
			end
			else
				next_state = IDLE;
		end
		READ: begin
			if(HTRANS == BUSY_TRANS)
				next_state = READ;
			else if(HSEL) begin
				if(HADDR[14:0] > ADDRESS_MAX)
					next_state = FIRST_ERROR;
				else if(HSEL && HWRITE && HTRANS == NONSEQ_TRANS)
					next_state = WRITE;
				else if(HSEL && ~HWRITE)
					next_state = READ;
				else
					next_state = FIRST_ERROR;
			end
			else
				next_state = IDLE;
		end
		WRITE: begin
			if(HTRANS == BUSY_TRANS)
				next_state = WRITE;
			else if(HSEL) begin
				if(HADDR[14:0] > ADDRESS_MAX)
					next_state = FIRST_ERROR;
				else if(HSEL && ~HWRITE && HTRANS == NONSEQ_TRANS)
					next_state = READ;
				else if(HSEL && HWRITE)
					next_state = WRITE;
				else
					next_state = FIRST_ERROR;
			end
			else
				next_state = IDLE;
		end
		FIRST_ERROR: begin			//First of two error cycles needed as per the specifications in the AHB protocol manual
			next_state = SECOND_ERROR;
		end
		SECOND_ERROR: begin
			next_state = IDLE;
		end
	endcase
end

//Assigning the outputs based on conditions met in the state machine
assign HRESP = ((state == FIRST_ERROR) || (state == SECOND_ERROR))? SLAVE_ERROR : SLAVE_OKAY;
//assign current_count = burst_counter;
assign HRDATA = sensor_data;
assign command_data = HWDATA[15:0];
assign HREADYOUT = ((state == FIRST_ERROR)? 1'b0 : ((state == SECOND_ERROR)? 1'b0 : ~slave_wait));
assign address = {HADDR[31], HADDR[14:0]};
assign burst_size = HBURST;
assign data_size = HSIZE;
assign renable = (state == READ && HTRANS != BUSY_TRANS);
assign wenable = (state == WRITE && HTRANS != BUSY_TRANS);

endmodule 
