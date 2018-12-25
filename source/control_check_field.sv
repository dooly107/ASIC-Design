// $Id: $
// File name:   control_check_field.sv
// Created:     11/14/2017
// Author:      Sang Hun Kim
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: control_check_field

`timescale 1ns / 100ps

module control_check_field
  (
   input wire 	     clk,
   input wire 	     n_rst,
   input wire 	     rxd;
   input wire [68:0] can_bus_data,
   output reg 	     rx_enable,
   output reg 	     tx_enable,
   );
   
   //Variables for Arbitration
   reg [10:0] 	     id;
   reg 		     win;
   reg 		     lose;		     
   reg 		     arbitration_start;

   arbitration ARBITRATION
     (
      .clk(clk),
      .n_rst(n_rst),
      .rxd(rxd),
      .id(id),
      .arbitration_start(arbitration_start),
      .win(win),
      .lose(lose)
      );
   
   typedef enum      bit [1:0] {IDLE, START, LOSE, WIN} stateType;

   stateType state;
   stateType next_state;
   
   always_ff @ (posedge clk, negedge n_rst)
     begin
	if (n_rst == 1'b0)
	  begin
	     state <= IDLE;
	  end
	else
	  begin
	     state <= next_state;
	  end
     end // always_ff @

   always_comb
     begin
	next_state = state;
	case(state)
	  IDLE:
	    begin
	       if (id != '0)
		 next_state = START;
	       else
		 next_state = IDLE;
	    end
	  START:
	    begin
	       if (win == 1'b1)
		 begin
		    next_state = WIN;
		 end
	       else if (lose == 1'b1)
		 begin
		    next_state = LOSE;
		 end
	       else
		 begin
		    next_state = START;
		 end
	    end // case: START
	  WIN:
	    begin
	       //Do Nothing
	    end
	  LOSE:
	    begin
	       //Do Nothing
	    end
	end // always_comb
   
   always_comb
     begin
	rx_enable = 1'b0;
	tx_enable = 1'b0;
	arbitration_start = 1'b0;
	id = can_bus_data[67:57];

	case(state)
	  IDLE:
	    begin
	       //No change
	    end
	  START:
	    begin
	       arbitration_start = 1'b1;
	    end
	  WIN:
	    begin
	       tx_enable = 1'b1;
	       arbitration_start = 1'b0;
	       id = '0;
	    end
	  LOSE:
	    begin
	       rx_enable = 1'b1;
	       arbitration_start = 1'b0;
	       id = '0;
	    end
	end // always_comb

endmodule // control_check_field
