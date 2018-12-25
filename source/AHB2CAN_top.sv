// $Id: $
// File name:   AHB2CAN_top.sv
// Created:     12/1/2017
// Author:      Vaibhav Ramachandran
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: AHB-Lite to CAN bus Interface Module top level file.

module AHB2CAN_top
(
	//AHB-Lite interface signals
	input logic HCLK, HRESETn, HWRITE, HSEL,
	input logic [31:0] HADDR, HWDATA,
	input logic [1:0] HTRANS,
	input logic [2:0] HBURST, HSIZE,
	output logic [31:0] HRDATA,
	output logic HRESP, HREADYOUT,
	//CAN bus interface signals
	input logic rx_data,
	output logic tx_data
);

//AHB Lite module registers
reg [31:0] sensor_data;
reg [15:0] address, command_data;
reg slave_wait, renable, wenable;
reg [2:0] data_size, burst_size;

//Control Unit registers
reg sensor_fifo_full, sensor_fifo_empty, sensor_read, sensor_write, command_fifo_full, command_fifo_empty, command_read, command_write;
reg [31:0] command_rdata, sensor_rdata, command_wdata, sensor_wdata;

//CAN bus module registers
reg read_fifo, write_fifo;
reg [31:0] CAN_rx_data, CAN_tx_data;


AHB_Slave AHBS (.HCLK(HCLK), 
		.HRESETn(HRESETn), 
		.HWRITE(HWRITE),
		.HSEL(HSEL),
		.HADDR(HADDR),
		.HWDATA(HWDATA),
		.HTRANS(HTRANS),
		.HBURST(HBURST),
		.HSIZE(HSIZE),
		.HRDATA(HRDATA),
		.HRESP(HRESP),
		.HREADYOUT(HREADYOUT),
		//Control Unit Interface Signals
		.sensor_data(sensor_data),
		.address(address),
		.command_data(command_data),
		.slave_wait(slave_wait),
		.renable(renable),
		.wenable(wenable),
		.data_size(data_size),
		.burst_size(burst_size)
);

Control_Unit CU(.clk(HCLK),
		.n_rst(HRESETn),
		//AHB Interface Signals
		.command_data(command_data),
		.address(address),
		.renable(renable),
		.wenable(wenable),
		.data_size(data_size),
		.burst_size(burst_size),
		.sensor_data(sensor_data),
		.slave_wait(slave_wait),
		//FIFO Interface signals
		.sensor_fifo_full(sensor_fifo_full),
		.sensor_fifo_empty(sensor_fifo_empty),
		.command_fifo_full(command_fifo_full),
		.command_fifo_empty(command_fifo_empty),
		.sensor_read(sensor_read),
		.sensor_write(sensor_write),
		.command_read(command_read),
		.command_write(command_write),
		.command_rdata(command_rdata),
		.command_wdata(command_wdata),
		.sensor_rdata(sensor_rdata),
		.sensor_wdata(sensor_wdata),
		//CAN bus interface signals
		.rx_data(CAN_rx_data),
		.read_fifo(read_fifo),
		.write_fifo(write_fifo),
		.tx_data(CAN_tx_data)
);

Sensor_FIFO_storage SFIFO      (.write_clk(HCLK),
				.read_clk(HCLK),
				.n_rst(HRESETn),
				.write_command(sensor_write),
				.read_command(sensor_read),
				.write_data(sensor_wdata),
				.fifo_full(sensor_fifo_full),
				.fifo_empty(sensor_fifo_empty),
				.read_data(sensor_rdata)
);

Command_FIFO_storage CFIFO     (.write_clk(HCLK),
				.read_clk(HCLK),
				.n_rst(HRESETn),
				.write_command(command_write),
				.read_command(command_read),
				.write_data(command_wdata),
				.fifo_full(command_fifo_full),
				.fifo_empty(command_fifo_empty),
				.read_data(command_rdata)
);

can_register CANbus    (.clk(HCLK),
			.n_rst(HRESETn),
			.command(CAN_tx_data),
			.rxd(rx_data),
			.txd(tx_data),
			.write_fifo(write_fifo),
			.read_fifo(read_fifo),
			.send_data(CAN_rx_data)
);


endmodule 		 
