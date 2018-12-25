/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Dec 13 15:42:22 2017
/////////////////////////////////////////////////////////////


module AHB_Slave ( HCLK, HRESETn, HWRITE, HSEL, HADDR, HWDATA, HTRANS, HBURST, 
        HSIZE, HRDATA, HRESP, HREADYOUT, sensor_data, slave_wait, command_data, 
        address, renable, wenable, data_size, burst_size );
  input [31:0] HADDR;
  input [31:0] HWDATA;
  input [1:0] HTRANS;
  input [2:0] HBURST;
  input [2:0] HSIZE;
  output [31:0] HRDATA;
  input [31:0] sensor_data;
  output [15:0] command_data;
  output [15:0] address;
  output [2:0] data_size;
  output [2:0] burst_size;
  input HCLK, HRESETn, HWRITE, HSEL, slave_wait;
  output HRESP, HREADYOUT, renable, wenable;
  wire   \HADDR[31] , \HADDR[14] , \HADDR[13] , \HADDR[12] , \HADDR[11] ,
         \HADDR[10] , \HADDR[9] , \HADDR[8] , \HADDR[7] , \HADDR[6] ,
         \HADDR[5] , \HADDR[4] , \HADDR[3] , \HADDR[2] , \HADDR[1] ,
         \HADDR[0] , N81, n1, n2, n3, n4, n5, n6, n7, n8, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40;
  wire   [2:0] state;
  wire   [2:0] next_state;
  assign HRDATA[31] = sensor_data[31];
  assign HRDATA[30] = sensor_data[30];
  assign HRDATA[29] = sensor_data[29];
  assign HRDATA[28] = sensor_data[28];
  assign HRDATA[27] = sensor_data[27];
  assign HRDATA[26] = sensor_data[26];
  assign HRDATA[25] = sensor_data[25];
  assign HRDATA[24] = sensor_data[24];
  assign HRDATA[23] = sensor_data[23];
  assign HRDATA[22] = sensor_data[22];
  assign HRDATA[21] = sensor_data[21];
  assign HRDATA[20] = sensor_data[20];
  assign HRDATA[19] = sensor_data[19];
  assign HRDATA[18] = sensor_data[18];
  assign HRDATA[17] = sensor_data[17];
  assign HRDATA[16] = sensor_data[16];
  assign HRDATA[15] = sensor_data[15];
  assign HRDATA[14] = sensor_data[14];
  assign HRDATA[13] = sensor_data[13];
  assign HRDATA[12] = sensor_data[12];
  assign HRDATA[11] = sensor_data[11];
  assign HRDATA[10] = sensor_data[10];
  assign HRDATA[9] = sensor_data[9];
  assign HRDATA[8] = sensor_data[8];
  assign HRDATA[7] = sensor_data[7];
  assign HRDATA[6] = sensor_data[6];
  assign HRDATA[5] = sensor_data[5];
  assign HRDATA[4] = sensor_data[4];
  assign HRDATA[3] = sensor_data[3];
  assign HRDATA[2] = sensor_data[2];
  assign HRDATA[1] = sensor_data[1];
  assign HRDATA[0] = sensor_data[0];
  assign command_data[15] = HWDATA[15];
  assign command_data[14] = HWDATA[14];
  assign command_data[13] = HWDATA[13];
  assign command_data[12] = HWDATA[12];
  assign command_data[11] = HWDATA[11];
  assign command_data[10] = HWDATA[10];
  assign command_data[9] = HWDATA[9];
  assign command_data[8] = HWDATA[8];
  assign command_data[7] = HWDATA[7];
  assign command_data[6] = HWDATA[6];
  assign command_data[5] = HWDATA[5];
  assign command_data[4] = HWDATA[4];
  assign command_data[3] = HWDATA[3];
  assign command_data[2] = HWDATA[2];
  assign command_data[1] = HWDATA[1];
  assign command_data[0] = HWDATA[0];
  assign address[15] = \HADDR[31] ;
  assign \HADDR[31]  = HADDR[31];
  assign address[14] = \HADDR[14] ;
  assign \HADDR[14]  = HADDR[14];
  assign address[13] = \HADDR[13] ;
  assign \HADDR[13]  = HADDR[13];
  assign address[12] = \HADDR[12] ;
  assign \HADDR[12]  = HADDR[12];
  assign address[11] = \HADDR[11] ;
  assign \HADDR[11]  = HADDR[11];
  assign address[10] = \HADDR[10] ;
  assign \HADDR[10]  = HADDR[10];
  assign address[9] = \HADDR[9] ;
  assign \HADDR[9]  = HADDR[9];
  assign address[8] = \HADDR[8] ;
  assign \HADDR[8]  = HADDR[8];
  assign address[7] = \HADDR[7] ;
  assign \HADDR[7]  = HADDR[7];
  assign address[6] = \HADDR[6] ;
  assign \HADDR[6]  = HADDR[6];
  assign address[5] = \HADDR[5] ;
  assign \HADDR[5]  = HADDR[5];
  assign address[4] = \HADDR[4] ;
  assign \HADDR[4]  = HADDR[4];
  assign address[3] = \HADDR[3] ;
  assign \HADDR[3]  = HADDR[3];
  assign address[2] = \HADDR[2] ;
  assign \HADDR[2]  = HADDR[2];
  assign address[1] = \HADDR[1] ;
  assign \HADDR[1]  = HADDR[1];
  assign address[0] = \HADDR[0] ;
  assign \HADDR[0]  = HADDR[0];
  assign data_size[2] = HSIZE[2];
  assign data_size[1] = HSIZE[1];
  assign data_size[0] = HSIZE[0];
  assign burst_size[2] = HBURST[2];
  assign burst_size[1] = HBURST[1];
  assign burst_size[0] = HBURST[0];
  assign HRESP = N81;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(HCLK), .R(HRESETn), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(HCLK), .R(HRESETn), .S(1'b1), 
        .Q(state[2]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(HCLK), .R(HRESETn), .S(1'b1), 
        .Q(state[1]) );
  NOR2X1 U4 ( .A(n1), .B(n2), .Y(wenable) );
  NOR2X1 U5 ( .A(n1), .B(n3), .Y(renable) );
  OAI22X1 U8 ( .A(n4), .B(n5), .C(n6), .D(n7), .Y(next_state[2]) );
  OR2X1 U9 ( .A(n8), .B(n12), .Y(next_state[1]) );
  OAI21X1 U10 ( .A(n13), .B(n14), .C(n15), .Y(n12) );
  INVX1 U11 ( .A(HWRITE), .Y(n14) );
  OAI22X1 U12 ( .A(n16), .B(n2), .C(n4), .D(n17), .Y(n8) );
  OR2X1 U13 ( .A(n18), .B(n19), .Y(next_state[0]) );
  OAI21X1 U14 ( .A(HWRITE), .B(n13), .C(n15), .Y(n19) );
  INVX1 U15 ( .A(n20), .Y(n15) );
  OAI21X1 U16 ( .A(n21), .B(n22), .C(n23), .Y(n20) );
  OAI21X1 U17 ( .A(n24), .B(n25), .C(n26), .Y(n23) );
  NAND3X1 U18 ( .A(n27), .B(n28), .C(n29), .Y(n25) );
  NOR2X1 U19 ( .A(\HADDR[11] ), .B(\HADDR[10] ), .Y(n29) );
  INVX1 U20 ( .A(\HADDR[12] ), .Y(n28) );
  NOR2X1 U21 ( .A(\HADDR[14] ), .B(\HADDR[13] ), .Y(n27) );
  NAND3X1 U22 ( .A(n30), .B(n31), .C(n32), .Y(n24) );
  NOR2X1 U23 ( .A(\HADDR[6] ), .B(\HADDR[5] ), .Y(n32) );
  INVX1 U24 ( .A(\HADDR[7] ), .Y(n31) );
  NOR2X1 U25 ( .A(\HADDR[9] ), .B(\HADDR[8] ), .Y(n30) );
  INVX1 U26 ( .A(n26), .Y(n13) );
  OAI21X1 U27 ( .A(n33), .B(n34), .C(n22), .Y(n26) );
  NAND3X1 U28 ( .A(n6), .B(n7), .C(HSEL), .Y(n22) );
  AND2X1 U29 ( .A(n3), .B(n2), .Y(n33) );
  OAI22X1 U30 ( .A(n16), .B(n3), .C(n7), .D(n17), .Y(n18) );
  NAND3X1 U31 ( .A(n3), .B(n2), .C(n35), .Y(n17) );
  NAND3X1 U32 ( .A(n7), .B(n5), .C(state[1]), .Y(n2) );
  NAND2X1 U33 ( .A(state[0]), .B(n6), .Y(n3) );
  NOR2X1 U34 ( .A(state[2]), .B(state[1]), .Y(n6) );
  INVX1 U35 ( .A(n36), .Y(n16) );
  OAI21X1 U36 ( .A(n21), .B(n34), .C(n37), .Y(n36) );
  NAND2X1 U37 ( .A(HSEL), .B(n37), .Y(n34) );
  INVX1 U38 ( .A(n1), .Y(n37) );
  NOR2X1 U39 ( .A(n38), .B(HTRANS[1]), .Y(n1) );
  AND2X1 U40 ( .A(HTRANS[1]), .B(n38), .Y(n21) );
  INVX1 U41 ( .A(HTRANS[0]), .Y(n38) );
  NOR2X1 U42 ( .A(slave_wait), .B(N81), .Y(HREADYOUT) );
  INVX1 U43 ( .A(n35), .Y(N81) );
  MUX2X1 U44 ( .B(n39), .A(n40), .S(n4), .Y(n35) );
  INVX1 U45 ( .A(state[1]), .Y(n4) );
  NOR2X1 U46 ( .A(state[0]), .B(n5), .Y(n40) );
  INVX1 U47 ( .A(state[2]), .Y(n5) );
  NOR2X1 U48 ( .A(state[2]), .B(n7), .Y(n39) );
  INVX1 U49 ( .A(state[0]), .Y(n7) );
endmodule


module Control_Unit ( clk, n_rst, command_data, address, renable, wenable, 
        data_size, burst_size, sensor_data, slave_wait, sensor_fifo_full, 
        sensor_fifo_empty, sensor_read, sensor_write, command_fifo_full, 
        command_fifo_empty, command_read, command_write, command_rdata, 
        sensor_rdata, command_wdata, sensor_wdata, rx_data, read_fifo, 
        write_fifo, tx_data );
  input [15:0] command_data;
  input [15:0] address;
  input [2:0] data_size;
  input [2:0] burst_size;
  output [31:0] sensor_data;
  input [31:0] command_rdata;
  input [31:0] sensor_rdata;
  output [31:0] command_wdata;
  output [31:0] sensor_wdata;
  input [31:0] rx_data;
  output [31:0] tx_data;
  input clk, n_rst, renable, wenable, sensor_fifo_full, sensor_fifo_empty,
         command_fifo_full, command_fifo_empty, read_fifo, write_fifo;
  output slave_wait, sensor_read, sensor_write, command_read, command_write;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71;
  wire   [3:0] state;
  wire   [3:0] current;
  wire   [3:0] next;
  wire   [3:0] next_state;

  DFFSR \current_reg[0]  ( .D(next[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        current[0]) );
  DFFSR \current_reg[2]  ( .D(next[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        current[2]) );
  DFFSR \current_reg[1]  ( .D(next[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        current[1]) );
  DFFSR \current_reg[3]  ( .D(next[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        current[3]) );
  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[3]  ( .D(next_state[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[3]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  INVX2 U11 ( .A(n12), .Y(sensor_write) );
  INVX2 U12 ( .A(n67), .Y(command_write) );
  INVX2 U13 ( .A(n70), .Y(sensor_read) );
  BUFX2 U14 ( .A(n10), .Y(n9) );
  OR2X1 U15 ( .A(command_rdata[9]), .B(n9), .Y(tx_data[9]) );
  OR2X1 U16 ( .A(command_rdata[8]), .B(n9), .Y(tx_data[8]) );
  OR2X1 U17 ( .A(command_rdata[7]), .B(n9), .Y(tx_data[7]) );
  OR2X1 U18 ( .A(command_rdata[6]), .B(n9), .Y(tx_data[6]) );
  OR2X1 U19 ( .A(command_rdata[5]), .B(n9), .Y(tx_data[5]) );
  OR2X1 U20 ( .A(command_rdata[4]), .B(n9), .Y(tx_data[4]) );
  OR2X1 U21 ( .A(command_rdata[3]), .B(n9), .Y(tx_data[3]) );
  OR2X1 U22 ( .A(command_rdata[31]), .B(n9), .Y(tx_data[31]) );
  OR2X1 U23 ( .A(command_rdata[30]), .B(n9), .Y(tx_data[30]) );
  OR2X1 U24 ( .A(command_rdata[2]), .B(n9), .Y(tx_data[2]) );
  OR2X1 U25 ( .A(command_rdata[29]), .B(n9), .Y(tx_data[29]) );
  OR2X1 U26 ( .A(command_rdata[28]), .B(n9), .Y(tx_data[28]) );
  OR2X1 U27 ( .A(command_rdata[27]), .B(n9), .Y(tx_data[27]) );
  OR2X1 U28 ( .A(command_rdata[26]), .B(n9), .Y(tx_data[26]) );
  OR2X1 U29 ( .A(command_rdata[25]), .B(n9), .Y(tx_data[25]) );
  OR2X1 U30 ( .A(command_rdata[24]), .B(n9), .Y(tx_data[24]) );
  OR2X1 U31 ( .A(command_rdata[23]), .B(n9), .Y(tx_data[23]) );
  OR2X1 U32 ( .A(command_rdata[22]), .B(n9), .Y(tx_data[22]) );
  OR2X1 U33 ( .A(command_rdata[21]), .B(n9), .Y(tx_data[21]) );
  OR2X1 U34 ( .A(command_rdata[20]), .B(n9), .Y(tx_data[20]) );
  OR2X1 U35 ( .A(command_rdata[1]), .B(n9), .Y(tx_data[1]) );
  OR2X1 U36 ( .A(command_rdata[19]), .B(n9), .Y(tx_data[19]) );
  OR2X1 U37 ( .A(command_rdata[18]), .B(n9), .Y(tx_data[18]) );
  OR2X1 U38 ( .A(command_rdata[17]), .B(n9), .Y(tx_data[17]) );
  OR2X1 U39 ( .A(command_rdata[16]), .B(n9), .Y(tx_data[16]) );
  OR2X1 U40 ( .A(command_rdata[15]), .B(n9), .Y(tx_data[15]) );
  OR2X1 U41 ( .A(command_rdata[14]), .B(n9), .Y(tx_data[14]) );
  OR2X1 U42 ( .A(command_rdata[13]), .B(n9), .Y(tx_data[13]) );
  OR2X1 U43 ( .A(command_rdata[12]), .B(n9), .Y(tx_data[12]) );
  OR2X1 U44 ( .A(command_rdata[11]), .B(n9), .Y(tx_data[11]) );
  OR2X1 U45 ( .A(command_rdata[10]), .B(n9), .Y(tx_data[10]) );
  OR2X1 U46 ( .A(command_rdata[0]), .B(n9), .Y(tx_data[0]) );
  NAND3X1 U47 ( .A(n11), .B(n12), .C(n13), .Y(n10) );
  OR2X1 U48 ( .A(n14), .B(n15), .Y(slave_wait) );
  OAI21X1 U49 ( .A(n16), .B(n17), .C(n18), .Y(n15) );
  NAND3X1 U50 ( .A(n19), .B(n20), .C(n21), .Y(n14) );
  OAI21X1 U51 ( .A(n22), .B(n23), .C(n24), .Y(n21) );
  NAND3X1 U52 ( .A(n25), .B(n13), .C(n26), .Y(n24) );
  NAND2X1 U53 ( .A(n27), .B(n16), .Y(n23) );
  AND2X1 U54 ( .A(rx_data[9]), .B(sensor_write), .Y(sensor_wdata[9]) );
  AND2X1 U55 ( .A(rx_data[8]), .B(sensor_write), .Y(sensor_wdata[8]) );
  AND2X1 U56 ( .A(rx_data[7]), .B(sensor_write), .Y(sensor_wdata[7]) );
  AND2X1 U57 ( .A(rx_data[6]), .B(sensor_write), .Y(sensor_wdata[6]) );
  AND2X1 U58 ( .A(rx_data[5]), .B(sensor_write), .Y(sensor_wdata[5]) );
  AND2X1 U59 ( .A(rx_data[4]), .B(sensor_write), .Y(sensor_wdata[4]) );
  AND2X1 U60 ( .A(rx_data[3]), .B(sensor_write), .Y(sensor_wdata[3]) );
  AND2X1 U61 ( .A(rx_data[31]), .B(sensor_write), .Y(sensor_wdata[31]) );
  AND2X1 U62 ( .A(rx_data[30]), .B(sensor_write), .Y(sensor_wdata[30]) );
  AND2X1 U63 ( .A(rx_data[2]), .B(sensor_write), .Y(sensor_wdata[2]) );
  AND2X1 U64 ( .A(rx_data[29]), .B(sensor_write), .Y(sensor_wdata[29]) );
  AND2X1 U65 ( .A(rx_data[28]), .B(sensor_write), .Y(sensor_wdata[28]) );
  AND2X1 U66 ( .A(rx_data[27]), .B(sensor_write), .Y(sensor_wdata[27]) );
  AND2X1 U67 ( .A(rx_data[26]), .B(sensor_write), .Y(sensor_wdata[26]) );
  AND2X1 U68 ( .A(rx_data[25]), .B(sensor_write), .Y(sensor_wdata[25]) );
  AND2X1 U69 ( .A(rx_data[24]), .B(sensor_write), .Y(sensor_wdata[24]) );
  AND2X1 U70 ( .A(rx_data[23]), .B(sensor_write), .Y(sensor_wdata[23]) );
  AND2X1 U71 ( .A(rx_data[22]), .B(sensor_write), .Y(sensor_wdata[22]) );
  AND2X1 U72 ( .A(rx_data[21]), .B(sensor_write), .Y(sensor_wdata[21]) );
  AND2X1 U73 ( .A(rx_data[20]), .B(sensor_write), .Y(sensor_wdata[20]) );
  AND2X1 U74 ( .A(rx_data[1]), .B(sensor_write), .Y(sensor_wdata[1]) );
  AND2X1 U75 ( .A(rx_data[19]), .B(sensor_write), .Y(sensor_wdata[19]) );
  AND2X1 U76 ( .A(rx_data[18]), .B(sensor_write), .Y(sensor_wdata[18]) );
  AND2X1 U77 ( .A(rx_data[17]), .B(sensor_write), .Y(sensor_wdata[17]) );
  AND2X1 U78 ( .A(rx_data[16]), .B(sensor_write), .Y(sensor_wdata[16]) );
  AND2X1 U79 ( .A(rx_data[15]), .B(sensor_write), .Y(sensor_wdata[15]) );
  AND2X1 U80 ( .A(rx_data[14]), .B(sensor_write), .Y(sensor_wdata[14]) );
  AND2X1 U81 ( .A(rx_data[13]), .B(sensor_write), .Y(sensor_wdata[13]) );
  AND2X1 U82 ( .A(rx_data[12]), .B(sensor_write), .Y(sensor_wdata[12]) );
  AND2X1 U83 ( .A(rx_data[11]), .B(sensor_write), .Y(sensor_wdata[11]) );
  AND2X1 U84 ( .A(rx_data[10]), .B(sensor_write), .Y(sensor_wdata[10]) );
  AND2X1 U85 ( .A(rx_data[0]), .B(sensor_write), .Y(sensor_wdata[0]) );
  AND2X1 U86 ( .A(sensor_rdata[9]), .B(sensor_read), .Y(sensor_data[9]) );
  AND2X1 U87 ( .A(sensor_rdata[8]), .B(sensor_read), .Y(sensor_data[8]) );
  AND2X1 U88 ( .A(sensor_rdata[7]), .B(sensor_read), .Y(sensor_data[7]) );
  AND2X1 U89 ( .A(sensor_rdata[6]), .B(sensor_read), .Y(sensor_data[6]) );
  AND2X1 U90 ( .A(sensor_rdata[5]), .B(sensor_read), .Y(sensor_data[5]) );
  AND2X1 U91 ( .A(sensor_rdata[4]), .B(sensor_read), .Y(sensor_data[4]) );
  AND2X1 U92 ( .A(sensor_rdata[3]), .B(sensor_read), .Y(sensor_data[3]) );
  AND2X1 U93 ( .A(sensor_rdata[31]), .B(sensor_read), .Y(sensor_data[31]) );
  AND2X1 U94 ( .A(sensor_rdata[30]), .B(sensor_read), .Y(sensor_data[30]) );
  AND2X1 U95 ( .A(sensor_rdata[2]), .B(sensor_read), .Y(sensor_data[2]) );
  AND2X1 U96 ( .A(sensor_rdata[29]), .B(sensor_read), .Y(sensor_data[29]) );
  AND2X1 U97 ( .A(sensor_rdata[28]), .B(sensor_read), .Y(sensor_data[28]) );
  AND2X1 U98 ( .A(sensor_rdata[27]), .B(sensor_read), .Y(sensor_data[27]) );
  AND2X1 U99 ( .A(sensor_rdata[26]), .B(sensor_read), .Y(sensor_data[26]) );
  AND2X1 U100 ( .A(sensor_rdata[25]), .B(sensor_read), .Y(sensor_data[25]) );
  AND2X1 U101 ( .A(sensor_rdata[24]), .B(sensor_read), .Y(sensor_data[24]) );
  AND2X1 U102 ( .A(sensor_rdata[23]), .B(sensor_read), .Y(sensor_data[23]) );
  AND2X1 U103 ( .A(sensor_rdata[22]), .B(sensor_read), .Y(sensor_data[22]) );
  AND2X1 U104 ( .A(sensor_rdata[21]), .B(sensor_read), .Y(sensor_data[21]) );
  AND2X1 U105 ( .A(sensor_rdata[20]), .B(sensor_read), .Y(sensor_data[20]) );
  AND2X1 U106 ( .A(sensor_rdata[1]), .B(sensor_read), .Y(sensor_data[1]) );
  AND2X1 U107 ( .A(sensor_rdata[19]), .B(sensor_read), .Y(sensor_data[19]) );
  AND2X1 U108 ( .A(sensor_rdata[18]), .B(sensor_read), .Y(sensor_data[18]) );
  AND2X1 U109 ( .A(sensor_rdata[17]), .B(sensor_read), .Y(sensor_data[17]) );
  AND2X1 U110 ( .A(sensor_rdata[16]), .B(sensor_read), .Y(sensor_data[16]) );
  AND2X1 U111 ( .A(sensor_rdata[15]), .B(sensor_read), .Y(sensor_data[15]) );
  AND2X1 U112 ( .A(sensor_rdata[14]), .B(sensor_read), .Y(sensor_data[14]) );
  AND2X1 U113 ( .A(sensor_rdata[13]), .B(sensor_read), .Y(sensor_data[13]) );
  AND2X1 U114 ( .A(sensor_rdata[12]), .B(sensor_read), .Y(sensor_data[12]) );
  AND2X1 U115 ( .A(sensor_rdata[11]), .B(sensor_read), .Y(sensor_data[11]) );
  AND2X1 U116 ( .A(sensor_rdata[10]), .B(sensor_read), .Y(sensor_data[10]) );
  AND2X1 U117 ( .A(sensor_rdata[0]), .B(sensor_read), .Y(sensor_data[0]) );
  OR2X1 U118 ( .A(n28), .B(n29), .Y(next_state[3]) );
  MUX2X1 U119 ( .B(n13), .A(n30), .S(n31), .Y(n29) );
  NAND3X1 U120 ( .A(state[1]), .B(n32), .C(command_fifo_empty), .Y(n30) );
  OAI21X1 U121 ( .A(n33), .B(n13), .C(n34), .Y(next_state[2]) );
  AOI21X1 U122 ( .A(write_fifo), .B(n35), .C(n36), .Y(n34) );
  INVX1 U123 ( .A(n37), .Y(n36) );
  INVX1 U124 ( .A(state[2]), .Y(n33) );
  NAND2X1 U125 ( .A(n38), .B(n39), .Y(next_state[1]) );
  INVX1 U126 ( .A(n28), .Y(n39) );
  OAI21X1 U127 ( .A(n31), .B(n40), .C(n26), .Y(n28) );
  NOR2X1 U128 ( .A(sensor_write), .B(command_read), .Y(n26) );
  NAND2X1 U129 ( .A(state[1]), .B(read_fifo), .Y(n40) );
  AOI22X1 U130 ( .A(n41), .B(n35), .C(n42), .D(state[1]), .Y(n38) );
  INVX1 U131 ( .A(n13), .Y(n42) );
  INVX1 U132 ( .A(n25), .Y(n35) );
  NAND3X1 U133 ( .A(n43), .B(n31), .C(n32), .Y(n25) );
  INVX1 U134 ( .A(state[3]), .Y(n31) );
  INVX1 U135 ( .A(state[1]), .Y(n43) );
  NOR2X1 U136 ( .A(write_fifo), .B(n44), .Y(n41) );
  INVX1 U137 ( .A(read_fifo), .Y(n44) );
  OAI21X1 U138 ( .A(n45), .B(n13), .C(n37), .Y(next_state[0]) );
  NAND3X1 U139 ( .A(state[1]), .B(n32), .C(n46), .Y(n37) );
  NOR2X1 U140 ( .A(state[3]), .B(command_fifo_empty), .Y(n46) );
  NAND3X1 U141 ( .A(n47), .B(n12), .C(n11), .Y(n13) );
  INVX1 U142 ( .A(n32), .Y(n11) );
  NOR2X1 U143 ( .A(state[0]), .B(state[2]), .Y(n32) );
  NAND3X1 U144 ( .A(state[2]), .B(n45), .C(n48), .Y(n12) );
  INVX1 U145 ( .A(state[0]), .Y(n45) );
  OAI21X1 U146 ( .A(n49), .B(n50), .C(n20), .Y(next[3]) );
  OAI21X1 U147 ( .A(n16), .B(n17), .C(n51), .Y(next[2]) );
  AOI22X1 U148 ( .A(n22), .B(current[2]), .C(n52), .D(n53), .Y(n51) );
  INVX1 U149 ( .A(command_fifo_full), .Y(n53) );
  INVX1 U150 ( .A(sensor_fifo_empty), .Y(n17) );
  OR2X1 U151 ( .A(n54), .B(n55), .Y(next[1]) );
  OAI22X1 U152 ( .A(command_fifo_full), .B(n27), .C(n56), .D(n50), .Y(n55) );
  OAI21X1 U153 ( .A(n57), .B(n58), .C(n16), .Y(n54) );
  NAND3X1 U154 ( .A(n16), .B(n20), .C(n59), .Y(next[0]) );
  AOI22X1 U155 ( .A(renable), .B(n60), .C(n22), .D(current[0]), .Y(n59) );
  INVX1 U156 ( .A(n50), .Y(n22) );
  NAND3X1 U157 ( .A(n57), .B(n27), .C(n18), .Y(n50) );
  INVX1 U158 ( .A(n61), .Y(n57) );
  OAI21X1 U159 ( .A(current[1]), .B(n62), .C(n19), .Y(n61) );
  NAND3X1 U160 ( .A(current[1]), .B(n49), .C(current[0]), .Y(n19) );
  INVX1 U161 ( .A(current[3]), .Y(n49) );
  OAI21X1 U162 ( .A(n62), .B(n63), .C(n18), .Y(n60) );
  INVX1 U163 ( .A(n64), .Y(n18) );
  OAI21X1 U164 ( .A(n65), .B(n66), .C(n67), .Y(n64) );
  NAND2X1 U165 ( .A(current[3]), .B(current[0]), .Y(n66) );
  OR2X1 U166 ( .A(current[1]), .B(current[2]), .Y(n65) );
  NAND2X1 U167 ( .A(n56), .B(n58), .Y(n63) );
  INVX1 U168 ( .A(wenable), .Y(n58) );
  INVX1 U169 ( .A(n68), .Y(n62) );
  NAND2X1 U170 ( .A(command_fifo_full), .B(n52), .Y(n20) );
  INVX1 U171 ( .A(n27), .Y(n52) );
  NAND3X1 U172 ( .A(n68), .B(n69), .C(current[1]), .Y(n27) );
  INVX1 U173 ( .A(current[0]), .Y(n69) );
  NAND3X1 U174 ( .A(n68), .B(n56), .C(current[0]), .Y(n16) );
  INVX1 U175 ( .A(current[1]), .Y(n56) );
  NAND3X1 U176 ( .A(current[1]), .B(n68), .C(current[0]), .Y(n70) );
  NOR2X1 U177 ( .A(current[3]), .B(current[2]), .Y(n68) );
  AND2X1 U178 ( .A(command_data[9]), .B(command_write), .Y(command_wdata[9])
         );
  AND2X1 U179 ( .A(command_data[8]), .B(command_write), .Y(command_wdata[8])
         );
  AND2X1 U180 ( .A(command_data[7]), .B(command_write), .Y(command_wdata[7])
         );
  AND2X1 U181 ( .A(command_data[6]), .B(command_write), .Y(command_wdata[6])
         );
  AND2X1 U182 ( .A(command_data[5]), .B(command_write), .Y(command_wdata[5])
         );
  AND2X1 U183 ( .A(command_data[4]), .B(command_write), .Y(command_wdata[4])
         );
  AND2X1 U184 ( .A(command_data[3]), .B(command_write), .Y(command_wdata[3])
         );
  AND2X1 U185 ( .A(address[15]), .B(command_write), .Y(command_wdata[31]) );
  AND2X1 U186 ( .A(address[14]), .B(command_write), .Y(command_wdata[30]) );
  AND2X1 U187 ( .A(command_data[2]), .B(command_write), .Y(command_wdata[2])
         );
  AND2X1 U188 ( .A(address[13]), .B(command_write), .Y(command_wdata[29]) );
  AND2X1 U189 ( .A(address[12]), .B(command_write), .Y(command_wdata[28]) );
  AND2X1 U190 ( .A(address[11]), .B(command_write), .Y(command_wdata[27]) );
  AND2X1 U191 ( .A(address[10]), .B(command_write), .Y(command_wdata[26]) );
  AND2X1 U192 ( .A(address[9]), .B(command_write), .Y(command_wdata[25]) );
  AND2X1 U193 ( .A(address[8]), .B(command_write), .Y(command_wdata[24]) );
  AND2X1 U194 ( .A(address[7]), .B(command_write), .Y(command_wdata[23]) );
  AND2X1 U195 ( .A(address[6]), .B(command_write), .Y(command_wdata[22]) );
  AND2X1 U196 ( .A(address[5]), .B(command_write), .Y(command_wdata[21]) );
  AND2X1 U197 ( .A(address[4]), .B(command_write), .Y(command_wdata[20]) );
  AND2X1 U198 ( .A(command_data[1]), .B(command_write), .Y(command_wdata[1])
         );
  AND2X1 U199 ( .A(address[3]), .B(command_write), .Y(command_wdata[19]) );
  AND2X1 U200 ( .A(address[2]), .B(command_write), .Y(command_wdata[18]) );
  AND2X1 U201 ( .A(address[1]), .B(command_write), .Y(command_wdata[17]) );
  AND2X1 U202 ( .A(address[0]), .B(command_write), .Y(command_wdata[16]) );
  AND2X1 U203 ( .A(command_data[15]), .B(command_write), .Y(command_wdata[15])
         );
  AND2X1 U204 ( .A(command_data[14]), .B(command_write), .Y(command_wdata[14])
         );
  AND2X1 U205 ( .A(command_data[13]), .B(command_write), .Y(command_wdata[13])
         );
  AND2X1 U206 ( .A(command_data[12]), .B(command_write), .Y(command_wdata[12])
         );
  AND2X1 U207 ( .A(command_data[11]), .B(command_write), .Y(command_wdata[11])
         );
  AND2X1 U208 ( .A(command_data[10]), .B(command_write), .Y(command_wdata[10])
         );
  AND2X1 U209 ( .A(command_data[0]), .B(command_write), .Y(command_wdata[0])
         );
  NAND3X1 U210 ( .A(current[2]), .B(current[1]), .C(n71), .Y(n67) );
  NOR2X1 U211 ( .A(current[3]), .B(current[0]), .Y(n71) );
  INVX1 U212 ( .A(n47), .Y(command_read) );
  NAND3X1 U213 ( .A(state[0]), .B(state[2]), .C(n48), .Y(n47) );
  NOR2X1 U214 ( .A(state[3]), .B(state[1]), .Y(n48) );
endmodule


module flex_counter_NUM_CNT_BITS4_5 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   temp_rollover_flag, n1, n2, n3, n4, n5, n6, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37;
  wire   [3:0] temp_count_out;

  DFFSR \count_out_reg[0]  ( .D(temp_count_out[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(temp_count_out[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[1]) );
  DFFSR \count_out_reg[3]  ( .D(temp_count_out[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(temp_count_out[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[2]) );
  DFFSR rollover_flag_reg ( .D(temp_rollover_flag), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(rollover_flag) );
  NOR2X1 U8 ( .A(n1), .B(n2), .Y(temp_rollover_flag) );
  NAND2X1 U9 ( .A(n3), .B(n4), .Y(n2) );
  XNOR2X1 U10 ( .A(rollover_val[1]), .B(temp_count_out[1]), .Y(n4) );
  XNOR2X1 U11 ( .A(rollover_val[2]), .B(temp_count_out[2]), .Y(n3) );
  NAND3X1 U12 ( .A(n5), .B(n6), .C(n12), .Y(n1) );
  XNOR2X1 U13 ( .A(rollover_val[0]), .B(temp_count_out[0]), .Y(n12) );
  XNOR2X1 U14 ( .A(rollover_val[3]), .B(temp_count_out[3]), .Y(n5) );
  OAI22X1 U15 ( .A(n13), .B(n14), .C(n15), .D(n16), .Y(temp_count_out[3]) );
  OAI22X1 U16 ( .A(n17), .B(n14), .C(n15), .D(n18), .Y(temp_count_out[2]) );
  OAI22X1 U17 ( .A(n19), .B(n14), .C(n15), .D(n20), .Y(temp_count_out[1]) );
  NAND3X1 U18 ( .A(n21), .B(n6), .C(count_enable), .Y(n14) );
  INVX1 U19 ( .A(n22), .Y(n21) );
  OAI22X1 U20 ( .A(n15), .B(n23), .C(n24), .D(n25), .Y(temp_count_out[0]) );
  OAI21X1 U21 ( .A(n23), .B(n22), .C(n6), .Y(n25) );
  OAI22X1 U22 ( .A(n26), .B(n27), .C(rollover_val[3]), .D(n13), .Y(n22) );
  OAI21X1 U23 ( .A(n28), .B(n29), .C(n30), .Y(n27) );
  OAI21X1 U24 ( .A(n17), .B(n31), .C(rollover_val[2]), .Y(n30) );
  INVX1 U25 ( .A(n17), .Y(n29) );
  XOR2X1 U26 ( .A(n32), .B(count_out[2]), .Y(n17) );
  INVX1 U27 ( .A(n31), .Y(n28) );
  OAI21X1 U28 ( .A(n33), .B(n34), .C(n35), .Y(n31) );
  OAI21X1 U29 ( .A(n19), .B(n36), .C(rollover_val[1]), .Y(n35) );
  INVX1 U30 ( .A(n33), .Y(n36) );
  INVX1 U31 ( .A(n34), .Y(n19) );
  XNOR2X1 U32 ( .A(n20), .B(count_out[0]), .Y(n34) );
  INVX1 U33 ( .A(count_out[1]), .Y(n20) );
  NOR2X1 U34 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n33) );
  AND2X1 U35 ( .A(n13), .B(rollover_val[3]), .Y(n26) );
  XOR2X1 U36 ( .A(n16), .B(n37), .Y(n13) );
  NOR2X1 U37 ( .A(n32), .B(n18), .Y(n37) );
  INVX1 U38 ( .A(count_out[2]), .Y(n18) );
  NAND2X1 U39 ( .A(count_out[1]), .B(count_out[0]), .Y(n32) );
  INVX1 U40 ( .A(count_out[3]), .Y(n16) );
  INVX1 U41 ( .A(count_out[0]), .Y(n23) );
  NAND2X1 U42 ( .A(n6), .B(n24), .Y(n15) );
  INVX1 U43 ( .A(count_enable), .Y(n24) );
  INVX1 U44 ( .A(clear), .Y(n6) );
endmodule


module flex_counter_NUM_CNT_BITS4_4 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   temp_rollover_flag, n1, n2, n3, n4, n5, n6, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37;
  wire   [3:0] temp_count_out;

  DFFSR \count_out_reg[0]  ( .D(temp_count_out[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(temp_count_out[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[1]) );
  DFFSR \count_out_reg[3]  ( .D(temp_count_out[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(temp_count_out[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[2]) );
  DFFSR rollover_flag_reg ( .D(temp_rollover_flag), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(rollover_flag) );
  NOR2X1 U8 ( .A(n1), .B(n2), .Y(temp_rollover_flag) );
  NAND2X1 U9 ( .A(n3), .B(n4), .Y(n2) );
  XNOR2X1 U10 ( .A(rollover_val[1]), .B(temp_count_out[1]), .Y(n4) );
  XNOR2X1 U11 ( .A(rollover_val[2]), .B(temp_count_out[2]), .Y(n3) );
  NAND3X1 U12 ( .A(n5), .B(n6), .C(n12), .Y(n1) );
  XNOR2X1 U13 ( .A(rollover_val[0]), .B(temp_count_out[0]), .Y(n12) );
  XNOR2X1 U14 ( .A(rollover_val[3]), .B(temp_count_out[3]), .Y(n5) );
  OAI22X1 U15 ( .A(n13), .B(n14), .C(n15), .D(n16), .Y(temp_count_out[3]) );
  OAI22X1 U16 ( .A(n17), .B(n14), .C(n15), .D(n18), .Y(temp_count_out[2]) );
  OAI22X1 U17 ( .A(n19), .B(n14), .C(n15), .D(n20), .Y(temp_count_out[1]) );
  NAND3X1 U18 ( .A(n21), .B(n6), .C(count_enable), .Y(n14) );
  INVX1 U19 ( .A(n22), .Y(n21) );
  OAI22X1 U20 ( .A(n15), .B(n23), .C(n24), .D(n25), .Y(temp_count_out[0]) );
  OAI21X1 U21 ( .A(n23), .B(n22), .C(n6), .Y(n25) );
  OAI22X1 U22 ( .A(n26), .B(n27), .C(rollover_val[3]), .D(n13), .Y(n22) );
  OAI21X1 U23 ( .A(n28), .B(n29), .C(n30), .Y(n27) );
  OAI21X1 U24 ( .A(n17), .B(n31), .C(rollover_val[2]), .Y(n30) );
  INVX1 U25 ( .A(n17), .Y(n29) );
  XOR2X1 U26 ( .A(n32), .B(count_out[2]), .Y(n17) );
  INVX1 U27 ( .A(n31), .Y(n28) );
  OAI21X1 U28 ( .A(n33), .B(n34), .C(n35), .Y(n31) );
  OAI21X1 U29 ( .A(n19), .B(n36), .C(rollover_val[1]), .Y(n35) );
  INVX1 U30 ( .A(n33), .Y(n36) );
  INVX1 U31 ( .A(n34), .Y(n19) );
  XNOR2X1 U32 ( .A(n20), .B(count_out[0]), .Y(n34) );
  INVX1 U33 ( .A(count_out[1]), .Y(n20) );
  NOR2X1 U34 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n33) );
  AND2X1 U35 ( .A(n13), .B(rollover_val[3]), .Y(n26) );
  XOR2X1 U36 ( .A(n16), .B(n37), .Y(n13) );
  NOR2X1 U37 ( .A(n32), .B(n18), .Y(n37) );
  INVX1 U38 ( .A(count_out[2]), .Y(n18) );
  NAND2X1 U39 ( .A(count_out[1]), .B(count_out[0]), .Y(n32) );
  INVX1 U40 ( .A(count_out[3]), .Y(n16) );
  INVX1 U41 ( .A(count_out[0]), .Y(n23) );
  NAND2X1 U42 ( .A(n6), .B(n24), .Y(n15) );
  INVX1 U43 ( .A(count_enable), .Y(n24) );
  INVX1 U44 ( .A(clear), .Y(n6) );
endmodule


module Sensor_FIFO_storage ( write_clk, read_clk, n_rst, write_command, 
        read_command, write_data, fifo_full, fifo_empty, read_data );
  input [31:0] write_data;
  output [31:0] read_data;
  input write_clk, read_clk, n_rst, write_command, read_command;
  output fifo_full, fifo_empty;
  wire   N19, N20, N21, read_enable, \read_pointer[3] , _1_net_, write_enable,
         _3_net_, \data[7][31] , \data[7][30] , \data[7][29] , \data[7][28] ,
         \data[7][27] , \data[7][26] , \data[7][25] , \data[7][24] ,
         \data[7][23] , \data[7][22] , \data[7][21] , \data[7][20] ,
         \data[7][19] , \data[7][18] , \data[7][17] , \data[7][16] ,
         \data[7][15] , \data[7][14] , \data[7][13] , \data[7][12] ,
         \data[7][11] , \data[7][10] , \data[7][9] , \data[7][8] ,
         \data[7][7] , \data[7][6] , \data[7][5] , \data[7][4] , \data[7][3] ,
         \data[7][2] , \data[7][1] , \data[7][0] , \data[6][31] ,
         \data[6][30] , \data[6][29] , \data[6][28] , \data[6][27] ,
         \data[6][26] , \data[6][25] , \data[6][24] , \data[6][23] ,
         \data[6][22] , \data[6][21] , \data[6][20] , \data[6][19] ,
         \data[6][18] , \data[6][17] , \data[6][16] , \data[6][15] ,
         \data[6][14] , \data[6][13] , \data[6][12] , \data[6][11] ,
         \data[6][10] , \data[6][9] , \data[6][8] , \data[6][7] , \data[6][6] ,
         \data[6][5] , \data[6][4] , \data[6][3] , \data[6][2] , \data[6][1] ,
         \data[6][0] , \data[5][31] , \data[5][30] , \data[5][29] ,
         \data[5][28] , \data[5][27] , \data[5][26] , \data[5][25] ,
         \data[5][24] , \data[5][23] , \data[5][22] , \data[5][21] ,
         \data[5][20] , \data[5][19] , \data[5][18] , \data[5][17] ,
         \data[5][16] , \data[5][15] , \data[5][14] , \data[5][13] ,
         \data[5][12] , \data[5][11] , \data[5][10] , \data[5][9] ,
         \data[5][8] , \data[5][7] , \data[5][6] , \data[5][5] , \data[5][4] ,
         \data[5][3] , \data[5][2] , \data[5][1] , \data[5][0] , \data[4][31] ,
         \data[4][30] , \data[4][29] , \data[4][28] , \data[4][27] ,
         \data[4][26] , \data[4][25] , \data[4][24] , \data[4][23] ,
         \data[4][22] , \data[4][21] , \data[4][20] , \data[4][19] ,
         \data[4][18] , \data[4][17] , \data[4][16] , \data[4][15] ,
         \data[4][14] , \data[4][13] , \data[4][12] , \data[4][11] ,
         \data[4][10] , \data[4][9] , \data[4][8] , \data[4][7] , \data[4][6] ,
         \data[4][5] , \data[4][4] , \data[4][3] , \data[4][2] , \data[4][1] ,
         \data[4][0] , \data[3][31] , \data[3][30] , \data[3][29] ,
         \data[3][28] , \data[3][27] , \data[3][26] , \data[3][25] ,
         \data[3][24] , \data[3][23] , \data[3][22] , \data[3][21] ,
         \data[3][20] , \data[3][19] , \data[3][18] , \data[3][17] ,
         \data[3][16] , \data[3][15] , \data[3][14] , \data[3][13] ,
         \data[3][12] , \data[3][11] , \data[3][10] , \data[3][9] ,
         \data[3][8] , \data[3][7] , \data[3][6] , \data[3][5] , \data[3][4] ,
         \data[3][3] , \data[3][2] , \data[3][1] , \data[3][0] , \data[2][31] ,
         \data[2][30] , \data[2][29] , \data[2][28] , \data[2][27] ,
         \data[2][26] , \data[2][25] , \data[2][24] , \data[2][23] ,
         \data[2][22] , \data[2][21] , \data[2][20] , \data[2][19] ,
         \data[2][18] , \data[2][17] , \data[2][16] , \data[2][15] ,
         \data[2][14] , \data[2][13] , \data[2][12] , \data[2][11] ,
         \data[2][10] , \data[2][9] , \data[2][8] , \data[2][7] , \data[2][6] ,
         \data[2][5] , \data[2][4] , \data[2][3] , \data[2][2] , \data[2][1] ,
         \data[2][0] , \data[1][31] , \data[1][30] , \data[1][29] ,
         \data[1][28] , \data[1][27] , \data[1][26] , \data[1][25] ,
         \data[1][24] , \data[1][23] , \data[1][22] , \data[1][21] ,
         \data[1][20] , \data[1][19] , \data[1][18] , \data[1][17] ,
         \data[1][16] , \data[1][15] , \data[1][14] , \data[1][13] ,
         \data[1][12] , \data[1][11] , \data[1][10] , \data[1][9] ,
         \data[1][8] , \data[1][7] , \data[1][6] , \data[1][5] , \data[1][4] ,
         \data[1][3] , \data[1][2] , \data[1][1] , \data[1][0] , \data[0][31] ,
         \data[0][30] , \data[0][29] , \data[0][28] , \data[0][27] ,
         \data[0][26] , \data[0][25] , \data[0][24] , \data[0][23] ,
         \data[0][22] , \data[0][21] , \data[0][20] , \data[0][19] ,
         \data[0][18] , \data[0][17] , \data[0][16] , \data[0][15] ,
         \data[0][14] , \data[0][13] , \data[0][12] , \data[0][11] ,
         \data[0][10] , \data[0][9] , \data[0][8] , \data[0][7] , \data[0][6] ,
         \data[0][5] , \data[0][4] , \data[0][3] , \data[0][2] , \data[0][1] ,
         \data[0][0] , N92, N94, N95, N96, N97, N98, N99, N100, N101, N102,
         N103, N104, N105, N106, N107, N108, N109, N110, N111, N112, N113,
         N114, N115, N116, N117, N118, N119, N120, N121, N122, N123, N124,
         N125, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444,
         n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, n455,
         n456, n457, n458, n459, n460, n461, n462, n463, n464, n465, n466,
         n467, n468, n469, n470, n471, n472, n473, n474, n475, n476, n477,
         n478, n479, n480, n481, n482, n483, n484, n485, n486, n487, n488,
         n489, n490, n491, n492, n493, n494, n495, n496, n497, n498, n499,
         n500, n501, n502, n503, n504, n505, n506, n507, n508, n509, n510,
         n511, n512, n513, n514, n515, n516, n517, n518, n519, n520, n521,
         n522, n523, n524, n525, n526, n527, n528, n529, n530, n531, n532,
         n533, n534, n535, n536, n537, n538, n539, n540, n541, n542, n543,
         n544, n545, n546, n547, n548, n549, n550, n551, n552, n553, n554,
         n555, n556, n557, n558, n559, n560, n561, n562, n563, n564, n565,
         n566, n567, n568, n569, n570, n571, n572, n573, n574, n575, n576,
         n577, n578, n579, n580, n581, n582, n583, n584, n585, n586, n587,
         n588, n589, n590, n591, n592, n593, n594, n595, n596, n597, n598,
         n599, n600, n601, n602, n603, n604, n605, n606, n607, n608, n609,
         n610, n611, n612, n613, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305,
         n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n614, n615, n616,
         n617, n618, n619, n620, n621, n622, n623, n624, n625, n626, n627,
         n628, n629, n630, n631, n632, n633, n634, n635, n636, n637, n638,
         n639, n640, n641, n642, n643, n644, n645, n646, n647, n648, n649,
         n650, n651, n652, n653, n654, n655, n656, n657, n658, n659, n660,
         n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, n671,
         n672, n673, n674, n675, n676, n677, n678, n679, n680, n681, n682,
         n683, n684, n685, n686, n687, n688, n689, n690, n691, n692, n693,
         n694, n695, n696, n697, n698, n699, n700, n701, n702, n703, n704,
         n705, n706, n707, n708, n709, n710, n711, n712, n713, n714, n715,
         n716, n717, n718, n719, n720, n721, n722, n723, n724, n725, n726,
         n727, n728, n729, n730, n731, n732, n733, n734, n735, n736, n737,
         n738, n739, n740, n741, n742, n743, n744, n745, n746, n747, n748,
         n749, n750, n751, n752, n753, n754, n755, n756, n757, n758, n759,
         n760, n761, n762, n763, n764, n765, n766, n767, n768, n769, n770,
         n771, n772, n773, n774, n775, n776, n777, n778, n779, n780, n781,
         n782;
  wire   [3:0] write_pointer;
  assign fifo_full = N92;

  DFFPOSX1 \data_reg[7][31]  ( .D(n613), .CLK(write_clk), .Q(\data[7][31] ) );
  DFFPOSX1 \data_reg[7][30]  ( .D(n612), .CLK(write_clk), .Q(\data[7][30] ) );
  DFFPOSX1 \data_reg[7][29]  ( .D(n611), .CLK(write_clk), .Q(\data[7][29] ) );
  DFFPOSX1 \data_reg[7][28]  ( .D(n610), .CLK(write_clk), .Q(\data[7][28] ) );
  DFFPOSX1 \data_reg[7][27]  ( .D(n609), .CLK(write_clk), .Q(\data[7][27] ) );
  DFFPOSX1 \data_reg[7][26]  ( .D(n608), .CLK(write_clk), .Q(\data[7][26] ) );
  DFFPOSX1 \data_reg[7][25]  ( .D(n607), .CLK(write_clk), .Q(\data[7][25] ) );
  DFFPOSX1 \data_reg[7][24]  ( .D(n606), .CLK(write_clk), .Q(\data[7][24] ) );
  DFFPOSX1 \data_reg[7][23]  ( .D(n605), .CLK(write_clk), .Q(\data[7][23] ) );
  DFFPOSX1 \data_reg[7][22]  ( .D(n604), .CLK(write_clk), .Q(\data[7][22] ) );
  DFFPOSX1 \data_reg[7][21]  ( .D(n603), .CLK(write_clk), .Q(\data[7][21] ) );
  DFFPOSX1 \data_reg[7][20]  ( .D(n602), .CLK(write_clk), .Q(\data[7][20] ) );
  DFFPOSX1 \data_reg[7][19]  ( .D(n601), .CLK(write_clk), .Q(\data[7][19] ) );
  DFFPOSX1 \data_reg[7][18]  ( .D(n600), .CLK(write_clk), .Q(\data[7][18] ) );
  DFFPOSX1 \data_reg[7][17]  ( .D(n599), .CLK(write_clk), .Q(\data[7][17] ) );
  DFFPOSX1 \data_reg[7][16]  ( .D(n598), .CLK(write_clk), .Q(\data[7][16] ) );
  DFFPOSX1 \data_reg[7][15]  ( .D(n597), .CLK(write_clk), .Q(\data[7][15] ) );
  DFFPOSX1 \data_reg[7][14]  ( .D(n596), .CLK(write_clk), .Q(\data[7][14] ) );
  DFFPOSX1 \data_reg[7][13]  ( .D(n595), .CLK(write_clk), .Q(\data[7][13] ) );
  DFFPOSX1 \data_reg[7][12]  ( .D(n594), .CLK(write_clk), .Q(\data[7][12] ) );
  DFFPOSX1 \data_reg[7][11]  ( .D(n593), .CLK(write_clk), .Q(\data[7][11] ) );
  DFFPOSX1 \data_reg[7][10]  ( .D(n592), .CLK(write_clk), .Q(\data[7][10] ) );
  DFFPOSX1 \data_reg[7][9]  ( .D(n591), .CLK(write_clk), .Q(\data[7][9] ) );
  DFFPOSX1 \data_reg[7][8]  ( .D(n590), .CLK(write_clk), .Q(\data[7][8] ) );
  DFFPOSX1 \data_reg[7][7]  ( .D(n589), .CLK(write_clk), .Q(\data[7][7] ) );
  DFFPOSX1 \data_reg[7][6]  ( .D(n588), .CLK(write_clk), .Q(\data[7][6] ) );
  DFFPOSX1 \data_reg[7][5]  ( .D(n587), .CLK(write_clk), .Q(\data[7][5] ) );
  DFFPOSX1 \data_reg[7][4]  ( .D(n586), .CLK(write_clk), .Q(\data[7][4] ) );
  DFFPOSX1 \data_reg[7][3]  ( .D(n585), .CLK(write_clk), .Q(\data[7][3] ) );
  DFFPOSX1 \data_reg[7][2]  ( .D(n584), .CLK(write_clk), .Q(\data[7][2] ) );
  DFFPOSX1 \data_reg[7][1]  ( .D(n583), .CLK(write_clk), .Q(\data[7][1] ) );
  DFFPOSX1 \data_reg[7][0]  ( .D(n582), .CLK(write_clk), .Q(\data[7][0] ) );
  DFFPOSX1 \data_reg[6][31]  ( .D(n581), .CLK(write_clk), .Q(\data[6][31] ) );
  DFFPOSX1 \data_reg[6][30]  ( .D(n580), .CLK(write_clk), .Q(\data[6][30] ) );
  DFFPOSX1 \data_reg[6][29]  ( .D(n579), .CLK(write_clk), .Q(\data[6][29] ) );
  DFFPOSX1 \data_reg[6][28]  ( .D(n578), .CLK(write_clk), .Q(\data[6][28] ) );
  DFFPOSX1 \data_reg[6][27]  ( .D(n577), .CLK(write_clk), .Q(\data[6][27] ) );
  DFFPOSX1 \data_reg[6][26]  ( .D(n576), .CLK(write_clk), .Q(\data[6][26] ) );
  DFFPOSX1 \data_reg[6][25]  ( .D(n575), .CLK(write_clk), .Q(\data[6][25] ) );
  DFFPOSX1 \data_reg[6][24]  ( .D(n574), .CLK(write_clk), .Q(\data[6][24] ) );
  DFFPOSX1 \data_reg[6][23]  ( .D(n573), .CLK(write_clk), .Q(\data[6][23] ) );
  DFFPOSX1 \data_reg[6][22]  ( .D(n572), .CLK(write_clk), .Q(\data[6][22] ) );
  DFFPOSX1 \data_reg[6][21]  ( .D(n571), .CLK(write_clk), .Q(\data[6][21] ) );
  DFFPOSX1 \data_reg[6][20]  ( .D(n570), .CLK(write_clk), .Q(\data[6][20] ) );
  DFFPOSX1 \data_reg[6][19]  ( .D(n569), .CLK(write_clk), .Q(\data[6][19] ) );
  DFFPOSX1 \data_reg[6][18]  ( .D(n568), .CLK(write_clk), .Q(\data[6][18] ) );
  DFFPOSX1 \data_reg[6][17]  ( .D(n567), .CLK(write_clk), .Q(\data[6][17] ) );
  DFFPOSX1 \data_reg[6][16]  ( .D(n566), .CLK(write_clk), .Q(\data[6][16] ) );
  DFFPOSX1 \data_reg[6][15]  ( .D(n565), .CLK(write_clk), .Q(\data[6][15] ) );
  DFFPOSX1 \data_reg[6][14]  ( .D(n564), .CLK(write_clk), .Q(\data[6][14] ) );
  DFFPOSX1 \data_reg[6][13]  ( .D(n563), .CLK(write_clk), .Q(\data[6][13] ) );
  DFFPOSX1 \data_reg[6][12]  ( .D(n562), .CLK(write_clk), .Q(\data[6][12] ) );
  DFFPOSX1 \data_reg[6][11]  ( .D(n561), .CLK(write_clk), .Q(\data[6][11] ) );
  DFFPOSX1 \data_reg[6][10]  ( .D(n560), .CLK(write_clk), .Q(\data[6][10] ) );
  DFFPOSX1 \data_reg[6][9]  ( .D(n559), .CLK(write_clk), .Q(\data[6][9] ) );
  DFFPOSX1 \data_reg[6][8]  ( .D(n558), .CLK(write_clk), .Q(\data[6][8] ) );
  DFFPOSX1 \data_reg[6][7]  ( .D(n557), .CLK(write_clk), .Q(\data[6][7] ) );
  DFFPOSX1 \data_reg[6][6]  ( .D(n556), .CLK(write_clk), .Q(\data[6][6] ) );
  DFFPOSX1 \data_reg[6][5]  ( .D(n555), .CLK(write_clk), .Q(\data[6][5] ) );
  DFFPOSX1 \data_reg[6][4]  ( .D(n554), .CLK(write_clk), .Q(\data[6][4] ) );
  DFFPOSX1 \data_reg[6][3]  ( .D(n553), .CLK(write_clk), .Q(\data[6][3] ) );
  DFFPOSX1 \data_reg[6][2]  ( .D(n552), .CLK(write_clk), .Q(\data[6][2] ) );
  DFFPOSX1 \data_reg[6][1]  ( .D(n551), .CLK(write_clk), .Q(\data[6][1] ) );
  DFFPOSX1 \data_reg[6][0]  ( .D(n550), .CLK(write_clk), .Q(\data[6][0] ) );
  DFFPOSX1 \data_reg[5][31]  ( .D(n549), .CLK(write_clk), .Q(\data[5][31] ) );
  DFFPOSX1 \data_reg[5][30]  ( .D(n548), .CLK(write_clk), .Q(\data[5][30] ) );
  DFFPOSX1 \data_reg[5][29]  ( .D(n547), .CLK(write_clk), .Q(\data[5][29] ) );
  DFFPOSX1 \data_reg[5][28]  ( .D(n546), .CLK(write_clk), .Q(\data[5][28] ) );
  DFFPOSX1 \data_reg[5][27]  ( .D(n545), .CLK(write_clk), .Q(\data[5][27] ) );
  DFFPOSX1 \data_reg[5][26]  ( .D(n544), .CLK(write_clk), .Q(\data[5][26] ) );
  DFFPOSX1 \data_reg[5][25]  ( .D(n543), .CLK(write_clk), .Q(\data[5][25] ) );
  DFFPOSX1 \data_reg[5][24]  ( .D(n542), .CLK(write_clk), .Q(\data[5][24] ) );
  DFFPOSX1 \data_reg[5][23]  ( .D(n541), .CLK(write_clk), .Q(\data[5][23] ) );
  DFFPOSX1 \data_reg[5][22]  ( .D(n540), .CLK(write_clk), .Q(\data[5][22] ) );
  DFFPOSX1 \data_reg[5][21]  ( .D(n539), .CLK(write_clk), .Q(\data[5][21] ) );
  DFFPOSX1 \data_reg[5][20]  ( .D(n538), .CLK(write_clk), .Q(\data[5][20] ) );
  DFFPOSX1 \data_reg[5][19]  ( .D(n537), .CLK(write_clk), .Q(\data[5][19] ) );
  DFFPOSX1 \data_reg[5][18]  ( .D(n536), .CLK(write_clk), .Q(\data[5][18] ) );
  DFFPOSX1 \data_reg[5][17]  ( .D(n535), .CLK(write_clk), .Q(\data[5][17] ) );
  DFFPOSX1 \data_reg[5][16]  ( .D(n534), .CLK(write_clk), .Q(\data[5][16] ) );
  DFFPOSX1 \data_reg[5][15]  ( .D(n533), .CLK(write_clk), .Q(\data[5][15] ) );
  DFFPOSX1 \data_reg[5][14]  ( .D(n532), .CLK(write_clk), .Q(\data[5][14] ) );
  DFFPOSX1 \data_reg[5][13]  ( .D(n531), .CLK(write_clk), .Q(\data[5][13] ) );
  DFFPOSX1 \data_reg[5][12]  ( .D(n530), .CLK(write_clk), .Q(\data[5][12] ) );
  DFFPOSX1 \data_reg[5][11]  ( .D(n529), .CLK(write_clk), .Q(\data[5][11] ) );
  DFFPOSX1 \data_reg[5][10]  ( .D(n528), .CLK(write_clk), .Q(\data[5][10] ) );
  DFFPOSX1 \data_reg[5][9]  ( .D(n527), .CLK(write_clk), .Q(\data[5][9] ) );
  DFFPOSX1 \data_reg[5][8]  ( .D(n526), .CLK(write_clk), .Q(\data[5][8] ) );
  DFFPOSX1 \data_reg[5][7]  ( .D(n525), .CLK(write_clk), .Q(\data[5][7] ) );
  DFFPOSX1 \data_reg[5][6]  ( .D(n524), .CLK(write_clk), .Q(\data[5][6] ) );
  DFFPOSX1 \data_reg[5][5]  ( .D(n523), .CLK(write_clk), .Q(\data[5][5] ) );
  DFFPOSX1 \data_reg[5][4]  ( .D(n522), .CLK(write_clk), .Q(\data[5][4] ) );
  DFFPOSX1 \data_reg[5][3]  ( .D(n521), .CLK(write_clk), .Q(\data[5][3] ) );
  DFFPOSX1 \data_reg[5][2]  ( .D(n520), .CLK(write_clk), .Q(\data[5][2] ) );
  DFFPOSX1 \data_reg[5][1]  ( .D(n519), .CLK(write_clk), .Q(\data[5][1] ) );
  DFFPOSX1 \data_reg[5][0]  ( .D(n518), .CLK(write_clk), .Q(\data[5][0] ) );
  DFFPOSX1 \data_reg[4][31]  ( .D(n517), .CLK(write_clk), .Q(\data[4][31] ) );
  DFFPOSX1 \data_reg[4][30]  ( .D(n516), .CLK(write_clk), .Q(\data[4][30] ) );
  DFFPOSX1 \data_reg[4][29]  ( .D(n515), .CLK(write_clk), .Q(\data[4][29] ) );
  DFFPOSX1 \data_reg[4][28]  ( .D(n514), .CLK(write_clk), .Q(\data[4][28] ) );
  DFFPOSX1 \data_reg[4][27]  ( .D(n513), .CLK(write_clk), .Q(\data[4][27] ) );
  DFFPOSX1 \data_reg[4][26]  ( .D(n512), .CLK(write_clk), .Q(\data[4][26] ) );
  DFFPOSX1 \data_reg[4][25]  ( .D(n511), .CLK(write_clk), .Q(\data[4][25] ) );
  DFFPOSX1 \data_reg[4][24]  ( .D(n510), .CLK(write_clk), .Q(\data[4][24] ) );
  DFFPOSX1 \data_reg[4][23]  ( .D(n509), .CLK(write_clk), .Q(\data[4][23] ) );
  DFFPOSX1 \data_reg[4][22]  ( .D(n508), .CLK(write_clk), .Q(\data[4][22] ) );
  DFFPOSX1 \data_reg[4][21]  ( .D(n507), .CLK(write_clk), .Q(\data[4][21] ) );
  DFFPOSX1 \data_reg[4][20]  ( .D(n506), .CLK(write_clk), .Q(\data[4][20] ) );
  DFFPOSX1 \data_reg[4][19]  ( .D(n505), .CLK(write_clk), .Q(\data[4][19] ) );
  DFFPOSX1 \data_reg[4][18]  ( .D(n504), .CLK(write_clk), .Q(\data[4][18] ) );
  DFFPOSX1 \data_reg[4][17]  ( .D(n503), .CLK(write_clk), .Q(\data[4][17] ) );
  DFFPOSX1 \data_reg[4][16]  ( .D(n502), .CLK(write_clk), .Q(\data[4][16] ) );
  DFFPOSX1 \data_reg[4][15]  ( .D(n501), .CLK(write_clk), .Q(\data[4][15] ) );
  DFFPOSX1 \data_reg[4][14]  ( .D(n500), .CLK(write_clk), .Q(\data[4][14] ) );
  DFFPOSX1 \data_reg[4][13]  ( .D(n499), .CLK(write_clk), .Q(\data[4][13] ) );
  DFFPOSX1 \data_reg[4][12]  ( .D(n498), .CLK(write_clk), .Q(\data[4][12] ) );
  DFFPOSX1 \data_reg[4][11]  ( .D(n497), .CLK(write_clk), .Q(\data[4][11] ) );
  DFFPOSX1 \data_reg[4][10]  ( .D(n496), .CLK(write_clk), .Q(\data[4][10] ) );
  DFFPOSX1 \data_reg[4][9]  ( .D(n495), .CLK(write_clk), .Q(\data[4][9] ) );
  DFFPOSX1 \data_reg[4][8]  ( .D(n494), .CLK(write_clk), .Q(\data[4][8] ) );
  DFFPOSX1 \data_reg[4][7]  ( .D(n493), .CLK(write_clk), .Q(\data[4][7] ) );
  DFFPOSX1 \data_reg[4][6]  ( .D(n492), .CLK(write_clk), .Q(\data[4][6] ) );
  DFFPOSX1 \data_reg[4][5]  ( .D(n491), .CLK(write_clk), .Q(\data[4][5] ) );
  DFFPOSX1 \data_reg[4][4]  ( .D(n490), .CLK(write_clk), .Q(\data[4][4] ) );
  DFFPOSX1 \data_reg[4][3]  ( .D(n489), .CLK(write_clk), .Q(\data[4][3] ) );
  DFFPOSX1 \data_reg[4][2]  ( .D(n488), .CLK(write_clk), .Q(\data[4][2] ) );
  DFFPOSX1 \data_reg[4][1]  ( .D(n487), .CLK(write_clk), .Q(\data[4][1] ) );
  DFFPOSX1 \data_reg[4][0]  ( .D(n486), .CLK(write_clk), .Q(\data[4][0] ) );
  DFFPOSX1 \data_reg[3][31]  ( .D(n485), .CLK(write_clk), .Q(\data[3][31] ) );
  DFFPOSX1 \data_reg[3][30]  ( .D(n484), .CLK(write_clk), .Q(\data[3][30] ) );
  DFFPOSX1 \data_reg[3][29]  ( .D(n483), .CLK(write_clk), .Q(\data[3][29] ) );
  DFFPOSX1 \data_reg[3][28]  ( .D(n482), .CLK(write_clk), .Q(\data[3][28] ) );
  DFFPOSX1 \data_reg[3][27]  ( .D(n481), .CLK(write_clk), .Q(\data[3][27] ) );
  DFFPOSX1 \data_reg[3][26]  ( .D(n480), .CLK(write_clk), .Q(\data[3][26] ) );
  DFFPOSX1 \data_reg[3][25]  ( .D(n479), .CLK(write_clk), .Q(\data[3][25] ) );
  DFFPOSX1 \data_reg[3][24]  ( .D(n478), .CLK(write_clk), .Q(\data[3][24] ) );
  DFFPOSX1 \data_reg[3][23]  ( .D(n477), .CLK(write_clk), .Q(\data[3][23] ) );
  DFFPOSX1 \data_reg[3][22]  ( .D(n476), .CLK(write_clk), .Q(\data[3][22] ) );
  DFFPOSX1 \data_reg[3][21]  ( .D(n475), .CLK(write_clk), .Q(\data[3][21] ) );
  DFFPOSX1 \data_reg[3][20]  ( .D(n474), .CLK(write_clk), .Q(\data[3][20] ) );
  DFFPOSX1 \data_reg[3][19]  ( .D(n473), .CLK(write_clk), .Q(\data[3][19] ) );
  DFFPOSX1 \data_reg[3][18]  ( .D(n472), .CLK(write_clk), .Q(\data[3][18] ) );
  DFFPOSX1 \data_reg[3][17]  ( .D(n471), .CLK(write_clk), .Q(\data[3][17] ) );
  DFFPOSX1 \data_reg[3][16]  ( .D(n470), .CLK(write_clk), .Q(\data[3][16] ) );
  DFFPOSX1 \data_reg[3][15]  ( .D(n469), .CLK(write_clk), .Q(\data[3][15] ) );
  DFFPOSX1 \data_reg[3][14]  ( .D(n468), .CLK(write_clk), .Q(\data[3][14] ) );
  DFFPOSX1 \data_reg[3][13]  ( .D(n467), .CLK(write_clk), .Q(\data[3][13] ) );
  DFFPOSX1 \data_reg[3][12]  ( .D(n466), .CLK(write_clk), .Q(\data[3][12] ) );
  DFFPOSX1 \data_reg[3][11]  ( .D(n465), .CLK(write_clk), .Q(\data[3][11] ) );
  DFFPOSX1 \data_reg[3][10]  ( .D(n464), .CLK(write_clk), .Q(\data[3][10] ) );
  DFFPOSX1 \data_reg[3][9]  ( .D(n463), .CLK(write_clk), .Q(\data[3][9] ) );
  DFFPOSX1 \data_reg[3][8]  ( .D(n462), .CLK(write_clk), .Q(\data[3][8] ) );
  DFFPOSX1 \data_reg[3][7]  ( .D(n461), .CLK(write_clk), .Q(\data[3][7] ) );
  DFFPOSX1 \data_reg[3][6]  ( .D(n460), .CLK(write_clk), .Q(\data[3][6] ) );
  DFFPOSX1 \data_reg[3][5]  ( .D(n459), .CLK(write_clk), .Q(\data[3][5] ) );
  DFFPOSX1 \data_reg[3][4]  ( .D(n458), .CLK(write_clk), .Q(\data[3][4] ) );
  DFFPOSX1 \data_reg[3][3]  ( .D(n457), .CLK(write_clk), .Q(\data[3][3] ) );
  DFFPOSX1 \data_reg[3][2]  ( .D(n456), .CLK(write_clk), .Q(\data[3][2] ) );
  DFFPOSX1 \data_reg[3][1]  ( .D(n455), .CLK(write_clk), .Q(\data[3][1] ) );
  DFFPOSX1 \data_reg[3][0]  ( .D(n454), .CLK(write_clk), .Q(\data[3][0] ) );
  DFFPOSX1 \data_reg[2][31]  ( .D(n453), .CLK(write_clk), .Q(\data[2][31] ) );
  DFFPOSX1 \data_reg[2][30]  ( .D(n452), .CLK(write_clk), .Q(\data[2][30] ) );
  DFFPOSX1 \data_reg[2][29]  ( .D(n451), .CLK(write_clk), .Q(\data[2][29] ) );
  DFFPOSX1 \data_reg[2][28]  ( .D(n450), .CLK(write_clk), .Q(\data[2][28] ) );
  DFFPOSX1 \data_reg[2][27]  ( .D(n449), .CLK(write_clk), .Q(\data[2][27] ) );
  DFFPOSX1 \data_reg[2][26]  ( .D(n448), .CLK(write_clk), .Q(\data[2][26] ) );
  DFFPOSX1 \data_reg[2][25]  ( .D(n447), .CLK(write_clk), .Q(\data[2][25] ) );
  DFFPOSX1 \data_reg[2][24]  ( .D(n446), .CLK(write_clk), .Q(\data[2][24] ) );
  DFFPOSX1 \data_reg[2][23]  ( .D(n445), .CLK(write_clk), .Q(\data[2][23] ) );
  DFFPOSX1 \data_reg[2][22]  ( .D(n444), .CLK(write_clk), .Q(\data[2][22] ) );
  DFFPOSX1 \data_reg[2][21]  ( .D(n443), .CLK(write_clk), .Q(\data[2][21] ) );
  DFFPOSX1 \data_reg[2][20]  ( .D(n442), .CLK(write_clk), .Q(\data[2][20] ) );
  DFFPOSX1 \data_reg[2][19]  ( .D(n441), .CLK(write_clk), .Q(\data[2][19] ) );
  DFFPOSX1 \data_reg[2][18]  ( .D(n440), .CLK(write_clk), .Q(\data[2][18] ) );
  DFFPOSX1 \data_reg[2][17]  ( .D(n439), .CLK(write_clk), .Q(\data[2][17] ) );
  DFFPOSX1 \data_reg[2][16]  ( .D(n438), .CLK(write_clk), .Q(\data[2][16] ) );
  DFFPOSX1 \data_reg[2][15]  ( .D(n437), .CLK(write_clk), .Q(\data[2][15] ) );
  DFFPOSX1 \data_reg[2][14]  ( .D(n436), .CLK(write_clk), .Q(\data[2][14] ) );
  DFFPOSX1 \data_reg[2][13]  ( .D(n435), .CLK(write_clk), .Q(\data[2][13] ) );
  DFFPOSX1 \data_reg[2][12]  ( .D(n434), .CLK(write_clk), .Q(\data[2][12] ) );
  DFFPOSX1 \data_reg[2][11]  ( .D(n433), .CLK(write_clk), .Q(\data[2][11] ) );
  DFFPOSX1 \data_reg[2][10]  ( .D(n432), .CLK(write_clk), .Q(\data[2][10] ) );
  DFFPOSX1 \data_reg[2][9]  ( .D(n431), .CLK(write_clk), .Q(\data[2][9] ) );
  DFFPOSX1 \data_reg[2][8]  ( .D(n430), .CLK(write_clk), .Q(\data[2][8] ) );
  DFFPOSX1 \data_reg[2][7]  ( .D(n429), .CLK(write_clk), .Q(\data[2][7] ) );
  DFFPOSX1 \data_reg[2][6]  ( .D(n428), .CLK(write_clk), .Q(\data[2][6] ) );
  DFFPOSX1 \data_reg[2][5]  ( .D(n427), .CLK(write_clk), .Q(\data[2][5] ) );
  DFFPOSX1 \data_reg[2][4]  ( .D(n426), .CLK(write_clk), .Q(\data[2][4] ) );
  DFFPOSX1 \data_reg[2][3]  ( .D(n425), .CLK(write_clk), .Q(\data[2][3] ) );
  DFFPOSX1 \data_reg[2][2]  ( .D(n424), .CLK(write_clk), .Q(\data[2][2] ) );
  DFFPOSX1 \data_reg[2][1]  ( .D(n423), .CLK(write_clk), .Q(\data[2][1] ) );
  DFFPOSX1 \data_reg[2][0]  ( .D(n422), .CLK(write_clk), .Q(\data[2][0] ) );
  DFFPOSX1 \data_reg[1][31]  ( .D(n421), .CLK(write_clk), .Q(\data[1][31] ) );
  DFFPOSX1 \data_reg[1][30]  ( .D(n420), .CLK(write_clk), .Q(\data[1][30] ) );
  DFFPOSX1 \data_reg[1][29]  ( .D(n419), .CLK(write_clk), .Q(\data[1][29] ) );
  DFFPOSX1 \data_reg[1][28]  ( .D(n418), .CLK(write_clk), .Q(\data[1][28] ) );
  DFFPOSX1 \data_reg[1][27]  ( .D(n417), .CLK(write_clk), .Q(\data[1][27] ) );
  DFFPOSX1 \data_reg[1][26]  ( .D(n416), .CLK(write_clk), .Q(\data[1][26] ) );
  DFFPOSX1 \data_reg[1][25]  ( .D(n415), .CLK(write_clk), .Q(\data[1][25] ) );
  DFFPOSX1 \data_reg[1][24]  ( .D(n414), .CLK(write_clk), .Q(\data[1][24] ) );
  DFFPOSX1 \data_reg[1][23]  ( .D(n413), .CLK(write_clk), .Q(\data[1][23] ) );
  DFFPOSX1 \data_reg[1][22]  ( .D(n412), .CLK(write_clk), .Q(\data[1][22] ) );
  DFFPOSX1 \data_reg[1][21]  ( .D(n411), .CLK(write_clk), .Q(\data[1][21] ) );
  DFFPOSX1 \data_reg[1][20]  ( .D(n410), .CLK(write_clk), .Q(\data[1][20] ) );
  DFFPOSX1 \data_reg[1][19]  ( .D(n409), .CLK(write_clk), .Q(\data[1][19] ) );
  DFFPOSX1 \data_reg[1][18]  ( .D(n408), .CLK(write_clk), .Q(\data[1][18] ) );
  DFFPOSX1 \data_reg[1][17]  ( .D(n407), .CLK(write_clk), .Q(\data[1][17] ) );
  DFFPOSX1 \data_reg[1][16]  ( .D(n406), .CLK(write_clk), .Q(\data[1][16] ) );
  DFFPOSX1 \data_reg[1][15]  ( .D(n405), .CLK(write_clk), .Q(\data[1][15] ) );
  DFFPOSX1 \data_reg[1][14]  ( .D(n404), .CLK(write_clk), .Q(\data[1][14] ) );
  DFFPOSX1 \data_reg[1][13]  ( .D(n403), .CLK(write_clk), .Q(\data[1][13] ) );
  DFFPOSX1 \data_reg[1][12]  ( .D(n402), .CLK(write_clk), .Q(\data[1][12] ) );
  DFFPOSX1 \data_reg[1][11]  ( .D(n401), .CLK(write_clk), .Q(\data[1][11] ) );
  DFFPOSX1 \data_reg[1][10]  ( .D(n400), .CLK(write_clk), .Q(\data[1][10] ) );
  DFFPOSX1 \data_reg[1][9]  ( .D(n399), .CLK(write_clk), .Q(\data[1][9] ) );
  DFFPOSX1 \data_reg[1][8]  ( .D(n398), .CLK(write_clk), .Q(\data[1][8] ) );
  DFFPOSX1 \data_reg[1][7]  ( .D(n397), .CLK(write_clk), .Q(\data[1][7] ) );
  DFFPOSX1 \data_reg[1][6]  ( .D(n396), .CLK(write_clk), .Q(\data[1][6] ) );
  DFFPOSX1 \data_reg[1][5]  ( .D(n395), .CLK(write_clk), .Q(\data[1][5] ) );
  DFFPOSX1 \data_reg[1][4]  ( .D(n394), .CLK(write_clk), .Q(\data[1][4] ) );
  DFFPOSX1 \data_reg[1][3]  ( .D(n393), .CLK(write_clk), .Q(\data[1][3] ) );
  DFFPOSX1 \data_reg[1][2]  ( .D(n392), .CLK(write_clk), .Q(\data[1][2] ) );
  DFFPOSX1 \data_reg[1][1]  ( .D(n391), .CLK(write_clk), .Q(\data[1][1] ) );
  DFFPOSX1 \data_reg[1][0]  ( .D(n390), .CLK(write_clk), .Q(\data[1][0] ) );
  DFFPOSX1 \data_reg[0][31]  ( .D(n389), .CLK(write_clk), .Q(\data[0][31] ) );
  DFFPOSX1 \data_reg[0][30]  ( .D(n388), .CLK(write_clk), .Q(\data[0][30] ) );
  DFFPOSX1 \data_reg[0][29]  ( .D(n387), .CLK(write_clk), .Q(\data[0][29] ) );
  DFFPOSX1 \data_reg[0][28]  ( .D(n386), .CLK(write_clk), .Q(\data[0][28] ) );
  DFFPOSX1 \data_reg[0][27]  ( .D(n385), .CLK(write_clk), .Q(\data[0][27] ) );
  DFFPOSX1 \data_reg[0][26]  ( .D(n384), .CLK(write_clk), .Q(\data[0][26] ) );
  DFFPOSX1 \data_reg[0][25]  ( .D(n383), .CLK(write_clk), .Q(\data[0][25] ) );
  DFFPOSX1 \data_reg[0][24]  ( .D(n382), .CLK(write_clk), .Q(\data[0][24] ) );
  DFFPOSX1 \data_reg[0][23]  ( .D(n381), .CLK(write_clk), .Q(\data[0][23] ) );
  DFFPOSX1 \data_reg[0][22]  ( .D(n380), .CLK(write_clk), .Q(\data[0][22] ) );
  DFFPOSX1 \data_reg[0][21]  ( .D(n379), .CLK(write_clk), .Q(\data[0][21] ) );
  DFFPOSX1 \data_reg[0][20]  ( .D(n378), .CLK(write_clk), .Q(\data[0][20] ) );
  DFFPOSX1 \data_reg[0][19]  ( .D(n377), .CLK(write_clk), .Q(\data[0][19] ) );
  DFFPOSX1 \data_reg[0][18]  ( .D(n376), .CLK(write_clk), .Q(\data[0][18] ) );
  DFFPOSX1 \data_reg[0][17]  ( .D(n375), .CLK(write_clk), .Q(\data[0][17] ) );
  DFFPOSX1 \data_reg[0][16]  ( .D(n374), .CLK(write_clk), .Q(\data[0][16] ) );
  DFFPOSX1 \data_reg[0][15]  ( .D(n373), .CLK(write_clk), .Q(\data[0][15] ) );
  DFFPOSX1 \data_reg[0][14]  ( .D(n372), .CLK(write_clk), .Q(\data[0][14] ) );
  DFFPOSX1 \data_reg[0][13]  ( .D(n371), .CLK(write_clk), .Q(\data[0][13] ) );
  DFFPOSX1 \data_reg[0][12]  ( .D(n370), .CLK(write_clk), .Q(\data[0][12] ) );
  DFFPOSX1 \data_reg[0][11]  ( .D(n369), .CLK(write_clk), .Q(\data[0][11] ) );
  DFFPOSX1 \data_reg[0][10]  ( .D(n368), .CLK(write_clk), .Q(\data[0][10] ) );
  DFFPOSX1 \data_reg[0][9]  ( .D(n367), .CLK(write_clk), .Q(\data[0][9] ) );
  DFFPOSX1 \data_reg[0][8]  ( .D(n366), .CLK(write_clk), .Q(\data[0][8] ) );
  DFFPOSX1 \data_reg[0][7]  ( .D(n365), .CLK(write_clk), .Q(\data[0][7] ) );
  DFFPOSX1 \data_reg[0][6]  ( .D(n364), .CLK(write_clk), .Q(\data[0][6] ) );
  DFFPOSX1 \data_reg[0][5]  ( .D(n363), .CLK(write_clk), .Q(\data[0][5] ) );
  DFFPOSX1 \data_reg[0][4]  ( .D(n362), .CLK(write_clk), .Q(\data[0][4] ) );
  DFFPOSX1 \data_reg[0][3]  ( .D(n361), .CLK(write_clk), .Q(\data[0][3] ) );
  DFFPOSX1 \data_reg[0][2]  ( .D(n360), .CLK(write_clk), .Q(\data[0][2] ) );
  DFFPOSX1 \data_reg[0][1]  ( .D(n359), .CLK(write_clk), .Q(\data[0][1] ) );
  DFFPOSX1 \data_reg[0][0]  ( .D(n358), .CLK(write_clk), .Q(\data[0][0] ) );
  flex_counter_NUM_CNT_BITS4_5 READ_COUNTER ( .clk(read_clk), .n_rst(n_rst), 
        .clear(_1_net_), .count_enable(read_enable), .rollover_val({1'b1, 1'b0, 
        1'b0, 1'b0}), .count_out({\read_pointer[3] , N21, N20, N19}) );
  flex_counter_NUM_CNT_BITS4_4 WRITE_COUNTER ( .clk(write_clk), .n_rst(n_rst), 
        .clear(_3_net_), .count_enable(write_enable), .rollover_val({1'b1, 
        1'b0, 1'b0, 1'b0}), .count_out(write_pointer) );
  NAND2X1 U3 ( .A(n19), .B(N19), .Y(n179) );
  INVX4 U4 ( .A(n179), .Y(n1) );
  NAND2X1 U5 ( .A(n21), .B(n762), .Y(n185) );
  INVX4 U6 ( .A(n185), .Y(n2) );
  BUFX2 U7 ( .A(n263), .Y(n3) );
  BUFX2 U8 ( .A(n623), .Y(n4) );
  NAND2X1 U9 ( .A(n21), .B(N19), .Y(n181) );
  INVX4 U10 ( .A(n181), .Y(n5) );
  NAND2X1 U11 ( .A(n19), .B(n762), .Y(n183) );
  INVX4 U12 ( .A(n183), .Y(n6) );
  BUFX2 U13 ( .A(n197), .Y(n7) );
  BUFX2 U14 ( .A(n657), .Y(n8) );
  NAND2X1 U15 ( .A(N19), .B(n20), .Y(n178) );
  INVX4 U16 ( .A(n178), .Y(n9) );
  NAND2X1 U17 ( .A(n22), .B(n762), .Y(n184) );
  INVX4 U18 ( .A(n184), .Y(n10) );
  BUFX2 U19 ( .A(n331), .Y(n11) );
  BUFX2 U20 ( .A(n691), .Y(n12) );
  BUFX2 U21 ( .A(n621), .Y(n13) );
  INVX2 U22 ( .A(fifo_empty), .Y(n14) );
  NAND2X1 U23 ( .A(n22), .B(N19), .Y(n180) );
  INVX4 U24 ( .A(n180), .Y(n15) );
  NAND2X1 U25 ( .A(n20), .B(n762), .Y(n182) );
  INVX4 U26 ( .A(n182), .Y(n16) );
  BUFX2 U27 ( .A(n297), .Y(n17) );
  BUFX2 U28 ( .A(n725), .Y(n18) );
  NOR2X1 U29 ( .A(n191), .B(N20), .Y(n19) );
  NOR2X1 U30 ( .A(n191), .B(n780), .Y(n20) );
  AOI22X1 U31 ( .A(\data[5][0] ), .B(n1), .C(\data[7][0] ), .D(n9), .Y(n27) );
  NOR2X1 U32 ( .A(N20), .B(N21), .Y(n21) );
  NOR2X1 U33 ( .A(n780), .B(N21), .Y(n22) );
  AOI22X1 U34 ( .A(\data[1][0] ), .B(n5), .C(\data[3][0] ), .D(n15), .Y(n26)
         );
  AOI22X1 U35 ( .A(\data[4][0] ), .B(n6), .C(\data[6][0] ), .D(n16), .Y(n24)
         );
  AOI22X1 U36 ( .A(\data[0][0] ), .B(n2), .C(\data[2][0] ), .D(n10), .Y(n23)
         );
  AND2X1 U37 ( .A(n24), .B(n23), .Y(n25) );
  NAND3X1 U38 ( .A(n27), .B(n26), .C(n25), .Y(N125) );
  AOI22X1 U39 ( .A(\data[5][1] ), .B(n1), .C(\data[7][1] ), .D(n9), .Y(n32) );
  AOI22X1 U40 ( .A(\data[1][1] ), .B(n5), .C(\data[3][1] ), .D(n15), .Y(n31)
         );
  AOI22X1 U41 ( .A(\data[4][1] ), .B(n6), .C(\data[6][1] ), .D(n16), .Y(n29)
         );
  AOI22X1 U42 ( .A(\data[0][1] ), .B(n2), .C(\data[2][1] ), .D(n10), .Y(n28)
         );
  AND2X1 U43 ( .A(n29), .B(n28), .Y(n30) );
  NAND3X1 U44 ( .A(n32), .B(n31), .C(n30), .Y(N124) );
  AOI22X1 U45 ( .A(\data[5][2] ), .B(n1), .C(\data[7][2] ), .D(n9), .Y(n37) );
  AOI22X1 U46 ( .A(\data[1][2] ), .B(n5), .C(\data[3][2] ), .D(n15), .Y(n36)
         );
  AOI22X1 U47 ( .A(\data[4][2] ), .B(n6), .C(\data[6][2] ), .D(n16), .Y(n34)
         );
  AOI22X1 U48 ( .A(\data[0][2] ), .B(n2), .C(\data[2][2] ), .D(n10), .Y(n33)
         );
  AND2X1 U49 ( .A(n34), .B(n33), .Y(n35) );
  NAND3X1 U50 ( .A(n37), .B(n36), .C(n35), .Y(N123) );
  AOI22X1 U51 ( .A(\data[5][3] ), .B(n1), .C(\data[7][3] ), .D(n9), .Y(n42) );
  AOI22X1 U52 ( .A(\data[1][3] ), .B(n5), .C(\data[3][3] ), .D(n15), .Y(n41)
         );
  AOI22X1 U53 ( .A(\data[4][3] ), .B(n6), .C(\data[6][3] ), .D(n16), .Y(n39)
         );
  AOI22X1 U54 ( .A(\data[0][3] ), .B(n2), .C(\data[2][3] ), .D(n10), .Y(n38)
         );
  AND2X1 U55 ( .A(n39), .B(n38), .Y(n40) );
  NAND3X1 U56 ( .A(n42), .B(n41), .C(n40), .Y(N122) );
  AOI22X1 U57 ( .A(\data[5][4] ), .B(n1), .C(\data[7][4] ), .D(n9), .Y(n47) );
  AOI22X1 U58 ( .A(\data[1][4] ), .B(n5), .C(\data[3][4] ), .D(n15), .Y(n46)
         );
  AOI22X1 U59 ( .A(\data[4][4] ), .B(n6), .C(\data[6][4] ), .D(n16), .Y(n44)
         );
  AOI22X1 U60 ( .A(\data[0][4] ), .B(n2), .C(\data[2][4] ), .D(n10), .Y(n43)
         );
  AND2X1 U61 ( .A(n44), .B(n43), .Y(n45) );
  NAND3X1 U62 ( .A(n47), .B(n46), .C(n45), .Y(N121) );
  AOI22X1 U63 ( .A(\data[5][5] ), .B(n1), .C(\data[7][5] ), .D(n9), .Y(n52) );
  AOI22X1 U64 ( .A(\data[1][5] ), .B(n5), .C(\data[3][5] ), .D(n15), .Y(n51)
         );
  AOI22X1 U65 ( .A(\data[4][5] ), .B(n6), .C(\data[6][5] ), .D(n16), .Y(n49)
         );
  AOI22X1 U66 ( .A(\data[0][5] ), .B(n2), .C(\data[2][5] ), .D(n10), .Y(n48)
         );
  AND2X1 U67 ( .A(n49), .B(n48), .Y(n50) );
  NAND3X1 U68 ( .A(n52), .B(n51), .C(n50), .Y(N120) );
  AOI22X1 U69 ( .A(\data[5][6] ), .B(n1), .C(\data[7][6] ), .D(n9), .Y(n57) );
  AOI22X1 U70 ( .A(\data[1][6] ), .B(n5), .C(\data[3][6] ), .D(n15), .Y(n56)
         );
  AOI22X1 U71 ( .A(\data[4][6] ), .B(n6), .C(\data[6][6] ), .D(n16), .Y(n54)
         );
  AOI22X1 U72 ( .A(\data[0][6] ), .B(n2), .C(\data[2][6] ), .D(n10), .Y(n53)
         );
  AND2X1 U73 ( .A(n54), .B(n53), .Y(n55) );
  NAND3X1 U74 ( .A(n57), .B(n56), .C(n55), .Y(N119) );
  AOI22X1 U75 ( .A(\data[5][7] ), .B(n1), .C(\data[7][7] ), .D(n9), .Y(n62) );
  AOI22X1 U76 ( .A(\data[1][7] ), .B(n5), .C(\data[3][7] ), .D(n15), .Y(n61)
         );
  AOI22X1 U77 ( .A(\data[4][7] ), .B(n6), .C(\data[6][7] ), .D(n16), .Y(n59)
         );
  AOI22X1 U78 ( .A(\data[0][7] ), .B(n2), .C(\data[2][7] ), .D(n10), .Y(n58)
         );
  AND2X1 U79 ( .A(n59), .B(n58), .Y(n60) );
  NAND3X1 U80 ( .A(n62), .B(n61), .C(n60), .Y(N118) );
  AOI22X1 U81 ( .A(\data[5][8] ), .B(n1), .C(\data[7][8] ), .D(n9), .Y(n67) );
  AOI22X1 U82 ( .A(\data[1][8] ), .B(n5), .C(\data[3][8] ), .D(n15), .Y(n66)
         );
  AOI22X1 U83 ( .A(\data[4][8] ), .B(n6), .C(\data[6][8] ), .D(n16), .Y(n64)
         );
  AOI22X1 U84 ( .A(\data[0][8] ), .B(n2), .C(\data[2][8] ), .D(n10), .Y(n63)
         );
  AND2X1 U85 ( .A(n64), .B(n63), .Y(n65) );
  NAND3X1 U86 ( .A(n67), .B(n66), .C(n65), .Y(N117) );
  AOI22X1 U87 ( .A(\data[5][9] ), .B(n1), .C(\data[7][9] ), .D(n9), .Y(n72) );
  AOI22X1 U88 ( .A(\data[1][9] ), .B(n5), .C(\data[3][9] ), .D(n15), .Y(n71)
         );
  AOI22X1 U89 ( .A(\data[4][9] ), .B(n6), .C(\data[6][9] ), .D(n16), .Y(n69)
         );
  AOI22X1 U90 ( .A(\data[0][9] ), .B(n2), .C(\data[2][9] ), .D(n10), .Y(n68)
         );
  AND2X1 U91 ( .A(n69), .B(n68), .Y(n70) );
  NAND3X1 U92 ( .A(n72), .B(n71), .C(n70), .Y(N116) );
  AOI22X1 U93 ( .A(\data[5][10] ), .B(n1), .C(\data[7][10] ), .D(n9), .Y(n77)
         );
  AOI22X1 U94 ( .A(\data[1][10] ), .B(n5), .C(\data[3][10] ), .D(n15), .Y(n76)
         );
  AOI22X1 U95 ( .A(\data[4][10] ), .B(n6), .C(\data[6][10] ), .D(n16), .Y(n74)
         );
  AOI22X1 U96 ( .A(\data[0][10] ), .B(n2), .C(\data[2][10] ), .D(n10), .Y(n73)
         );
  AND2X1 U97 ( .A(n74), .B(n73), .Y(n75) );
  NAND3X1 U98 ( .A(n77), .B(n76), .C(n75), .Y(N115) );
  AOI22X1 U99 ( .A(\data[5][11] ), .B(n1), .C(\data[7][11] ), .D(n9), .Y(n82)
         );
  AOI22X1 U100 ( .A(\data[1][11] ), .B(n5), .C(\data[3][11] ), .D(n15), .Y(n81) );
  AOI22X1 U101 ( .A(\data[4][11] ), .B(n6), .C(\data[6][11] ), .D(n16), .Y(n79) );
  AOI22X1 U102 ( .A(\data[0][11] ), .B(n2), .C(\data[2][11] ), .D(n10), .Y(n78) );
  AND2X1 U103 ( .A(n79), .B(n78), .Y(n80) );
  NAND3X1 U104 ( .A(n82), .B(n81), .C(n80), .Y(N114) );
  AOI22X1 U105 ( .A(\data[5][12] ), .B(n1), .C(\data[7][12] ), .D(n9), .Y(n87)
         );
  AOI22X1 U106 ( .A(\data[1][12] ), .B(n5), .C(\data[3][12] ), .D(n15), .Y(n86) );
  AOI22X1 U107 ( .A(\data[4][12] ), .B(n6), .C(\data[6][12] ), .D(n16), .Y(n84) );
  AOI22X1 U108 ( .A(\data[0][12] ), .B(n2), .C(\data[2][12] ), .D(n10), .Y(n83) );
  AND2X1 U109 ( .A(n84), .B(n83), .Y(n85) );
  NAND3X1 U110 ( .A(n87), .B(n86), .C(n85), .Y(N113) );
  AOI22X1 U111 ( .A(\data[5][13] ), .B(n1), .C(\data[7][13] ), .D(n9), .Y(n92)
         );
  AOI22X1 U112 ( .A(\data[1][13] ), .B(n5), .C(\data[3][13] ), .D(n15), .Y(n91) );
  AOI22X1 U113 ( .A(\data[4][13] ), .B(n6), .C(\data[6][13] ), .D(n16), .Y(n89) );
  AOI22X1 U114 ( .A(\data[0][13] ), .B(n2), .C(\data[2][13] ), .D(n10), .Y(n88) );
  AND2X1 U115 ( .A(n89), .B(n88), .Y(n90) );
  NAND3X1 U116 ( .A(n92), .B(n91), .C(n90), .Y(N112) );
  AOI22X1 U117 ( .A(\data[5][14] ), .B(n1), .C(\data[7][14] ), .D(n9), .Y(n97)
         );
  AOI22X1 U118 ( .A(\data[1][14] ), .B(n5), .C(\data[3][14] ), .D(n15), .Y(n96) );
  AOI22X1 U119 ( .A(\data[4][14] ), .B(n6), .C(\data[6][14] ), .D(n16), .Y(n94) );
  AOI22X1 U120 ( .A(\data[0][14] ), .B(n2), .C(\data[2][14] ), .D(n10), .Y(n93) );
  AND2X1 U121 ( .A(n94), .B(n93), .Y(n95) );
  NAND3X1 U122 ( .A(n97), .B(n96), .C(n95), .Y(N111) );
  AOI22X1 U123 ( .A(\data[5][15] ), .B(n1), .C(\data[7][15] ), .D(n9), .Y(n102) );
  AOI22X1 U124 ( .A(\data[1][15] ), .B(n5), .C(\data[3][15] ), .D(n15), .Y(
        n101) );
  AOI22X1 U125 ( .A(\data[4][15] ), .B(n6), .C(\data[6][15] ), .D(n16), .Y(n99) );
  AOI22X1 U126 ( .A(\data[0][15] ), .B(n2), .C(\data[2][15] ), .D(n10), .Y(n98) );
  AND2X1 U127 ( .A(n99), .B(n98), .Y(n100) );
  NAND3X1 U128 ( .A(n102), .B(n101), .C(n100), .Y(N110) );
  AOI22X1 U129 ( .A(\data[5][16] ), .B(n1), .C(\data[7][16] ), .D(n9), .Y(n107) );
  AOI22X1 U130 ( .A(\data[1][16] ), .B(n5), .C(\data[3][16] ), .D(n15), .Y(
        n106) );
  AOI22X1 U131 ( .A(\data[4][16] ), .B(n6), .C(\data[6][16] ), .D(n16), .Y(
        n104) );
  AOI22X1 U132 ( .A(\data[0][16] ), .B(n2), .C(\data[2][16] ), .D(n10), .Y(
        n103) );
  AND2X1 U133 ( .A(n104), .B(n103), .Y(n105) );
  NAND3X1 U134 ( .A(n107), .B(n106), .C(n105), .Y(N109) );
  AOI22X1 U135 ( .A(\data[5][17] ), .B(n1), .C(\data[7][17] ), .D(n9), .Y(n112) );
  AOI22X1 U136 ( .A(\data[1][17] ), .B(n5), .C(\data[3][17] ), .D(n15), .Y(
        n111) );
  AOI22X1 U137 ( .A(\data[4][17] ), .B(n6), .C(\data[6][17] ), .D(n16), .Y(
        n109) );
  AOI22X1 U138 ( .A(\data[0][17] ), .B(n2), .C(\data[2][17] ), .D(n10), .Y(
        n108) );
  AND2X1 U139 ( .A(n109), .B(n108), .Y(n110) );
  NAND3X1 U140 ( .A(n112), .B(n111), .C(n110), .Y(N108) );
  AOI22X1 U141 ( .A(\data[5][18] ), .B(n1), .C(\data[7][18] ), .D(n9), .Y(n117) );
  AOI22X1 U142 ( .A(\data[1][18] ), .B(n5), .C(\data[3][18] ), .D(n15), .Y(
        n116) );
  AOI22X1 U143 ( .A(\data[4][18] ), .B(n6), .C(\data[6][18] ), .D(n16), .Y(
        n114) );
  AOI22X1 U144 ( .A(\data[0][18] ), .B(n2), .C(\data[2][18] ), .D(n10), .Y(
        n113) );
  AND2X1 U145 ( .A(n114), .B(n113), .Y(n115) );
  NAND3X1 U146 ( .A(n117), .B(n116), .C(n115), .Y(N107) );
  AOI22X1 U147 ( .A(\data[5][19] ), .B(n1), .C(\data[7][19] ), .D(n9), .Y(n122) );
  AOI22X1 U148 ( .A(\data[1][19] ), .B(n5), .C(\data[3][19] ), .D(n15), .Y(
        n121) );
  AOI22X1 U149 ( .A(\data[4][19] ), .B(n6), .C(\data[6][19] ), .D(n16), .Y(
        n119) );
  AOI22X1 U150 ( .A(\data[0][19] ), .B(n2), .C(\data[2][19] ), .D(n10), .Y(
        n118) );
  AND2X1 U151 ( .A(n119), .B(n118), .Y(n120) );
  NAND3X1 U152 ( .A(n122), .B(n121), .C(n120), .Y(N106) );
  AOI22X1 U153 ( .A(\data[5][20] ), .B(n1), .C(\data[7][20] ), .D(n9), .Y(n127) );
  AOI22X1 U154 ( .A(\data[1][20] ), .B(n5), .C(\data[3][20] ), .D(n15), .Y(
        n126) );
  AOI22X1 U155 ( .A(\data[4][20] ), .B(n6), .C(\data[6][20] ), .D(n16), .Y(
        n124) );
  AOI22X1 U156 ( .A(\data[0][20] ), .B(n2), .C(\data[2][20] ), .D(n10), .Y(
        n123) );
  AND2X1 U157 ( .A(n124), .B(n123), .Y(n125) );
  NAND3X1 U158 ( .A(n127), .B(n126), .C(n125), .Y(N105) );
  AOI22X1 U159 ( .A(\data[5][21] ), .B(n1), .C(\data[7][21] ), .D(n9), .Y(n132) );
  AOI22X1 U160 ( .A(\data[1][21] ), .B(n5), .C(\data[3][21] ), .D(n15), .Y(
        n131) );
  AOI22X1 U161 ( .A(\data[4][21] ), .B(n6), .C(\data[6][21] ), .D(n16), .Y(
        n129) );
  AOI22X1 U162 ( .A(\data[0][21] ), .B(n2), .C(\data[2][21] ), .D(n10), .Y(
        n128) );
  AND2X1 U163 ( .A(n129), .B(n128), .Y(n130) );
  NAND3X1 U164 ( .A(n132), .B(n131), .C(n130), .Y(N104) );
  AOI22X1 U165 ( .A(\data[5][22] ), .B(n1), .C(\data[7][22] ), .D(n9), .Y(n137) );
  AOI22X1 U166 ( .A(\data[1][22] ), .B(n5), .C(\data[3][22] ), .D(n15), .Y(
        n136) );
  AOI22X1 U167 ( .A(\data[4][22] ), .B(n6), .C(\data[6][22] ), .D(n16), .Y(
        n134) );
  AOI22X1 U168 ( .A(\data[0][22] ), .B(n2), .C(\data[2][22] ), .D(n10), .Y(
        n133) );
  AND2X1 U169 ( .A(n134), .B(n133), .Y(n135) );
  NAND3X1 U170 ( .A(n137), .B(n136), .C(n135), .Y(N103) );
  AOI22X1 U171 ( .A(\data[5][23] ), .B(n1), .C(\data[7][23] ), .D(n9), .Y(n142) );
  AOI22X1 U172 ( .A(\data[1][23] ), .B(n5), .C(\data[3][23] ), .D(n15), .Y(
        n141) );
  AOI22X1 U173 ( .A(\data[4][23] ), .B(n6), .C(\data[6][23] ), .D(n16), .Y(
        n139) );
  AOI22X1 U174 ( .A(\data[0][23] ), .B(n2), .C(\data[2][23] ), .D(n10), .Y(
        n138) );
  AND2X1 U175 ( .A(n139), .B(n138), .Y(n140) );
  NAND3X1 U176 ( .A(n142), .B(n141), .C(n140), .Y(N102) );
  AOI22X1 U177 ( .A(\data[5][24] ), .B(n1), .C(\data[7][24] ), .D(n9), .Y(n147) );
  AOI22X1 U178 ( .A(\data[1][24] ), .B(n5), .C(\data[3][24] ), .D(n15), .Y(
        n146) );
  AOI22X1 U179 ( .A(\data[4][24] ), .B(n6), .C(\data[6][24] ), .D(n16), .Y(
        n144) );
  AOI22X1 U180 ( .A(\data[0][24] ), .B(n2), .C(\data[2][24] ), .D(n10), .Y(
        n143) );
  AND2X1 U181 ( .A(n144), .B(n143), .Y(n145) );
  NAND3X1 U182 ( .A(n147), .B(n146), .C(n145), .Y(N101) );
  AOI22X1 U183 ( .A(\data[5][25] ), .B(n1), .C(\data[7][25] ), .D(n9), .Y(n152) );
  AOI22X1 U184 ( .A(\data[1][25] ), .B(n5), .C(\data[3][25] ), .D(n15), .Y(
        n151) );
  AOI22X1 U185 ( .A(\data[4][25] ), .B(n6), .C(\data[6][25] ), .D(n16), .Y(
        n149) );
  AOI22X1 U186 ( .A(\data[0][25] ), .B(n2), .C(\data[2][25] ), .D(n10), .Y(
        n148) );
  AND2X1 U187 ( .A(n149), .B(n148), .Y(n150) );
  NAND3X1 U188 ( .A(n152), .B(n151), .C(n150), .Y(N100) );
  AOI22X1 U189 ( .A(\data[5][26] ), .B(n1), .C(\data[7][26] ), .D(n9), .Y(n157) );
  AOI22X1 U190 ( .A(\data[1][26] ), .B(n5), .C(\data[3][26] ), .D(n15), .Y(
        n156) );
  AOI22X1 U191 ( .A(\data[4][26] ), .B(n6), .C(\data[6][26] ), .D(n16), .Y(
        n154) );
  AOI22X1 U192 ( .A(\data[0][26] ), .B(n2), .C(\data[2][26] ), .D(n10), .Y(
        n153) );
  AND2X1 U193 ( .A(n154), .B(n153), .Y(n155) );
  NAND3X1 U194 ( .A(n157), .B(n156), .C(n155), .Y(N99) );
  AOI22X1 U195 ( .A(\data[5][27] ), .B(n1), .C(\data[7][27] ), .D(n9), .Y(n162) );
  AOI22X1 U196 ( .A(\data[1][27] ), .B(n5), .C(\data[3][27] ), .D(n15), .Y(
        n161) );
  AOI22X1 U197 ( .A(\data[4][27] ), .B(n6), .C(\data[6][27] ), .D(n16), .Y(
        n159) );
  AOI22X1 U198 ( .A(\data[0][27] ), .B(n2), .C(\data[2][27] ), .D(n10), .Y(
        n158) );
  AND2X1 U199 ( .A(n159), .B(n158), .Y(n160) );
  NAND3X1 U200 ( .A(n162), .B(n161), .C(n160), .Y(N98) );
  AOI22X1 U201 ( .A(\data[5][28] ), .B(n1), .C(\data[7][28] ), .D(n9), .Y(n167) );
  AOI22X1 U202 ( .A(\data[1][28] ), .B(n5), .C(\data[3][28] ), .D(n15), .Y(
        n166) );
  AOI22X1 U203 ( .A(\data[4][28] ), .B(n6), .C(\data[6][28] ), .D(n16), .Y(
        n164) );
  AOI22X1 U204 ( .A(\data[0][28] ), .B(n2), .C(\data[2][28] ), .D(n10), .Y(
        n163) );
  AND2X1 U205 ( .A(n164), .B(n163), .Y(n165) );
  NAND3X1 U206 ( .A(n167), .B(n166), .C(n165), .Y(N97) );
  AOI22X1 U207 ( .A(\data[5][29] ), .B(n1), .C(\data[7][29] ), .D(n9), .Y(n172) );
  AOI22X1 U208 ( .A(\data[1][29] ), .B(n5), .C(\data[3][29] ), .D(n15), .Y(
        n171) );
  AOI22X1 U209 ( .A(\data[4][29] ), .B(n6), .C(\data[6][29] ), .D(n16), .Y(
        n169) );
  AOI22X1 U210 ( .A(\data[0][29] ), .B(n2), .C(\data[2][29] ), .D(n10), .Y(
        n168) );
  AND2X1 U211 ( .A(n169), .B(n168), .Y(n170) );
  NAND3X1 U212 ( .A(n172), .B(n171), .C(n170), .Y(N96) );
  AOI22X1 U213 ( .A(\data[5][30] ), .B(n1), .C(\data[7][30] ), .D(n9), .Y(n177) );
  AOI22X1 U214 ( .A(\data[1][30] ), .B(n5), .C(\data[3][30] ), .D(n15), .Y(
        n176) );
  AOI22X1 U215 ( .A(\data[4][30] ), .B(n6), .C(\data[6][30] ), .D(n16), .Y(
        n174) );
  AOI22X1 U216 ( .A(\data[0][30] ), .B(n2), .C(\data[2][30] ), .D(n10), .Y(
        n173) );
  AND2X1 U217 ( .A(n174), .B(n173), .Y(n175) );
  NAND3X1 U218 ( .A(n177), .B(n176), .C(n175), .Y(N95) );
  AOI22X1 U219 ( .A(\data[5][31] ), .B(n1), .C(\data[7][31] ), .D(n9), .Y(n190) );
  AOI22X1 U220 ( .A(\data[1][31] ), .B(n5), .C(\data[3][31] ), .D(n15), .Y(
        n189) );
  AOI22X1 U221 ( .A(\data[4][31] ), .B(n6), .C(\data[6][31] ), .D(n16), .Y(
        n187) );
  AOI22X1 U222 ( .A(\data[0][31] ), .B(n2), .C(\data[2][31] ), .D(n10), .Y(
        n186) );
  AND2X1 U223 ( .A(n187), .B(n186), .Y(n188) );
  NAND3X1 U224 ( .A(n190), .B(n189), .C(n188), .Y(N94) );
  INVX2 U225 ( .A(N21), .Y(n191) );
  AOI21X1 U226 ( .A(n192), .B(N92), .C(n193), .Y(write_enable) );
  INVX1 U227 ( .A(write_command), .Y(n193) );
  AND2X1 U228 ( .A(read_command), .B(n14), .Y(read_enable) );
  AND2X1 U229 ( .A(N116), .B(n14), .Y(read_data[9]) );
  AND2X1 U230 ( .A(N117), .B(n14), .Y(read_data[8]) );
  AND2X1 U231 ( .A(N118), .B(n14), .Y(read_data[7]) );
  AND2X1 U232 ( .A(N119), .B(n14), .Y(read_data[6]) );
  AND2X1 U233 ( .A(N120), .B(n14), .Y(read_data[5]) );
  AND2X1 U234 ( .A(N121), .B(n14), .Y(read_data[4]) );
  AND2X1 U235 ( .A(N122), .B(n14), .Y(read_data[3]) );
  AND2X1 U236 ( .A(N94), .B(n14), .Y(read_data[31]) );
  AND2X1 U237 ( .A(N95), .B(n14), .Y(read_data[30]) );
  AND2X1 U238 ( .A(N123), .B(n14), .Y(read_data[2]) );
  AND2X1 U239 ( .A(N96), .B(n14), .Y(read_data[29]) );
  AND2X1 U240 ( .A(N97), .B(n14), .Y(read_data[28]) );
  AND2X1 U241 ( .A(N98), .B(n14), .Y(read_data[27]) );
  AND2X1 U242 ( .A(N99), .B(n14), .Y(read_data[26]) );
  AND2X1 U243 ( .A(N100), .B(n14), .Y(read_data[25]) );
  AND2X1 U244 ( .A(N101), .B(n14), .Y(read_data[24]) );
  AND2X1 U245 ( .A(N102), .B(n14), .Y(read_data[23]) );
  AND2X1 U246 ( .A(N103), .B(n14), .Y(read_data[22]) );
  AND2X1 U247 ( .A(N104), .B(n14), .Y(read_data[21]) );
  AND2X1 U248 ( .A(N105), .B(n14), .Y(read_data[20]) );
  AND2X1 U249 ( .A(N124), .B(n194), .Y(read_data[1]) );
  AND2X1 U250 ( .A(N106), .B(n194), .Y(read_data[19]) );
  AND2X1 U251 ( .A(N107), .B(n194), .Y(read_data[18]) );
  AND2X1 U252 ( .A(N108), .B(n194), .Y(read_data[17]) );
  AND2X1 U253 ( .A(N109), .B(n194), .Y(read_data[16]) );
  AND2X1 U254 ( .A(N110), .B(n194), .Y(read_data[15]) );
  AND2X1 U255 ( .A(N111), .B(n194), .Y(read_data[14]) );
  AND2X1 U256 ( .A(N112), .B(n194), .Y(read_data[13]) );
  AND2X1 U257 ( .A(N113), .B(n194), .Y(read_data[12]) );
  AND2X1 U258 ( .A(N114), .B(n194), .Y(read_data[11]) );
  AND2X1 U259 ( .A(N115), .B(n194), .Y(read_data[10]) );
  AND2X1 U260 ( .A(N125), .B(n194), .Y(read_data[0]) );
  INVX1 U261 ( .A(n194), .Y(fifo_empty) );
  MUX2X1 U262 ( .B(n195), .A(n196), .S(n7), .Y(n613) );
  INVX1 U263 ( .A(\data[7][31] ), .Y(n195) );
  MUX2X1 U264 ( .B(n198), .A(n199), .S(n7), .Y(n612) );
  INVX1 U265 ( .A(\data[7][30] ), .Y(n198) );
  MUX2X1 U266 ( .B(n200), .A(n201), .S(n7), .Y(n611) );
  INVX1 U267 ( .A(\data[7][29] ), .Y(n200) );
  MUX2X1 U268 ( .B(n202), .A(n203), .S(n7), .Y(n610) );
  INVX1 U269 ( .A(\data[7][28] ), .Y(n202) );
  MUX2X1 U270 ( .B(n204), .A(n205), .S(n7), .Y(n609) );
  INVX1 U271 ( .A(\data[7][27] ), .Y(n204) );
  MUX2X1 U272 ( .B(n206), .A(n207), .S(n7), .Y(n608) );
  INVX1 U273 ( .A(\data[7][26] ), .Y(n206) );
  MUX2X1 U274 ( .B(n208), .A(n209), .S(n7), .Y(n607) );
  INVX1 U275 ( .A(\data[7][25] ), .Y(n208) );
  MUX2X1 U276 ( .B(n210), .A(n211), .S(n7), .Y(n606) );
  INVX1 U277 ( .A(\data[7][24] ), .Y(n210) );
  MUX2X1 U278 ( .B(n212), .A(n213), .S(n7), .Y(n605) );
  INVX1 U279 ( .A(\data[7][23] ), .Y(n212) );
  MUX2X1 U280 ( .B(n214), .A(n215), .S(n7), .Y(n604) );
  INVX1 U281 ( .A(\data[7][22] ), .Y(n214) );
  MUX2X1 U282 ( .B(n216), .A(n217), .S(n7), .Y(n603) );
  INVX1 U283 ( .A(\data[7][21] ), .Y(n216) );
  MUX2X1 U284 ( .B(n218), .A(n219), .S(n7), .Y(n602) );
  INVX1 U285 ( .A(\data[7][20] ), .Y(n218) );
  MUX2X1 U286 ( .B(n220), .A(n221), .S(n7), .Y(n601) );
  INVX1 U287 ( .A(\data[7][19] ), .Y(n220) );
  MUX2X1 U288 ( .B(n222), .A(n223), .S(n7), .Y(n600) );
  INVX1 U289 ( .A(\data[7][18] ), .Y(n222) );
  MUX2X1 U290 ( .B(n224), .A(n225), .S(n7), .Y(n599) );
  INVX1 U291 ( .A(\data[7][17] ), .Y(n224) );
  MUX2X1 U292 ( .B(n226), .A(n227), .S(n7), .Y(n598) );
  INVX1 U293 ( .A(\data[7][16] ), .Y(n226) );
  MUX2X1 U294 ( .B(n228), .A(n229), .S(n7), .Y(n597) );
  INVX1 U295 ( .A(\data[7][15] ), .Y(n228) );
  MUX2X1 U296 ( .B(n230), .A(n231), .S(n7), .Y(n596) );
  INVX1 U297 ( .A(\data[7][14] ), .Y(n230) );
  MUX2X1 U298 ( .B(n232), .A(n233), .S(n7), .Y(n595) );
  INVX1 U299 ( .A(\data[7][13] ), .Y(n232) );
  MUX2X1 U300 ( .B(n234), .A(n235), .S(n7), .Y(n594) );
  INVX1 U301 ( .A(\data[7][12] ), .Y(n234) );
  MUX2X1 U302 ( .B(n236), .A(n237), .S(n7), .Y(n593) );
  INVX1 U303 ( .A(\data[7][11] ), .Y(n236) );
  MUX2X1 U304 ( .B(n238), .A(n239), .S(n197), .Y(n592) );
  INVX1 U305 ( .A(\data[7][10] ), .Y(n238) );
  MUX2X1 U306 ( .B(n240), .A(n241), .S(n197), .Y(n591) );
  INVX1 U307 ( .A(\data[7][9] ), .Y(n240) );
  MUX2X1 U308 ( .B(n242), .A(n243), .S(n197), .Y(n590) );
  INVX1 U309 ( .A(\data[7][8] ), .Y(n242) );
  MUX2X1 U310 ( .B(n244), .A(n245), .S(n197), .Y(n589) );
  INVX1 U311 ( .A(\data[7][7] ), .Y(n244) );
  MUX2X1 U312 ( .B(n246), .A(n247), .S(n197), .Y(n588) );
  INVX1 U313 ( .A(\data[7][6] ), .Y(n246) );
  MUX2X1 U314 ( .B(n248), .A(n249), .S(n197), .Y(n587) );
  INVX1 U315 ( .A(\data[7][5] ), .Y(n248) );
  MUX2X1 U316 ( .B(n250), .A(n251), .S(n197), .Y(n586) );
  INVX1 U317 ( .A(\data[7][4] ), .Y(n250) );
  MUX2X1 U318 ( .B(n252), .A(n253), .S(n197), .Y(n585) );
  INVX1 U319 ( .A(\data[7][3] ), .Y(n252) );
  MUX2X1 U320 ( .B(n254), .A(n255), .S(n197), .Y(n584) );
  INVX1 U321 ( .A(\data[7][2] ), .Y(n254) );
  MUX2X1 U322 ( .B(n256), .A(n257), .S(n197), .Y(n583) );
  INVX1 U323 ( .A(\data[7][1] ), .Y(n256) );
  MUX2X1 U324 ( .B(n258), .A(n259), .S(n197), .Y(n582) );
  OAI21X1 U325 ( .A(n260), .B(n261), .C(n_rst), .Y(n197) );
  INVX1 U326 ( .A(\data[7][0] ), .Y(n258) );
  MUX2X1 U327 ( .B(n262), .A(n196), .S(n3), .Y(n581) );
  INVX1 U328 ( .A(\data[6][31] ), .Y(n262) );
  MUX2X1 U329 ( .B(n264), .A(n199), .S(n3), .Y(n580) );
  INVX1 U330 ( .A(\data[6][30] ), .Y(n264) );
  MUX2X1 U331 ( .B(n265), .A(n201), .S(n3), .Y(n579) );
  INVX1 U332 ( .A(\data[6][29] ), .Y(n265) );
  MUX2X1 U333 ( .B(n266), .A(n203), .S(n3), .Y(n578) );
  INVX1 U334 ( .A(\data[6][28] ), .Y(n266) );
  MUX2X1 U335 ( .B(n267), .A(n205), .S(n3), .Y(n577) );
  INVX1 U336 ( .A(\data[6][27] ), .Y(n267) );
  MUX2X1 U337 ( .B(n268), .A(n207), .S(n3), .Y(n576) );
  INVX1 U338 ( .A(\data[6][26] ), .Y(n268) );
  MUX2X1 U339 ( .B(n269), .A(n209), .S(n3), .Y(n575) );
  INVX1 U340 ( .A(\data[6][25] ), .Y(n269) );
  MUX2X1 U341 ( .B(n270), .A(n211), .S(n3), .Y(n574) );
  INVX1 U342 ( .A(\data[6][24] ), .Y(n270) );
  MUX2X1 U343 ( .B(n271), .A(n213), .S(n3), .Y(n573) );
  INVX1 U344 ( .A(\data[6][23] ), .Y(n271) );
  MUX2X1 U345 ( .B(n272), .A(n215), .S(n3), .Y(n572) );
  INVX1 U346 ( .A(\data[6][22] ), .Y(n272) );
  MUX2X1 U347 ( .B(n273), .A(n217), .S(n3), .Y(n571) );
  INVX1 U348 ( .A(\data[6][21] ), .Y(n273) );
  MUX2X1 U349 ( .B(n274), .A(n219), .S(n3), .Y(n570) );
  INVX1 U350 ( .A(\data[6][20] ), .Y(n274) );
  MUX2X1 U351 ( .B(n275), .A(n221), .S(n3), .Y(n569) );
  INVX1 U352 ( .A(\data[6][19] ), .Y(n275) );
  MUX2X1 U353 ( .B(n276), .A(n223), .S(n3), .Y(n568) );
  INVX1 U354 ( .A(\data[6][18] ), .Y(n276) );
  MUX2X1 U355 ( .B(n277), .A(n225), .S(n3), .Y(n567) );
  INVX1 U356 ( .A(\data[6][17] ), .Y(n277) );
  MUX2X1 U357 ( .B(n278), .A(n227), .S(n3), .Y(n566) );
  INVX1 U358 ( .A(\data[6][16] ), .Y(n278) );
  MUX2X1 U359 ( .B(n279), .A(n229), .S(n3), .Y(n565) );
  INVX1 U360 ( .A(\data[6][15] ), .Y(n279) );
  MUX2X1 U361 ( .B(n280), .A(n231), .S(n3), .Y(n564) );
  INVX1 U362 ( .A(\data[6][14] ), .Y(n280) );
  MUX2X1 U363 ( .B(n281), .A(n233), .S(n3), .Y(n563) );
  INVX1 U364 ( .A(\data[6][13] ), .Y(n281) );
  MUX2X1 U365 ( .B(n282), .A(n235), .S(n3), .Y(n562) );
  INVX1 U366 ( .A(\data[6][12] ), .Y(n282) );
  MUX2X1 U367 ( .B(n283), .A(n237), .S(n3), .Y(n561) );
  INVX1 U368 ( .A(\data[6][11] ), .Y(n283) );
  MUX2X1 U369 ( .B(n284), .A(n239), .S(n263), .Y(n560) );
  INVX1 U370 ( .A(\data[6][10] ), .Y(n284) );
  MUX2X1 U371 ( .B(n285), .A(n241), .S(n263), .Y(n559) );
  INVX1 U372 ( .A(\data[6][9] ), .Y(n285) );
  MUX2X1 U373 ( .B(n286), .A(n243), .S(n263), .Y(n558) );
  INVX1 U374 ( .A(\data[6][8] ), .Y(n286) );
  MUX2X1 U375 ( .B(n287), .A(n245), .S(n263), .Y(n557) );
  INVX1 U376 ( .A(\data[6][7] ), .Y(n287) );
  MUX2X1 U377 ( .B(n288), .A(n247), .S(n263), .Y(n556) );
  INVX1 U378 ( .A(\data[6][6] ), .Y(n288) );
  MUX2X1 U379 ( .B(n289), .A(n249), .S(n263), .Y(n555) );
  INVX1 U380 ( .A(\data[6][5] ), .Y(n289) );
  MUX2X1 U381 ( .B(n290), .A(n251), .S(n263), .Y(n554) );
  INVX1 U382 ( .A(\data[6][4] ), .Y(n290) );
  MUX2X1 U383 ( .B(n291), .A(n253), .S(n263), .Y(n553) );
  INVX1 U384 ( .A(\data[6][3] ), .Y(n291) );
  MUX2X1 U385 ( .B(n292), .A(n255), .S(n263), .Y(n552) );
  INVX1 U386 ( .A(\data[6][2] ), .Y(n292) );
  MUX2X1 U387 ( .B(n293), .A(n257), .S(n263), .Y(n551) );
  INVX1 U388 ( .A(\data[6][1] ), .Y(n293) );
  MUX2X1 U389 ( .B(n294), .A(n259), .S(n263), .Y(n550) );
  OAI21X1 U390 ( .A(n261), .B(n295), .C(n_rst), .Y(n263) );
  INVX1 U391 ( .A(\data[6][0] ), .Y(n294) );
  MUX2X1 U392 ( .B(n296), .A(n196), .S(n17), .Y(n549) );
  INVX1 U393 ( .A(\data[5][31] ), .Y(n296) );
  MUX2X1 U394 ( .B(n298), .A(n199), .S(n17), .Y(n548) );
  INVX1 U395 ( .A(\data[5][30] ), .Y(n298) );
  MUX2X1 U396 ( .B(n299), .A(n201), .S(n17), .Y(n547) );
  INVX1 U397 ( .A(\data[5][29] ), .Y(n299) );
  MUX2X1 U398 ( .B(n300), .A(n203), .S(n17), .Y(n546) );
  INVX1 U399 ( .A(\data[5][28] ), .Y(n300) );
  MUX2X1 U400 ( .B(n301), .A(n205), .S(n17), .Y(n545) );
  INVX1 U401 ( .A(\data[5][27] ), .Y(n301) );
  MUX2X1 U402 ( .B(n302), .A(n207), .S(n17), .Y(n544) );
  INVX1 U403 ( .A(\data[5][26] ), .Y(n302) );
  MUX2X1 U404 ( .B(n303), .A(n209), .S(n17), .Y(n543) );
  INVX1 U405 ( .A(\data[5][25] ), .Y(n303) );
  MUX2X1 U406 ( .B(n304), .A(n211), .S(n17), .Y(n542) );
  INVX1 U407 ( .A(\data[5][24] ), .Y(n304) );
  MUX2X1 U408 ( .B(n305), .A(n213), .S(n17), .Y(n541) );
  INVX1 U409 ( .A(\data[5][23] ), .Y(n305) );
  MUX2X1 U410 ( .B(n306), .A(n215), .S(n17), .Y(n540) );
  INVX1 U411 ( .A(\data[5][22] ), .Y(n306) );
  MUX2X1 U412 ( .B(n307), .A(n217), .S(n17), .Y(n539) );
  INVX1 U413 ( .A(\data[5][21] ), .Y(n307) );
  MUX2X1 U414 ( .B(n308), .A(n219), .S(n17), .Y(n538) );
  INVX1 U415 ( .A(\data[5][20] ), .Y(n308) );
  MUX2X1 U416 ( .B(n309), .A(n221), .S(n17), .Y(n537) );
  INVX1 U417 ( .A(\data[5][19] ), .Y(n309) );
  MUX2X1 U418 ( .B(n310), .A(n223), .S(n17), .Y(n536) );
  INVX1 U419 ( .A(\data[5][18] ), .Y(n310) );
  MUX2X1 U420 ( .B(n311), .A(n225), .S(n17), .Y(n535) );
  INVX1 U421 ( .A(\data[5][17] ), .Y(n311) );
  MUX2X1 U422 ( .B(n312), .A(n227), .S(n17), .Y(n534) );
  INVX1 U423 ( .A(\data[5][16] ), .Y(n312) );
  MUX2X1 U424 ( .B(n313), .A(n229), .S(n17), .Y(n533) );
  INVX1 U425 ( .A(\data[5][15] ), .Y(n313) );
  MUX2X1 U426 ( .B(n314), .A(n231), .S(n17), .Y(n532) );
  INVX1 U427 ( .A(\data[5][14] ), .Y(n314) );
  MUX2X1 U428 ( .B(n315), .A(n233), .S(n17), .Y(n531) );
  INVX1 U429 ( .A(\data[5][13] ), .Y(n315) );
  MUX2X1 U430 ( .B(n316), .A(n235), .S(n17), .Y(n530) );
  INVX1 U431 ( .A(\data[5][12] ), .Y(n316) );
  MUX2X1 U432 ( .B(n317), .A(n237), .S(n17), .Y(n529) );
  INVX1 U433 ( .A(\data[5][11] ), .Y(n317) );
  MUX2X1 U434 ( .B(n318), .A(n239), .S(n297), .Y(n528) );
  INVX1 U435 ( .A(\data[5][10] ), .Y(n318) );
  MUX2X1 U436 ( .B(n319), .A(n241), .S(n297), .Y(n527) );
  INVX1 U437 ( .A(\data[5][9] ), .Y(n319) );
  MUX2X1 U438 ( .B(n320), .A(n243), .S(n297), .Y(n526) );
  INVX1 U439 ( .A(\data[5][8] ), .Y(n320) );
  MUX2X1 U440 ( .B(n321), .A(n245), .S(n297), .Y(n525) );
  INVX1 U441 ( .A(\data[5][7] ), .Y(n321) );
  MUX2X1 U442 ( .B(n322), .A(n247), .S(n297), .Y(n524) );
  INVX1 U443 ( .A(\data[5][6] ), .Y(n322) );
  MUX2X1 U444 ( .B(n323), .A(n249), .S(n297), .Y(n523) );
  INVX1 U445 ( .A(\data[5][5] ), .Y(n323) );
  MUX2X1 U446 ( .B(n324), .A(n251), .S(n297), .Y(n522) );
  INVX1 U447 ( .A(\data[5][4] ), .Y(n324) );
  MUX2X1 U448 ( .B(n325), .A(n253), .S(n297), .Y(n521) );
  INVX1 U449 ( .A(\data[5][3] ), .Y(n325) );
  MUX2X1 U450 ( .B(n326), .A(n255), .S(n297), .Y(n520) );
  INVX1 U451 ( .A(\data[5][2] ), .Y(n326) );
  MUX2X1 U452 ( .B(n327), .A(n257), .S(n297), .Y(n519) );
  INVX1 U453 ( .A(\data[5][1] ), .Y(n327) );
  MUX2X1 U454 ( .B(n328), .A(n259), .S(n297), .Y(n518) );
  OAI21X1 U455 ( .A(n261), .B(n329), .C(n_rst), .Y(n297) );
  INVX1 U456 ( .A(\data[5][0] ), .Y(n328) );
  MUX2X1 U457 ( .B(n330), .A(n196), .S(n11), .Y(n517) );
  INVX1 U458 ( .A(\data[4][31] ), .Y(n330) );
  MUX2X1 U459 ( .B(n332), .A(n199), .S(n11), .Y(n516) );
  INVX1 U460 ( .A(\data[4][30] ), .Y(n332) );
  MUX2X1 U461 ( .B(n333), .A(n201), .S(n11), .Y(n515) );
  INVX1 U462 ( .A(\data[4][29] ), .Y(n333) );
  MUX2X1 U463 ( .B(n334), .A(n203), .S(n11), .Y(n514) );
  INVX1 U464 ( .A(\data[4][28] ), .Y(n334) );
  MUX2X1 U465 ( .B(n335), .A(n205), .S(n11), .Y(n513) );
  INVX1 U466 ( .A(\data[4][27] ), .Y(n335) );
  MUX2X1 U467 ( .B(n336), .A(n207), .S(n11), .Y(n512) );
  INVX1 U468 ( .A(\data[4][26] ), .Y(n336) );
  MUX2X1 U469 ( .B(n337), .A(n209), .S(n11), .Y(n511) );
  INVX1 U470 ( .A(\data[4][25] ), .Y(n337) );
  MUX2X1 U471 ( .B(n338), .A(n211), .S(n11), .Y(n510) );
  INVX1 U472 ( .A(\data[4][24] ), .Y(n338) );
  MUX2X1 U473 ( .B(n339), .A(n213), .S(n11), .Y(n509) );
  INVX1 U474 ( .A(\data[4][23] ), .Y(n339) );
  MUX2X1 U475 ( .B(n340), .A(n215), .S(n11), .Y(n508) );
  INVX1 U476 ( .A(\data[4][22] ), .Y(n340) );
  MUX2X1 U477 ( .B(n341), .A(n217), .S(n11), .Y(n507) );
  INVX1 U478 ( .A(\data[4][21] ), .Y(n341) );
  MUX2X1 U479 ( .B(n342), .A(n219), .S(n11), .Y(n506) );
  INVX1 U480 ( .A(\data[4][20] ), .Y(n342) );
  MUX2X1 U481 ( .B(n343), .A(n221), .S(n11), .Y(n505) );
  INVX1 U482 ( .A(\data[4][19] ), .Y(n343) );
  MUX2X1 U483 ( .B(n344), .A(n223), .S(n11), .Y(n504) );
  INVX1 U484 ( .A(\data[4][18] ), .Y(n344) );
  MUX2X1 U485 ( .B(n345), .A(n225), .S(n11), .Y(n503) );
  INVX1 U486 ( .A(\data[4][17] ), .Y(n345) );
  MUX2X1 U487 ( .B(n346), .A(n227), .S(n11), .Y(n502) );
  INVX1 U488 ( .A(\data[4][16] ), .Y(n346) );
  MUX2X1 U489 ( .B(n347), .A(n229), .S(n11), .Y(n501) );
  INVX1 U490 ( .A(\data[4][15] ), .Y(n347) );
  MUX2X1 U491 ( .B(n348), .A(n231), .S(n11), .Y(n500) );
  INVX1 U492 ( .A(\data[4][14] ), .Y(n348) );
  MUX2X1 U493 ( .B(n349), .A(n233), .S(n11), .Y(n499) );
  INVX1 U494 ( .A(\data[4][13] ), .Y(n349) );
  MUX2X1 U495 ( .B(n350), .A(n235), .S(n11), .Y(n498) );
  INVX1 U496 ( .A(\data[4][12] ), .Y(n350) );
  MUX2X1 U497 ( .B(n351), .A(n237), .S(n11), .Y(n497) );
  INVX1 U498 ( .A(\data[4][11] ), .Y(n351) );
  MUX2X1 U499 ( .B(n352), .A(n239), .S(n331), .Y(n496) );
  INVX1 U500 ( .A(\data[4][10] ), .Y(n352) );
  MUX2X1 U501 ( .B(n353), .A(n241), .S(n331), .Y(n495) );
  INVX1 U502 ( .A(\data[4][9] ), .Y(n353) );
  MUX2X1 U503 ( .B(n354), .A(n243), .S(n331), .Y(n494) );
  INVX1 U504 ( .A(\data[4][8] ), .Y(n354) );
  MUX2X1 U505 ( .B(n355), .A(n245), .S(n331), .Y(n493) );
  INVX1 U506 ( .A(\data[4][7] ), .Y(n355) );
  MUX2X1 U507 ( .B(n356), .A(n247), .S(n331), .Y(n492) );
  INVX1 U508 ( .A(\data[4][6] ), .Y(n356) );
  MUX2X1 U509 ( .B(n357), .A(n249), .S(n331), .Y(n491) );
  INVX1 U510 ( .A(\data[4][5] ), .Y(n357) );
  MUX2X1 U511 ( .B(n614), .A(n251), .S(n331), .Y(n490) );
  INVX1 U512 ( .A(\data[4][4] ), .Y(n614) );
  MUX2X1 U513 ( .B(n615), .A(n253), .S(n331), .Y(n489) );
  INVX1 U514 ( .A(\data[4][3] ), .Y(n615) );
  MUX2X1 U515 ( .B(n616), .A(n255), .S(n331), .Y(n488) );
  INVX1 U516 ( .A(\data[4][2] ), .Y(n616) );
  MUX2X1 U517 ( .B(n617), .A(n257), .S(n331), .Y(n487) );
  INVX1 U518 ( .A(\data[4][1] ), .Y(n617) );
  MUX2X1 U519 ( .B(n618), .A(n259), .S(n331), .Y(n486) );
  OAI21X1 U520 ( .A(n619), .B(n261), .C(n_rst), .Y(n331) );
  NAND3X1 U521 ( .A(write_pointer[2]), .B(n620), .C(n13), .Y(n261) );
  INVX1 U522 ( .A(\data[4][0] ), .Y(n618) );
  MUX2X1 U523 ( .B(n622), .A(n196), .S(n4), .Y(n485) );
  INVX1 U524 ( .A(\data[3][31] ), .Y(n622) );
  MUX2X1 U525 ( .B(n624), .A(n199), .S(n4), .Y(n484) );
  INVX1 U526 ( .A(\data[3][30] ), .Y(n624) );
  MUX2X1 U527 ( .B(n625), .A(n201), .S(n4), .Y(n483) );
  INVX1 U528 ( .A(\data[3][29] ), .Y(n625) );
  MUX2X1 U529 ( .B(n626), .A(n203), .S(n4), .Y(n482) );
  INVX1 U530 ( .A(\data[3][28] ), .Y(n626) );
  MUX2X1 U531 ( .B(n627), .A(n205), .S(n4), .Y(n481) );
  INVX1 U532 ( .A(\data[3][27] ), .Y(n627) );
  MUX2X1 U533 ( .B(n628), .A(n207), .S(n4), .Y(n480) );
  INVX1 U534 ( .A(\data[3][26] ), .Y(n628) );
  MUX2X1 U535 ( .B(n629), .A(n209), .S(n4), .Y(n479) );
  INVX1 U536 ( .A(\data[3][25] ), .Y(n629) );
  MUX2X1 U537 ( .B(n630), .A(n211), .S(n4), .Y(n478) );
  INVX1 U538 ( .A(\data[3][24] ), .Y(n630) );
  MUX2X1 U539 ( .B(n631), .A(n213), .S(n4), .Y(n477) );
  INVX1 U540 ( .A(\data[3][23] ), .Y(n631) );
  MUX2X1 U541 ( .B(n632), .A(n215), .S(n4), .Y(n476) );
  INVX1 U542 ( .A(\data[3][22] ), .Y(n632) );
  MUX2X1 U543 ( .B(n633), .A(n217), .S(n4), .Y(n475) );
  INVX1 U544 ( .A(\data[3][21] ), .Y(n633) );
  MUX2X1 U545 ( .B(n634), .A(n219), .S(n4), .Y(n474) );
  INVX1 U546 ( .A(\data[3][20] ), .Y(n634) );
  MUX2X1 U547 ( .B(n635), .A(n221), .S(n4), .Y(n473) );
  INVX1 U548 ( .A(\data[3][19] ), .Y(n635) );
  MUX2X1 U549 ( .B(n636), .A(n223), .S(n4), .Y(n472) );
  INVX1 U550 ( .A(\data[3][18] ), .Y(n636) );
  MUX2X1 U551 ( .B(n637), .A(n225), .S(n4), .Y(n471) );
  INVX1 U552 ( .A(\data[3][17] ), .Y(n637) );
  MUX2X1 U553 ( .B(n638), .A(n227), .S(n4), .Y(n470) );
  INVX1 U554 ( .A(\data[3][16] ), .Y(n638) );
  MUX2X1 U555 ( .B(n639), .A(n229), .S(n4), .Y(n469) );
  INVX1 U556 ( .A(\data[3][15] ), .Y(n639) );
  MUX2X1 U557 ( .B(n640), .A(n231), .S(n4), .Y(n468) );
  INVX1 U558 ( .A(\data[3][14] ), .Y(n640) );
  MUX2X1 U559 ( .B(n641), .A(n233), .S(n4), .Y(n467) );
  INVX1 U560 ( .A(\data[3][13] ), .Y(n641) );
  MUX2X1 U561 ( .B(n642), .A(n235), .S(n4), .Y(n466) );
  INVX1 U562 ( .A(\data[3][12] ), .Y(n642) );
  MUX2X1 U563 ( .B(n643), .A(n237), .S(n4), .Y(n465) );
  INVX1 U564 ( .A(\data[3][11] ), .Y(n643) );
  MUX2X1 U565 ( .B(n644), .A(n239), .S(n623), .Y(n464) );
  INVX1 U566 ( .A(\data[3][10] ), .Y(n644) );
  MUX2X1 U567 ( .B(n645), .A(n241), .S(n623), .Y(n463) );
  INVX1 U568 ( .A(\data[3][9] ), .Y(n645) );
  MUX2X1 U569 ( .B(n646), .A(n243), .S(n623), .Y(n462) );
  INVX1 U570 ( .A(\data[3][8] ), .Y(n646) );
  MUX2X1 U571 ( .B(n647), .A(n245), .S(n623), .Y(n461) );
  INVX1 U572 ( .A(\data[3][7] ), .Y(n647) );
  MUX2X1 U573 ( .B(n648), .A(n247), .S(n623), .Y(n460) );
  INVX1 U574 ( .A(\data[3][6] ), .Y(n648) );
  MUX2X1 U575 ( .B(n649), .A(n249), .S(n623), .Y(n459) );
  INVX1 U576 ( .A(\data[3][5] ), .Y(n649) );
  MUX2X1 U577 ( .B(n650), .A(n251), .S(n623), .Y(n458) );
  INVX1 U578 ( .A(\data[3][4] ), .Y(n650) );
  MUX2X1 U579 ( .B(n651), .A(n253), .S(n623), .Y(n457) );
  INVX1 U580 ( .A(\data[3][3] ), .Y(n651) );
  MUX2X1 U581 ( .B(n652), .A(n255), .S(n623), .Y(n456) );
  INVX1 U582 ( .A(\data[3][2] ), .Y(n652) );
  MUX2X1 U583 ( .B(n653), .A(n257), .S(n623), .Y(n455) );
  INVX1 U584 ( .A(\data[3][1] ), .Y(n653) );
  MUX2X1 U585 ( .B(n654), .A(n259), .S(n623), .Y(n454) );
  OAI21X1 U586 ( .A(n260), .B(n655), .C(n_rst), .Y(n623) );
  INVX1 U587 ( .A(\data[3][0] ), .Y(n654) );
  MUX2X1 U588 ( .B(n656), .A(n196), .S(n8), .Y(n453) );
  INVX1 U589 ( .A(\data[2][31] ), .Y(n656) );
  MUX2X1 U590 ( .B(n658), .A(n199), .S(n8), .Y(n452) );
  INVX1 U591 ( .A(\data[2][30] ), .Y(n658) );
  MUX2X1 U592 ( .B(n659), .A(n201), .S(n8), .Y(n451) );
  INVX1 U593 ( .A(\data[2][29] ), .Y(n659) );
  MUX2X1 U594 ( .B(n660), .A(n203), .S(n8), .Y(n450) );
  INVX1 U595 ( .A(\data[2][28] ), .Y(n660) );
  MUX2X1 U596 ( .B(n661), .A(n205), .S(n8), .Y(n449) );
  INVX1 U597 ( .A(\data[2][27] ), .Y(n661) );
  MUX2X1 U598 ( .B(n662), .A(n207), .S(n8), .Y(n448) );
  INVX1 U599 ( .A(\data[2][26] ), .Y(n662) );
  MUX2X1 U600 ( .B(n663), .A(n209), .S(n8), .Y(n447) );
  INVX1 U601 ( .A(\data[2][25] ), .Y(n663) );
  MUX2X1 U602 ( .B(n664), .A(n211), .S(n8), .Y(n446) );
  INVX1 U603 ( .A(\data[2][24] ), .Y(n664) );
  MUX2X1 U604 ( .B(n665), .A(n213), .S(n8), .Y(n445) );
  INVX1 U605 ( .A(\data[2][23] ), .Y(n665) );
  MUX2X1 U606 ( .B(n666), .A(n215), .S(n8), .Y(n444) );
  INVX1 U607 ( .A(\data[2][22] ), .Y(n666) );
  MUX2X1 U608 ( .B(n667), .A(n217), .S(n8), .Y(n443) );
  INVX1 U609 ( .A(\data[2][21] ), .Y(n667) );
  MUX2X1 U610 ( .B(n668), .A(n219), .S(n8), .Y(n442) );
  INVX1 U611 ( .A(\data[2][20] ), .Y(n668) );
  MUX2X1 U612 ( .B(n669), .A(n221), .S(n8), .Y(n441) );
  INVX1 U613 ( .A(\data[2][19] ), .Y(n669) );
  MUX2X1 U614 ( .B(n670), .A(n223), .S(n8), .Y(n440) );
  INVX1 U615 ( .A(\data[2][18] ), .Y(n670) );
  MUX2X1 U616 ( .B(n671), .A(n225), .S(n8), .Y(n439) );
  INVX1 U617 ( .A(\data[2][17] ), .Y(n671) );
  MUX2X1 U618 ( .B(n672), .A(n227), .S(n8), .Y(n438) );
  INVX1 U619 ( .A(\data[2][16] ), .Y(n672) );
  MUX2X1 U620 ( .B(n673), .A(n229), .S(n8), .Y(n437) );
  INVX1 U621 ( .A(\data[2][15] ), .Y(n673) );
  MUX2X1 U622 ( .B(n674), .A(n231), .S(n8), .Y(n436) );
  INVX1 U623 ( .A(\data[2][14] ), .Y(n674) );
  MUX2X1 U624 ( .B(n675), .A(n233), .S(n8), .Y(n435) );
  INVX1 U625 ( .A(\data[2][13] ), .Y(n675) );
  MUX2X1 U626 ( .B(n676), .A(n235), .S(n8), .Y(n434) );
  INVX1 U627 ( .A(\data[2][12] ), .Y(n676) );
  MUX2X1 U628 ( .B(n677), .A(n237), .S(n8), .Y(n433) );
  INVX1 U629 ( .A(\data[2][11] ), .Y(n677) );
  MUX2X1 U630 ( .B(n678), .A(n239), .S(n657), .Y(n432) );
  INVX1 U631 ( .A(\data[2][10] ), .Y(n678) );
  MUX2X1 U632 ( .B(n679), .A(n241), .S(n657), .Y(n431) );
  INVX1 U633 ( .A(\data[2][9] ), .Y(n679) );
  MUX2X1 U634 ( .B(n680), .A(n243), .S(n657), .Y(n430) );
  INVX1 U635 ( .A(\data[2][8] ), .Y(n680) );
  MUX2X1 U636 ( .B(n681), .A(n245), .S(n657), .Y(n429) );
  INVX1 U637 ( .A(\data[2][7] ), .Y(n681) );
  MUX2X1 U638 ( .B(n682), .A(n247), .S(n657), .Y(n428) );
  INVX1 U639 ( .A(\data[2][6] ), .Y(n682) );
  MUX2X1 U640 ( .B(n683), .A(n249), .S(n657), .Y(n427) );
  INVX1 U641 ( .A(\data[2][5] ), .Y(n683) );
  MUX2X1 U642 ( .B(n684), .A(n251), .S(n657), .Y(n426) );
  INVX1 U643 ( .A(\data[2][4] ), .Y(n684) );
  MUX2X1 U644 ( .B(n685), .A(n253), .S(n657), .Y(n425) );
  INVX1 U645 ( .A(\data[2][3] ), .Y(n685) );
  MUX2X1 U646 ( .B(n686), .A(n255), .S(n657), .Y(n424) );
  INVX1 U647 ( .A(\data[2][2] ), .Y(n686) );
  MUX2X1 U648 ( .B(n687), .A(n257), .S(n657), .Y(n423) );
  INVX1 U649 ( .A(\data[2][1] ), .Y(n687) );
  MUX2X1 U650 ( .B(n688), .A(n259), .S(n657), .Y(n422) );
  OAI21X1 U651 ( .A(n655), .B(n295), .C(n_rst), .Y(n657) );
  NAND2X1 U652 ( .A(write_pointer[1]), .B(n689), .Y(n295) );
  INVX1 U653 ( .A(\data[2][0] ), .Y(n688) );
  MUX2X1 U654 ( .B(n690), .A(n196), .S(n12), .Y(n421) );
  INVX1 U655 ( .A(\data[1][31] ), .Y(n690) );
  MUX2X1 U656 ( .B(n692), .A(n199), .S(n12), .Y(n420) );
  INVX1 U657 ( .A(\data[1][30] ), .Y(n692) );
  MUX2X1 U658 ( .B(n693), .A(n201), .S(n12), .Y(n419) );
  INVX1 U659 ( .A(\data[1][29] ), .Y(n693) );
  MUX2X1 U660 ( .B(n694), .A(n203), .S(n12), .Y(n418) );
  INVX1 U661 ( .A(\data[1][28] ), .Y(n694) );
  MUX2X1 U662 ( .B(n695), .A(n205), .S(n12), .Y(n417) );
  INVX1 U663 ( .A(\data[1][27] ), .Y(n695) );
  MUX2X1 U664 ( .B(n696), .A(n207), .S(n12), .Y(n416) );
  INVX1 U665 ( .A(\data[1][26] ), .Y(n696) );
  MUX2X1 U666 ( .B(n697), .A(n209), .S(n12), .Y(n415) );
  INVX1 U667 ( .A(\data[1][25] ), .Y(n697) );
  MUX2X1 U668 ( .B(n698), .A(n211), .S(n12), .Y(n414) );
  INVX1 U669 ( .A(\data[1][24] ), .Y(n698) );
  MUX2X1 U670 ( .B(n699), .A(n213), .S(n12), .Y(n413) );
  INVX1 U671 ( .A(\data[1][23] ), .Y(n699) );
  MUX2X1 U672 ( .B(n700), .A(n215), .S(n12), .Y(n412) );
  INVX1 U673 ( .A(\data[1][22] ), .Y(n700) );
  MUX2X1 U674 ( .B(n701), .A(n217), .S(n12), .Y(n411) );
  INVX1 U675 ( .A(\data[1][21] ), .Y(n701) );
  MUX2X1 U676 ( .B(n702), .A(n219), .S(n12), .Y(n410) );
  INVX1 U677 ( .A(\data[1][20] ), .Y(n702) );
  MUX2X1 U678 ( .B(n703), .A(n221), .S(n12), .Y(n409) );
  INVX1 U679 ( .A(\data[1][19] ), .Y(n703) );
  MUX2X1 U680 ( .B(n704), .A(n223), .S(n12), .Y(n408) );
  INVX1 U681 ( .A(\data[1][18] ), .Y(n704) );
  MUX2X1 U682 ( .B(n705), .A(n225), .S(n12), .Y(n407) );
  INVX1 U683 ( .A(\data[1][17] ), .Y(n705) );
  MUX2X1 U684 ( .B(n706), .A(n227), .S(n12), .Y(n406) );
  INVX1 U685 ( .A(\data[1][16] ), .Y(n706) );
  MUX2X1 U686 ( .B(n707), .A(n229), .S(n12), .Y(n405) );
  INVX1 U687 ( .A(\data[1][15] ), .Y(n707) );
  MUX2X1 U688 ( .B(n708), .A(n231), .S(n12), .Y(n404) );
  INVX1 U689 ( .A(\data[1][14] ), .Y(n708) );
  MUX2X1 U690 ( .B(n709), .A(n233), .S(n12), .Y(n403) );
  INVX1 U691 ( .A(\data[1][13] ), .Y(n709) );
  MUX2X1 U692 ( .B(n710), .A(n235), .S(n12), .Y(n402) );
  INVX1 U693 ( .A(\data[1][12] ), .Y(n710) );
  MUX2X1 U694 ( .B(n711), .A(n237), .S(n12), .Y(n401) );
  INVX1 U695 ( .A(\data[1][11] ), .Y(n711) );
  MUX2X1 U696 ( .B(n712), .A(n239), .S(n691), .Y(n400) );
  INVX1 U697 ( .A(\data[1][10] ), .Y(n712) );
  MUX2X1 U698 ( .B(n713), .A(n241), .S(n691), .Y(n399) );
  INVX1 U699 ( .A(\data[1][9] ), .Y(n713) );
  MUX2X1 U700 ( .B(n714), .A(n243), .S(n691), .Y(n398) );
  INVX1 U701 ( .A(\data[1][8] ), .Y(n714) );
  MUX2X1 U702 ( .B(n715), .A(n245), .S(n691), .Y(n397) );
  INVX1 U703 ( .A(\data[1][7] ), .Y(n715) );
  MUX2X1 U704 ( .B(n716), .A(n247), .S(n691), .Y(n396) );
  INVX1 U705 ( .A(\data[1][6] ), .Y(n716) );
  MUX2X1 U706 ( .B(n717), .A(n249), .S(n691), .Y(n395) );
  INVX1 U707 ( .A(\data[1][5] ), .Y(n717) );
  MUX2X1 U708 ( .B(n718), .A(n251), .S(n691), .Y(n394) );
  INVX1 U709 ( .A(\data[1][4] ), .Y(n718) );
  MUX2X1 U710 ( .B(n719), .A(n253), .S(n691), .Y(n393) );
  INVX1 U711 ( .A(\data[1][3] ), .Y(n719) );
  MUX2X1 U712 ( .B(n720), .A(n255), .S(n691), .Y(n392) );
  INVX1 U713 ( .A(\data[1][2] ), .Y(n720) );
  MUX2X1 U714 ( .B(n721), .A(n257), .S(n691), .Y(n391) );
  INVX1 U715 ( .A(\data[1][1] ), .Y(n721) );
  MUX2X1 U716 ( .B(n722), .A(n259), .S(n691), .Y(n390) );
  OAI21X1 U717 ( .A(n655), .B(n329), .C(n_rst), .Y(n691) );
  NAND2X1 U718 ( .A(write_pointer[0]), .B(n723), .Y(n329) );
  INVX1 U719 ( .A(\data[1][0] ), .Y(n722) );
  MUX2X1 U720 ( .B(n724), .A(n196), .S(n18), .Y(n389) );
  NAND2X1 U721 ( .A(write_data[31]), .B(n13), .Y(n196) );
  INVX1 U722 ( .A(\data[0][31] ), .Y(n724) );
  MUX2X1 U723 ( .B(n726), .A(n199), .S(n18), .Y(n388) );
  NAND2X1 U724 ( .A(write_data[30]), .B(n13), .Y(n199) );
  INVX1 U725 ( .A(\data[0][30] ), .Y(n726) );
  MUX2X1 U726 ( .B(n727), .A(n201), .S(n18), .Y(n387) );
  NAND2X1 U727 ( .A(write_data[29]), .B(n13), .Y(n201) );
  INVX1 U728 ( .A(\data[0][29] ), .Y(n727) );
  MUX2X1 U729 ( .B(n728), .A(n203), .S(n18), .Y(n386) );
  NAND2X1 U730 ( .A(write_data[28]), .B(n13), .Y(n203) );
  INVX1 U731 ( .A(\data[0][28] ), .Y(n728) );
  MUX2X1 U732 ( .B(n729), .A(n205), .S(n18), .Y(n385) );
  NAND2X1 U733 ( .A(write_data[27]), .B(n13), .Y(n205) );
  INVX1 U734 ( .A(\data[0][27] ), .Y(n729) );
  MUX2X1 U735 ( .B(n730), .A(n207), .S(n18), .Y(n384) );
  NAND2X1 U736 ( .A(write_data[26]), .B(n13), .Y(n207) );
  INVX1 U737 ( .A(\data[0][26] ), .Y(n730) );
  MUX2X1 U738 ( .B(n731), .A(n209), .S(n18), .Y(n383) );
  NAND2X1 U739 ( .A(write_data[25]), .B(n13), .Y(n209) );
  INVX1 U740 ( .A(\data[0][25] ), .Y(n731) );
  MUX2X1 U741 ( .B(n732), .A(n211), .S(n18), .Y(n382) );
  NAND2X1 U742 ( .A(write_data[24]), .B(n13), .Y(n211) );
  INVX1 U743 ( .A(\data[0][24] ), .Y(n732) );
  MUX2X1 U744 ( .B(n733), .A(n213), .S(n18), .Y(n381) );
  NAND2X1 U745 ( .A(write_data[23]), .B(n13), .Y(n213) );
  INVX1 U746 ( .A(\data[0][23] ), .Y(n733) );
  MUX2X1 U747 ( .B(n734), .A(n215), .S(n18), .Y(n380) );
  NAND2X1 U748 ( .A(write_data[22]), .B(n13), .Y(n215) );
  INVX1 U749 ( .A(\data[0][22] ), .Y(n734) );
  MUX2X1 U750 ( .B(n735), .A(n217), .S(n18), .Y(n379) );
  NAND2X1 U751 ( .A(write_data[21]), .B(n13), .Y(n217) );
  INVX1 U752 ( .A(\data[0][21] ), .Y(n735) );
  MUX2X1 U753 ( .B(n736), .A(n219), .S(n18), .Y(n378) );
  NAND2X1 U754 ( .A(write_data[20]), .B(n13), .Y(n219) );
  INVX1 U755 ( .A(\data[0][20] ), .Y(n736) );
  MUX2X1 U756 ( .B(n737), .A(n221), .S(n18), .Y(n377) );
  NAND2X1 U757 ( .A(write_data[19]), .B(n13), .Y(n221) );
  INVX1 U758 ( .A(\data[0][19] ), .Y(n737) );
  MUX2X1 U759 ( .B(n738), .A(n223), .S(n18), .Y(n376) );
  NAND2X1 U760 ( .A(write_data[18]), .B(n13), .Y(n223) );
  INVX1 U761 ( .A(\data[0][18] ), .Y(n738) );
  MUX2X1 U762 ( .B(n739), .A(n225), .S(n18), .Y(n375) );
  NAND2X1 U763 ( .A(write_data[17]), .B(n13), .Y(n225) );
  INVX1 U764 ( .A(\data[0][17] ), .Y(n739) );
  MUX2X1 U765 ( .B(n740), .A(n227), .S(n18), .Y(n374) );
  NAND2X1 U766 ( .A(write_data[16]), .B(n13), .Y(n227) );
  INVX1 U767 ( .A(\data[0][16] ), .Y(n740) );
  MUX2X1 U768 ( .B(n741), .A(n229), .S(n18), .Y(n373) );
  NAND2X1 U769 ( .A(write_data[15]), .B(n13), .Y(n229) );
  INVX1 U770 ( .A(\data[0][15] ), .Y(n741) );
  MUX2X1 U771 ( .B(n742), .A(n231), .S(n18), .Y(n372) );
  NAND2X1 U772 ( .A(write_data[14]), .B(n13), .Y(n231) );
  INVX1 U773 ( .A(\data[0][14] ), .Y(n742) );
  MUX2X1 U774 ( .B(n743), .A(n233), .S(n18), .Y(n371) );
  NAND2X1 U775 ( .A(write_data[13]), .B(n13), .Y(n233) );
  INVX1 U776 ( .A(\data[0][13] ), .Y(n743) );
  MUX2X1 U777 ( .B(n744), .A(n235), .S(n18), .Y(n370) );
  NAND2X1 U778 ( .A(write_data[12]), .B(n13), .Y(n235) );
  INVX1 U779 ( .A(\data[0][12] ), .Y(n744) );
  MUX2X1 U780 ( .B(n745), .A(n237), .S(n18), .Y(n369) );
  NAND2X1 U781 ( .A(write_data[11]), .B(n13), .Y(n237) );
  INVX1 U782 ( .A(\data[0][11] ), .Y(n745) );
  MUX2X1 U783 ( .B(n746), .A(n239), .S(n725), .Y(n368) );
  NAND2X1 U784 ( .A(write_data[10]), .B(n13), .Y(n239) );
  INVX1 U785 ( .A(\data[0][10] ), .Y(n746) );
  MUX2X1 U786 ( .B(n747), .A(n241), .S(n725), .Y(n367) );
  NAND2X1 U787 ( .A(write_data[9]), .B(n13), .Y(n241) );
  INVX1 U788 ( .A(\data[0][9] ), .Y(n747) );
  MUX2X1 U789 ( .B(n748), .A(n243), .S(n725), .Y(n366) );
  NAND2X1 U790 ( .A(write_data[8]), .B(n13), .Y(n243) );
  INVX1 U791 ( .A(\data[0][8] ), .Y(n748) );
  MUX2X1 U792 ( .B(n749), .A(n245), .S(n725), .Y(n365) );
  NAND2X1 U793 ( .A(write_data[7]), .B(n13), .Y(n245) );
  INVX1 U794 ( .A(\data[0][7] ), .Y(n749) );
  MUX2X1 U795 ( .B(n750), .A(n247), .S(n725), .Y(n364) );
  NAND2X1 U796 ( .A(write_data[6]), .B(n13), .Y(n247) );
  INVX1 U797 ( .A(\data[0][6] ), .Y(n750) );
  MUX2X1 U798 ( .B(n751), .A(n249), .S(n725), .Y(n363) );
  NAND2X1 U799 ( .A(write_data[5]), .B(n13), .Y(n249) );
  INVX1 U800 ( .A(\data[0][5] ), .Y(n751) );
  MUX2X1 U801 ( .B(n752), .A(n251), .S(n725), .Y(n362) );
  NAND2X1 U802 ( .A(write_data[4]), .B(n13), .Y(n251) );
  INVX1 U803 ( .A(\data[0][4] ), .Y(n752) );
  MUX2X1 U804 ( .B(n753), .A(n253), .S(n725), .Y(n361) );
  NAND2X1 U805 ( .A(write_data[3]), .B(n13), .Y(n253) );
  INVX1 U806 ( .A(\data[0][3] ), .Y(n753) );
  MUX2X1 U807 ( .B(n754), .A(n255), .S(n725), .Y(n360) );
  NAND2X1 U808 ( .A(write_data[2]), .B(n13), .Y(n255) );
  INVX1 U809 ( .A(\data[0][2] ), .Y(n754) );
  MUX2X1 U810 ( .B(n755), .A(n257), .S(n725), .Y(n359) );
  NAND2X1 U811 ( .A(write_data[1]), .B(n13), .Y(n257) );
  INVX1 U812 ( .A(\data[0][1] ), .Y(n755) );
  MUX2X1 U813 ( .B(n756), .A(n259), .S(n725), .Y(n358) );
  OAI21X1 U814 ( .A(n619), .B(n655), .C(n_rst), .Y(n725) );
  NAND3X1 U815 ( .A(n757), .B(n620), .C(n13), .Y(n655) );
  INVX1 U816 ( .A(write_pointer[3]), .Y(n620) );
  NAND2X1 U817 ( .A(write_data[0]), .B(n13), .Y(n259) );
  NOR2X1 U818 ( .A(n758), .B(N92), .Y(n621) );
  INVX1 U819 ( .A(n_rst), .Y(n758) );
  INVX1 U820 ( .A(\data[0][0] ), .Y(n756) );
  AOI21X1 U821 ( .A(n194), .B(n759), .C(n760), .Y(_3_net_) );
  OAI21X1 U822 ( .A(n760), .B(n194), .C(n761), .Y(_1_net_) );
  NAND3X1 U823 ( .A(\read_pointer[3] ), .B(n762), .C(n763), .Y(n761) );
  NOR2X1 U824 ( .A(N21), .B(N20), .Y(n763) );
  NAND3X1 U825 ( .A(n764), .B(n765), .C(n766), .Y(n194) );
  NOR2X1 U826 ( .A(n767), .B(n768), .Y(n766) );
  XOR2X1 U827 ( .A(write_pointer[0]), .B(N19), .Y(n768) );
  XOR2X1 U828 ( .A(N21), .B(n757), .Y(n765) );
  XOR2X1 U829 ( .A(n769), .B(write_pointer[3]), .Y(n764) );
  INVX1 U830 ( .A(n770), .Y(n760) );
  OAI21X1 U831 ( .A(n770), .B(n759), .C(n192), .Y(N92) );
  NAND3X1 U832 ( .A(n771), .B(n772), .C(n773), .Y(n192) );
  AOI21X1 U833 ( .A(n774), .B(n769), .C(n775), .Y(n773) );
  XOR2X1 U834 ( .A(write_pointer[3]), .B(n776), .Y(n775) );
  NOR2X1 U835 ( .A(n774), .B(n769), .Y(n776) );
  INVX1 U836 ( .A(\read_pointer[3] ), .Y(n769) );
  NOR2X1 U837 ( .A(n757), .B(n260), .Y(n774) );
  XOR2X1 U838 ( .A(n260), .B(n777), .Y(n772) );
  XOR2X1 U839 ( .A(write_pointer[2]), .B(N21), .Y(n777) );
  NAND2X1 U840 ( .A(write_pointer[1]), .B(write_pointer[0]), .Y(n260) );
  MUX2X1 U841 ( .B(n778), .A(n779), .S(write_pointer[0]), .Y(n771) );
  NAND2X1 U842 ( .A(n767), .B(n762), .Y(n779) );
  OR2X1 U843 ( .A(n762), .B(n767), .Y(n778) );
  XOR2X1 U844 ( .A(n780), .B(n723), .Y(n767) );
  NAND3X1 U845 ( .A(write_pointer[3]), .B(n757), .C(n781), .Y(n759) );
  INVX1 U846 ( .A(n619), .Y(n781) );
  NAND2X1 U847 ( .A(n689), .B(n723), .Y(n619) );
  INVX1 U848 ( .A(write_pointer[1]), .Y(n723) );
  INVX1 U849 ( .A(write_pointer[0]), .Y(n689) );
  INVX1 U850 ( .A(write_pointer[2]), .Y(n757) );
  NAND3X1 U851 ( .A(n762), .B(n780), .C(n782), .Y(n770) );
  NOR2X1 U852 ( .A(\read_pointer[3] ), .B(N21), .Y(n782) );
  INVX1 U853 ( .A(N20), .Y(n780) );
  INVX1 U854 ( .A(N19), .Y(n762) );
endmodule


module flex_counter_NUM_CNT_BITS4_3 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   temp_rollover_flag, n1, n2, n3, n4, n5, n6, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37;
  wire   [3:0] temp_count_out;

  DFFSR \count_out_reg[0]  ( .D(temp_count_out[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(temp_count_out[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[1]) );
  DFFSR \count_out_reg[3]  ( .D(temp_count_out[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(temp_count_out[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[2]) );
  DFFSR rollover_flag_reg ( .D(temp_rollover_flag), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(rollover_flag) );
  NOR2X1 U8 ( .A(n1), .B(n2), .Y(temp_rollover_flag) );
  NAND2X1 U9 ( .A(n3), .B(n4), .Y(n2) );
  XNOR2X1 U10 ( .A(rollover_val[1]), .B(temp_count_out[1]), .Y(n4) );
  XNOR2X1 U11 ( .A(rollover_val[2]), .B(temp_count_out[2]), .Y(n3) );
  NAND3X1 U12 ( .A(n5), .B(n6), .C(n12), .Y(n1) );
  XNOR2X1 U13 ( .A(rollover_val[0]), .B(temp_count_out[0]), .Y(n12) );
  XNOR2X1 U14 ( .A(rollover_val[3]), .B(temp_count_out[3]), .Y(n5) );
  OAI22X1 U15 ( .A(n13), .B(n14), .C(n15), .D(n16), .Y(temp_count_out[3]) );
  OAI22X1 U16 ( .A(n17), .B(n14), .C(n15), .D(n18), .Y(temp_count_out[2]) );
  OAI22X1 U17 ( .A(n19), .B(n14), .C(n15), .D(n20), .Y(temp_count_out[1]) );
  NAND3X1 U18 ( .A(n21), .B(n6), .C(count_enable), .Y(n14) );
  INVX1 U19 ( .A(n22), .Y(n21) );
  OAI22X1 U20 ( .A(n15), .B(n23), .C(n24), .D(n25), .Y(temp_count_out[0]) );
  OAI21X1 U21 ( .A(n23), .B(n22), .C(n6), .Y(n25) );
  OAI22X1 U22 ( .A(n26), .B(n27), .C(rollover_val[3]), .D(n13), .Y(n22) );
  OAI21X1 U23 ( .A(n28), .B(n29), .C(n30), .Y(n27) );
  OAI21X1 U24 ( .A(n17), .B(n31), .C(rollover_val[2]), .Y(n30) );
  INVX1 U25 ( .A(n17), .Y(n29) );
  XOR2X1 U26 ( .A(n32), .B(count_out[2]), .Y(n17) );
  INVX1 U27 ( .A(n31), .Y(n28) );
  OAI21X1 U28 ( .A(n33), .B(n34), .C(n35), .Y(n31) );
  OAI21X1 U29 ( .A(n19), .B(n36), .C(rollover_val[1]), .Y(n35) );
  INVX1 U30 ( .A(n33), .Y(n36) );
  INVX1 U31 ( .A(n34), .Y(n19) );
  XNOR2X1 U32 ( .A(n20), .B(count_out[0]), .Y(n34) );
  INVX1 U33 ( .A(count_out[1]), .Y(n20) );
  NOR2X1 U34 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n33) );
  AND2X1 U35 ( .A(n13), .B(rollover_val[3]), .Y(n26) );
  XOR2X1 U36 ( .A(n16), .B(n37), .Y(n13) );
  NOR2X1 U37 ( .A(n32), .B(n18), .Y(n37) );
  INVX1 U38 ( .A(count_out[2]), .Y(n18) );
  NAND2X1 U39 ( .A(count_out[1]), .B(count_out[0]), .Y(n32) );
  INVX1 U40 ( .A(count_out[3]), .Y(n16) );
  INVX1 U41 ( .A(count_out[0]), .Y(n23) );
  NAND2X1 U42 ( .A(n6), .B(n24), .Y(n15) );
  INVX1 U43 ( .A(count_enable), .Y(n24) );
  INVX1 U44 ( .A(clear), .Y(n6) );
endmodule


module flex_counter_NUM_CNT_BITS4_2 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   temp_rollover_flag, n1, n2, n3, n4, n5, n6, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37;
  wire   [3:0] temp_count_out;

  DFFSR \count_out_reg[0]  ( .D(temp_count_out[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(temp_count_out[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[1]) );
  DFFSR \count_out_reg[3]  ( .D(temp_count_out[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(temp_count_out[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[2]) );
  DFFSR rollover_flag_reg ( .D(temp_rollover_flag), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(rollover_flag) );
  NOR2X1 U8 ( .A(n1), .B(n2), .Y(temp_rollover_flag) );
  NAND2X1 U9 ( .A(n3), .B(n4), .Y(n2) );
  XNOR2X1 U10 ( .A(rollover_val[1]), .B(temp_count_out[1]), .Y(n4) );
  XNOR2X1 U11 ( .A(rollover_val[2]), .B(temp_count_out[2]), .Y(n3) );
  NAND3X1 U12 ( .A(n5), .B(n6), .C(n12), .Y(n1) );
  XNOR2X1 U13 ( .A(rollover_val[0]), .B(temp_count_out[0]), .Y(n12) );
  XNOR2X1 U14 ( .A(rollover_val[3]), .B(temp_count_out[3]), .Y(n5) );
  OAI22X1 U15 ( .A(n13), .B(n14), .C(n15), .D(n16), .Y(temp_count_out[3]) );
  OAI22X1 U16 ( .A(n17), .B(n14), .C(n15), .D(n18), .Y(temp_count_out[2]) );
  OAI22X1 U17 ( .A(n19), .B(n14), .C(n15), .D(n20), .Y(temp_count_out[1]) );
  NAND3X1 U18 ( .A(n21), .B(n6), .C(count_enable), .Y(n14) );
  INVX1 U19 ( .A(n22), .Y(n21) );
  OAI22X1 U20 ( .A(n15), .B(n23), .C(n24), .D(n25), .Y(temp_count_out[0]) );
  OAI21X1 U21 ( .A(n23), .B(n22), .C(n6), .Y(n25) );
  OAI22X1 U22 ( .A(n26), .B(n27), .C(rollover_val[3]), .D(n13), .Y(n22) );
  OAI21X1 U23 ( .A(n28), .B(n29), .C(n30), .Y(n27) );
  OAI21X1 U24 ( .A(n17), .B(n31), .C(rollover_val[2]), .Y(n30) );
  INVX1 U25 ( .A(n17), .Y(n29) );
  XOR2X1 U26 ( .A(n32), .B(count_out[2]), .Y(n17) );
  INVX1 U27 ( .A(n31), .Y(n28) );
  OAI21X1 U28 ( .A(n33), .B(n34), .C(n35), .Y(n31) );
  OAI21X1 U29 ( .A(n19), .B(n36), .C(rollover_val[1]), .Y(n35) );
  INVX1 U30 ( .A(n33), .Y(n36) );
  INVX1 U31 ( .A(n34), .Y(n19) );
  XNOR2X1 U32 ( .A(n20), .B(count_out[0]), .Y(n34) );
  INVX1 U33 ( .A(count_out[1]), .Y(n20) );
  NOR2X1 U34 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n33) );
  AND2X1 U35 ( .A(n13), .B(rollover_val[3]), .Y(n26) );
  XOR2X1 U36 ( .A(n16), .B(n37), .Y(n13) );
  NOR2X1 U37 ( .A(n32), .B(n18), .Y(n37) );
  INVX1 U38 ( .A(count_out[2]), .Y(n18) );
  NAND2X1 U39 ( .A(count_out[1]), .B(count_out[0]), .Y(n32) );
  INVX1 U40 ( .A(count_out[3]), .Y(n16) );
  INVX1 U41 ( .A(count_out[0]), .Y(n23) );
  NAND2X1 U42 ( .A(n6), .B(n24), .Y(n15) );
  INVX1 U43 ( .A(count_enable), .Y(n24) );
  INVX1 U44 ( .A(clear), .Y(n6) );
endmodule


module Command_FIFO_storage ( write_clk, read_clk, n_rst, write_command, 
        read_command, write_data, fifo_full, fifo_empty, read_data );
  input [31:0] write_data;
  output [31:0] read_data;
  input write_clk, read_clk, n_rst, write_command, read_command;
  output fifo_full, fifo_empty;
  wire   N19, N20, N21, read_enable, \read_pointer[3] , _1_net_, write_enable,
         _3_net_, \data[7][31] , \data[7][30] , \data[7][29] , \data[7][28] ,
         \data[7][27] , \data[7][26] , \data[7][25] , \data[7][24] ,
         \data[7][23] , \data[7][22] , \data[7][21] , \data[7][20] ,
         \data[7][19] , \data[7][18] , \data[7][17] , \data[7][16] ,
         \data[7][15] , \data[7][14] , \data[7][13] , \data[7][12] ,
         \data[7][11] , \data[7][10] , \data[7][9] , \data[7][8] ,
         \data[7][7] , \data[7][6] , \data[7][5] , \data[7][4] , \data[7][3] ,
         \data[7][2] , \data[7][1] , \data[7][0] , \data[6][31] ,
         \data[6][30] , \data[6][29] , \data[6][28] , \data[6][27] ,
         \data[6][26] , \data[6][25] , \data[6][24] , \data[6][23] ,
         \data[6][22] , \data[6][21] , \data[6][20] , \data[6][19] ,
         \data[6][18] , \data[6][17] , \data[6][16] , \data[6][15] ,
         \data[6][14] , \data[6][13] , \data[6][12] , \data[6][11] ,
         \data[6][10] , \data[6][9] , \data[6][8] , \data[6][7] , \data[6][6] ,
         \data[6][5] , \data[6][4] , \data[6][3] , \data[6][2] , \data[6][1] ,
         \data[6][0] , \data[5][31] , \data[5][30] , \data[5][29] ,
         \data[5][28] , \data[5][27] , \data[5][26] , \data[5][25] ,
         \data[5][24] , \data[5][23] , \data[5][22] , \data[5][21] ,
         \data[5][20] , \data[5][19] , \data[5][18] , \data[5][17] ,
         \data[5][16] , \data[5][15] , \data[5][14] , \data[5][13] ,
         \data[5][12] , \data[5][11] , \data[5][10] , \data[5][9] ,
         \data[5][8] , \data[5][7] , \data[5][6] , \data[5][5] , \data[5][4] ,
         \data[5][3] , \data[5][2] , \data[5][1] , \data[5][0] , \data[4][31] ,
         \data[4][30] , \data[4][29] , \data[4][28] , \data[4][27] ,
         \data[4][26] , \data[4][25] , \data[4][24] , \data[4][23] ,
         \data[4][22] , \data[4][21] , \data[4][20] , \data[4][19] ,
         \data[4][18] , \data[4][17] , \data[4][16] , \data[4][15] ,
         \data[4][14] , \data[4][13] , \data[4][12] , \data[4][11] ,
         \data[4][10] , \data[4][9] , \data[4][8] , \data[4][7] , \data[4][6] ,
         \data[4][5] , \data[4][4] , \data[4][3] , \data[4][2] , \data[4][1] ,
         \data[4][0] , \data[3][31] , \data[3][30] , \data[3][29] ,
         \data[3][28] , \data[3][27] , \data[3][26] , \data[3][25] ,
         \data[3][24] , \data[3][23] , \data[3][22] , \data[3][21] ,
         \data[3][20] , \data[3][19] , \data[3][18] , \data[3][17] ,
         \data[3][16] , \data[3][15] , \data[3][14] , \data[3][13] ,
         \data[3][12] , \data[3][11] , \data[3][10] , \data[3][9] ,
         \data[3][8] , \data[3][7] , \data[3][6] , \data[3][5] , \data[3][4] ,
         \data[3][3] , \data[3][2] , \data[3][1] , \data[3][0] , \data[2][31] ,
         \data[2][30] , \data[2][29] , \data[2][28] , \data[2][27] ,
         \data[2][26] , \data[2][25] , \data[2][24] , \data[2][23] ,
         \data[2][22] , \data[2][21] , \data[2][20] , \data[2][19] ,
         \data[2][18] , \data[2][17] , \data[2][16] , \data[2][15] ,
         \data[2][14] , \data[2][13] , \data[2][12] , \data[2][11] ,
         \data[2][10] , \data[2][9] , \data[2][8] , \data[2][7] , \data[2][6] ,
         \data[2][5] , \data[2][4] , \data[2][3] , \data[2][2] , \data[2][1] ,
         \data[2][0] , \data[1][31] , \data[1][30] , \data[1][29] ,
         \data[1][28] , \data[1][27] , \data[1][26] , \data[1][25] ,
         \data[1][24] , \data[1][23] , \data[1][22] , \data[1][21] ,
         \data[1][20] , \data[1][19] , \data[1][18] , \data[1][17] ,
         \data[1][16] , \data[1][15] , \data[1][14] , \data[1][13] ,
         \data[1][12] , \data[1][11] , \data[1][10] , \data[1][9] ,
         \data[1][8] , \data[1][7] , \data[1][6] , \data[1][5] , \data[1][4] ,
         \data[1][3] , \data[1][2] , \data[1][1] , \data[1][0] , \data[0][31] ,
         \data[0][30] , \data[0][29] , \data[0][28] , \data[0][27] ,
         \data[0][26] , \data[0][25] , \data[0][24] , \data[0][23] ,
         \data[0][22] , \data[0][21] , \data[0][20] , \data[0][19] ,
         \data[0][18] , \data[0][17] , \data[0][16] , \data[0][15] ,
         \data[0][14] , \data[0][13] , \data[0][12] , \data[0][11] ,
         \data[0][10] , \data[0][9] , \data[0][8] , \data[0][7] , \data[0][6] ,
         \data[0][5] , \data[0][4] , \data[0][3] , \data[0][2] , \data[0][1] ,
         \data[0][0] , N92, N94, N95, N96, N97, N98, N99, N100, N101, N102,
         N103, N104, N105, N106, N107, N108, N109, N110, N111, N112, N113,
         N114, N115, N116, N117, N118, N119, N120, N121, N122, N123, N124,
         N125, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444,
         n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, n455,
         n456, n457, n458, n459, n460, n461, n462, n463, n464, n465, n466,
         n467, n468, n469, n470, n471, n472, n473, n474, n475, n476, n477,
         n478, n479, n480, n481, n482, n483, n484, n485, n486, n487, n488,
         n489, n490, n491, n492, n493, n494, n495, n496, n497, n498, n499,
         n500, n501, n502, n503, n504, n505, n506, n507, n508, n509, n510,
         n511, n512, n513, n514, n515, n516, n517, n518, n519, n520, n521,
         n522, n523, n524, n525, n526, n527, n528, n529, n530, n531, n532,
         n533, n534, n535, n536, n537, n538, n539, n540, n541, n542, n543,
         n544, n545, n546, n547, n548, n549, n550, n551, n552, n553, n554,
         n555, n556, n557, n558, n559, n560, n561, n562, n563, n564, n565,
         n566, n567, n568, n569, n570, n571, n572, n573, n574, n575, n576,
         n577, n578, n579, n580, n581, n582, n583, n584, n585, n586, n587,
         n588, n589, n590, n591, n592, n593, n594, n595, n596, n597, n598,
         n599, n600, n601, n602, n603, n604, n605, n606, n607, n608, n609,
         n610, n611, n612, n613, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305,
         n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n614, n615, n616,
         n617, n618, n619, n620, n621, n622, n623, n624, n625, n626, n627,
         n628, n629, n630, n631, n632, n633, n634, n635, n636, n637, n638,
         n639, n640, n641, n642, n643, n644, n645, n646, n647, n648, n649,
         n650, n651, n652, n653, n654, n655, n656, n657, n658, n659, n660,
         n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, n671,
         n672, n673, n674, n675, n676, n677, n678, n679, n680, n681, n682,
         n683, n684, n685, n686, n687, n688, n689, n690, n691, n692, n693,
         n694, n695, n696, n697, n698, n699, n700, n701, n702, n703, n704,
         n705, n706, n707, n708, n709, n710, n711, n712, n713, n714, n715,
         n716, n717, n718, n719, n720, n721, n722, n723, n724, n725, n726,
         n727, n728, n729, n730, n731, n732, n733, n734, n735, n736, n737,
         n738, n739, n740, n741, n742, n743, n744, n745, n746, n747, n748,
         n749, n750, n751, n752, n753, n754, n755, n756, n757, n758, n759,
         n760, n761, n762, n763, n764, n765, n766, n767, n768, n769, n770,
         n771, n772, n773, n774, n775, n776, n777, n778, n779, n780, n781,
         n782;
  wire   [3:0] write_pointer;
  assign fifo_full = N92;

  DFFPOSX1 \data_reg[7][31]  ( .D(n613), .CLK(write_clk), .Q(\data[7][31] ) );
  DFFPOSX1 \data_reg[7][30]  ( .D(n612), .CLK(write_clk), .Q(\data[7][30] ) );
  DFFPOSX1 \data_reg[7][29]  ( .D(n611), .CLK(write_clk), .Q(\data[7][29] ) );
  DFFPOSX1 \data_reg[7][28]  ( .D(n610), .CLK(write_clk), .Q(\data[7][28] ) );
  DFFPOSX1 \data_reg[7][27]  ( .D(n609), .CLK(write_clk), .Q(\data[7][27] ) );
  DFFPOSX1 \data_reg[7][26]  ( .D(n608), .CLK(write_clk), .Q(\data[7][26] ) );
  DFFPOSX1 \data_reg[7][25]  ( .D(n607), .CLK(write_clk), .Q(\data[7][25] ) );
  DFFPOSX1 \data_reg[7][24]  ( .D(n606), .CLK(write_clk), .Q(\data[7][24] ) );
  DFFPOSX1 \data_reg[7][23]  ( .D(n605), .CLK(write_clk), .Q(\data[7][23] ) );
  DFFPOSX1 \data_reg[7][22]  ( .D(n604), .CLK(write_clk), .Q(\data[7][22] ) );
  DFFPOSX1 \data_reg[7][21]  ( .D(n603), .CLK(write_clk), .Q(\data[7][21] ) );
  DFFPOSX1 \data_reg[7][20]  ( .D(n602), .CLK(write_clk), .Q(\data[7][20] ) );
  DFFPOSX1 \data_reg[7][19]  ( .D(n601), .CLK(write_clk), .Q(\data[7][19] ) );
  DFFPOSX1 \data_reg[7][18]  ( .D(n600), .CLK(write_clk), .Q(\data[7][18] ) );
  DFFPOSX1 \data_reg[7][17]  ( .D(n599), .CLK(write_clk), .Q(\data[7][17] ) );
  DFFPOSX1 \data_reg[7][16]  ( .D(n598), .CLK(write_clk), .Q(\data[7][16] ) );
  DFFPOSX1 \data_reg[7][15]  ( .D(n597), .CLK(write_clk), .Q(\data[7][15] ) );
  DFFPOSX1 \data_reg[7][14]  ( .D(n596), .CLK(write_clk), .Q(\data[7][14] ) );
  DFFPOSX1 \data_reg[7][13]  ( .D(n595), .CLK(write_clk), .Q(\data[7][13] ) );
  DFFPOSX1 \data_reg[7][12]  ( .D(n594), .CLK(write_clk), .Q(\data[7][12] ) );
  DFFPOSX1 \data_reg[7][11]  ( .D(n593), .CLK(write_clk), .Q(\data[7][11] ) );
  DFFPOSX1 \data_reg[7][10]  ( .D(n592), .CLK(write_clk), .Q(\data[7][10] ) );
  DFFPOSX1 \data_reg[7][9]  ( .D(n591), .CLK(write_clk), .Q(\data[7][9] ) );
  DFFPOSX1 \data_reg[7][8]  ( .D(n590), .CLK(write_clk), .Q(\data[7][8] ) );
  DFFPOSX1 \data_reg[7][7]  ( .D(n589), .CLK(write_clk), .Q(\data[7][7] ) );
  DFFPOSX1 \data_reg[7][6]  ( .D(n588), .CLK(write_clk), .Q(\data[7][6] ) );
  DFFPOSX1 \data_reg[7][5]  ( .D(n587), .CLK(write_clk), .Q(\data[7][5] ) );
  DFFPOSX1 \data_reg[7][4]  ( .D(n586), .CLK(write_clk), .Q(\data[7][4] ) );
  DFFPOSX1 \data_reg[7][3]  ( .D(n585), .CLK(write_clk), .Q(\data[7][3] ) );
  DFFPOSX1 \data_reg[7][2]  ( .D(n584), .CLK(write_clk), .Q(\data[7][2] ) );
  DFFPOSX1 \data_reg[7][1]  ( .D(n583), .CLK(write_clk), .Q(\data[7][1] ) );
  DFFPOSX1 \data_reg[7][0]  ( .D(n582), .CLK(write_clk), .Q(\data[7][0] ) );
  DFFPOSX1 \data_reg[6][31]  ( .D(n581), .CLK(write_clk), .Q(\data[6][31] ) );
  DFFPOSX1 \data_reg[6][30]  ( .D(n580), .CLK(write_clk), .Q(\data[6][30] ) );
  DFFPOSX1 \data_reg[6][29]  ( .D(n579), .CLK(write_clk), .Q(\data[6][29] ) );
  DFFPOSX1 \data_reg[6][28]  ( .D(n578), .CLK(write_clk), .Q(\data[6][28] ) );
  DFFPOSX1 \data_reg[6][27]  ( .D(n577), .CLK(write_clk), .Q(\data[6][27] ) );
  DFFPOSX1 \data_reg[6][26]  ( .D(n576), .CLK(write_clk), .Q(\data[6][26] ) );
  DFFPOSX1 \data_reg[6][25]  ( .D(n575), .CLK(write_clk), .Q(\data[6][25] ) );
  DFFPOSX1 \data_reg[6][24]  ( .D(n574), .CLK(write_clk), .Q(\data[6][24] ) );
  DFFPOSX1 \data_reg[6][23]  ( .D(n573), .CLK(write_clk), .Q(\data[6][23] ) );
  DFFPOSX1 \data_reg[6][22]  ( .D(n572), .CLK(write_clk), .Q(\data[6][22] ) );
  DFFPOSX1 \data_reg[6][21]  ( .D(n571), .CLK(write_clk), .Q(\data[6][21] ) );
  DFFPOSX1 \data_reg[6][20]  ( .D(n570), .CLK(write_clk), .Q(\data[6][20] ) );
  DFFPOSX1 \data_reg[6][19]  ( .D(n569), .CLK(write_clk), .Q(\data[6][19] ) );
  DFFPOSX1 \data_reg[6][18]  ( .D(n568), .CLK(write_clk), .Q(\data[6][18] ) );
  DFFPOSX1 \data_reg[6][17]  ( .D(n567), .CLK(write_clk), .Q(\data[6][17] ) );
  DFFPOSX1 \data_reg[6][16]  ( .D(n566), .CLK(write_clk), .Q(\data[6][16] ) );
  DFFPOSX1 \data_reg[6][15]  ( .D(n565), .CLK(write_clk), .Q(\data[6][15] ) );
  DFFPOSX1 \data_reg[6][14]  ( .D(n564), .CLK(write_clk), .Q(\data[6][14] ) );
  DFFPOSX1 \data_reg[6][13]  ( .D(n563), .CLK(write_clk), .Q(\data[6][13] ) );
  DFFPOSX1 \data_reg[6][12]  ( .D(n562), .CLK(write_clk), .Q(\data[6][12] ) );
  DFFPOSX1 \data_reg[6][11]  ( .D(n561), .CLK(write_clk), .Q(\data[6][11] ) );
  DFFPOSX1 \data_reg[6][10]  ( .D(n560), .CLK(write_clk), .Q(\data[6][10] ) );
  DFFPOSX1 \data_reg[6][9]  ( .D(n559), .CLK(write_clk), .Q(\data[6][9] ) );
  DFFPOSX1 \data_reg[6][8]  ( .D(n558), .CLK(write_clk), .Q(\data[6][8] ) );
  DFFPOSX1 \data_reg[6][7]  ( .D(n557), .CLK(write_clk), .Q(\data[6][7] ) );
  DFFPOSX1 \data_reg[6][6]  ( .D(n556), .CLK(write_clk), .Q(\data[6][6] ) );
  DFFPOSX1 \data_reg[6][5]  ( .D(n555), .CLK(write_clk), .Q(\data[6][5] ) );
  DFFPOSX1 \data_reg[6][4]  ( .D(n554), .CLK(write_clk), .Q(\data[6][4] ) );
  DFFPOSX1 \data_reg[6][3]  ( .D(n553), .CLK(write_clk), .Q(\data[6][3] ) );
  DFFPOSX1 \data_reg[6][2]  ( .D(n552), .CLK(write_clk), .Q(\data[6][2] ) );
  DFFPOSX1 \data_reg[6][1]  ( .D(n551), .CLK(write_clk), .Q(\data[6][1] ) );
  DFFPOSX1 \data_reg[6][0]  ( .D(n550), .CLK(write_clk), .Q(\data[6][0] ) );
  DFFPOSX1 \data_reg[5][31]  ( .D(n549), .CLK(write_clk), .Q(\data[5][31] ) );
  DFFPOSX1 \data_reg[5][30]  ( .D(n548), .CLK(write_clk), .Q(\data[5][30] ) );
  DFFPOSX1 \data_reg[5][29]  ( .D(n547), .CLK(write_clk), .Q(\data[5][29] ) );
  DFFPOSX1 \data_reg[5][28]  ( .D(n546), .CLK(write_clk), .Q(\data[5][28] ) );
  DFFPOSX1 \data_reg[5][27]  ( .D(n545), .CLK(write_clk), .Q(\data[5][27] ) );
  DFFPOSX1 \data_reg[5][26]  ( .D(n544), .CLK(write_clk), .Q(\data[5][26] ) );
  DFFPOSX1 \data_reg[5][25]  ( .D(n543), .CLK(write_clk), .Q(\data[5][25] ) );
  DFFPOSX1 \data_reg[5][24]  ( .D(n542), .CLK(write_clk), .Q(\data[5][24] ) );
  DFFPOSX1 \data_reg[5][23]  ( .D(n541), .CLK(write_clk), .Q(\data[5][23] ) );
  DFFPOSX1 \data_reg[5][22]  ( .D(n540), .CLK(write_clk), .Q(\data[5][22] ) );
  DFFPOSX1 \data_reg[5][21]  ( .D(n539), .CLK(write_clk), .Q(\data[5][21] ) );
  DFFPOSX1 \data_reg[5][20]  ( .D(n538), .CLK(write_clk), .Q(\data[5][20] ) );
  DFFPOSX1 \data_reg[5][19]  ( .D(n537), .CLK(write_clk), .Q(\data[5][19] ) );
  DFFPOSX1 \data_reg[5][18]  ( .D(n536), .CLK(write_clk), .Q(\data[5][18] ) );
  DFFPOSX1 \data_reg[5][17]  ( .D(n535), .CLK(write_clk), .Q(\data[5][17] ) );
  DFFPOSX1 \data_reg[5][16]  ( .D(n534), .CLK(write_clk), .Q(\data[5][16] ) );
  DFFPOSX1 \data_reg[5][15]  ( .D(n533), .CLK(write_clk), .Q(\data[5][15] ) );
  DFFPOSX1 \data_reg[5][14]  ( .D(n532), .CLK(write_clk), .Q(\data[5][14] ) );
  DFFPOSX1 \data_reg[5][13]  ( .D(n531), .CLK(write_clk), .Q(\data[5][13] ) );
  DFFPOSX1 \data_reg[5][12]  ( .D(n530), .CLK(write_clk), .Q(\data[5][12] ) );
  DFFPOSX1 \data_reg[5][11]  ( .D(n529), .CLK(write_clk), .Q(\data[5][11] ) );
  DFFPOSX1 \data_reg[5][10]  ( .D(n528), .CLK(write_clk), .Q(\data[5][10] ) );
  DFFPOSX1 \data_reg[5][9]  ( .D(n527), .CLK(write_clk), .Q(\data[5][9] ) );
  DFFPOSX1 \data_reg[5][8]  ( .D(n526), .CLK(write_clk), .Q(\data[5][8] ) );
  DFFPOSX1 \data_reg[5][7]  ( .D(n525), .CLK(write_clk), .Q(\data[5][7] ) );
  DFFPOSX1 \data_reg[5][6]  ( .D(n524), .CLK(write_clk), .Q(\data[5][6] ) );
  DFFPOSX1 \data_reg[5][5]  ( .D(n523), .CLK(write_clk), .Q(\data[5][5] ) );
  DFFPOSX1 \data_reg[5][4]  ( .D(n522), .CLK(write_clk), .Q(\data[5][4] ) );
  DFFPOSX1 \data_reg[5][3]  ( .D(n521), .CLK(write_clk), .Q(\data[5][3] ) );
  DFFPOSX1 \data_reg[5][2]  ( .D(n520), .CLK(write_clk), .Q(\data[5][2] ) );
  DFFPOSX1 \data_reg[5][1]  ( .D(n519), .CLK(write_clk), .Q(\data[5][1] ) );
  DFFPOSX1 \data_reg[5][0]  ( .D(n518), .CLK(write_clk), .Q(\data[5][0] ) );
  DFFPOSX1 \data_reg[4][31]  ( .D(n517), .CLK(write_clk), .Q(\data[4][31] ) );
  DFFPOSX1 \data_reg[4][30]  ( .D(n516), .CLK(write_clk), .Q(\data[4][30] ) );
  DFFPOSX1 \data_reg[4][29]  ( .D(n515), .CLK(write_clk), .Q(\data[4][29] ) );
  DFFPOSX1 \data_reg[4][28]  ( .D(n514), .CLK(write_clk), .Q(\data[4][28] ) );
  DFFPOSX1 \data_reg[4][27]  ( .D(n513), .CLK(write_clk), .Q(\data[4][27] ) );
  DFFPOSX1 \data_reg[4][26]  ( .D(n512), .CLK(write_clk), .Q(\data[4][26] ) );
  DFFPOSX1 \data_reg[4][25]  ( .D(n511), .CLK(write_clk), .Q(\data[4][25] ) );
  DFFPOSX1 \data_reg[4][24]  ( .D(n510), .CLK(write_clk), .Q(\data[4][24] ) );
  DFFPOSX1 \data_reg[4][23]  ( .D(n509), .CLK(write_clk), .Q(\data[4][23] ) );
  DFFPOSX1 \data_reg[4][22]  ( .D(n508), .CLK(write_clk), .Q(\data[4][22] ) );
  DFFPOSX1 \data_reg[4][21]  ( .D(n507), .CLK(write_clk), .Q(\data[4][21] ) );
  DFFPOSX1 \data_reg[4][20]  ( .D(n506), .CLK(write_clk), .Q(\data[4][20] ) );
  DFFPOSX1 \data_reg[4][19]  ( .D(n505), .CLK(write_clk), .Q(\data[4][19] ) );
  DFFPOSX1 \data_reg[4][18]  ( .D(n504), .CLK(write_clk), .Q(\data[4][18] ) );
  DFFPOSX1 \data_reg[4][17]  ( .D(n503), .CLK(write_clk), .Q(\data[4][17] ) );
  DFFPOSX1 \data_reg[4][16]  ( .D(n502), .CLK(write_clk), .Q(\data[4][16] ) );
  DFFPOSX1 \data_reg[4][15]  ( .D(n501), .CLK(write_clk), .Q(\data[4][15] ) );
  DFFPOSX1 \data_reg[4][14]  ( .D(n500), .CLK(write_clk), .Q(\data[4][14] ) );
  DFFPOSX1 \data_reg[4][13]  ( .D(n499), .CLK(write_clk), .Q(\data[4][13] ) );
  DFFPOSX1 \data_reg[4][12]  ( .D(n498), .CLK(write_clk), .Q(\data[4][12] ) );
  DFFPOSX1 \data_reg[4][11]  ( .D(n497), .CLK(write_clk), .Q(\data[4][11] ) );
  DFFPOSX1 \data_reg[4][10]  ( .D(n496), .CLK(write_clk), .Q(\data[4][10] ) );
  DFFPOSX1 \data_reg[4][9]  ( .D(n495), .CLK(write_clk), .Q(\data[4][9] ) );
  DFFPOSX1 \data_reg[4][8]  ( .D(n494), .CLK(write_clk), .Q(\data[4][8] ) );
  DFFPOSX1 \data_reg[4][7]  ( .D(n493), .CLK(write_clk), .Q(\data[4][7] ) );
  DFFPOSX1 \data_reg[4][6]  ( .D(n492), .CLK(write_clk), .Q(\data[4][6] ) );
  DFFPOSX1 \data_reg[4][5]  ( .D(n491), .CLK(write_clk), .Q(\data[4][5] ) );
  DFFPOSX1 \data_reg[4][4]  ( .D(n490), .CLK(write_clk), .Q(\data[4][4] ) );
  DFFPOSX1 \data_reg[4][3]  ( .D(n489), .CLK(write_clk), .Q(\data[4][3] ) );
  DFFPOSX1 \data_reg[4][2]  ( .D(n488), .CLK(write_clk), .Q(\data[4][2] ) );
  DFFPOSX1 \data_reg[4][1]  ( .D(n487), .CLK(write_clk), .Q(\data[4][1] ) );
  DFFPOSX1 \data_reg[4][0]  ( .D(n486), .CLK(write_clk), .Q(\data[4][0] ) );
  DFFPOSX1 \data_reg[3][31]  ( .D(n485), .CLK(write_clk), .Q(\data[3][31] ) );
  DFFPOSX1 \data_reg[3][30]  ( .D(n484), .CLK(write_clk), .Q(\data[3][30] ) );
  DFFPOSX1 \data_reg[3][29]  ( .D(n483), .CLK(write_clk), .Q(\data[3][29] ) );
  DFFPOSX1 \data_reg[3][28]  ( .D(n482), .CLK(write_clk), .Q(\data[3][28] ) );
  DFFPOSX1 \data_reg[3][27]  ( .D(n481), .CLK(write_clk), .Q(\data[3][27] ) );
  DFFPOSX1 \data_reg[3][26]  ( .D(n480), .CLK(write_clk), .Q(\data[3][26] ) );
  DFFPOSX1 \data_reg[3][25]  ( .D(n479), .CLK(write_clk), .Q(\data[3][25] ) );
  DFFPOSX1 \data_reg[3][24]  ( .D(n478), .CLK(write_clk), .Q(\data[3][24] ) );
  DFFPOSX1 \data_reg[3][23]  ( .D(n477), .CLK(write_clk), .Q(\data[3][23] ) );
  DFFPOSX1 \data_reg[3][22]  ( .D(n476), .CLK(write_clk), .Q(\data[3][22] ) );
  DFFPOSX1 \data_reg[3][21]  ( .D(n475), .CLK(write_clk), .Q(\data[3][21] ) );
  DFFPOSX1 \data_reg[3][20]  ( .D(n474), .CLK(write_clk), .Q(\data[3][20] ) );
  DFFPOSX1 \data_reg[3][19]  ( .D(n473), .CLK(write_clk), .Q(\data[3][19] ) );
  DFFPOSX1 \data_reg[3][18]  ( .D(n472), .CLK(write_clk), .Q(\data[3][18] ) );
  DFFPOSX1 \data_reg[3][17]  ( .D(n471), .CLK(write_clk), .Q(\data[3][17] ) );
  DFFPOSX1 \data_reg[3][16]  ( .D(n470), .CLK(write_clk), .Q(\data[3][16] ) );
  DFFPOSX1 \data_reg[3][15]  ( .D(n469), .CLK(write_clk), .Q(\data[3][15] ) );
  DFFPOSX1 \data_reg[3][14]  ( .D(n468), .CLK(write_clk), .Q(\data[3][14] ) );
  DFFPOSX1 \data_reg[3][13]  ( .D(n467), .CLK(write_clk), .Q(\data[3][13] ) );
  DFFPOSX1 \data_reg[3][12]  ( .D(n466), .CLK(write_clk), .Q(\data[3][12] ) );
  DFFPOSX1 \data_reg[3][11]  ( .D(n465), .CLK(write_clk), .Q(\data[3][11] ) );
  DFFPOSX1 \data_reg[3][10]  ( .D(n464), .CLK(write_clk), .Q(\data[3][10] ) );
  DFFPOSX1 \data_reg[3][9]  ( .D(n463), .CLK(write_clk), .Q(\data[3][9] ) );
  DFFPOSX1 \data_reg[3][8]  ( .D(n462), .CLK(write_clk), .Q(\data[3][8] ) );
  DFFPOSX1 \data_reg[3][7]  ( .D(n461), .CLK(write_clk), .Q(\data[3][7] ) );
  DFFPOSX1 \data_reg[3][6]  ( .D(n460), .CLK(write_clk), .Q(\data[3][6] ) );
  DFFPOSX1 \data_reg[3][5]  ( .D(n459), .CLK(write_clk), .Q(\data[3][5] ) );
  DFFPOSX1 \data_reg[3][4]  ( .D(n458), .CLK(write_clk), .Q(\data[3][4] ) );
  DFFPOSX1 \data_reg[3][3]  ( .D(n457), .CLK(write_clk), .Q(\data[3][3] ) );
  DFFPOSX1 \data_reg[3][2]  ( .D(n456), .CLK(write_clk), .Q(\data[3][2] ) );
  DFFPOSX1 \data_reg[3][1]  ( .D(n455), .CLK(write_clk), .Q(\data[3][1] ) );
  DFFPOSX1 \data_reg[3][0]  ( .D(n454), .CLK(write_clk), .Q(\data[3][0] ) );
  DFFPOSX1 \data_reg[2][31]  ( .D(n453), .CLK(write_clk), .Q(\data[2][31] ) );
  DFFPOSX1 \data_reg[2][30]  ( .D(n452), .CLK(write_clk), .Q(\data[2][30] ) );
  DFFPOSX1 \data_reg[2][29]  ( .D(n451), .CLK(write_clk), .Q(\data[2][29] ) );
  DFFPOSX1 \data_reg[2][28]  ( .D(n450), .CLK(write_clk), .Q(\data[2][28] ) );
  DFFPOSX1 \data_reg[2][27]  ( .D(n449), .CLK(write_clk), .Q(\data[2][27] ) );
  DFFPOSX1 \data_reg[2][26]  ( .D(n448), .CLK(write_clk), .Q(\data[2][26] ) );
  DFFPOSX1 \data_reg[2][25]  ( .D(n447), .CLK(write_clk), .Q(\data[2][25] ) );
  DFFPOSX1 \data_reg[2][24]  ( .D(n446), .CLK(write_clk), .Q(\data[2][24] ) );
  DFFPOSX1 \data_reg[2][23]  ( .D(n445), .CLK(write_clk), .Q(\data[2][23] ) );
  DFFPOSX1 \data_reg[2][22]  ( .D(n444), .CLK(write_clk), .Q(\data[2][22] ) );
  DFFPOSX1 \data_reg[2][21]  ( .D(n443), .CLK(write_clk), .Q(\data[2][21] ) );
  DFFPOSX1 \data_reg[2][20]  ( .D(n442), .CLK(write_clk), .Q(\data[2][20] ) );
  DFFPOSX1 \data_reg[2][19]  ( .D(n441), .CLK(write_clk), .Q(\data[2][19] ) );
  DFFPOSX1 \data_reg[2][18]  ( .D(n440), .CLK(write_clk), .Q(\data[2][18] ) );
  DFFPOSX1 \data_reg[2][17]  ( .D(n439), .CLK(write_clk), .Q(\data[2][17] ) );
  DFFPOSX1 \data_reg[2][16]  ( .D(n438), .CLK(write_clk), .Q(\data[2][16] ) );
  DFFPOSX1 \data_reg[2][15]  ( .D(n437), .CLK(write_clk), .Q(\data[2][15] ) );
  DFFPOSX1 \data_reg[2][14]  ( .D(n436), .CLK(write_clk), .Q(\data[2][14] ) );
  DFFPOSX1 \data_reg[2][13]  ( .D(n435), .CLK(write_clk), .Q(\data[2][13] ) );
  DFFPOSX1 \data_reg[2][12]  ( .D(n434), .CLK(write_clk), .Q(\data[2][12] ) );
  DFFPOSX1 \data_reg[2][11]  ( .D(n433), .CLK(write_clk), .Q(\data[2][11] ) );
  DFFPOSX1 \data_reg[2][10]  ( .D(n432), .CLK(write_clk), .Q(\data[2][10] ) );
  DFFPOSX1 \data_reg[2][9]  ( .D(n431), .CLK(write_clk), .Q(\data[2][9] ) );
  DFFPOSX1 \data_reg[2][8]  ( .D(n430), .CLK(write_clk), .Q(\data[2][8] ) );
  DFFPOSX1 \data_reg[2][7]  ( .D(n429), .CLK(write_clk), .Q(\data[2][7] ) );
  DFFPOSX1 \data_reg[2][6]  ( .D(n428), .CLK(write_clk), .Q(\data[2][6] ) );
  DFFPOSX1 \data_reg[2][5]  ( .D(n427), .CLK(write_clk), .Q(\data[2][5] ) );
  DFFPOSX1 \data_reg[2][4]  ( .D(n426), .CLK(write_clk), .Q(\data[2][4] ) );
  DFFPOSX1 \data_reg[2][3]  ( .D(n425), .CLK(write_clk), .Q(\data[2][3] ) );
  DFFPOSX1 \data_reg[2][2]  ( .D(n424), .CLK(write_clk), .Q(\data[2][2] ) );
  DFFPOSX1 \data_reg[2][1]  ( .D(n423), .CLK(write_clk), .Q(\data[2][1] ) );
  DFFPOSX1 \data_reg[2][0]  ( .D(n422), .CLK(write_clk), .Q(\data[2][0] ) );
  DFFPOSX1 \data_reg[1][31]  ( .D(n421), .CLK(write_clk), .Q(\data[1][31] ) );
  DFFPOSX1 \data_reg[1][30]  ( .D(n420), .CLK(write_clk), .Q(\data[1][30] ) );
  DFFPOSX1 \data_reg[1][29]  ( .D(n419), .CLK(write_clk), .Q(\data[1][29] ) );
  DFFPOSX1 \data_reg[1][28]  ( .D(n418), .CLK(write_clk), .Q(\data[1][28] ) );
  DFFPOSX1 \data_reg[1][27]  ( .D(n417), .CLK(write_clk), .Q(\data[1][27] ) );
  DFFPOSX1 \data_reg[1][26]  ( .D(n416), .CLK(write_clk), .Q(\data[1][26] ) );
  DFFPOSX1 \data_reg[1][25]  ( .D(n415), .CLK(write_clk), .Q(\data[1][25] ) );
  DFFPOSX1 \data_reg[1][24]  ( .D(n414), .CLK(write_clk), .Q(\data[1][24] ) );
  DFFPOSX1 \data_reg[1][23]  ( .D(n413), .CLK(write_clk), .Q(\data[1][23] ) );
  DFFPOSX1 \data_reg[1][22]  ( .D(n412), .CLK(write_clk), .Q(\data[1][22] ) );
  DFFPOSX1 \data_reg[1][21]  ( .D(n411), .CLK(write_clk), .Q(\data[1][21] ) );
  DFFPOSX1 \data_reg[1][20]  ( .D(n410), .CLK(write_clk), .Q(\data[1][20] ) );
  DFFPOSX1 \data_reg[1][19]  ( .D(n409), .CLK(write_clk), .Q(\data[1][19] ) );
  DFFPOSX1 \data_reg[1][18]  ( .D(n408), .CLK(write_clk), .Q(\data[1][18] ) );
  DFFPOSX1 \data_reg[1][17]  ( .D(n407), .CLK(write_clk), .Q(\data[1][17] ) );
  DFFPOSX1 \data_reg[1][16]  ( .D(n406), .CLK(write_clk), .Q(\data[1][16] ) );
  DFFPOSX1 \data_reg[1][15]  ( .D(n405), .CLK(write_clk), .Q(\data[1][15] ) );
  DFFPOSX1 \data_reg[1][14]  ( .D(n404), .CLK(write_clk), .Q(\data[1][14] ) );
  DFFPOSX1 \data_reg[1][13]  ( .D(n403), .CLK(write_clk), .Q(\data[1][13] ) );
  DFFPOSX1 \data_reg[1][12]  ( .D(n402), .CLK(write_clk), .Q(\data[1][12] ) );
  DFFPOSX1 \data_reg[1][11]  ( .D(n401), .CLK(write_clk), .Q(\data[1][11] ) );
  DFFPOSX1 \data_reg[1][10]  ( .D(n400), .CLK(write_clk), .Q(\data[1][10] ) );
  DFFPOSX1 \data_reg[1][9]  ( .D(n399), .CLK(write_clk), .Q(\data[1][9] ) );
  DFFPOSX1 \data_reg[1][8]  ( .D(n398), .CLK(write_clk), .Q(\data[1][8] ) );
  DFFPOSX1 \data_reg[1][7]  ( .D(n397), .CLK(write_clk), .Q(\data[1][7] ) );
  DFFPOSX1 \data_reg[1][6]  ( .D(n396), .CLK(write_clk), .Q(\data[1][6] ) );
  DFFPOSX1 \data_reg[1][5]  ( .D(n395), .CLK(write_clk), .Q(\data[1][5] ) );
  DFFPOSX1 \data_reg[1][4]  ( .D(n394), .CLK(write_clk), .Q(\data[1][4] ) );
  DFFPOSX1 \data_reg[1][3]  ( .D(n393), .CLK(write_clk), .Q(\data[1][3] ) );
  DFFPOSX1 \data_reg[1][2]  ( .D(n392), .CLK(write_clk), .Q(\data[1][2] ) );
  DFFPOSX1 \data_reg[1][1]  ( .D(n391), .CLK(write_clk), .Q(\data[1][1] ) );
  DFFPOSX1 \data_reg[1][0]  ( .D(n390), .CLK(write_clk), .Q(\data[1][0] ) );
  DFFPOSX1 \data_reg[0][31]  ( .D(n389), .CLK(write_clk), .Q(\data[0][31] ) );
  DFFPOSX1 \data_reg[0][30]  ( .D(n388), .CLK(write_clk), .Q(\data[0][30] ) );
  DFFPOSX1 \data_reg[0][29]  ( .D(n387), .CLK(write_clk), .Q(\data[0][29] ) );
  DFFPOSX1 \data_reg[0][28]  ( .D(n386), .CLK(write_clk), .Q(\data[0][28] ) );
  DFFPOSX1 \data_reg[0][27]  ( .D(n385), .CLK(write_clk), .Q(\data[0][27] ) );
  DFFPOSX1 \data_reg[0][26]  ( .D(n384), .CLK(write_clk), .Q(\data[0][26] ) );
  DFFPOSX1 \data_reg[0][25]  ( .D(n383), .CLK(write_clk), .Q(\data[0][25] ) );
  DFFPOSX1 \data_reg[0][24]  ( .D(n382), .CLK(write_clk), .Q(\data[0][24] ) );
  DFFPOSX1 \data_reg[0][23]  ( .D(n381), .CLK(write_clk), .Q(\data[0][23] ) );
  DFFPOSX1 \data_reg[0][22]  ( .D(n380), .CLK(write_clk), .Q(\data[0][22] ) );
  DFFPOSX1 \data_reg[0][21]  ( .D(n379), .CLK(write_clk), .Q(\data[0][21] ) );
  DFFPOSX1 \data_reg[0][20]  ( .D(n378), .CLK(write_clk), .Q(\data[0][20] ) );
  DFFPOSX1 \data_reg[0][19]  ( .D(n377), .CLK(write_clk), .Q(\data[0][19] ) );
  DFFPOSX1 \data_reg[0][18]  ( .D(n376), .CLK(write_clk), .Q(\data[0][18] ) );
  DFFPOSX1 \data_reg[0][17]  ( .D(n375), .CLK(write_clk), .Q(\data[0][17] ) );
  DFFPOSX1 \data_reg[0][16]  ( .D(n374), .CLK(write_clk), .Q(\data[0][16] ) );
  DFFPOSX1 \data_reg[0][15]  ( .D(n373), .CLK(write_clk), .Q(\data[0][15] ) );
  DFFPOSX1 \data_reg[0][14]  ( .D(n372), .CLK(write_clk), .Q(\data[0][14] ) );
  DFFPOSX1 \data_reg[0][13]  ( .D(n371), .CLK(write_clk), .Q(\data[0][13] ) );
  DFFPOSX1 \data_reg[0][12]  ( .D(n370), .CLK(write_clk), .Q(\data[0][12] ) );
  DFFPOSX1 \data_reg[0][11]  ( .D(n369), .CLK(write_clk), .Q(\data[0][11] ) );
  DFFPOSX1 \data_reg[0][10]  ( .D(n368), .CLK(write_clk), .Q(\data[0][10] ) );
  DFFPOSX1 \data_reg[0][9]  ( .D(n367), .CLK(write_clk), .Q(\data[0][9] ) );
  DFFPOSX1 \data_reg[0][8]  ( .D(n366), .CLK(write_clk), .Q(\data[0][8] ) );
  DFFPOSX1 \data_reg[0][7]  ( .D(n365), .CLK(write_clk), .Q(\data[0][7] ) );
  DFFPOSX1 \data_reg[0][6]  ( .D(n364), .CLK(write_clk), .Q(\data[0][6] ) );
  DFFPOSX1 \data_reg[0][5]  ( .D(n363), .CLK(write_clk), .Q(\data[0][5] ) );
  DFFPOSX1 \data_reg[0][4]  ( .D(n362), .CLK(write_clk), .Q(\data[0][4] ) );
  DFFPOSX1 \data_reg[0][3]  ( .D(n361), .CLK(write_clk), .Q(\data[0][3] ) );
  DFFPOSX1 \data_reg[0][2]  ( .D(n360), .CLK(write_clk), .Q(\data[0][2] ) );
  DFFPOSX1 \data_reg[0][1]  ( .D(n359), .CLK(write_clk), .Q(\data[0][1] ) );
  DFFPOSX1 \data_reg[0][0]  ( .D(n358), .CLK(write_clk), .Q(\data[0][0] ) );
  flex_counter_NUM_CNT_BITS4_3 READ_COUNTER ( .clk(read_clk), .n_rst(n_rst), 
        .clear(_1_net_), .count_enable(read_enable), .rollover_val({1'b1, 1'b0, 
        1'b0, 1'b0}), .count_out({\read_pointer[3] , N21, N20, N19}) );
  flex_counter_NUM_CNT_BITS4_2 WRITE_COUNTER ( .clk(write_clk), .n_rst(n_rst), 
        .clear(_3_net_), .count_enable(write_enable), .rollover_val({1'b1, 
        1'b0, 1'b0, 1'b0}), .count_out(write_pointer) );
  NAND2X1 U3 ( .A(n19), .B(N19), .Y(n179) );
  INVX4 U4 ( .A(n179), .Y(n1) );
  NAND2X1 U5 ( .A(n21), .B(n762), .Y(n185) );
  INVX4 U6 ( .A(n185), .Y(n2) );
  BUFX2 U7 ( .A(n263), .Y(n3) );
  BUFX2 U8 ( .A(n623), .Y(n4) );
  NAND2X1 U9 ( .A(n21), .B(N19), .Y(n181) );
  INVX4 U10 ( .A(n181), .Y(n5) );
  NAND2X1 U11 ( .A(n19), .B(n762), .Y(n183) );
  INVX4 U12 ( .A(n183), .Y(n6) );
  BUFX2 U13 ( .A(n197), .Y(n7) );
  BUFX2 U14 ( .A(n657), .Y(n8) );
  NAND2X1 U15 ( .A(N19), .B(n20), .Y(n178) );
  INVX4 U16 ( .A(n178), .Y(n9) );
  NAND2X1 U17 ( .A(n22), .B(n762), .Y(n184) );
  INVX4 U18 ( .A(n184), .Y(n10) );
  BUFX2 U19 ( .A(n331), .Y(n11) );
  BUFX2 U20 ( .A(n691), .Y(n12) );
  BUFX2 U21 ( .A(n621), .Y(n13) );
  INVX2 U22 ( .A(fifo_empty), .Y(n14) );
  NAND2X1 U23 ( .A(n22), .B(N19), .Y(n180) );
  INVX4 U24 ( .A(n180), .Y(n15) );
  NAND2X1 U25 ( .A(n20), .B(n762), .Y(n182) );
  INVX4 U26 ( .A(n182), .Y(n16) );
  BUFX2 U27 ( .A(n297), .Y(n17) );
  BUFX2 U28 ( .A(n725), .Y(n18) );
  NOR2X1 U29 ( .A(n191), .B(N20), .Y(n19) );
  NOR2X1 U30 ( .A(n191), .B(n780), .Y(n20) );
  AOI22X1 U31 ( .A(\data[5][0] ), .B(n1), .C(\data[7][0] ), .D(n9), .Y(n27) );
  NOR2X1 U32 ( .A(N20), .B(N21), .Y(n21) );
  NOR2X1 U33 ( .A(n780), .B(N21), .Y(n22) );
  AOI22X1 U34 ( .A(\data[1][0] ), .B(n5), .C(\data[3][0] ), .D(n15), .Y(n26)
         );
  AOI22X1 U35 ( .A(\data[4][0] ), .B(n6), .C(\data[6][0] ), .D(n16), .Y(n24)
         );
  AOI22X1 U36 ( .A(\data[0][0] ), .B(n2), .C(\data[2][0] ), .D(n10), .Y(n23)
         );
  AND2X1 U37 ( .A(n24), .B(n23), .Y(n25) );
  NAND3X1 U38 ( .A(n27), .B(n26), .C(n25), .Y(N125) );
  AOI22X1 U39 ( .A(\data[5][1] ), .B(n1), .C(\data[7][1] ), .D(n9), .Y(n32) );
  AOI22X1 U40 ( .A(\data[1][1] ), .B(n5), .C(\data[3][1] ), .D(n15), .Y(n31)
         );
  AOI22X1 U41 ( .A(\data[4][1] ), .B(n6), .C(\data[6][1] ), .D(n16), .Y(n29)
         );
  AOI22X1 U42 ( .A(\data[0][1] ), .B(n2), .C(\data[2][1] ), .D(n10), .Y(n28)
         );
  AND2X1 U43 ( .A(n29), .B(n28), .Y(n30) );
  NAND3X1 U44 ( .A(n32), .B(n31), .C(n30), .Y(N124) );
  AOI22X1 U45 ( .A(\data[5][2] ), .B(n1), .C(\data[7][2] ), .D(n9), .Y(n37) );
  AOI22X1 U46 ( .A(\data[1][2] ), .B(n5), .C(\data[3][2] ), .D(n15), .Y(n36)
         );
  AOI22X1 U47 ( .A(\data[4][2] ), .B(n6), .C(\data[6][2] ), .D(n16), .Y(n34)
         );
  AOI22X1 U48 ( .A(\data[0][2] ), .B(n2), .C(\data[2][2] ), .D(n10), .Y(n33)
         );
  AND2X1 U49 ( .A(n34), .B(n33), .Y(n35) );
  NAND3X1 U50 ( .A(n37), .B(n36), .C(n35), .Y(N123) );
  AOI22X1 U51 ( .A(\data[5][3] ), .B(n1), .C(\data[7][3] ), .D(n9), .Y(n42) );
  AOI22X1 U52 ( .A(\data[1][3] ), .B(n5), .C(\data[3][3] ), .D(n15), .Y(n41)
         );
  AOI22X1 U53 ( .A(\data[4][3] ), .B(n6), .C(\data[6][3] ), .D(n16), .Y(n39)
         );
  AOI22X1 U54 ( .A(\data[0][3] ), .B(n2), .C(\data[2][3] ), .D(n10), .Y(n38)
         );
  AND2X1 U55 ( .A(n39), .B(n38), .Y(n40) );
  NAND3X1 U56 ( .A(n42), .B(n41), .C(n40), .Y(N122) );
  AOI22X1 U57 ( .A(\data[5][4] ), .B(n1), .C(\data[7][4] ), .D(n9), .Y(n47) );
  AOI22X1 U58 ( .A(\data[1][4] ), .B(n5), .C(\data[3][4] ), .D(n15), .Y(n46)
         );
  AOI22X1 U59 ( .A(\data[4][4] ), .B(n6), .C(\data[6][4] ), .D(n16), .Y(n44)
         );
  AOI22X1 U60 ( .A(\data[0][4] ), .B(n2), .C(\data[2][4] ), .D(n10), .Y(n43)
         );
  AND2X1 U61 ( .A(n44), .B(n43), .Y(n45) );
  NAND3X1 U62 ( .A(n47), .B(n46), .C(n45), .Y(N121) );
  AOI22X1 U63 ( .A(\data[5][5] ), .B(n1), .C(\data[7][5] ), .D(n9), .Y(n52) );
  AOI22X1 U64 ( .A(\data[1][5] ), .B(n5), .C(\data[3][5] ), .D(n15), .Y(n51)
         );
  AOI22X1 U65 ( .A(\data[4][5] ), .B(n6), .C(\data[6][5] ), .D(n16), .Y(n49)
         );
  AOI22X1 U66 ( .A(\data[0][5] ), .B(n2), .C(\data[2][5] ), .D(n10), .Y(n48)
         );
  AND2X1 U67 ( .A(n49), .B(n48), .Y(n50) );
  NAND3X1 U68 ( .A(n52), .B(n51), .C(n50), .Y(N120) );
  AOI22X1 U69 ( .A(\data[5][6] ), .B(n1), .C(\data[7][6] ), .D(n9), .Y(n57) );
  AOI22X1 U70 ( .A(\data[1][6] ), .B(n5), .C(\data[3][6] ), .D(n15), .Y(n56)
         );
  AOI22X1 U71 ( .A(\data[4][6] ), .B(n6), .C(\data[6][6] ), .D(n16), .Y(n54)
         );
  AOI22X1 U72 ( .A(\data[0][6] ), .B(n2), .C(\data[2][6] ), .D(n10), .Y(n53)
         );
  AND2X1 U73 ( .A(n54), .B(n53), .Y(n55) );
  NAND3X1 U74 ( .A(n57), .B(n56), .C(n55), .Y(N119) );
  AOI22X1 U75 ( .A(\data[5][7] ), .B(n1), .C(\data[7][7] ), .D(n9), .Y(n62) );
  AOI22X1 U76 ( .A(\data[1][7] ), .B(n5), .C(\data[3][7] ), .D(n15), .Y(n61)
         );
  AOI22X1 U77 ( .A(\data[4][7] ), .B(n6), .C(\data[6][7] ), .D(n16), .Y(n59)
         );
  AOI22X1 U78 ( .A(\data[0][7] ), .B(n2), .C(\data[2][7] ), .D(n10), .Y(n58)
         );
  AND2X1 U79 ( .A(n59), .B(n58), .Y(n60) );
  NAND3X1 U80 ( .A(n62), .B(n61), .C(n60), .Y(N118) );
  AOI22X1 U81 ( .A(\data[5][8] ), .B(n1), .C(\data[7][8] ), .D(n9), .Y(n67) );
  AOI22X1 U82 ( .A(\data[1][8] ), .B(n5), .C(\data[3][8] ), .D(n15), .Y(n66)
         );
  AOI22X1 U83 ( .A(\data[4][8] ), .B(n6), .C(\data[6][8] ), .D(n16), .Y(n64)
         );
  AOI22X1 U84 ( .A(\data[0][8] ), .B(n2), .C(\data[2][8] ), .D(n10), .Y(n63)
         );
  AND2X1 U85 ( .A(n64), .B(n63), .Y(n65) );
  NAND3X1 U86 ( .A(n67), .B(n66), .C(n65), .Y(N117) );
  AOI22X1 U87 ( .A(\data[5][9] ), .B(n1), .C(\data[7][9] ), .D(n9), .Y(n72) );
  AOI22X1 U88 ( .A(\data[1][9] ), .B(n5), .C(\data[3][9] ), .D(n15), .Y(n71)
         );
  AOI22X1 U89 ( .A(\data[4][9] ), .B(n6), .C(\data[6][9] ), .D(n16), .Y(n69)
         );
  AOI22X1 U90 ( .A(\data[0][9] ), .B(n2), .C(\data[2][9] ), .D(n10), .Y(n68)
         );
  AND2X1 U91 ( .A(n69), .B(n68), .Y(n70) );
  NAND3X1 U92 ( .A(n72), .B(n71), .C(n70), .Y(N116) );
  AOI22X1 U93 ( .A(\data[5][10] ), .B(n1), .C(\data[7][10] ), .D(n9), .Y(n77)
         );
  AOI22X1 U94 ( .A(\data[1][10] ), .B(n5), .C(\data[3][10] ), .D(n15), .Y(n76)
         );
  AOI22X1 U95 ( .A(\data[4][10] ), .B(n6), .C(\data[6][10] ), .D(n16), .Y(n74)
         );
  AOI22X1 U96 ( .A(\data[0][10] ), .B(n2), .C(\data[2][10] ), .D(n10), .Y(n73)
         );
  AND2X1 U97 ( .A(n74), .B(n73), .Y(n75) );
  NAND3X1 U98 ( .A(n77), .B(n76), .C(n75), .Y(N115) );
  AOI22X1 U99 ( .A(\data[5][11] ), .B(n1), .C(\data[7][11] ), .D(n9), .Y(n82)
         );
  AOI22X1 U100 ( .A(\data[1][11] ), .B(n5), .C(\data[3][11] ), .D(n15), .Y(n81) );
  AOI22X1 U101 ( .A(\data[4][11] ), .B(n6), .C(\data[6][11] ), .D(n16), .Y(n79) );
  AOI22X1 U102 ( .A(\data[0][11] ), .B(n2), .C(\data[2][11] ), .D(n10), .Y(n78) );
  AND2X1 U103 ( .A(n79), .B(n78), .Y(n80) );
  NAND3X1 U104 ( .A(n82), .B(n81), .C(n80), .Y(N114) );
  AOI22X1 U105 ( .A(\data[5][12] ), .B(n1), .C(\data[7][12] ), .D(n9), .Y(n87)
         );
  AOI22X1 U106 ( .A(\data[1][12] ), .B(n5), .C(\data[3][12] ), .D(n15), .Y(n86) );
  AOI22X1 U107 ( .A(\data[4][12] ), .B(n6), .C(\data[6][12] ), .D(n16), .Y(n84) );
  AOI22X1 U108 ( .A(\data[0][12] ), .B(n2), .C(\data[2][12] ), .D(n10), .Y(n83) );
  AND2X1 U109 ( .A(n84), .B(n83), .Y(n85) );
  NAND3X1 U110 ( .A(n87), .B(n86), .C(n85), .Y(N113) );
  AOI22X1 U111 ( .A(\data[5][13] ), .B(n1), .C(\data[7][13] ), .D(n9), .Y(n92)
         );
  AOI22X1 U112 ( .A(\data[1][13] ), .B(n5), .C(\data[3][13] ), .D(n15), .Y(n91) );
  AOI22X1 U113 ( .A(\data[4][13] ), .B(n6), .C(\data[6][13] ), .D(n16), .Y(n89) );
  AOI22X1 U114 ( .A(\data[0][13] ), .B(n2), .C(\data[2][13] ), .D(n10), .Y(n88) );
  AND2X1 U115 ( .A(n89), .B(n88), .Y(n90) );
  NAND3X1 U116 ( .A(n92), .B(n91), .C(n90), .Y(N112) );
  AOI22X1 U117 ( .A(\data[5][14] ), .B(n1), .C(\data[7][14] ), .D(n9), .Y(n97)
         );
  AOI22X1 U118 ( .A(\data[1][14] ), .B(n5), .C(\data[3][14] ), .D(n15), .Y(n96) );
  AOI22X1 U119 ( .A(\data[4][14] ), .B(n6), .C(\data[6][14] ), .D(n16), .Y(n94) );
  AOI22X1 U120 ( .A(\data[0][14] ), .B(n2), .C(\data[2][14] ), .D(n10), .Y(n93) );
  AND2X1 U121 ( .A(n94), .B(n93), .Y(n95) );
  NAND3X1 U122 ( .A(n97), .B(n96), .C(n95), .Y(N111) );
  AOI22X1 U123 ( .A(\data[5][15] ), .B(n1), .C(\data[7][15] ), .D(n9), .Y(n102) );
  AOI22X1 U124 ( .A(\data[1][15] ), .B(n5), .C(\data[3][15] ), .D(n15), .Y(
        n101) );
  AOI22X1 U125 ( .A(\data[4][15] ), .B(n6), .C(\data[6][15] ), .D(n16), .Y(n99) );
  AOI22X1 U126 ( .A(\data[0][15] ), .B(n2), .C(\data[2][15] ), .D(n10), .Y(n98) );
  AND2X1 U127 ( .A(n99), .B(n98), .Y(n100) );
  NAND3X1 U128 ( .A(n102), .B(n101), .C(n100), .Y(N110) );
  AOI22X1 U129 ( .A(\data[5][16] ), .B(n1), .C(\data[7][16] ), .D(n9), .Y(n107) );
  AOI22X1 U130 ( .A(\data[1][16] ), .B(n5), .C(\data[3][16] ), .D(n15), .Y(
        n106) );
  AOI22X1 U131 ( .A(\data[4][16] ), .B(n6), .C(\data[6][16] ), .D(n16), .Y(
        n104) );
  AOI22X1 U132 ( .A(\data[0][16] ), .B(n2), .C(\data[2][16] ), .D(n10), .Y(
        n103) );
  AND2X1 U133 ( .A(n104), .B(n103), .Y(n105) );
  NAND3X1 U134 ( .A(n107), .B(n106), .C(n105), .Y(N109) );
  AOI22X1 U135 ( .A(\data[5][17] ), .B(n1), .C(\data[7][17] ), .D(n9), .Y(n112) );
  AOI22X1 U136 ( .A(\data[1][17] ), .B(n5), .C(\data[3][17] ), .D(n15), .Y(
        n111) );
  AOI22X1 U137 ( .A(\data[4][17] ), .B(n6), .C(\data[6][17] ), .D(n16), .Y(
        n109) );
  AOI22X1 U138 ( .A(\data[0][17] ), .B(n2), .C(\data[2][17] ), .D(n10), .Y(
        n108) );
  AND2X1 U139 ( .A(n109), .B(n108), .Y(n110) );
  NAND3X1 U140 ( .A(n112), .B(n111), .C(n110), .Y(N108) );
  AOI22X1 U141 ( .A(\data[5][18] ), .B(n1), .C(\data[7][18] ), .D(n9), .Y(n117) );
  AOI22X1 U142 ( .A(\data[1][18] ), .B(n5), .C(\data[3][18] ), .D(n15), .Y(
        n116) );
  AOI22X1 U143 ( .A(\data[4][18] ), .B(n6), .C(\data[6][18] ), .D(n16), .Y(
        n114) );
  AOI22X1 U144 ( .A(\data[0][18] ), .B(n2), .C(\data[2][18] ), .D(n10), .Y(
        n113) );
  AND2X1 U145 ( .A(n114), .B(n113), .Y(n115) );
  NAND3X1 U146 ( .A(n117), .B(n116), .C(n115), .Y(N107) );
  AOI22X1 U147 ( .A(\data[5][19] ), .B(n1), .C(\data[7][19] ), .D(n9), .Y(n122) );
  AOI22X1 U148 ( .A(\data[1][19] ), .B(n5), .C(\data[3][19] ), .D(n15), .Y(
        n121) );
  AOI22X1 U149 ( .A(\data[4][19] ), .B(n6), .C(\data[6][19] ), .D(n16), .Y(
        n119) );
  AOI22X1 U150 ( .A(\data[0][19] ), .B(n2), .C(\data[2][19] ), .D(n10), .Y(
        n118) );
  AND2X1 U151 ( .A(n119), .B(n118), .Y(n120) );
  NAND3X1 U152 ( .A(n122), .B(n121), .C(n120), .Y(N106) );
  AOI22X1 U153 ( .A(\data[5][20] ), .B(n1), .C(\data[7][20] ), .D(n9), .Y(n127) );
  AOI22X1 U154 ( .A(\data[1][20] ), .B(n5), .C(\data[3][20] ), .D(n15), .Y(
        n126) );
  AOI22X1 U155 ( .A(\data[4][20] ), .B(n6), .C(\data[6][20] ), .D(n16), .Y(
        n124) );
  AOI22X1 U156 ( .A(\data[0][20] ), .B(n2), .C(\data[2][20] ), .D(n10), .Y(
        n123) );
  AND2X1 U157 ( .A(n124), .B(n123), .Y(n125) );
  NAND3X1 U158 ( .A(n127), .B(n126), .C(n125), .Y(N105) );
  AOI22X1 U159 ( .A(\data[5][21] ), .B(n1), .C(\data[7][21] ), .D(n9), .Y(n132) );
  AOI22X1 U160 ( .A(\data[1][21] ), .B(n5), .C(\data[3][21] ), .D(n15), .Y(
        n131) );
  AOI22X1 U161 ( .A(\data[4][21] ), .B(n6), .C(\data[6][21] ), .D(n16), .Y(
        n129) );
  AOI22X1 U162 ( .A(\data[0][21] ), .B(n2), .C(\data[2][21] ), .D(n10), .Y(
        n128) );
  AND2X1 U163 ( .A(n129), .B(n128), .Y(n130) );
  NAND3X1 U164 ( .A(n132), .B(n131), .C(n130), .Y(N104) );
  AOI22X1 U165 ( .A(\data[5][22] ), .B(n1), .C(\data[7][22] ), .D(n9), .Y(n137) );
  AOI22X1 U166 ( .A(\data[1][22] ), .B(n5), .C(\data[3][22] ), .D(n15), .Y(
        n136) );
  AOI22X1 U167 ( .A(\data[4][22] ), .B(n6), .C(\data[6][22] ), .D(n16), .Y(
        n134) );
  AOI22X1 U168 ( .A(\data[0][22] ), .B(n2), .C(\data[2][22] ), .D(n10), .Y(
        n133) );
  AND2X1 U169 ( .A(n134), .B(n133), .Y(n135) );
  NAND3X1 U170 ( .A(n137), .B(n136), .C(n135), .Y(N103) );
  AOI22X1 U171 ( .A(\data[5][23] ), .B(n1), .C(\data[7][23] ), .D(n9), .Y(n142) );
  AOI22X1 U172 ( .A(\data[1][23] ), .B(n5), .C(\data[3][23] ), .D(n15), .Y(
        n141) );
  AOI22X1 U173 ( .A(\data[4][23] ), .B(n6), .C(\data[6][23] ), .D(n16), .Y(
        n139) );
  AOI22X1 U174 ( .A(\data[0][23] ), .B(n2), .C(\data[2][23] ), .D(n10), .Y(
        n138) );
  AND2X1 U175 ( .A(n139), .B(n138), .Y(n140) );
  NAND3X1 U176 ( .A(n142), .B(n141), .C(n140), .Y(N102) );
  AOI22X1 U177 ( .A(\data[5][24] ), .B(n1), .C(\data[7][24] ), .D(n9), .Y(n147) );
  AOI22X1 U178 ( .A(\data[1][24] ), .B(n5), .C(\data[3][24] ), .D(n15), .Y(
        n146) );
  AOI22X1 U179 ( .A(\data[4][24] ), .B(n6), .C(\data[6][24] ), .D(n16), .Y(
        n144) );
  AOI22X1 U180 ( .A(\data[0][24] ), .B(n2), .C(\data[2][24] ), .D(n10), .Y(
        n143) );
  AND2X1 U181 ( .A(n144), .B(n143), .Y(n145) );
  NAND3X1 U182 ( .A(n147), .B(n146), .C(n145), .Y(N101) );
  AOI22X1 U183 ( .A(\data[5][25] ), .B(n1), .C(\data[7][25] ), .D(n9), .Y(n152) );
  AOI22X1 U184 ( .A(\data[1][25] ), .B(n5), .C(\data[3][25] ), .D(n15), .Y(
        n151) );
  AOI22X1 U185 ( .A(\data[4][25] ), .B(n6), .C(\data[6][25] ), .D(n16), .Y(
        n149) );
  AOI22X1 U186 ( .A(\data[0][25] ), .B(n2), .C(\data[2][25] ), .D(n10), .Y(
        n148) );
  AND2X1 U187 ( .A(n149), .B(n148), .Y(n150) );
  NAND3X1 U188 ( .A(n152), .B(n151), .C(n150), .Y(N100) );
  AOI22X1 U189 ( .A(\data[5][26] ), .B(n1), .C(\data[7][26] ), .D(n9), .Y(n157) );
  AOI22X1 U190 ( .A(\data[1][26] ), .B(n5), .C(\data[3][26] ), .D(n15), .Y(
        n156) );
  AOI22X1 U191 ( .A(\data[4][26] ), .B(n6), .C(\data[6][26] ), .D(n16), .Y(
        n154) );
  AOI22X1 U192 ( .A(\data[0][26] ), .B(n2), .C(\data[2][26] ), .D(n10), .Y(
        n153) );
  AND2X1 U193 ( .A(n154), .B(n153), .Y(n155) );
  NAND3X1 U194 ( .A(n157), .B(n156), .C(n155), .Y(N99) );
  AOI22X1 U195 ( .A(\data[5][27] ), .B(n1), .C(\data[7][27] ), .D(n9), .Y(n162) );
  AOI22X1 U196 ( .A(\data[1][27] ), .B(n5), .C(\data[3][27] ), .D(n15), .Y(
        n161) );
  AOI22X1 U197 ( .A(\data[4][27] ), .B(n6), .C(\data[6][27] ), .D(n16), .Y(
        n159) );
  AOI22X1 U198 ( .A(\data[0][27] ), .B(n2), .C(\data[2][27] ), .D(n10), .Y(
        n158) );
  AND2X1 U199 ( .A(n159), .B(n158), .Y(n160) );
  NAND3X1 U200 ( .A(n162), .B(n161), .C(n160), .Y(N98) );
  AOI22X1 U201 ( .A(\data[5][28] ), .B(n1), .C(\data[7][28] ), .D(n9), .Y(n167) );
  AOI22X1 U202 ( .A(\data[1][28] ), .B(n5), .C(\data[3][28] ), .D(n15), .Y(
        n166) );
  AOI22X1 U203 ( .A(\data[4][28] ), .B(n6), .C(\data[6][28] ), .D(n16), .Y(
        n164) );
  AOI22X1 U204 ( .A(\data[0][28] ), .B(n2), .C(\data[2][28] ), .D(n10), .Y(
        n163) );
  AND2X1 U205 ( .A(n164), .B(n163), .Y(n165) );
  NAND3X1 U206 ( .A(n167), .B(n166), .C(n165), .Y(N97) );
  AOI22X1 U207 ( .A(\data[5][29] ), .B(n1), .C(\data[7][29] ), .D(n9), .Y(n172) );
  AOI22X1 U208 ( .A(\data[1][29] ), .B(n5), .C(\data[3][29] ), .D(n15), .Y(
        n171) );
  AOI22X1 U209 ( .A(\data[4][29] ), .B(n6), .C(\data[6][29] ), .D(n16), .Y(
        n169) );
  AOI22X1 U210 ( .A(\data[0][29] ), .B(n2), .C(\data[2][29] ), .D(n10), .Y(
        n168) );
  AND2X1 U211 ( .A(n169), .B(n168), .Y(n170) );
  NAND3X1 U212 ( .A(n172), .B(n171), .C(n170), .Y(N96) );
  AOI22X1 U213 ( .A(\data[5][30] ), .B(n1), .C(\data[7][30] ), .D(n9), .Y(n177) );
  AOI22X1 U214 ( .A(\data[1][30] ), .B(n5), .C(\data[3][30] ), .D(n15), .Y(
        n176) );
  AOI22X1 U215 ( .A(\data[4][30] ), .B(n6), .C(\data[6][30] ), .D(n16), .Y(
        n174) );
  AOI22X1 U216 ( .A(\data[0][30] ), .B(n2), .C(\data[2][30] ), .D(n10), .Y(
        n173) );
  AND2X1 U217 ( .A(n174), .B(n173), .Y(n175) );
  NAND3X1 U218 ( .A(n177), .B(n176), .C(n175), .Y(N95) );
  AOI22X1 U219 ( .A(\data[5][31] ), .B(n1), .C(\data[7][31] ), .D(n9), .Y(n190) );
  AOI22X1 U220 ( .A(\data[1][31] ), .B(n5), .C(\data[3][31] ), .D(n15), .Y(
        n189) );
  AOI22X1 U221 ( .A(\data[4][31] ), .B(n6), .C(\data[6][31] ), .D(n16), .Y(
        n187) );
  AOI22X1 U222 ( .A(\data[0][31] ), .B(n2), .C(\data[2][31] ), .D(n10), .Y(
        n186) );
  AND2X1 U223 ( .A(n187), .B(n186), .Y(n188) );
  NAND3X1 U224 ( .A(n190), .B(n189), .C(n188), .Y(N94) );
  INVX2 U225 ( .A(N21), .Y(n191) );
  AOI21X1 U226 ( .A(n192), .B(N92), .C(n193), .Y(write_enable) );
  INVX1 U227 ( .A(write_command), .Y(n193) );
  AND2X1 U228 ( .A(read_command), .B(n14), .Y(read_enable) );
  AND2X1 U229 ( .A(N116), .B(n14), .Y(read_data[9]) );
  AND2X1 U230 ( .A(N117), .B(n14), .Y(read_data[8]) );
  AND2X1 U231 ( .A(N118), .B(n14), .Y(read_data[7]) );
  AND2X1 U232 ( .A(N119), .B(n14), .Y(read_data[6]) );
  AND2X1 U233 ( .A(N120), .B(n14), .Y(read_data[5]) );
  AND2X1 U234 ( .A(N121), .B(n14), .Y(read_data[4]) );
  AND2X1 U235 ( .A(N122), .B(n14), .Y(read_data[3]) );
  AND2X1 U236 ( .A(N94), .B(n14), .Y(read_data[31]) );
  AND2X1 U237 ( .A(N95), .B(n14), .Y(read_data[30]) );
  AND2X1 U238 ( .A(N123), .B(n14), .Y(read_data[2]) );
  AND2X1 U239 ( .A(N96), .B(n14), .Y(read_data[29]) );
  AND2X1 U240 ( .A(N97), .B(n14), .Y(read_data[28]) );
  AND2X1 U241 ( .A(N98), .B(n14), .Y(read_data[27]) );
  AND2X1 U242 ( .A(N99), .B(n14), .Y(read_data[26]) );
  AND2X1 U243 ( .A(N100), .B(n14), .Y(read_data[25]) );
  AND2X1 U244 ( .A(N101), .B(n14), .Y(read_data[24]) );
  AND2X1 U245 ( .A(N102), .B(n14), .Y(read_data[23]) );
  AND2X1 U246 ( .A(N103), .B(n14), .Y(read_data[22]) );
  AND2X1 U247 ( .A(N104), .B(n14), .Y(read_data[21]) );
  AND2X1 U248 ( .A(N105), .B(n14), .Y(read_data[20]) );
  AND2X1 U249 ( .A(N124), .B(n194), .Y(read_data[1]) );
  AND2X1 U250 ( .A(N106), .B(n194), .Y(read_data[19]) );
  AND2X1 U251 ( .A(N107), .B(n194), .Y(read_data[18]) );
  AND2X1 U252 ( .A(N108), .B(n194), .Y(read_data[17]) );
  AND2X1 U253 ( .A(N109), .B(n194), .Y(read_data[16]) );
  AND2X1 U254 ( .A(N110), .B(n194), .Y(read_data[15]) );
  AND2X1 U255 ( .A(N111), .B(n194), .Y(read_data[14]) );
  AND2X1 U256 ( .A(N112), .B(n194), .Y(read_data[13]) );
  AND2X1 U257 ( .A(N113), .B(n194), .Y(read_data[12]) );
  AND2X1 U258 ( .A(N114), .B(n194), .Y(read_data[11]) );
  AND2X1 U259 ( .A(N115), .B(n194), .Y(read_data[10]) );
  AND2X1 U260 ( .A(N125), .B(n194), .Y(read_data[0]) );
  INVX1 U261 ( .A(n194), .Y(fifo_empty) );
  MUX2X1 U262 ( .B(n195), .A(n196), .S(n7), .Y(n613) );
  INVX1 U263 ( .A(\data[7][31] ), .Y(n195) );
  MUX2X1 U264 ( .B(n198), .A(n199), .S(n7), .Y(n612) );
  INVX1 U265 ( .A(\data[7][30] ), .Y(n198) );
  MUX2X1 U266 ( .B(n200), .A(n201), .S(n7), .Y(n611) );
  INVX1 U267 ( .A(\data[7][29] ), .Y(n200) );
  MUX2X1 U268 ( .B(n202), .A(n203), .S(n7), .Y(n610) );
  INVX1 U269 ( .A(\data[7][28] ), .Y(n202) );
  MUX2X1 U270 ( .B(n204), .A(n205), .S(n7), .Y(n609) );
  INVX1 U271 ( .A(\data[7][27] ), .Y(n204) );
  MUX2X1 U272 ( .B(n206), .A(n207), .S(n7), .Y(n608) );
  INVX1 U273 ( .A(\data[7][26] ), .Y(n206) );
  MUX2X1 U274 ( .B(n208), .A(n209), .S(n7), .Y(n607) );
  INVX1 U275 ( .A(\data[7][25] ), .Y(n208) );
  MUX2X1 U276 ( .B(n210), .A(n211), .S(n7), .Y(n606) );
  INVX1 U277 ( .A(\data[7][24] ), .Y(n210) );
  MUX2X1 U278 ( .B(n212), .A(n213), .S(n7), .Y(n605) );
  INVX1 U279 ( .A(\data[7][23] ), .Y(n212) );
  MUX2X1 U280 ( .B(n214), .A(n215), .S(n7), .Y(n604) );
  INVX1 U281 ( .A(\data[7][22] ), .Y(n214) );
  MUX2X1 U282 ( .B(n216), .A(n217), .S(n7), .Y(n603) );
  INVX1 U283 ( .A(\data[7][21] ), .Y(n216) );
  MUX2X1 U284 ( .B(n218), .A(n219), .S(n7), .Y(n602) );
  INVX1 U285 ( .A(\data[7][20] ), .Y(n218) );
  MUX2X1 U286 ( .B(n220), .A(n221), .S(n7), .Y(n601) );
  INVX1 U287 ( .A(\data[7][19] ), .Y(n220) );
  MUX2X1 U288 ( .B(n222), .A(n223), .S(n7), .Y(n600) );
  INVX1 U289 ( .A(\data[7][18] ), .Y(n222) );
  MUX2X1 U290 ( .B(n224), .A(n225), .S(n7), .Y(n599) );
  INVX1 U291 ( .A(\data[7][17] ), .Y(n224) );
  MUX2X1 U292 ( .B(n226), .A(n227), .S(n7), .Y(n598) );
  INVX1 U293 ( .A(\data[7][16] ), .Y(n226) );
  MUX2X1 U294 ( .B(n228), .A(n229), .S(n7), .Y(n597) );
  INVX1 U295 ( .A(\data[7][15] ), .Y(n228) );
  MUX2X1 U296 ( .B(n230), .A(n231), .S(n7), .Y(n596) );
  INVX1 U297 ( .A(\data[7][14] ), .Y(n230) );
  MUX2X1 U298 ( .B(n232), .A(n233), .S(n7), .Y(n595) );
  INVX1 U299 ( .A(\data[7][13] ), .Y(n232) );
  MUX2X1 U300 ( .B(n234), .A(n235), .S(n7), .Y(n594) );
  INVX1 U301 ( .A(\data[7][12] ), .Y(n234) );
  MUX2X1 U302 ( .B(n236), .A(n237), .S(n7), .Y(n593) );
  INVX1 U303 ( .A(\data[7][11] ), .Y(n236) );
  MUX2X1 U304 ( .B(n238), .A(n239), .S(n197), .Y(n592) );
  INVX1 U305 ( .A(\data[7][10] ), .Y(n238) );
  MUX2X1 U306 ( .B(n240), .A(n241), .S(n197), .Y(n591) );
  INVX1 U307 ( .A(\data[7][9] ), .Y(n240) );
  MUX2X1 U308 ( .B(n242), .A(n243), .S(n197), .Y(n590) );
  INVX1 U309 ( .A(\data[7][8] ), .Y(n242) );
  MUX2X1 U310 ( .B(n244), .A(n245), .S(n197), .Y(n589) );
  INVX1 U311 ( .A(\data[7][7] ), .Y(n244) );
  MUX2X1 U312 ( .B(n246), .A(n247), .S(n197), .Y(n588) );
  INVX1 U313 ( .A(\data[7][6] ), .Y(n246) );
  MUX2X1 U314 ( .B(n248), .A(n249), .S(n197), .Y(n587) );
  INVX1 U315 ( .A(\data[7][5] ), .Y(n248) );
  MUX2X1 U316 ( .B(n250), .A(n251), .S(n197), .Y(n586) );
  INVX1 U317 ( .A(\data[7][4] ), .Y(n250) );
  MUX2X1 U318 ( .B(n252), .A(n253), .S(n197), .Y(n585) );
  INVX1 U319 ( .A(\data[7][3] ), .Y(n252) );
  MUX2X1 U320 ( .B(n254), .A(n255), .S(n197), .Y(n584) );
  INVX1 U321 ( .A(\data[7][2] ), .Y(n254) );
  MUX2X1 U322 ( .B(n256), .A(n257), .S(n197), .Y(n583) );
  INVX1 U323 ( .A(\data[7][1] ), .Y(n256) );
  MUX2X1 U324 ( .B(n258), .A(n259), .S(n197), .Y(n582) );
  OAI21X1 U325 ( .A(n260), .B(n261), .C(n_rst), .Y(n197) );
  INVX1 U326 ( .A(\data[7][0] ), .Y(n258) );
  MUX2X1 U327 ( .B(n262), .A(n196), .S(n3), .Y(n581) );
  INVX1 U328 ( .A(\data[6][31] ), .Y(n262) );
  MUX2X1 U329 ( .B(n264), .A(n199), .S(n3), .Y(n580) );
  INVX1 U330 ( .A(\data[6][30] ), .Y(n264) );
  MUX2X1 U331 ( .B(n265), .A(n201), .S(n3), .Y(n579) );
  INVX1 U332 ( .A(\data[6][29] ), .Y(n265) );
  MUX2X1 U333 ( .B(n266), .A(n203), .S(n3), .Y(n578) );
  INVX1 U334 ( .A(\data[6][28] ), .Y(n266) );
  MUX2X1 U335 ( .B(n267), .A(n205), .S(n3), .Y(n577) );
  INVX1 U336 ( .A(\data[6][27] ), .Y(n267) );
  MUX2X1 U337 ( .B(n268), .A(n207), .S(n3), .Y(n576) );
  INVX1 U338 ( .A(\data[6][26] ), .Y(n268) );
  MUX2X1 U339 ( .B(n269), .A(n209), .S(n3), .Y(n575) );
  INVX1 U340 ( .A(\data[6][25] ), .Y(n269) );
  MUX2X1 U341 ( .B(n270), .A(n211), .S(n3), .Y(n574) );
  INVX1 U342 ( .A(\data[6][24] ), .Y(n270) );
  MUX2X1 U343 ( .B(n271), .A(n213), .S(n3), .Y(n573) );
  INVX1 U344 ( .A(\data[6][23] ), .Y(n271) );
  MUX2X1 U345 ( .B(n272), .A(n215), .S(n3), .Y(n572) );
  INVX1 U346 ( .A(\data[6][22] ), .Y(n272) );
  MUX2X1 U347 ( .B(n273), .A(n217), .S(n3), .Y(n571) );
  INVX1 U348 ( .A(\data[6][21] ), .Y(n273) );
  MUX2X1 U349 ( .B(n274), .A(n219), .S(n3), .Y(n570) );
  INVX1 U350 ( .A(\data[6][20] ), .Y(n274) );
  MUX2X1 U351 ( .B(n275), .A(n221), .S(n3), .Y(n569) );
  INVX1 U352 ( .A(\data[6][19] ), .Y(n275) );
  MUX2X1 U353 ( .B(n276), .A(n223), .S(n3), .Y(n568) );
  INVX1 U354 ( .A(\data[6][18] ), .Y(n276) );
  MUX2X1 U355 ( .B(n277), .A(n225), .S(n3), .Y(n567) );
  INVX1 U356 ( .A(\data[6][17] ), .Y(n277) );
  MUX2X1 U357 ( .B(n278), .A(n227), .S(n3), .Y(n566) );
  INVX1 U358 ( .A(\data[6][16] ), .Y(n278) );
  MUX2X1 U359 ( .B(n279), .A(n229), .S(n3), .Y(n565) );
  INVX1 U360 ( .A(\data[6][15] ), .Y(n279) );
  MUX2X1 U361 ( .B(n280), .A(n231), .S(n3), .Y(n564) );
  INVX1 U362 ( .A(\data[6][14] ), .Y(n280) );
  MUX2X1 U363 ( .B(n281), .A(n233), .S(n3), .Y(n563) );
  INVX1 U364 ( .A(\data[6][13] ), .Y(n281) );
  MUX2X1 U365 ( .B(n282), .A(n235), .S(n3), .Y(n562) );
  INVX1 U366 ( .A(\data[6][12] ), .Y(n282) );
  MUX2X1 U367 ( .B(n283), .A(n237), .S(n3), .Y(n561) );
  INVX1 U368 ( .A(\data[6][11] ), .Y(n283) );
  MUX2X1 U369 ( .B(n284), .A(n239), .S(n263), .Y(n560) );
  INVX1 U370 ( .A(\data[6][10] ), .Y(n284) );
  MUX2X1 U371 ( .B(n285), .A(n241), .S(n263), .Y(n559) );
  INVX1 U372 ( .A(\data[6][9] ), .Y(n285) );
  MUX2X1 U373 ( .B(n286), .A(n243), .S(n263), .Y(n558) );
  INVX1 U374 ( .A(\data[6][8] ), .Y(n286) );
  MUX2X1 U375 ( .B(n287), .A(n245), .S(n263), .Y(n557) );
  INVX1 U376 ( .A(\data[6][7] ), .Y(n287) );
  MUX2X1 U377 ( .B(n288), .A(n247), .S(n263), .Y(n556) );
  INVX1 U378 ( .A(\data[6][6] ), .Y(n288) );
  MUX2X1 U379 ( .B(n289), .A(n249), .S(n263), .Y(n555) );
  INVX1 U380 ( .A(\data[6][5] ), .Y(n289) );
  MUX2X1 U381 ( .B(n290), .A(n251), .S(n263), .Y(n554) );
  INVX1 U382 ( .A(\data[6][4] ), .Y(n290) );
  MUX2X1 U383 ( .B(n291), .A(n253), .S(n263), .Y(n553) );
  INVX1 U384 ( .A(\data[6][3] ), .Y(n291) );
  MUX2X1 U385 ( .B(n292), .A(n255), .S(n263), .Y(n552) );
  INVX1 U386 ( .A(\data[6][2] ), .Y(n292) );
  MUX2X1 U387 ( .B(n293), .A(n257), .S(n263), .Y(n551) );
  INVX1 U388 ( .A(\data[6][1] ), .Y(n293) );
  MUX2X1 U389 ( .B(n294), .A(n259), .S(n263), .Y(n550) );
  OAI21X1 U390 ( .A(n261), .B(n295), .C(n_rst), .Y(n263) );
  INVX1 U391 ( .A(\data[6][0] ), .Y(n294) );
  MUX2X1 U392 ( .B(n296), .A(n196), .S(n17), .Y(n549) );
  INVX1 U393 ( .A(\data[5][31] ), .Y(n296) );
  MUX2X1 U394 ( .B(n298), .A(n199), .S(n17), .Y(n548) );
  INVX1 U395 ( .A(\data[5][30] ), .Y(n298) );
  MUX2X1 U396 ( .B(n299), .A(n201), .S(n17), .Y(n547) );
  INVX1 U397 ( .A(\data[5][29] ), .Y(n299) );
  MUX2X1 U398 ( .B(n300), .A(n203), .S(n17), .Y(n546) );
  INVX1 U399 ( .A(\data[5][28] ), .Y(n300) );
  MUX2X1 U400 ( .B(n301), .A(n205), .S(n17), .Y(n545) );
  INVX1 U401 ( .A(\data[5][27] ), .Y(n301) );
  MUX2X1 U402 ( .B(n302), .A(n207), .S(n17), .Y(n544) );
  INVX1 U403 ( .A(\data[5][26] ), .Y(n302) );
  MUX2X1 U404 ( .B(n303), .A(n209), .S(n17), .Y(n543) );
  INVX1 U405 ( .A(\data[5][25] ), .Y(n303) );
  MUX2X1 U406 ( .B(n304), .A(n211), .S(n17), .Y(n542) );
  INVX1 U407 ( .A(\data[5][24] ), .Y(n304) );
  MUX2X1 U408 ( .B(n305), .A(n213), .S(n17), .Y(n541) );
  INVX1 U409 ( .A(\data[5][23] ), .Y(n305) );
  MUX2X1 U410 ( .B(n306), .A(n215), .S(n17), .Y(n540) );
  INVX1 U411 ( .A(\data[5][22] ), .Y(n306) );
  MUX2X1 U412 ( .B(n307), .A(n217), .S(n17), .Y(n539) );
  INVX1 U413 ( .A(\data[5][21] ), .Y(n307) );
  MUX2X1 U414 ( .B(n308), .A(n219), .S(n17), .Y(n538) );
  INVX1 U415 ( .A(\data[5][20] ), .Y(n308) );
  MUX2X1 U416 ( .B(n309), .A(n221), .S(n17), .Y(n537) );
  INVX1 U417 ( .A(\data[5][19] ), .Y(n309) );
  MUX2X1 U418 ( .B(n310), .A(n223), .S(n17), .Y(n536) );
  INVX1 U419 ( .A(\data[5][18] ), .Y(n310) );
  MUX2X1 U420 ( .B(n311), .A(n225), .S(n17), .Y(n535) );
  INVX1 U421 ( .A(\data[5][17] ), .Y(n311) );
  MUX2X1 U422 ( .B(n312), .A(n227), .S(n17), .Y(n534) );
  INVX1 U423 ( .A(\data[5][16] ), .Y(n312) );
  MUX2X1 U424 ( .B(n313), .A(n229), .S(n17), .Y(n533) );
  INVX1 U425 ( .A(\data[5][15] ), .Y(n313) );
  MUX2X1 U426 ( .B(n314), .A(n231), .S(n17), .Y(n532) );
  INVX1 U427 ( .A(\data[5][14] ), .Y(n314) );
  MUX2X1 U428 ( .B(n315), .A(n233), .S(n17), .Y(n531) );
  INVX1 U429 ( .A(\data[5][13] ), .Y(n315) );
  MUX2X1 U430 ( .B(n316), .A(n235), .S(n17), .Y(n530) );
  INVX1 U431 ( .A(\data[5][12] ), .Y(n316) );
  MUX2X1 U432 ( .B(n317), .A(n237), .S(n17), .Y(n529) );
  INVX1 U433 ( .A(\data[5][11] ), .Y(n317) );
  MUX2X1 U434 ( .B(n318), .A(n239), .S(n297), .Y(n528) );
  INVX1 U435 ( .A(\data[5][10] ), .Y(n318) );
  MUX2X1 U436 ( .B(n319), .A(n241), .S(n297), .Y(n527) );
  INVX1 U437 ( .A(\data[5][9] ), .Y(n319) );
  MUX2X1 U438 ( .B(n320), .A(n243), .S(n297), .Y(n526) );
  INVX1 U439 ( .A(\data[5][8] ), .Y(n320) );
  MUX2X1 U440 ( .B(n321), .A(n245), .S(n297), .Y(n525) );
  INVX1 U441 ( .A(\data[5][7] ), .Y(n321) );
  MUX2X1 U442 ( .B(n322), .A(n247), .S(n297), .Y(n524) );
  INVX1 U443 ( .A(\data[5][6] ), .Y(n322) );
  MUX2X1 U444 ( .B(n323), .A(n249), .S(n297), .Y(n523) );
  INVX1 U445 ( .A(\data[5][5] ), .Y(n323) );
  MUX2X1 U446 ( .B(n324), .A(n251), .S(n297), .Y(n522) );
  INVX1 U447 ( .A(\data[5][4] ), .Y(n324) );
  MUX2X1 U448 ( .B(n325), .A(n253), .S(n297), .Y(n521) );
  INVX1 U449 ( .A(\data[5][3] ), .Y(n325) );
  MUX2X1 U450 ( .B(n326), .A(n255), .S(n297), .Y(n520) );
  INVX1 U451 ( .A(\data[5][2] ), .Y(n326) );
  MUX2X1 U452 ( .B(n327), .A(n257), .S(n297), .Y(n519) );
  INVX1 U453 ( .A(\data[5][1] ), .Y(n327) );
  MUX2X1 U454 ( .B(n328), .A(n259), .S(n297), .Y(n518) );
  OAI21X1 U455 ( .A(n261), .B(n329), .C(n_rst), .Y(n297) );
  INVX1 U456 ( .A(\data[5][0] ), .Y(n328) );
  MUX2X1 U457 ( .B(n330), .A(n196), .S(n11), .Y(n517) );
  INVX1 U458 ( .A(\data[4][31] ), .Y(n330) );
  MUX2X1 U459 ( .B(n332), .A(n199), .S(n11), .Y(n516) );
  INVX1 U460 ( .A(\data[4][30] ), .Y(n332) );
  MUX2X1 U461 ( .B(n333), .A(n201), .S(n11), .Y(n515) );
  INVX1 U462 ( .A(\data[4][29] ), .Y(n333) );
  MUX2X1 U463 ( .B(n334), .A(n203), .S(n11), .Y(n514) );
  INVX1 U464 ( .A(\data[4][28] ), .Y(n334) );
  MUX2X1 U465 ( .B(n335), .A(n205), .S(n11), .Y(n513) );
  INVX1 U466 ( .A(\data[4][27] ), .Y(n335) );
  MUX2X1 U467 ( .B(n336), .A(n207), .S(n11), .Y(n512) );
  INVX1 U468 ( .A(\data[4][26] ), .Y(n336) );
  MUX2X1 U469 ( .B(n337), .A(n209), .S(n11), .Y(n511) );
  INVX1 U470 ( .A(\data[4][25] ), .Y(n337) );
  MUX2X1 U471 ( .B(n338), .A(n211), .S(n11), .Y(n510) );
  INVX1 U472 ( .A(\data[4][24] ), .Y(n338) );
  MUX2X1 U473 ( .B(n339), .A(n213), .S(n11), .Y(n509) );
  INVX1 U474 ( .A(\data[4][23] ), .Y(n339) );
  MUX2X1 U475 ( .B(n340), .A(n215), .S(n11), .Y(n508) );
  INVX1 U476 ( .A(\data[4][22] ), .Y(n340) );
  MUX2X1 U477 ( .B(n341), .A(n217), .S(n11), .Y(n507) );
  INVX1 U478 ( .A(\data[4][21] ), .Y(n341) );
  MUX2X1 U479 ( .B(n342), .A(n219), .S(n11), .Y(n506) );
  INVX1 U480 ( .A(\data[4][20] ), .Y(n342) );
  MUX2X1 U481 ( .B(n343), .A(n221), .S(n11), .Y(n505) );
  INVX1 U482 ( .A(\data[4][19] ), .Y(n343) );
  MUX2X1 U483 ( .B(n344), .A(n223), .S(n11), .Y(n504) );
  INVX1 U484 ( .A(\data[4][18] ), .Y(n344) );
  MUX2X1 U485 ( .B(n345), .A(n225), .S(n11), .Y(n503) );
  INVX1 U486 ( .A(\data[4][17] ), .Y(n345) );
  MUX2X1 U487 ( .B(n346), .A(n227), .S(n11), .Y(n502) );
  INVX1 U488 ( .A(\data[4][16] ), .Y(n346) );
  MUX2X1 U489 ( .B(n347), .A(n229), .S(n11), .Y(n501) );
  INVX1 U490 ( .A(\data[4][15] ), .Y(n347) );
  MUX2X1 U491 ( .B(n348), .A(n231), .S(n11), .Y(n500) );
  INVX1 U492 ( .A(\data[4][14] ), .Y(n348) );
  MUX2X1 U493 ( .B(n349), .A(n233), .S(n11), .Y(n499) );
  INVX1 U494 ( .A(\data[4][13] ), .Y(n349) );
  MUX2X1 U495 ( .B(n350), .A(n235), .S(n11), .Y(n498) );
  INVX1 U496 ( .A(\data[4][12] ), .Y(n350) );
  MUX2X1 U497 ( .B(n351), .A(n237), .S(n11), .Y(n497) );
  INVX1 U498 ( .A(\data[4][11] ), .Y(n351) );
  MUX2X1 U499 ( .B(n352), .A(n239), .S(n331), .Y(n496) );
  INVX1 U500 ( .A(\data[4][10] ), .Y(n352) );
  MUX2X1 U501 ( .B(n353), .A(n241), .S(n331), .Y(n495) );
  INVX1 U502 ( .A(\data[4][9] ), .Y(n353) );
  MUX2X1 U503 ( .B(n354), .A(n243), .S(n331), .Y(n494) );
  INVX1 U504 ( .A(\data[4][8] ), .Y(n354) );
  MUX2X1 U505 ( .B(n355), .A(n245), .S(n331), .Y(n493) );
  INVX1 U506 ( .A(\data[4][7] ), .Y(n355) );
  MUX2X1 U507 ( .B(n356), .A(n247), .S(n331), .Y(n492) );
  INVX1 U508 ( .A(\data[4][6] ), .Y(n356) );
  MUX2X1 U509 ( .B(n357), .A(n249), .S(n331), .Y(n491) );
  INVX1 U510 ( .A(\data[4][5] ), .Y(n357) );
  MUX2X1 U511 ( .B(n614), .A(n251), .S(n331), .Y(n490) );
  INVX1 U512 ( .A(\data[4][4] ), .Y(n614) );
  MUX2X1 U513 ( .B(n615), .A(n253), .S(n331), .Y(n489) );
  INVX1 U514 ( .A(\data[4][3] ), .Y(n615) );
  MUX2X1 U515 ( .B(n616), .A(n255), .S(n331), .Y(n488) );
  INVX1 U516 ( .A(\data[4][2] ), .Y(n616) );
  MUX2X1 U517 ( .B(n617), .A(n257), .S(n331), .Y(n487) );
  INVX1 U518 ( .A(\data[4][1] ), .Y(n617) );
  MUX2X1 U519 ( .B(n618), .A(n259), .S(n331), .Y(n486) );
  OAI21X1 U520 ( .A(n619), .B(n261), .C(n_rst), .Y(n331) );
  NAND3X1 U521 ( .A(write_pointer[2]), .B(n620), .C(n13), .Y(n261) );
  INVX1 U522 ( .A(\data[4][0] ), .Y(n618) );
  MUX2X1 U523 ( .B(n622), .A(n196), .S(n4), .Y(n485) );
  INVX1 U524 ( .A(\data[3][31] ), .Y(n622) );
  MUX2X1 U525 ( .B(n624), .A(n199), .S(n4), .Y(n484) );
  INVX1 U526 ( .A(\data[3][30] ), .Y(n624) );
  MUX2X1 U527 ( .B(n625), .A(n201), .S(n4), .Y(n483) );
  INVX1 U528 ( .A(\data[3][29] ), .Y(n625) );
  MUX2X1 U529 ( .B(n626), .A(n203), .S(n4), .Y(n482) );
  INVX1 U530 ( .A(\data[3][28] ), .Y(n626) );
  MUX2X1 U531 ( .B(n627), .A(n205), .S(n4), .Y(n481) );
  INVX1 U532 ( .A(\data[3][27] ), .Y(n627) );
  MUX2X1 U533 ( .B(n628), .A(n207), .S(n4), .Y(n480) );
  INVX1 U534 ( .A(\data[3][26] ), .Y(n628) );
  MUX2X1 U535 ( .B(n629), .A(n209), .S(n4), .Y(n479) );
  INVX1 U536 ( .A(\data[3][25] ), .Y(n629) );
  MUX2X1 U537 ( .B(n630), .A(n211), .S(n4), .Y(n478) );
  INVX1 U538 ( .A(\data[3][24] ), .Y(n630) );
  MUX2X1 U539 ( .B(n631), .A(n213), .S(n4), .Y(n477) );
  INVX1 U540 ( .A(\data[3][23] ), .Y(n631) );
  MUX2X1 U541 ( .B(n632), .A(n215), .S(n4), .Y(n476) );
  INVX1 U542 ( .A(\data[3][22] ), .Y(n632) );
  MUX2X1 U543 ( .B(n633), .A(n217), .S(n4), .Y(n475) );
  INVX1 U544 ( .A(\data[3][21] ), .Y(n633) );
  MUX2X1 U545 ( .B(n634), .A(n219), .S(n4), .Y(n474) );
  INVX1 U546 ( .A(\data[3][20] ), .Y(n634) );
  MUX2X1 U547 ( .B(n635), .A(n221), .S(n4), .Y(n473) );
  INVX1 U548 ( .A(\data[3][19] ), .Y(n635) );
  MUX2X1 U549 ( .B(n636), .A(n223), .S(n4), .Y(n472) );
  INVX1 U550 ( .A(\data[3][18] ), .Y(n636) );
  MUX2X1 U551 ( .B(n637), .A(n225), .S(n4), .Y(n471) );
  INVX1 U552 ( .A(\data[3][17] ), .Y(n637) );
  MUX2X1 U553 ( .B(n638), .A(n227), .S(n4), .Y(n470) );
  INVX1 U554 ( .A(\data[3][16] ), .Y(n638) );
  MUX2X1 U555 ( .B(n639), .A(n229), .S(n4), .Y(n469) );
  INVX1 U556 ( .A(\data[3][15] ), .Y(n639) );
  MUX2X1 U557 ( .B(n640), .A(n231), .S(n4), .Y(n468) );
  INVX1 U558 ( .A(\data[3][14] ), .Y(n640) );
  MUX2X1 U559 ( .B(n641), .A(n233), .S(n4), .Y(n467) );
  INVX1 U560 ( .A(\data[3][13] ), .Y(n641) );
  MUX2X1 U561 ( .B(n642), .A(n235), .S(n4), .Y(n466) );
  INVX1 U562 ( .A(\data[3][12] ), .Y(n642) );
  MUX2X1 U563 ( .B(n643), .A(n237), .S(n4), .Y(n465) );
  INVX1 U564 ( .A(\data[3][11] ), .Y(n643) );
  MUX2X1 U565 ( .B(n644), .A(n239), .S(n623), .Y(n464) );
  INVX1 U566 ( .A(\data[3][10] ), .Y(n644) );
  MUX2X1 U567 ( .B(n645), .A(n241), .S(n623), .Y(n463) );
  INVX1 U568 ( .A(\data[3][9] ), .Y(n645) );
  MUX2X1 U569 ( .B(n646), .A(n243), .S(n623), .Y(n462) );
  INVX1 U570 ( .A(\data[3][8] ), .Y(n646) );
  MUX2X1 U571 ( .B(n647), .A(n245), .S(n623), .Y(n461) );
  INVX1 U572 ( .A(\data[3][7] ), .Y(n647) );
  MUX2X1 U573 ( .B(n648), .A(n247), .S(n623), .Y(n460) );
  INVX1 U574 ( .A(\data[3][6] ), .Y(n648) );
  MUX2X1 U575 ( .B(n649), .A(n249), .S(n623), .Y(n459) );
  INVX1 U576 ( .A(\data[3][5] ), .Y(n649) );
  MUX2X1 U577 ( .B(n650), .A(n251), .S(n623), .Y(n458) );
  INVX1 U578 ( .A(\data[3][4] ), .Y(n650) );
  MUX2X1 U579 ( .B(n651), .A(n253), .S(n623), .Y(n457) );
  INVX1 U580 ( .A(\data[3][3] ), .Y(n651) );
  MUX2X1 U581 ( .B(n652), .A(n255), .S(n623), .Y(n456) );
  INVX1 U582 ( .A(\data[3][2] ), .Y(n652) );
  MUX2X1 U583 ( .B(n653), .A(n257), .S(n623), .Y(n455) );
  INVX1 U584 ( .A(\data[3][1] ), .Y(n653) );
  MUX2X1 U585 ( .B(n654), .A(n259), .S(n623), .Y(n454) );
  OAI21X1 U586 ( .A(n260), .B(n655), .C(n_rst), .Y(n623) );
  INVX1 U587 ( .A(\data[3][0] ), .Y(n654) );
  MUX2X1 U588 ( .B(n656), .A(n196), .S(n8), .Y(n453) );
  INVX1 U589 ( .A(\data[2][31] ), .Y(n656) );
  MUX2X1 U590 ( .B(n658), .A(n199), .S(n8), .Y(n452) );
  INVX1 U591 ( .A(\data[2][30] ), .Y(n658) );
  MUX2X1 U592 ( .B(n659), .A(n201), .S(n8), .Y(n451) );
  INVX1 U593 ( .A(\data[2][29] ), .Y(n659) );
  MUX2X1 U594 ( .B(n660), .A(n203), .S(n8), .Y(n450) );
  INVX1 U595 ( .A(\data[2][28] ), .Y(n660) );
  MUX2X1 U596 ( .B(n661), .A(n205), .S(n8), .Y(n449) );
  INVX1 U597 ( .A(\data[2][27] ), .Y(n661) );
  MUX2X1 U598 ( .B(n662), .A(n207), .S(n8), .Y(n448) );
  INVX1 U599 ( .A(\data[2][26] ), .Y(n662) );
  MUX2X1 U600 ( .B(n663), .A(n209), .S(n8), .Y(n447) );
  INVX1 U601 ( .A(\data[2][25] ), .Y(n663) );
  MUX2X1 U602 ( .B(n664), .A(n211), .S(n8), .Y(n446) );
  INVX1 U603 ( .A(\data[2][24] ), .Y(n664) );
  MUX2X1 U604 ( .B(n665), .A(n213), .S(n8), .Y(n445) );
  INVX1 U605 ( .A(\data[2][23] ), .Y(n665) );
  MUX2X1 U606 ( .B(n666), .A(n215), .S(n8), .Y(n444) );
  INVX1 U607 ( .A(\data[2][22] ), .Y(n666) );
  MUX2X1 U608 ( .B(n667), .A(n217), .S(n8), .Y(n443) );
  INVX1 U609 ( .A(\data[2][21] ), .Y(n667) );
  MUX2X1 U610 ( .B(n668), .A(n219), .S(n8), .Y(n442) );
  INVX1 U611 ( .A(\data[2][20] ), .Y(n668) );
  MUX2X1 U612 ( .B(n669), .A(n221), .S(n8), .Y(n441) );
  INVX1 U613 ( .A(\data[2][19] ), .Y(n669) );
  MUX2X1 U614 ( .B(n670), .A(n223), .S(n8), .Y(n440) );
  INVX1 U615 ( .A(\data[2][18] ), .Y(n670) );
  MUX2X1 U616 ( .B(n671), .A(n225), .S(n8), .Y(n439) );
  INVX1 U617 ( .A(\data[2][17] ), .Y(n671) );
  MUX2X1 U618 ( .B(n672), .A(n227), .S(n8), .Y(n438) );
  INVX1 U619 ( .A(\data[2][16] ), .Y(n672) );
  MUX2X1 U620 ( .B(n673), .A(n229), .S(n8), .Y(n437) );
  INVX1 U621 ( .A(\data[2][15] ), .Y(n673) );
  MUX2X1 U622 ( .B(n674), .A(n231), .S(n8), .Y(n436) );
  INVX1 U623 ( .A(\data[2][14] ), .Y(n674) );
  MUX2X1 U624 ( .B(n675), .A(n233), .S(n8), .Y(n435) );
  INVX1 U625 ( .A(\data[2][13] ), .Y(n675) );
  MUX2X1 U626 ( .B(n676), .A(n235), .S(n8), .Y(n434) );
  INVX1 U627 ( .A(\data[2][12] ), .Y(n676) );
  MUX2X1 U628 ( .B(n677), .A(n237), .S(n8), .Y(n433) );
  INVX1 U629 ( .A(\data[2][11] ), .Y(n677) );
  MUX2X1 U630 ( .B(n678), .A(n239), .S(n657), .Y(n432) );
  INVX1 U631 ( .A(\data[2][10] ), .Y(n678) );
  MUX2X1 U632 ( .B(n679), .A(n241), .S(n657), .Y(n431) );
  INVX1 U633 ( .A(\data[2][9] ), .Y(n679) );
  MUX2X1 U634 ( .B(n680), .A(n243), .S(n657), .Y(n430) );
  INVX1 U635 ( .A(\data[2][8] ), .Y(n680) );
  MUX2X1 U636 ( .B(n681), .A(n245), .S(n657), .Y(n429) );
  INVX1 U637 ( .A(\data[2][7] ), .Y(n681) );
  MUX2X1 U638 ( .B(n682), .A(n247), .S(n657), .Y(n428) );
  INVX1 U639 ( .A(\data[2][6] ), .Y(n682) );
  MUX2X1 U640 ( .B(n683), .A(n249), .S(n657), .Y(n427) );
  INVX1 U641 ( .A(\data[2][5] ), .Y(n683) );
  MUX2X1 U642 ( .B(n684), .A(n251), .S(n657), .Y(n426) );
  INVX1 U643 ( .A(\data[2][4] ), .Y(n684) );
  MUX2X1 U644 ( .B(n685), .A(n253), .S(n657), .Y(n425) );
  INVX1 U645 ( .A(\data[2][3] ), .Y(n685) );
  MUX2X1 U646 ( .B(n686), .A(n255), .S(n657), .Y(n424) );
  INVX1 U647 ( .A(\data[2][2] ), .Y(n686) );
  MUX2X1 U648 ( .B(n687), .A(n257), .S(n657), .Y(n423) );
  INVX1 U649 ( .A(\data[2][1] ), .Y(n687) );
  MUX2X1 U650 ( .B(n688), .A(n259), .S(n657), .Y(n422) );
  OAI21X1 U651 ( .A(n655), .B(n295), .C(n_rst), .Y(n657) );
  NAND2X1 U652 ( .A(write_pointer[1]), .B(n689), .Y(n295) );
  INVX1 U653 ( .A(\data[2][0] ), .Y(n688) );
  MUX2X1 U654 ( .B(n690), .A(n196), .S(n12), .Y(n421) );
  INVX1 U655 ( .A(\data[1][31] ), .Y(n690) );
  MUX2X1 U656 ( .B(n692), .A(n199), .S(n12), .Y(n420) );
  INVX1 U657 ( .A(\data[1][30] ), .Y(n692) );
  MUX2X1 U658 ( .B(n693), .A(n201), .S(n12), .Y(n419) );
  INVX1 U659 ( .A(\data[1][29] ), .Y(n693) );
  MUX2X1 U660 ( .B(n694), .A(n203), .S(n12), .Y(n418) );
  INVX1 U661 ( .A(\data[1][28] ), .Y(n694) );
  MUX2X1 U662 ( .B(n695), .A(n205), .S(n12), .Y(n417) );
  INVX1 U663 ( .A(\data[1][27] ), .Y(n695) );
  MUX2X1 U664 ( .B(n696), .A(n207), .S(n12), .Y(n416) );
  INVX1 U665 ( .A(\data[1][26] ), .Y(n696) );
  MUX2X1 U666 ( .B(n697), .A(n209), .S(n12), .Y(n415) );
  INVX1 U667 ( .A(\data[1][25] ), .Y(n697) );
  MUX2X1 U668 ( .B(n698), .A(n211), .S(n12), .Y(n414) );
  INVX1 U669 ( .A(\data[1][24] ), .Y(n698) );
  MUX2X1 U670 ( .B(n699), .A(n213), .S(n12), .Y(n413) );
  INVX1 U671 ( .A(\data[1][23] ), .Y(n699) );
  MUX2X1 U672 ( .B(n700), .A(n215), .S(n12), .Y(n412) );
  INVX1 U673 ( .A(\data[1][22] ), .Y(n700) );
  MUX2X1 U674 ( .B(n701), .A(n217), .S(n12), .Y(n411) );
  INVX1 U675 ( .A(\data[1][21] ), .Y(n701) );
  MUX2X1 U676 ( .B(n702), .A(n219), .S(n12), .Y(n410) );
  INVX1 U677 ( .A(\data[1][20] ), .Y(n702) );
  MUX2X1 U678 ( .B(n703), .A(n221), .S(n12), .Y(n409) );
  INVX1 U679 ( .A(\data[1][19] ), .Y(n703) );
  MUX2X1 U680 ( .B(n704), .A(n223), .S(n12), .Y(n408) );
  INVX1 U681 ( .A(\data[1][18] ), .Y(n704) );
  MUX2X1 U682 ( .B(n705), .A(n225), .S(n12), .Y(n407) );
  INVX1 U683 ( .A(\data[1][17] ), .Y(n705) );
  MUX2X1 U684 ( .B(n706), .A(n227), .S(n12), .Y(n406) );
  INVX1 U685 ( .A(\data[1][16] ), .Y(n706) );
  MUX2X1 U686 ( .B(n707), .A(n229), .S(n12), .Y(n405) );
  INVX1 U687 ( .A(\data[1][15] ), .Y(n707) );
  MUX2X1 U688 ( .B(n708), .A(n231), .S(n12), .Y(n404) );
  INVX1 U689 ( .A(\data[1][14] ), .Y(n708) );
  MUX2X1 U690 ( .B(n709), .A(n233), .S(n12), .Y(n403) );
  INVX1 U691 ( .A(\data[1][13] ), .Y(n709) );
  MUX2X1 U692 ( .B(n710), .A(n235), .S(n12), .Y(n402) );
  INVX1 U693 ( .A(\data[1][12] ), .Y(n710) );
  MUX2X1 U694 ( .B(n711), .A(n237), .S(n12), .Y(n401) );
  INVX1 U695 ( .A(\data[1][11] ), .Y(n711) );
  MUX2X1 U696 ( .B(n712), .A(n239), .S(n691), .Y(n400) );
  INVX1 U697 ( .A(\data[1][10] ), .Y(n712) );
  MUX2X1 U698 ( .B(n713), .A(n241), .S(n691), .Y(n399) );
  INVX1 U699 ( .A(\data[1][9] ), .Y(n713) );
  MUX2X1 U700 ( .B(n714), .A(n243), .S(n691), .Y(n398) );
  INVX1 U701 ( .A(\data[1][8] ), .Y(n714) );
  MUX2X1 U702 ( .B(n715), .A(n245), .S(n691), .Y(n397) );
  INVX1 U703 ( .A(\data[1][7] ), .Y(n715) );
  MUX2X1 U704 ( .B(n716), .A(n247), .S(n691), .Y(n396) );
  INVX1 U705 ( .A(\data[1][6] ), .Y(n716) );
  MUX2X1 U706 ( .B(n717), .A(n249), .S(n691), .Y(n395) );
  INVX1 U707 ( .A(\data[1][5] ), .Y(n717) );
  MUX2X1 U708 ( .B(n718), .A(n251), .S(n691), .Y(n394) );
  INVX1 U709 ( .A(\data[1][4] ), .Y(n718) );
  MUX2X1 U710 ( .B(n719), .A(n253), .S(n691), .Y(n393) );
  INVX1 U711 ( .A(\data[1][3] ), .Y(n719) );
  MUX2X1 U712 ( .B(n720), .A(n255), .S(n691), .Y(n392) );
  INVX1 U713 ( .A(\data[1][2] ), .Y(n720) );
  MUX2X1 U714 ( .B(n721), .A(n257), .S(n691), .Y(n391) );
  INVX1 U715 ( .A(\data[1][1] ), .Y(n721) );
  MUX2X1 U716 ( .B(n722), .A(n259), .S(n691), .Y(n390) );
  OAI21X1 U717 ( .A(n655), .B(n329), .C(n_rst), .Y(n691) );
  NAND2X1 U718 ( .A(write_pointer[0]), .B(n723), .Y(n329) );
  INVX1 U719 ( .A(\data[1][0] ), .Y(n722) );
  MUX2X1 U720 ( .B(n724), .A(n196), .S(n18), .Y(n389) );
  NAND2X1 U721 ( .A(write_data[31]), .B(n13), .Y(n196) );
  INVX1 U722 ( .A(\data[0][31] ), .Y(n724) );
  MUX2X1 U723 ( .B(n726), .A(n199), .S(n18), .Y(n388) );
  NAND2X1 U724 ( .A(write_data[30]), .B(n13), .Y(n199) );
  INVX1 U725 ( .A(\data[0][30] ), .Y(n726) );
  MUX2X1 U726 ( .B(n727), .A(n201), .S(n18), .Y(n387) );
  NAND2X1 U727 ( .A(write_data[29]), .B(n13), .Y(n201) );
  INVX1 U728 ( .A(\data[0][29] ), .Y(n727) );
  MUX2X1 U729 ( .B(n728), .A(n203), .S(n18), .Y(n386) );
  NAND2X1 U730 ( .A(write_data[28]), .B(n13), .Y(n203) );
  INVX1 U731 ( .A(\data[0][28] ), .Y(n728) );
  MUX2X1 U732 ( .B(n729), .A(n205), .S(n18), .Y(n385) );
  NAND2X1 U733 ( .A(write_data[27]), .B(n13), .Y(n205) );
  INVX1 U734 ( .A(\data[0][27] ), .Y(n729) );
  MUX2X1 U735 ( .B(n730), .A(n207), .S(n18), .Y(n384) );
  NAND2X1 U736 ( .A(write_data[26]), .B(n13), .Y(n207) );
  INVX1 U737 ( .A(\data[0][26] ), .Y(n730) );
  MUX2X1 U738 ( .B(n731), .A(n209), .S(n18), .Y(n383) );
  NAND2X1 U739 ( .A(write_data[25]), .B(n13), .Y(n209) );
  INVX1 U740 ( .A(\data[0][25] ), .Y(n731) );
  MUX2X1 U741 ( .B(n732), .A(n211), .S(n18), .Y(n382) );
  NAND2X1 U742 ( .A(write_data[24]), .B(n13), .Y(n211) );
  INVX1 U743 ( .A(\data[0][24] ), .Y(n732) );
  MUX2X1 U744 ( .B(n733), .A(n213), .S(n18), .Y(n381) );
  NAND2X1 U745 ( .A(write_data[23]), .B(n13), .Y(n213) );
  INVX1 U746 ( .A(\data[0][23] ), .Y(n733) );
  MUX2X1 U747 ( .B(n734), .A(n215), .S(n18), .Y(n380) );
  NAND2X1 U748 ( .A(write_data[22]), .B(n13), .Y(n215) );
  INVX1 U749 ( .A(\data[0][22] ), .Y(n734) );
  MUX2X1 U750 ( .B(n735), .A(n217), .S(n18), .Y(n379) );
  NAND2X1 U751 ( .A(write_data[21]), .B(n13), .Y(n217) );
  INVX1 U752 ( .A(\data[0][21] ), .Y(n735) );
  MUX2X1 U753 ( .B(n736), .A(n219), .S(n18), .Y(n378) );
  NAND2X1 U754 ( .A(write_data[20]), .B(n13), .Y(n219) );
  INVX1 U755 ( .A(\data[0][20] ), .Y(n736) );
  MUX2X1 U756 ( .B(n737), .A(n221), .S(n18), .Y(n377) );
  NAND2X1 U757 ( .A(write_data[19]), .B(n13), .Y(n221) );
  INVX1 U758 ( .A(\data[0][19] ), .Y(n737) );
  MUX2X1 U759 ( .B(n738), .A(n223), .S(n18), .Y(n376) );
  NAND2X1 U760 ( .A(write_data[18]), .B(n13), .Y(n223) );
  INVX1 U761 ( .A(\data[0][18] ), .Y(n738) );
  MUX2X1 U762 ( .B(n739), .A(n225), .S(n18), .Y(n375) );
  NAND2X1 U763 ( .A(write_data[17]), .B(n13), .Y(n225) );
  INVX1 U764 ( .A(\data[0][17] ), .Y(n739) );
  MUX2X1 U765 ( .B(n740), .A(n227), .S(n18), .Y(n374) );
  NAND2X1 U766 ( .A(write_data[16]), .B(n13), .Y(n227) );
  INVX1 U767 ( .A(\data[0][16] ), .Y(n740) );
  MUX2X1 U768 ( .B(n741), .A(n229), .S(n18), .Y(n373) );
  NAND2X1 U769 ( .A(write_data[15]), .B(n13), .Y(n229) );
  INVX1 U770 ( .A(\data[0][15] ), .Y(n741) );
  MUX2X1 U771 ( .B(n742), .A(n231), .S(n18), .Y(n372) );
  NAND2X1 U772 ( .A(write_data[14]), .B(n13), .Y(n231) );
  INVX1 U773 ( .A(\data[0][14] ), .Y(n742) );
  MUX2X1 U774 ( .B(n743), .A(n233), .S(n18), .Y(n371) );
  NAND2X1 U775 ( .A(write_data[13]), .B(n13), .Y(n233) );
  INVX1 U776 ( .A(\data[0][13] ), .Y(n743) );
  MUX2X1 U777 ( .B(n744), .A(n235), .S(n18), .Y(n370) );
  NAND2X1 U778 ( .A(write_data[12]), .B(n13), .Y(n235) );
  INVX1 U779 ( .A(\data[0][12] ), .Y(n744) );
  MUX2X1 U780 ( .B(n745), .A(n237), .S(n18), .Y(n369) );
  NAND2X1 U781 ( .A(write_data[11]), .B(n13), .Y(n237) );
  INVX1 U782 ( .A(\data[0][11] ), .Y(n745) );
  MUX2X1 U783 ( .B(n746), .A(n239), .S(n725), .Y(n368) );
  NAND2X1 U784 ( .A(write_data[10]), .B(n13), .Y(n239) );
  INVX1 U785 ( .A(\data[0][10] ), .Y(n746) );
  MUX2X1 U786 ( .B(n747), .A(n241), .S(n725), .Y(n367) );
  NAND2X1 U787 ( .A(write_data[9]), .B(n13), .Y(n241) );
  INVX1 U788 ( .A(\data[0][9] ), .Y(n747) );
  MUX2X1 U789 ( .B(n748), .A(n243), .S(n725), .Y(n366) );
  NAND2X1 U790 ( .A(write_data[8]), .B(n13), .Y(n243) );
  INVX1 U791 ( .A(\data[0][8] ), .Y(n748) );
  MUX2X1 U792 ( .B(n749), .A(n245), .S(n725), .Y(n365) );
  NAND2X1 U793 ( .A(write_data[7]), .B(n13), .Y(n245) );
  INVX1 U794 ( .A(\data[0][7] ), .Y(n749) );
  MUX2X1 U795 ( .B(n750), .A(n247), .S(n725), .Y(n364) );
  NAND2X1 U796 ( .A(write_data[6]), .B(n13), .Y(n247) );
  INVX1 U797 ( .A(\data[0][6] ), .Y(n750) );
  MUX2X1 U798 ( .B(n751), .A(n249), .S(n725), .Y(n363) );
  NAND2X1 U799 ( .A(write_data[5]), .B(n13), .Y(n249) );
  INVX1 U800 ( .A(\data[0][5] ), .Y(n751) );
  MUX2X1 U801 ( .B(n752), .A(n251), .S(n725), .Y(n362) );
  NAND2X1 U802 ( .A(write_data[4]), .B(n13), .Y(n251) );
  INVX1 U803 ( .A(\data[0][4] ), .Y(n752) );
  MUX2X1 U804 ( .B(n753), .A(n253), .S(n725), .Y(n361) );
  NAND2X1 U805 ( .A(write_data[3]), .B(n13), .Y(n253) );
  INVX1 U806 ( .A(\data[0][3] ), .Y(n753) );
  MUX2X1 U807 ( .B(n754), .A(n255), .S(n725), .Y(n360) );
  NAND2X1 U808 ( .A(write_data[2]), .B(n13), .Y(n255) );
  INVX1 U809 ( .A(\data[0][2] ), .Y(n754) );
  MUX2X1 U810 ( .B(n755), .A(n257), .S(n725), .Y(n359) );
  NAND2X1 U811 ( .A(write_data[1]), .B(n13), .Y(n257) );
  INVX1 U812 ( .A(\data[0][1] ), .Y(n755) );
  MUX2X1 U813 ( .B(n756), .A(n259), .S(n725), .Y(n358) );
  OAI21X1 U814 ( .A(n619), .B(n655), .C(n_rst), .Y(n725) );
  NAND3X1 U815 ( .A(n757), .B(n620), .C(n13), .Y(n655) );
  INVX1 U816 ( .A(write_pointer[3]), .Y(n620) );
  NAND2X1 U817 ( .A(write_data[0]), .B(n13), .Y(n259) );
  NOR2X1 U818 ( .A(n758), .B(N92), .Y(n621) );
  INVX1 U819 ( .A(n_rst), .Y(n758) );
  INVX1 U820 ( .A(\data[0][0] ), .Y(n756) );
  AOI21X1 U821 ( .A(n194), .B(n759), .C(n760), .Y(_3_net_) );
  OAI21X1 U822 ( .A(n760), .B(n194), .C(n761), .Y(_1_net_) );
  NAND3X1 U823 ( .A(\read_pointer[3] ), .B(n762), .C(n763), .Y(n761) );
  NOR2X1 U824 ( .A(N21), .B(N20), .Y(n763) );
  NAND3X1 U825 ( .A(n764), .B(n765), .C(n766), .Y(n194) );
  NOR2X1 U826 ( .A(n767), .B(n768), .Y(n766) );
  XOR2X1 U827 ( .A(write_pointer[0]), .B(N19), .Y(n768) );
  XOR2X1 U828 ( .A(N21), .B(n757), .Y(n765) );
  XOR2X1 U829 ( .A(n769), .B(write_pointer[3]), .Y(n764) );
  INVX1 U830 ( .A(n770), .Y(n760) );
  OAI21X1 U831 ( .A(n770), .B(n759), .C(n192), .Y(N92) );
  NAND3X1 U832 ( .A(n771), .B(n772), .C(n773), .Y(n192) );
  AOI21X1 U833 ( .A(n774), .B(n769), .C(n775), .Y(n773) );
  XOR2X1 U834 ( .A(write_pointer[3]), .B(n776), .Y(n775) );
  NOR2X1 U835 ( .A(n774), .B(n769), .Y(n776) );
  INVX1 U836 ( .A(\read_pointer[3] ), .Y(n769) );
  NOR2X1 U837 ( .A(n757), .B(n260), .Y(n774) );
  XOR2X1 U838 ( .A(n260), .B(n777), .Y(n772) );
  XOR2X1 U839 ( .A(write_pointer[2]), .B(N21), .Y(n777) );
  NAND2X1 U840 ( .A(write_pointer[1]), .B(write_pointer[0]), .Y(n260) );
  MUX2X1 U841 ( .B(n778), .A(n779), .S(write_pointer[0]), .Y(n771) );
  NAND2X1 U842 ( .A(n767), .B(n762), .Y(n779) );
  OR2X1 U843 ( .A(n762), .B(n767), .Y(n778) );
  XOR2X1 U844 ( .A(n780), .B(n723), .Y(n767) );
  NAND3X1 U845 ( .A(write_pointer[3]), .B(n757), .C(n781), .Y(n759) );
  INVX1 U846 ( .A(n619), .Y(n781) );
  NAND2X1 U847 ( .A(n689), .B(n723), .Y(n619) );
  INVX1 U848 ( .A(write_pointer[1]), .Y(n723) );
  INVX1 U849 ( .A(write_pointer[0]), .Y(n689) );
  INVX1 U850 ( .A(write_pointer[2]), .Y(n757) );
  NAND3X1 U851 ( .A(n762), .B(n780), .C(n782), .Y(n770) );
  NOR2X1 U852 ( .A(\read_pointer[3] ), .B(N21), .Y(n782) );
  INVX1 U853 ( .A(N20), .Y(n780) );
  INVX1 U854 ( .A(N19), .Y(n762) );
endmodule


module flex_counter_NUM_CNT_BITS4_1 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   temp_rollover_flag, n1, n2, n3, n4, n5, n6, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37;
  wire   [3:0] temp_count_out;

  DFFSR \count_out_reg[0]  ( .D(temp_count_out[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(temp_count_out[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[1]) );
  DFFSR \count_out_reg[3]  ( .D(temp_count_out[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(temp_count_out[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[2]) );
  DFFSR rollover_flag_reg ( .D(temp_rollover_flag), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(rollover_flag) );
  NOR2X1 U8 ( .A(n1), .B(n2), .Y(temp_rollover_flag) );
  NAND2X1 U9 ( .A(n3), .B(n4), .Y(n2) );
  XNOR2X1 U10 ( .A(rollover_val[1]), .B(temp_count_out[1]), .Y(n4) );
  XNOR2X1 U11 ( .A(rollover_val[2]), .B(temp_count_out[2]), .Y(n3) );
  NAND3X1 U12 ( .A(n5), .B(n6), .C(n12), .Y(n1) );
  XNOR2X1 U13 ( .A(rollover_val[0]), .B(temp_count_out[0]), .Y(n12) );
  XNOR2X1 U14 ( .A(rollover_val[3]), .B(temp_count_out[3]), .Y(n5) );
  OAI22X1 U15 ( .A(n13), .B(n14), .C(n15), .D(n16), .Y(temp_count_out[3]) );
  OAI22X1 U16 ( .A(n17), .B(n14), .C(n15), .D(n18), .Y(temp_count_out[2]) );
  OAI22X1 U17 ( .A(n19), .B(n14), .C(n15), .D(n20), .Y(temp_count_out[1]) );
  NAND3X1 U18 ( .A(n21), .B(n6), .C(count_enable), .Y(n14) );
  INVX1 U19 ( .A(n22), .Y(n21) );
  OAI22X1 U20 ( .A(n15), .B(n23), .C(n24), .D(n25), .Y(temp_count_out[0]) );
  OAI21X1 U21 ( .A(n23), .B(n22), .C(n6), .Y(n25) );
  OAI22X1 U22 ( .A(n26), .B(n27), .C(rollover_val[3]), .D(n13), .Y(n22) );
  OAI21X1 U23 ( .A(n28), .B(n29), .C(n30), .Y(n27) );
  OAI21X1 U24 ( .A(n17), .B(n31), .C(rollover_val[2]), .Y(n30) );
  INVX1 U25 ( .A(n17), .Y(n29) );
  XOR2X1 U26 ( .A(n32), .B(count_out[2]), .Y(n17) );
  INVX1 U27 ( .A(n31), .Y(n28) );
  OAI21X1 U28 ( .A(n33), .B(n34), .C(n35), .Y(n31) );
  OAI21X1 U29 ( .A(n19), .B(n36), .C(rollover_val[1]), .Y(n35) );
  INVX1 U30 ( .A(n33), .Y(n36) );
  INVX1 U31 ( .A(n34), .Y(n19) );
  XNOR2X1 U32 ( .A(n20), .B(count_out[0]), .Y(n34) );
  INVX1 U33 ( .A(count_out[1]), .Y(n20) );
  NOR2X1 U34 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n33) );
  AND2X1 U35 ( .A(n13), .B(rollover_val[3]), .Y(n26) );
  XOR2X1 U36 ( .A(n16), .B(n37), .Y(n13) );
  NOR2X1 U37 ( .A(n32), .B(n18), .Y(n37) );
  INVX1 U38 ( .A(count_out[2]), .Y(n18) );
  NAND2X1 U39 ( .A(count_out[1]), .B(count_out[0]), .Y(n32) );
  INVX1 U40 ( .A(count_out[3]), .Y(n16) );
  INVX1 U41 ( .A(count_out[0]), .Y(n23) );
  NAND2X1 U42 ( .A(n6), .B(n24), .Y(n15) );
  INVX1 U43 ( .A(count_enable), .Y(n24) );
  INVX1 U44 ( .A(clear), .Y(n6) );
endmodule


module acceptance_filter ( clk, n_rst, enable, rxd, crc_calculated, correct );
  input [14:0] crc_calculated;
  input clk, n_rst, enable, rxd;
  output correct;
  wire   N4, N5, N6, correct1, tracking, correctph, N15, n1, n2, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41;
  wire   [3:0] count_out;

  DFFSR tracking_reg ( .D(n40), .CLK(clk), .R(n_rst), .S(1'b1), .Q(tracking)
         );
  DFFSR correct1_reg ( .D(correctph), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        correct1) );
  flex_counter_NUM_CNT_BITS4_1 FLEX_COUNTER ( .clk(clk), .n_rst(n_rst), 
        .clear(n41), .count_enable(enable), .rollover_val({1'b1, 1'b1, 1'b1, 
        1'b0}), .count_out({count_out[3:1], N4}) );
  XOR2X1 U6 ( .A(count_out[3]), .B(n37), .Y(n1) );
  NOR2X1 U7 ( .A(n26), .B(N4), .Y(n5) );
  NOR2X1 U8 ( .A(N4), .B(N5), .Y(n10) );
  NAND2X1 U9 ( .A(N4), .B(n26), .Y(n16) );
  AOI22X1 U10 ( .A(crc_calculated[12]), .B(n10), .C(crc_calculated[13]), .D(
        n29), .Y(n2) );
  OAI21X1 U11 ( .A(n27), .B(n24), .C(n2), .Y(n9) );
  AOI22X1 U12 ( .A(crc_calculated[9]), .B(n29), .C(crc_calculated[10]), .D(n5), 
        .Y(n7) );
  NAND2X1 U13 ( .A(N4), .B(N5), .Y(n13) );
  AOI22X1 U14 ( .A(crc_calculated[11]), .B(n30), .C(crc_calculated[8]), .D(n10), .Y(n6) );
  NAND2X1 U15 ( .A(n7), .B(n6), .Y(n8) );
  AOI22X1 U16 ( .A(N6), .B(n9), .C(n8), .D(n25), .Y(n23) );
  NOR2X1 U17 ( .A(crc_calculated[7]), .B(n13), .Y(n11) );
  NOR2X1 U18 ( .A(n25), .B(n11), .Y(n12) );
  OAI21X1 U19 ( .A(crc_calculated[4]), .B(n28), .C(n12), .Y(n20) );
  OAI22X1 U20 ( .A(crc_calculated[6]), .B(n27), .C(crc_calculated[5]), .D(n16), 
        .Y(n19) );
  NOR2X1 U21 ( .A(crc_calculated[3]), .B(n13), .Y(n14) );
  NOR2X1 U22 ( .A(N6), .B(n14), .Y(n15) );
  OAI21X1 U23 ( .A(crc_calculated[0]), .B(n28), .C(n15), .Y(n18) );
  OAI22X1 U24 ( .A(crc_calculated[2]), .B(n27), .C(crc_calculated[1]), .D(n16), 
        .Y(n17) );
  OAI22X1 U25 ( .A(n20), .B(n19), .C(n18), .D(n17), .Y(n21) );
  NAND2X1 U26 ( .A(n21), .B(n1), .Y(n22) );
  OAI21X1 U27 ( .A(n23), .B(n1), .C(n22), .Y(N15) );
  INVX2 U28 ( .A(crc_calculated[14]), .Y(n24) );
  INVX2 U29 ( .A(N6), .Y(n25) );
  INVX2 U30 ( .A(N5), .Y(n26) );
  INVX2 U31 ( .A(n5), .Y(n27) );
  INVX2 U32 ( .A(n10), .Y(n28) );
  INVX2 U33 ( .A(n16), .Y(n29) );
  INVX2 U34 ( .A(n13), .Y(n30) );
  AOI21X1 U35 ( .A(n31), .B(n32), .C(n41), .Y(n40) );
  INVX1 U36 ( .A(tracking), .Y(n32) );
  XNOR2X1 U37 ( .A(N15), .B(rxd), .Y(n31) );
  INVX1 U38 ( .A(enable), .Y(n41) );
  AOI21X1 U39 ( .A(n33), .B(enable), .C(tracking), .Y(correctph) );
  XOR2X1 U40 ( .A(rxd), .B(N15), .Y(n33) );
  NOR2X1 U41 ( .A(n34), .B(n35), .Y(correct) );
  NAND2X1 U42 ( .A(count_out[3]), .B(count_out[2]), .Y(n35) );
  NAND3X1 U43 ( .A(correct1), .B(n36), .C(count_out[1]), .Y(n34) );
  INVX1 U44 ( .A(N4), .Y(n36) );
  NOR2X1 U45 ( .A(n38), .B(n39), .Y(n37) );
  XNOR2X1 U46 ( .A(n39), .B(n38), .Y(N6) );
  INVX1 U47 ( .A(count_out[2]), .Y(n38) );
  OAI21X1 U48 ( .A(count_out[1]), .B(N4), .C(n39), .Y(N5) );
  NAND2X1 U49 ( .A(N4), .B(count_out[1]), .Y(n39) );
endmodule


module can_crc ( data, crc_en, clk, n_rst, crc_out );
  output [14:0] crc_out;
  input data, crc_en, clk, n_rst;
  wire   n18, n26, n30, n32, n38, n40, n46, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n20, n22, n24, n28, n34, n36, n42;

  DFFSR \crc_out_reg[0]  ( .D(n46), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        crc_out[0]) );
  DFFSR \crc_out_reg[1]  ( .D(n16), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        crc_out[1]) );
  DFFSR \crc_out_reg[2]  ( .D(n20), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        crc_out[2]) );
  DFFSR \crc_out_reg[3]  ( .D(n40), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        crc_out[3]) );
  DFFSR \crc_out_reg[4]  ( .D(n38), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        crc_out[4]) );
  DFFSR \crc_out_reg[5]  ( .D(n22), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        crc_out[5]) );
  DFFSR \crc_out_reg[6]  ( .D(n24), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        crc_out[6]) );
  DFFSR \crc_out_reg[7]  ( .D(n32), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        crc_out[7]) );
  DFFSR \crc_out_reg[8]  ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        crc_out[8]) );
  DFFSR \crc_out_reg[9]  ( .D(n28), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        crc_out[9]) );
  DFFSR \crc_out_reg[10]  ( .D(n26), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        crc_out[10]) );
  DFFSR \crc_out_reg[11]  ( .D(n34), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        crc_out[11]) );
  DFFSR \crc_out_reg[12]  ( .D(n36), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        crc_out[12]) );
  DFFSR \crc_out_reg[13]  ( .D(n42), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        crc_out[13]) );
  DFFSR \crc_out_reg[14]  ( .D(n18), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        crc_out[14]) );
  INVX1 U2 ( .A(n1), .Y(n16) );
  MUX2X1 U3 ( .B(crc_out[1]), .A(crc_out[0]), .S(crc_en), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(crc_out[2]), .A(crc_out[1]), .S(crc_en), .Y(n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(crc_out[5]), .A(crc_out[4]), .S(crc_en), .Y(n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(crc_out[6]), .A(crc_out[5]), .S(crc_en), .Y(n4) );
  INVX1 U10 ( .A(n5), .Y(n28) );
  MUX2X1 U11 ( .B(crc_out[9]), .A(crc_out[8]), .S(crc_en), .Y(n5) );
  MUX2X1 U12 ( .B(n6), .A(n7), .S(crc_en), .Y(n34) );
  INVX1 U13 ( .A(crc_out[11]), .Y(n6) );
  INVX1 U14 ( .A(n8), .Y(n36) );
  MUX2X1 U15 ( .B(crc_out[12]), .A(crc_out[11]), .S(crc_en), .Y(n8) );
  INVX1 U16 ( .A(n9), .Y(n42) );
  MUX2X1 U17 ( .B(crc_out[13]), .A(crc_out[12]), .S(crc_en), .Y(n9) );
  MUX2X1 U18 ( .B(n10), .A(data), .S(crc_en), .Y(n46) );
  INVX1 U19 ( .A(crc_out[0]), .Y(n10) );
  MUX2X1 U20 ( .B(n11), .A(crc_out[2]), .S(crc_en), .Y(n40) );
  INVX1 U21 ( .A(n12), .Y(n38) );
  MUX2X1 U22 ( .B(crc_out[4]), .A(n11), .S(crc_en), .Y(n12) );
  INVX1 U23 ( .A(crc_out[3]), .Y(n11) );
  MUX2X1 U24 ( .B(n13), .A(crc_out[6]), .S(crc_en), .Y(n32) );
  INVX1 U25 ( .A(crc_out[7]), .Y(n13) );
  MUX2X1 U26 ( .B(n14), .A(crc_out[7]), .S(crc_en), .Y(n30) );
  INVX1 U27 ( .A(crc_out[8]), .Y(n14) );
  MUX2X1 U28 ( .B(n7), .A(crc_out[9]), .S(crc_en), .Y(n26) );
  INVX1 U29 ( .A(crc_out[10]), .Y(n7) );
  MUX2X1 U30 ( .B(n15), .A(crc_out[13]), .S(crc_en), .Y(n18) );
  INVX1 U31 ( .A(crc_out[14]), .Y(n15) );
endmodule


module flex_counter_NUM_CNT_BITS6 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [5:0] rollover_val;
  output [5:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   \temp_count_out[0] , temp_rollover_flag, \eq_77/A[1] , \eq_77/A[2] ,
         \eq_77/A[3] , \eq_77/A[4] , \eq_77/A[5] , n1, n2, n3, n4, n5, n6, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55;

  DFFSR \count_out_reg[0]  ( .D(\temp_count_out[0] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(count_out[0]) );
  DFFSR \count_out_reg[4]  ( .D(\eq_77/A[4] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[4]) );
  DFFSR \count_out_reg[3]  ( .D(\eq_77/A[3] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(\eq_77/A[2] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(\eq_77/A[1] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  DFFSR \count_out_reg[5]  ( .D(\eq_77/A[5] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[5]) );
  DFFSR rollover_flag_reg ( .D(temp_rollover_flag), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(rollover_flag) );
  NOR2X1 U5 ( .A(n1), .B(n2), .Y(temp_rollover_flag) );
  NAND3X1 U6 ( .A(n3), .B(n4), .C(n5), .Y(n2) );
  XNOR2X1 U12 ( .A(rollover_val[3]), .B(\eq_77/A[3] ), .Y(n5) );
  XNOR2X1 U13 ( .A(rollover_val[4]), .B(\eq_77/A[4] ), .Y(n4) );
  XNOR2X1 U14 ( .A(rollover_val[2]), .B(\eq_77/A[2] ), .Y(n3) );
  NAND3X1 U15 ( .A(n6), .B(n14), .C(n15), .Y(n1) );
  NOR2X1 U16 ( .A(clear), .B(n16), .Y(n15) );
  XOR2X1 U17 ( .A(\eq_77/A[1] ), .B(rollover_val[1]), .Y(n16) );
  XOR2X1 U18 ( .A(n17), .B(\eq_77/A[5] ), .Y(n14) );
  XNOR2X1 U19 ( .A(rollover_val[0]), .B(\temp_count_out[0] ), .Y(n6) );
  OAI22X1 U20 ( .A(n18), .B(n19), .C(n20), .D(n21), .Y(\temp_count_out[0] ) );
  OAI21X1 U21 ( .A(n19), .B(n22), .C(n23), .Y(n21) );
  INVX1 U22 ( .A(count_out[0]), .Y(n19) );
  OAI22X1 U23 ( .A(n24), .B(n25), .C(n18), .D(n26), .Y(\eq_77/A[5] ) );
  INVX1 U24 ( .A(count_out[5]), .Y(n26) );
  OAI22X1 U25 ( .A(n27), .B(n25), .C(n18), .D(n28), .Y(\eq_77/A[4] ) );
  OAI22X1 U26 ( .A(n29), .B(n25), .C(n18), .D(n30), .Y(\eq_77/A[3] ) );
  OAI22X1 U27 ( .A(n31), .B(n25), .C(n18), .D(n32), .Y(\eq_77/A[2] ) );
  INVX1 U28 ( .A(count_out[2]), .Y(n32) );
  OAI22X1 U29 ( .A(n33), .B(n25), .C(n18), .D(n34), .Y(\eq_77/A[1] ) );
  NAND2X1 U30 ( .A(n23), .B(n20), .Y(n18) );
  INVX1 U31 ( .A(count_enable), .Y(n20) );
  NAND3X1 U32 ( .A(n35), .B(n23), .C(count_enable), .Y(n25) );
  INVX1 U33 ( .A(clear), .Y(n23) );
  INVX1 U34 ( .A(n22), .Y(n35) );
  OAI21X1 U35 ( .A(rollover_val[5]), .B(n24), .C(n36), .Y(n22) );
  OAI21X1 U36 ( .A(n37), .B(n17), .C(n38), .Y(n36) );
  OAI22X1 U37 ( .A(n39), .B(n40), .C(rollover_val[4]), .D(n27), .Y(n38) );
  OAI21X1 U38 ( .A(n41), .B(n42), .C(n43), .Y(n40) );
  OAI21X1 U39 ( .A(n44), .B(n29), .C(rollover_val[3]), .Y(n43) );
  INVX1 U40 ( .A(n42), .Y(n44) );
  OAI21X1 U41 ( .A(n31), .B(n45), .C(n46), .Y(n42) );
  INVX1 U42 ( .A(n47), .Y(n46) );
  AOI21X1 U43 ( .A(n45), .B(n31), .C(rollover_val[2]), .Y(n47) );
  OAI21X1 U44 ( .A(n48), .B(n49), .C(n50), .Y(n45) );
  OAI21X1 U45 ( .A(n33), .B(n51), .C(rollover_val[1]), .Y(n50) );
  INVX1 U46 ( .A(n48), .Y(n51) );
  NOR2X1 U47 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n48) );
  XOR2X1 U48 ( .A(n52), .B(count_out[2]), .Y(n31) );
  NAND2X1 U49 ( .A(count_out[0]), .B(count_out[1]), .Y(n52) );
  INVX1 U50 ( .A(n29), .Y(n41) );
  XOR2X1 U51 ( .A(n53), .B(count_out[3]), .Y(n29) );
  AND2X1 U52 ( .A(n27), .B(rollover_val[4]), .Y(n39) );
  XOR2X1 U53 ( .A(n28), .B(n54), .Y(n27) );
  INVX1 U54 ( .A(count_out[4]), .Y(n28) );
  INVX1 U55 ( .A(rollover_val[5]), .Y(n17) );
  INVX1 U56 ( .A(n24), .Y(n37) );
  XOR2X1 U57 ( .A(n55), .B(count_out[5]), .Y(n24) );
  NAND2X1 U58 ( .A(count_out[4]), .B(n54), .Y(n55) );
  NOR2X1 U59 ( .A(n30), .B(n53), .Y(n54) );
  NAND3X1 U60 ( .A(count_out[0]), .B(count_out[1]), .C(count_out[2]), .Y(n53)
         );
  INVX1 U61 ( .A(count_out[3]), .Y(n30) );
  INVX1 U62 ( .A(n49), .Y(n33) );
  XNOR2X1 U63 ( .A(n34), .B(count_out[0]), .Y(n49) );
  INVX1 U64 ( .A(count_out[1]), .Y(n34) );
endmodule


module flex_pts_sr_NUM_BITS32_SHIFT_MSB1 ( clk, n_rst, shift_enable, 
        load_enable, parallel_in, serial_out );
  input [31:0] parallel_in;
  input clk, n_rst, shift_enable, load_enable;
  output serial_out;
  wire   n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n131;
  wire   [30:0] parallel;

  DFFSR \parallel_reg[0]  ( .D(n130), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[0]) );
  DFFSR \parallel_reg[1]  ( .D(n129), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[1]) );
  DFFSR \parallel_reg[2]  ( .D(n128), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[2]) );
  DFFSR \parallel_reg[3]  ( .D(n127), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[3]) );
  DFFSR \parallel_reg[4]  ( .D(n126), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[4]) );
  DFFSR \parallel_reg[5]  ( .D(n125), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[5]) );
  DFFSR \parallel_reg[6]  ( .D(n124), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[6]) );
  DFFSR \parallel_reg[7]  ( .D(n123), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[7]) );
  DFFSR \parallel_reg[8]  ( .D(n122), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[8]) );
  DFFSR \parallel_reg[9]  ( .D(n121), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[9]) );
  DFFSR \parallel_reg[10]  ( .D(n120), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[10]) );
  DFFSR \parallel_reg[11]  ( .D(n119), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[11]) );
  DFFSR \parallel_reg[12]  ( .D(n118), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[12]) );
  DFFSR \parallel_reg[13]  ( .D(n117), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[13]) );
  DFFSR \parallel_reg[14]  ( .D(n116), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[14]) );
  DFFSR \parallel_reg[15]  ( .D(n115), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[15]) );
  DFFSR \parallel_reg[16]  ( .D(n114), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[16]) );
  DFFSR \parallel_reg[17]  ( .D(n113), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[17]) );
  DFFSR \parallel_reg[18]  ( .D(n112), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[18]) );
  DFFSR \parallel_reg[19]  ( .D(n111), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[19]) );
  DFFSR \parallel_reg[20]  ( .D(n110), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[20]) );
  DFFSR \parallel_reg[21]  ( .D(n109), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[21]) );
  DFFSR \parallel_reg[22]  ( .D(n108), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[22]) );
  DFFSR \parallel_reg[23]  ( .D(n107), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[23]) );
  DFFSR \parallel_reg[24]  ( .D(n106), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[24]) );
  DFFSR \parallel_reg[25]  ( .D(n105), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[25]) );
  DFFSR \parallel_reg[26]  ( .D(n104), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[26]) );
  DFFSR \parallel_reg[27]  ( .D(n103), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[27]) );
  DFFSR \parallel_reg[28]  ( .D(n102), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[28]) );
  DFFSR \parallel_reg[29]  ( .D(n101), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[29]) );
  DFFSR \parallel_reg[30]  ( .D(n100), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel[30]) );
  INVX4 U34 ( .A(load_enable), .Y(n36) );
  INVX2 U35 ( .A(n38), .Y(n32) );
  INVX2 U36 ( .A(n35), .Y(n33) );
  NAND2X1 U37 ( .A(n34), .B(n35), .Y(serial_out) );
  MUX2X1 U38 ( .B(parallel_in[31]), .A(parallel[30]), .S(n36), .Y(n34) );
  NAND2X1 U39 ( .A(n37), .B(n38), .Y(n130) );
  INVX1 U40 ( .A(n39), .Y(n38) );
  MUX2X1 U41 ( .B(parallel[0]), .A(parallel_in[0]), .S(n35), .Y(n37) );
  INVX1 U42 ( .A(n40), .Y(n35) );
  OAI21X1 U43 ( .A(n36), .B(n41), .C(n42), .Y(n129) );
  AOI22X1 U44 ( .A(n32), .B(parallel[0]), .C(parallel[1]), .D(n33), .Y(n42) );
  INVX1 U45 ( .A(parallel_in[1]), .Y(n41) );
  OAI21X1 U46 ( .A(n36), .B(n43), .C(n44), .Y(n128) );
  AOI22X1 U47 ( .A(parallel[1]), .B(n32), .C(parallel[2]), .D(n33), .Y(n44) );
  INVX1 U48 ( .A(parallel_in[2]), .Y(n43) );
  OAI21X1 U49 ( .A(n36), .B(n45), .C(n46), .Y(n127) );
  AOI22X1 U50 ( .A(parallel[2]), .B(n32), .C(parallel[3]), .D(n33), .Y(n46) );
  INVX1 U51 ( .A(parallel_in[3]), .Y(n45) );
  OAI21X1 U52 ( .A(n36), .B(n47), .C(n48), .Y(n126) );
  AOI22X1 U53 ( .A(parallel[3]), .B(n32), .C(parallel[4]), .D(n33), .Y(n48) );
  INVX1 U54 ( .A(parallel_in[4]), .Y(n47) );
  OAI21X1 U55 ( .A(n36), .B(n49), .C(n50), .Y(n125) );
  AOI22X1 U56 ( .A(parallel[4]), .B(n32), .C(parallel[5]), .D(n33), .Y(n50) );
  INVX1 U57 ( .A(parallel_in[5]), .Y(n49) );
  OAI21X1 U58 ( .A(n36), .B(n51), .C(n52), .Y(n124) );
  AOI22X1 U59 ( .A(parallel[5]), .B(n32), .C(parallel[6]), .D(n33), .Y(n52) );
  INVX1 U60 ( .A(parallel_in[6]), .Y(n51) );
  OAI21X1 U61 ( .A(n36), .B(n53), .C(n54), .Y(n123) );
  AOI22X1 U62 ( .A(parallel[6]), .B(n32), .C(parallel[7]), .D(n33), .Y(n54) );
  INVX1 U63 ( .A(parallel_in[7]), .Y(n53) );
  OAI21X1 U64 ( .A(n36), .B(n55), .C(n56), .Y(n122) );
  AOI22X1 U65 ( .A(parallel[7]), .B(n32), .C(parallel[8]), .D(n33), .Y(n56) );
  INVX1 U66 ( .A(parallel_in[8]), .Y(n55) );
  OAI21X1 U67 ( .A(n36), .B(n57), .C(n58), .Y(n121) );
  AOI22X1 U68 ( .A(parallel[8]), .B(n32), .C(parallel[9]), .D(n33), .Y(n58) );
  INVX1 U69 ( .A(parallel_in[9]), .Y(n57) );
  OAI21X1 U70 ( .A(n36), .B(n59), .C(n60), .Y(n120) );
  AOI22X1 U71 ( .A(parallel[9]), .B(n32), .C(parallel[10]), .D(n33), .Y(n60)
         );
  INVX1 U72 ( .A(parallel_in[10]), .Y(n59) );
  OAI21X1 U73 ( .A(n36), .B(n61), .C(n62), .Y(n119) );
  AOI22X1 U74 ( .A(parallel[10]), .B(n32), .C(parallel[11]), .D(n33), .Y(n62)
         );
  INVX1 U75 ( .A(parallel_in[11]), .Y(n61) );
  OAI21X1 U76 ( .A(n36), .B(n63), .C(n64), .Y(n118) );
  AOI22X1 U77 ( .A(parallel[11]), .B(n32), .C(parallel[12]), .D(n33), .Y(n64)
         );
  INVX1 U78 ( .A(parallel_in[12]), .Y(n63) );
  OAI21X1 U79 ( .A(n36), .B(n65), .C(n66), .Y(n117) );
  AOI22X1 U80 ( .A(parallel[12]), .B(n32), .C(parallel[13]), .D(n33), .Y(n66)
         );
  INVX1 U81 ( .A(parallel_in[13]), .Y(n65) );
  OAI21X1 U82 ( .A(n36), .B(n67), .C(n68), .Y(n116) );
  AOI22X1 U83 ( .A(parallel[13]), .B(n32), .C(parallel[14]), .D(n33), .Y(n68)
         );
  INVX1 U84 ( .A(parallel_in[14]), .Y(n67) );
  OAI21X1 U85 ( .A(n36), .B(n69), .C(n70), .Y(n115) );
  AOI22X1 U86 ( .A(parallel[14]), .B(n32), .C(parallel[15]), .D(n33), .Y(n70)
         );
  INVX1 U87 ( .A(parallel_in[15]), .Y(n69) );
  OAI21X1 U88 ( .A(n36), .B(n71), .C(n72), .Y(n114) );
  AOI22X1 U89 ( .A(parallel[15]), .B(n32), .C(parallel[16]), .D(n33), .Y(n72)
         );
  INVX1 U90 ( .A(parallel_in[16]), .Y(n71) );
  OAI21X1 U91 ( .A(n36), .B(n73), .C(n74), .Y(n113) );
  AOI22X1 U92 ( .A(parallel[16]), .B(n32), .C(parallel[17]), .D(n33), .Y(n74)
         );
  INVX1 U93 ( .A(parallel_in[17]), .Y(n73) );
  OAI21X1 U94 ( .A(n36), .B(n75), .C(n76), .Y(n112) );
  AOI22X1 U95 ( .A(parallel[17]), .B(n32), .C(parallel[18]), .D(n33), .Y(n76)
         );
  INVX1 U96 ( .A(parallel_in[18]), .Y(n75) );
  OAI21X1 U97 ( .A(n36), .B(n77), .C(n78), .Y(n111) );
  AOI22X1 U98 ( .A(parallel[18]), .B(n32), .C(parallel[19]), .D(n33), .Y(n78)
         );
  INVX1 U99 ( .A(parallel_in[19]), .Y(n77) );
  OAI21X1 U100 ( .A(n36), .B(n79), .C(n80), .Y(n110) );
  AOI22X1 U101 ( .A(parallel[19]), .B(n32), .C(parallel[20]), .D(n40), .Y(n80)
         );
  INVX1 U102 ( .A(parallel_in[20]), .Y(n79) );
  OAI21X1 U103 ( .A(n36), .B(n81), .C(n82), .Y(n109) );
  AOI22X1 U104 ( .A(parallel[20]), .B(n32), .C(parallel[21]), .D(n40), .Y(n82)
         );
  INVX1 U105 ( .A(parallel_in[21]), .Y(n81) );
  OAI21X1 U106 ( .A(n36), .B(n83), .C(n84), .Y(n108) );
  AOI22X1 U107 ( .A(parallel[21]), .B(n39), .C(parallel[22]), .D(n40), .Y(n84)
         );
  INVX1 U108 ( .A(parallel_in[22]), .Y(n83) );
  OAI21X1 U109 ( .A(n36), .B(n85), .C(n86), .Y(n107) );
  AOI22X1 U110 ( .A(parallel[22]), .B(n39), .C(parallel[23]), .D(n40), .Y(n86)
         );
  INVX1 U111 ( .A(parallel_in[23]), .Y(n85) );
  OAI21X1 U112 ( .A(n36), .B(n87), .C(n88), .Y(n106) );
  AOI22X1 U113 ( .A(parallel[23]), .B(n39), .C(parallel[24]), .D(n40), .Y(n88)
         );
  INVX1 U114 ( .A(parallel_in[24]), .Y(n87) );
  OAI21X1 U115 ( .A(n36), .B(n89), .C(n90), .Y(n105) );
  AOI22X1 U116 ( .A(parallel[24]), .B(n39), .C(parallel[25]), .D(n40), .Y(n90)
         );
  INVX1 U117 ( .A(parallel_in[25]), .Y(n89) );
  OAI21X1 U118 ( .A(n36), .B(n91), .C(n92), .Y(n104) );
  AOI22X1 U119 ( .A(parallel[25]), .B(n39), .C(parallel[26]), .D(n40), .Y(n92)
         );
  INVX1 U120 ( .A(parallel_in[26]), .Y(n91) );
  OAI21X1 U121 ( .A(n36), .B(n93), .C(n94), .Y(n103) );
  AOI22X1 U122 ( .A(parallel[26]), .B(n39), .C(parallel[27]), .D(n40), .Y(n94)
         );
  INVX1 U123 ( .A(parallel_in[27]), .Y(n93) );
  OAI21X1 U124 ( .A(n36), .B(n95), .C(n96), .Y(n102) );
  AOI22X1 U125 ( .A(parallel[27]), .B(n39), .C(parallel[28]), .D(n40), .Y(n96)
         );
  INVX1 U126 ( .A(parallel_in[28]), .Y(n95) );
  OAI21X1 U127 ( .A(n36), .B(n97), .C(n98), .Y(n101) );
  AOI22X1 U128 ( .A(parallel[28]), .B(n39), .C(parallel[29]), .D(n40), .Y(n98)
         );
  INVX1 U129 ( .A(parallel_in[29]), .Y(n97) );
  OAI21X1 U130 ( .A(n36), .B(n99), .C(n131), .Y(n100) );
  AOI22X1 U131 ( .A(parallel[29]), .B(n39), .C(n33), .D(parallel[30]), .Y(n131) );
  NOR2X1 U132 ( .A(n33), .B(load_enable), .Y(n39) );
  NOR2X1 U133 ( .A(shift_enable), .B(load_enable), .Y(n40) );
  INVX1 U134 ( .A(parallel_in[30]), .Y(n99) );
endmodule


module tx_sr ( clk, n_rst, tx_enable, load_enable, tx_data, tx_out );
  input [31:0] tx_data;
  input clk, n_rst, tx_enable, load_enable;
  output tx_out;


  flex_pts_sr_NUM_BITS32_SHIFT_MSB1 TX_SR ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(tx_enable), .load_enable(load_enable), .parallel_in(
        tx_data), .serial_out(tx_out) );
endmodule


module flex_stp_sr_NUM_BITS32_SHIFT_MSB1 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [31:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n36, n38, n40, n42, n44, n46, n48, n50, n52, n54, n56, n58, n60, n62,
         n64, n66, n68, n70, n72, n74, n76, n78, n80, n82, n84, n86, n88, n90,
         n92, n94, n96, n98, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32;

  DFFSR \parallel_out_reg[0]  ( .D(n98), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  DFFSR \parallel_out_reg[1]  ( .D(n96), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[2]  ( .D(n94), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[3]  ( .D(n92), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[4]  ( .D(n90), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[5]  ( .D(n88), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[6]  ( .D(n86), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[7]  ( .D(n84), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[8]  ( .D(n82), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \parallel_out_reg[9]  ( .D(n80), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[9]) );
  DFFSR \parallel_out_reg[10]  ( .D(n78), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[10]) );
  DFFSR \parallel_out_reg[11]  ( .D(n76), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[11]) );
  DFFSR \parallel_out_reg[12]  ( .D(n74), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[12]) );
  DFFSR \parallel_out_reg[13]  ( .D(n72), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[13]) );
  DFFSR \parallel_out_reg[14]  ( .D(n70), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[14]) );
  DFFSR \parallel_out_reg[15]  ( .D(n68), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[15]) );
  DFFSR \parallel_out_reg[16]  ( .D(n66), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[16]) );
  DFFSR \parallel_out_reg[17]  ( .D(n64), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[17]) );
  DFFSR \parallel_out_reg[18]  ( .D(n62), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[18]) );
  DFFSR \parallel_out_reg[19]  ( .D(n60), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[19]) );
  DFFSR \parallel_out_reg[20]  ( .D(n58), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[20]) );
  DFFSR \parallel_out_reg[21]  ( .D(n56), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[21]) );
  DFFSR \parallel_out_reg[22]  ( .D(n54), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[22]) );
  DFFSR \parallel_out_reg[23]  ( .D(n52), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[23]) );
  DFFSR \parallel_out_reg[24]  ( .D(n50), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[24]) );
  DFFSR \parallel_out_reg[25]  ( .D(n48), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[25]) );
  DFFSR \parallel_out_reg[26]  ( .D(n46), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[26]) );
  DFFSR \parallel_out_reg[27]  ( .D(n44), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[27]) );
  DFFSR \parallel_out_reg[28]  ( .D(n42), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[28]) );
  DFFSR \parallel_out_reg[29]  ( .D(n40), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[29]) );
  DFFSR \parallel_out_reg[30]  ( .D(n38), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[30]) );
  DFFSR \parallel_out_reg[31]  ( .D(n36), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[31]) );
  INVX1 U2 ( .A(n1), .Y(n98) );
  MUX2X1 U3 ( .B(parallel_out[0]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n96) );
  MUX2X1 U5 ( .B(parallel_out[1]), .A(parallel_out[0]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n94) );
  MUX2X1 U7 ( .B(parallel_out[2]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n92) );
  MUX2X1 U9 ( .B(parallel_out[3]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n90) );
  MUX2X1 U11 ( .B(parallel_out[4]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n88) );
  MUX2X1 U13 ( .B(parallel_out[5]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n86) );
  MUX2X1 U15 ( .B(parallel_out[6]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n84) );
  MUX2X1 U17 ( .B(parallel_out[7]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n8) );
  INVX1 U18 ( .A(n9), .Y(n82) );
  MUX2X1 U19 ( .B(parallel_out[8]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n9) );
  INVX1 U20 ( .A(n10), .Y(n80) );
  MUX2X1 U21 ( .B(parallel_out[9]), .A(parallel_out[8]), .S(shift_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n78) );
  MUX2X1 U23 ( .B(parallel_out[10]), .A(parallel_out[9]), .S(shift_enable), 
        .Y(n11) );
  INVX1 U24 ( .A(n12), .Y(n76) );
  MUX2X1 U25 ( .B(parallel_out[11]), .A(parallel_out[10]), .S(shift_enable), 
        .Y(n12) );
  INVX1 U26 ( .A(n13), .Y(n74) );
  MUX2X1 U27 ( .B(parallel_out[12]), .A(parallel_out[11]), .S(shift_enable), 
        .Y(n13) );
  INVX1 U28 ( .A(n14), .Y(n72) );
  MUX2X1 U29 ( .B(parallel_out[13]), .A(parallel_out[12]), .S(shift_enable), 
        .Y(n14) );
  INVX1 U30 ( .A(n15), .Y(n70) );
  MUX2X1 U31 ( .B(parallel_out[14]), .A(parallel_out[13]), .S(shift_enable), 
        .Y(n15) );
  INVX1 U32 ( .A(n16), .Y(n68) );
  MUX2X1 U33 ( .B(parallel_out[15]), .A(parallel_out[14]), .S(shift_enable), 
        .Y(n16) );
  INVX1 U34 ( .A(n17), .Y(n66) );
  MUX2X1 U35 ( .B(parallel_out[16]), .A(parallel_out[15]), .S(shift_enable), 
        .Y(n17) );
  INVX1 U36 ( .A(n18), .Y(n64) );
  MUX2X1 U37 ( .B(parallel_out[17]), .A(parallel_out[16]), .S(shift_enable), 
        .Y(n18) );
  INVX1 U38 ( .A(n19), .Y(n62) );
  MUX2X1 U39 ( .B(parallel_out[18]), .A(parallel_out[17]), .S(shift_enable), 
        .Y(n19) );
  INVX1 U40 ( .A(n20), .Y(n60) );
  MUX2X1 U41 ( .B(parallel_out[19]), .A(parallel_out[18]), .S(shift_enable), 
        .Y(n20) );
  INVX1 U42 ( .A(n21), .Y(n58) );
  MUX2X1 U43 ( .B(parallel_out[20]), .A(parallel_out[19]), .S(shift_enable), 
        .Y(n21) );
  INVX1 U44 ( .A(n22), .Y(n56) );
  MUX2X1 U45 ( .B(parallel_out[21]), .A(parallel_out[20]), .S(shift_enable), 
        .Y(n22) );
  INVX1 U46 ( .A(n23), .Y(n54) );
  MUX2X1 U47 ( .B(parallel_out[22]), .A(parallel_out[21]), .S(shift_enable), 
        .Y(n23) );
  INVX1 U48 ( .A(n24), .Y(n52) );
  MUX2X1 U49 ( .B(parallel_out[23]), .A(parallel_out[22]), .S(shift_enable), 
        .Y(n24) );
  INVX1 U50 ( .A(n25), .Y(n50) );
  MUX2X1 U51 ( .B(parallel_out[24]), .A(parallel_out[23]), .S(shift_enable), 
        .Y(n25) );
  INVX1 U52 ( .A(n26), .Y(n48) );
  MUX2X1 U53 ( .B(parallel_out[25]), .A(parallel_out[24]), .S(shift_enable), 
        .Y(n26) );
  INVX1 U54 ( .A(n27), .Y(n46) );
  MUX2X1 U55 ( .B(parallel_out[26]), .A(parallel_out[25]), .S(shift_enable), 
        .Y(n27) );
  INVX1 U56 ( .A(n28), .Y(n44) );
  MUX2X1 U57 ( .B(parallel_out[27]), .A(parallel_out[26]), .S(shift_enable), 
        .Y(n28) );
  INVX1 U58 ( .A(n29), .Y(n42) );
  MUX2X1 U59 ( .B(parallel_out[28]), .A(parallel_out[27]), .S(shift_enable), 
        .Y(n29) );
  INVX1 U60 ( .A(n30), .Y(n40) );
  MUX2X1 U61 ( .B(parallel_out[29]), .A(parallel_out[28]), .S(shift_enable), 
        .Y(n30) );
  INVX1 U62 ( .A(n31), .Y(n38) );
  MUX2X1 U63 ( .B(parallel_out[30]), .A(parallel_out[29]), .S(shift_enable), 
        .Y(n31) );
  INVX1 U64 ( .A(n32), .Y(n36) );
  MUX2X1 U65 ( .B(parallel_out[31]), .A(parallel_out[30]), .S(shift_enable), 
        .Y(n32) );
endmodule


module rx_sr ( clk, n_rst, rx_enable, can_bus_data, rx_data );
  output [31:0] rx_data;
  input clk, n_rst, rx_enable, can_bus_data;


  flex_stp_sr_NUM_BITS32_SHIFT_MSB1 RX_SR ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(rx_enable), .serial_in(can_bus_data), .parallel_out(
        rx_data) );
endmodule


module flex_counter_NUM_CNT_BITS4_0 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   temp_rollover_flag, n1, n2, n3, n4, n5, n6, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37;
  wire   [3:0] temp_count_out;

  DFFSR \count_out_reg[0]  ( .D(temp_count_out[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(temp_count_out[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[1]) );
  DFFSR \count_out_reg[3]  ( .D(temp_count_out[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(temp_count_out[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[2]) );
  DFFSR rollover_flag_reg ( .D(temp_rollover_flag), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(rollover_flag) );
  NOR2X1 U8 ( .A(n1), .B(n2), .Y(temp_rollover_flag) );
  NAND2X1 U9 ( .A(n3), .B(n4), .Y(n2) );
  XNOR2X1 U10 ( .A(rollover_val[1]), .B(temp_count_out[1]), .Y(n4) );
  XNOR2X1 U11 ( .A(rollover_val[2]), .B(temp_count_out[2]), .Y(n3) );
  NAND3X1 U12 ( .A(n5), .B(n6), .C(n12), .Y(n1) );
  XNOR2X1 U13 ( .A(rollover_val[0]), .B(temp_count_out[0]), .Y(n12) );
  XNOR2X1 U14 ( .A(rollover_val[3]), .B(temp_count_out[3]), .Y(n5) );
  OAI22X1 U15 ( .A(n13), .B(n14), .C(n15), .D(n16), .Y(temp_count_out[3]) );
  OAI22X1 U16 ( .A(n17), .B(n14), .C(n15), .D(n18), .Y(temp_count_out[2]) );
  OAI22X1 U17 ( .A(n19), .B(n14), .C(n15), .D(n20), .Y(temp_count_out[1]) );
  NAND3X1 U18 ( .A(n21), .B(n6), .C(count_enable), .Y(n14) );
  INVX1 U19 ( .A(n22), .Y(n21) );
  OAI22X1 U20 ( .A(n15), .B(n23), .C(n24), .D(n25), .Y(temp_count_out[0]) );
  OAI21X1 U21 ( .A(n23), .B(n22), .C(n6), .Y(n25) );
  OAI22X1 U22 ( .A(n26), .B(n27), .C(rollover_val[3]), .D(n13), .Y(n22) );
  OAI21X1 U23 ( .A(n28), .B(n29), .C(n30), .Y(n27) );
  OAI21X1 U24 ( .A(n17), .B(n31), .C(rollover_val[2]), .Y(n30) );
  INVX1 U25 ( .A(n17), .Y(n29) );
  XOR2X1 U26 ( .A(n32), .B(count_out[2]), .Y(n17) );
  INVX1 U27 ( .A(n31), .Y(n28) );
  OAI21X1 U28 ( .A(n33), .B(n34), .C(n35), .Y(n31) );
  OAI21X1 U29 ( .A(n19), .B(n36), .C(rollover_val[1]), .Y(n35) );
  INVX1 U30 ( .A(n33), .Y(n36) );
  INVX1 U31 ( .A(n34), .Y(n19) );
  XNOR2X1 U32 ( .A(n20), .B(count_out[0]), .Y(n34) );
  INVX1 U33 ( .A(count_out[1]), .Y(n20) );
  NOR2X1 U34 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n33) );
  AND2X1 U35 ( .A(n13), .B(rollover_val[3]), .Y(n26) );
  XOR2X1 U36 ( .A(n16), .B(n37), .Y(n13) );
  NOR2X1 U37 ( .A(n32), .B(n18), .Y(n37) );
  INVX1 U38 ( .A(count_out[2]), .Y(n18) );
  NAND2X1 U39 ( .A(count_out[1]), .B(count_out[0]), .Y(n32) );
  INVX1 U40 ( .A(count_out[3]), .Y(n16) );
  INVX1 U41 ( .A(count_out[0]), .Y(n23) );
  NAND2X1 U42 ( .A(n6), .B(n24), .Y(n15) );
  INVX1 U43 ( .A(count_enable), .Y(n24) );
  INVX1 U44 ( .A(clear), .Y(n6) );
endmodule


module arbitration ( clk, n_rst, rxd, arbitration_start, win, loose );
  input clk, n_rst, rxd, arbitration_start;
  output win, loose;
  wire   tracking, count_enable, N65, n22, n24, n26, n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16;
  wire   [3:0] count_out;

  DFFSR tracking_reg ( .D(n26), .CLK(clk), .R(n_rst), .S(1'b1), .Q(tracking)
         );
  DFFSR win_reg ( .D(n24), .CLK(clk), .R(n_rst), .S(1'b1), .Q(win) );
  DFFSR loose_reg ( .D(n22), .CLK(clk), .R(n_rst), .S(1'b1), .Q(loose) );
  flex_counter_NUM_CNT_BITS4_0 FLEX_COUNTER ( .clk(clk), .n_rst(n_rst), 
        .clear(n26), .count_enable(count_enable), .rollover_val({1'b1, 1'b0, 
        1'b1, 1'b0}), .count_out({count_out[3:1], N65}) );
  AOI21X1 U3 ( .A(n1), .B(n2), .C(n3), .Y(n26) );
  INVX1 U4 ( .A(tracking), .Y(n2) );
  XNOR2X1 U5 ( .A(rxd), .B(n4), .Y(n1) );
  OAI21X1 U6 ( .A(n5), .B(n6), .C(n7), .Y(n24) );
  NAND2X1 U7 ( .A(win), .B(n8), .Y(n7) );
  OR2X1 U8 ( .A(n4), .B(n9), .Y(n6) );
  OAI21X1 U9 ( .A(n5), .B(n10), .C(n11), .Y(n22) );
  NAND2X1 U10 ( .A(loose), .B(n8), .Y(n11) );
  NAND2X1 U11 ( .A(tracking), .B(arbitration_start), .Y(n8) );
  NAND2X1 U12 ( .A(n4), .B(n9), .Y(n10) );
  INVX1 U13 ( .A(rxd), .Y(n9) );
  OAI21X1 U14 ( .A(n12), .B(n13), .C(n14), .Y(n4) );
  OAI21X1 U15 ( .A(count_out[2]), .B(n15), .C(n16), .Y(n14) );
  INVX1 U16 ( .A(N65), .Y(n16) );
  INVX1 U17 ( .A(n12), .Y(n15) );
  INVX1 U18 ( .A(count_out[1]), .Y(n13) );
  XOR2X1 U19 ( .A(N65), .B(count_out[3]), .Y(n12) );
  INVX1 U20 ( .A(count_enable), .Y(n5) );
  NOR2X1 U21 ( .A(n3), .B(tracking), .Y(count_enable) );
  INVX1 U22 ( .A(arbitration_start), .Y(n3) );
endmodule


module can_register ( clk, n_rst, command, rxd, txd, write_fifo, read_fifo, 
        send_data );
  input [31:0] command;
  output [31:0] send_data;
  input clk, n_rst, rxd;
  output txd, write_fifo, read_fifo;
  wire   correct, af_enable, WRITE_CAN, clear, count_enable, load_enable, win,
         loose, sync1, sync2, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n301, n303, n304;
  wire   [2:0] state;
  wire   [5:0] count_out;
  wire   [31:0] temp_rx_data;
  wire   [31:0] rx_data;
  wire   [14:0] crc;
  wire   [4:0] rollover_val;
  wire   [31:0] send_data_to_tx;
  wire   [31:0] data_stored_command;
  wire   [2:0] next_state;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  DFFSR WRITE_CAN_reg ( .D(n421), .CLK(clk), .R(1'b1), .S(n_rst), .Q(WRITE_CAN) );
  DFFSR sync1_reg ( .D(read_fifo), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync1)
         );
  DFFSR sync2_reg ( .D(sync1), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync2) );
  DFFNEGX1 \temp_rx_data_reg[0]  ( .D(n420), .CLK(clk), .Q(temp_rx_data[0]) );
  DFFNEGX1 \temp_rx_data_reg[31]  ( .D(n419), .CLK(clk), .Q(temp_rx_data[31])
         );
  DFFNEGX1 \temp_rx_data_reg[30]  ( .D(n418), .CLK(clk), .Q(temp_rx_data[30])
         );
  DFFNEGX1 \temp_rx_data_reg[29]  ( .D(n417), .CLK(clk), .Q(temp_rx_data[29])
         );
  DFFNEGX1 \temp_rx_data_reg[28]  ( .D(n416), .CLK(clk), .Q(temp_rx_data[28])
         );
  DFFNEGX1 \temp_rx_data_reg[27]  ( .D(n415), .CLK(clk), .Q(temp_rx_data[27])
         );
  DFFNEGX1 \temp_rx_data_reg[26]  ( .D(n414), .CLK(clk), .Q(temp_rx_data[26])
         );
  DFFNEGX1 \temp_rx_data_reg[25]  ( .D(n413), .CLK(clk), .Q(temp_rx_data[25])
         );
  DFFNEGX1 \temp_rx_data_reg[24]  ( .D(n412), .CLK(clk), .Q(temp_rx_data[24])
         );
  DFFNEGX1 \temp_rx_data_reg[23]  ( .D(n411), .CLK(clk), .Q(temp_rx_data[23])
         );
  DFFNEGX1 \temp_rx_data_reg[22]  ( .D(n410), .CLK(clk), .Q(temp_rx_data[22])
         );
  DFFNEGX1 \temp_rx_data_reg[21]  ( .D(n409), .CLK(clk), .Q(temp_rx_data[21])
         );
  DFFNEGX1 \temp_rx_data_reg[20]  ( .D(n408), .CLK(clk), .Q(temp_rx_data[20])
         );
  DFFNEGX1 \temp_rx_data_reg[19]  ( .D(n407), .CLK(clk), .Q(temp_rx_data[19])
         );
  DFFNEGX1 \temp_rx_data_reg[18]  ( .D(n406), .CLK(clk), .Q(temp_rx_data[18])
         );
  DFFNEGX1 \temp_rx_data_reg[17]  ( .D(n405), .CLK(clk), .Q(temp_rx_data[17])
         );
  DFFNEGX1 \temp_rx_data_reg[16]  ( .D(n404), .CLK(clk), .Q(temp_rx_data[16])
         );
  DFFNEGX1 \temp_rx_data_reg[15]  ( .D(n403), .CLK(clk), .Q(temp_rx_data[15])
         );
  DFFNEGX1 \temp_rx_data_reg[14]  ( .D(n402), .CLK(clk), .Q(temp_rx_data[14])
         );
  DFFNEGX1 \temp_rx_data_reg[13]  ( .D(n401), .CLK(clk), .Q(temp_rx_data[13])
         );
  DFFNEGX1 \temp_rx_data_reg[12]  ( .D(n400), .CLK(clk), .Q(temp_rx_data[12])
         );
  DFFNEGX1 \temp_rx_data_reg[11]  ( .D(n399), .CLK(clk), .Q(temp_rx_data[11])
         );
  DFFNEGX1 \temp_rx_data_reg[10]  ( .D(n398), .CLK(clk), .Q(temp_rx_data[10])
         );
  DFFNEGX1 \temp_rx_data_reg[9]  ( .D(n397), .CLK(clk), .Q(temp_rx_data[9]) );
  DFFNEGX1 \temp_rx_data_reg[8]  ( .D(n396), .CLK(clk), .Q(temp_rx_data[8]) );
  DFFNEGX1 \temp_rx_data_reg[7]  ( .D(n395), .CLK(clk), .Q(temp_rx_data[7]) );
  DFFNEGX1 \temp_rx_data_reg[6]  ( .D(n394), .CLK(clk), .Q(temp_rx_data[6]) );
  DFFNEGX1 \temp_rx_data_reg[5]  ( .D(n393), .CLK(clk), .Q(temp_rx_data[5]) );
  DFFNEGX1 \temp_rx_data_reg[4]  ( .D(n392), .CLK(clk), .Q(temp_rx_data[4]) );
  DFFNEGX1 \temp_rx_data_reg[3]  ( .D(n391), .CLK(clk), .Q(temp_rx_data[3]) );
  DFFNEGX1 \temp_rx_data_reg[2]  ( .D(n390), .CLK(clk), .Q(temp_rx_data[2]) );
  DFFNEGX1 \temp_rx_data_reg[1]  ( .D(n389), .CLK(clk), .Q(temp_rx_data[1]) );
  DFFNEGX1 \data_stored_command_reg[31]  ( .D(n299), .CLK(clk), .Q(
        data_stored_command[31]) );
  DFFNEGX1 \data_stored_command_reg[30]  ( .D(n298), .CLK(clk), .Q(
        data_stored_command[30]) );
  DFFNEGX1 \data_stored_command_reg[29]  ( .D(n297), .CLK(clk), .Q(
        data_stored_command[29]) );
  DFFNEGX1 \data_stored_command_reg[28]  ( .D(n296), .CLK(clk), .Q(
        data_stored_command[28]) );
  DFFNEGX1 \data_stored_command_reg[27]  ( .D(n295), .CLK(clk), .Q(
        data_stored_command[27]) );
  DFFNEGX1 \data_stored_command_reg[26]  ( .D(n294), .CLK(clk), .Q(
        data_stored_command[26]) );
  DFFNEGX1 \data_stored_command_reg[25]  ( .D(n293), .CLK(clk), .Q(
        data_stored_command[25]) );
  DFFNEGX1 \data_stored_command_reg[24]  ( .D(n292), .CLK(clk), .Q(
        data_stored_command[24]) );
  DFFNEGX1 \data_stored_command_reg[23]  ( .D(n291), .CLK(clk), .Q(
        data_stored_command[23]) );
  DFFNEGX1 \data_stored_command_reg[22]  ( .D(n290), .CLK(clk), .Q(
        data_stored_command[22]) );
  DFFNEGX1 \data_stored_command_reg[21]  ( .D(n289), .CLK(clk), .Q(
        data_stored_command[21]) );
  DFFNEGX1 \data_stored_command_reg[20]  ( .D(n288), .CLK(clk), .Q(
        data_stored_command[20]) );
  DFFNEGX1 \data_stored_command_reg[19]  ( .D(n287), .CLK(clk), .Q(
        data_stored_command[19]) );
  DFFNEGX1 \data_stored_command_reg[18]  ( .D(n286), .CLK(clk), .Q(
        data_stored_command[18]) );
  DFFNEGX1 \data_stored_command_reg[17]  ( .D(n285), .CLK(clk), .Q(
        data_stored_command[17]) );
  DFFNEGX1 \data_stored_command_reg[16]  ( .D(n284), .CLK(clk), .Q(
        data_stored_command[16]) );
  DFFNEGX1 \data_stored_command_reg[15]  ( .D(n283), .CLK(clk), .Q(
        data_stored_command[15]) );
  DFFNEGX1 \data_stored_command_reg[14]  ( .D(n282), .CLK(clk), .Q(
        data_stored_command[14]) );
  DFFNEGX1 \data_stored_command_reg[13]  ( .D(n281), .CLK(clk), .Q(
        data_stored_command[13]) );
  DFFNEGX1 \data_stored_command_reg[12]  ( .D(n280), .CLK(clk), .Q(
        data_stored_command[12]) );
  DFFNEGX1 \data_stored_command_reg[11]  ( .D(n279), .CLK(clk), .Q(
        data_stored_command[11]) );
  DFFNEGX1 \data_stored_command_reg[10]  ( .D(n278), .CLK(clk), .Q(
        data_stored_command[10]) );
  DFFNEGX1 \data_stored_command_reg[9]  ( .D(n277), .CLK(clk), .Q(
        data_stored_command[9]) );
  DFFNEGX1 \data_stored_command_reg[8]  ( .D(n276), .CLK(clk), .Q(
        data_stored_command[8]) );
  DFFNEGX1 \data_stored_command_reg[7]  ( .D(n275), .CLK(clk), .Q(
        data_stored_command[7]) );
  DFFNEGX1 \data_stored_command_reg[6]  ( .D(n274), .CLK(clk), .Q(
        data_stored_command[6]) );
  DFFNEGX1 \data_stored_command_reg[5]  ( .D(n273), .CLK(clk), .Q(
        data_stored_command[5]) );
  DFFNEGX1 \data_stored_command_reg[4]  ( .D(n272), .CLK(clk), .Q(
        data_stored_command[4]) );
  DFFNEGX1 \data_stored_command_reg[3]  ( .D(n271), .CLK(clk), .Q(
        data_stored_command[3]) );
  DFFNEGX1 \data_stored_command_reg[2]  ( .D(n270), .CLK(clk), .Q(
        data_stored_command[2]) );
  DFFNEGX1 \data_stored_command_reg[1]  ( .D(n269), .CLK(clk), .Q(
        data_stored_command[1]) );
  DFFNEGX1 \data_stored_command_reg[0]  ( .D(n268), .CLK(clk), .Q(
        data_stored_command[0]) );
  DFFSR \send_data_reg[31]  ( .D(n357), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[31]) );
  DFFSR \send_data_reg[30]  ( .D(n358), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[30]) );
  DFFSR \send_data_reg[29]  ( .D(n359), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[29]) );
  DFFSR \send_data_reg[28]  ( .D(n360), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[28]) );
  DFFSR \send_data_reg[27]  ( .D(n361), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[27]) );
  DFFSR \send_data_reg[26]  ( .D(n362), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[26]) );
  DFFSR \send_data_reg[25]  ( .D(n363), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[25]) );
  DFFSR \send_data_reg[24]  ( .D(n364), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[24]) );
  DFFSR \send_data_reg[23]  ( .D(n365), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[23]) );
  DFFSR \send_data_reg[22]  ( .D(n366), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[22]) );
  DFFSR \send_data_reg[21]  ( .D(n367), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[21]) );
  DFFSR \send_data_reg[20]  ( .D(n368), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[20]) );
  DFFSR \send_data_reg[19]  ( .D(n369), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[19]) );
  DFFSR \send_data_reg[18]  ( .D(n370), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[18]) );
  DFFSR \send_data_reg[17]  ( .D(n371), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[17]) );
  DFFSR \send_data_reg[16]  ( .D(n372), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[16]) );
  DFFSR \send_data_reg[15]  ( .D(n373), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[15]) );
  DFFSR \send_data_reg[14]  ( .D(n374), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[14]) );
  DFFSR \send_data_reg[13]  ( .D(n375), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[13]) );
  DFFSR \send_data_reg[12]  ( .D(n376), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[12]) );
  DFFSR \send_data_reg[11]  ( .D(n377), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[11]) );
  DFFSR \send_data_reg[10]  ( .D(n378), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[10]) );
  DFFSR \send_data_reg[9]  ( .D(n379), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[9]) );
  DFFSR \send_data_reg[8]  ( .D(n380), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[8]) );
  DFFSR \send_data_reg[7]  ( .D(n381), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[7]) );
  DFFSR \send_data_reg[6]  ( .D(n382), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[6]) );
  DFFSR \send_data_reg[5]  ( .D(n383), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[5]) );
  DFFSR \send_data_reg[4]  ( .D(n384), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[4]) );
  DFFSR \send_data_reg[3]  ( .D(n385), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[3]) );
  DFFSR \send_data_reg[2]  ( .D(n386), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[2]) );
  DFFSR \send_data_reg[1]  ( .D(n387), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[1]) );
  DFFSR \send_data_reg[0]  ( .D(n388), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        send_data[0]) );
  acceptance_filter ACCEPT ( .clk(clk), .n_rst(n_rst), .enable(af_enable), 
        .rxd(rxd), .crc_calculated(crc), .correct(correct) );
  can_crc CRC_module ( .data(n301), .crc_en(n303), .clk(clk), .n_rst(n_rst), 
        .crc_out(crc) );
  flex_counter_NUM_CNT_BITS6 FLEX_COUNTER ( .clk(clk), .n_rst(n_rst), .clear(
        clear), .count_enable(count_enable), .rollover_val({1'b0, n303, 
        rollover_val[3:0]}), .count_out(count_out) );
  tx_sr TX_SR ( .clk(clk), .n_rst(n_rst), .tx_enable(1'b1), .load_enable(
        load_enable), .tx_data(send_data_to_tx), .tx_out(txd) );
  rx_sr RX_SR ( .clk(clk), .n_rst(n_rst), .rx_enable(1'b1), .can_bus_data(rxd), 
        .rx_data(rx_data) );
  arbitration ARBITRATION_module ( .clk(clk), .n_rst(n_rst), .rxd(rxd), 
        .arbitration_start(n304), .win(win), .loose(loose) );
  INVX2 U41 ( .A(n43), .Y(n42) );
  INVX2 U42 ( .A(n207), .Y(n144) );
  INVX2 U43 ( .A(n82), .Y(n303) );
  BUFX2 U44 ( .A(n210), .Y(n39) );
  BUFX2 U45 ( .A(n141), .Y(n40) );
  INVX4 U46 ( .A(write_fifo), .Y(n208) );
  BUFX2 U47 ( .A(sync2), .Y(n41) );
  AND2X1 U48 ( .A(n42), .B(data_stored_command[9]), .Y(send_data_to_tx[9]) );
  AND2X1 U49 ( .A(n42), .B(data_stored_command[8]), .Y(send_data_to_tx[8]) );
  AND2X1 U50 ( .A(n42), .B(data_stored_command[7]), .Y(send_data_to_tx[7]) );
  AND2X1 U51 ( .A(n42), .B(data_stored_command[6]), .Y(send_data_to_tx[6]) );
  AND2X1 U52 ( .A(n42), .B(data_stored_command[5]), .Y(send_data_to_tx[5]) );
  AND2X1 U53 ( .A(n42), .B(data_stored_command[4]), .Y(send_data_to_tx[4]) );
  AND2X1 U54 ( .A(n42), .B(data_stored_command[3]), .Y(send_data_to_tx[3]) );
  OAI21X1 U55 ( .A(n43), .B(n44), .C(n45), .Y(send_data_to_tx[31]) );
  NAND2X1 U56 ( .A(crc[14]), .B(n46), .Y(n45) );
  INVX1 U57 ( .A(data_stored_command[31]), .Y(n44) );
  OAI21X1 U58 ( .A(n43), .B(n47), .C(n48), .Y(send_data_to_tx[30]) );
  NAND2X1 U59 ( .A(crc[13]), .B(n46), .Y(n48) );
  INVX1 U60 ( .A(data_stored_command[30]), .Y(n47) );
  AND2X1 U61 ( .A(n42), .B(data_stored_command[2]), .Y(send_data_to_tx[2]) );
  NAND2X1 U62 ( .A(n49), .B(n50), .Y(send_data_to_tx[29]) );
  AOI21X1 U63 ( .A(data_stored_command[29]), .B(n42), .C(n51), .Y(n50) );
  AOI22X1 U64 ( .A(n52), .B(n53), .C(crc[12]), .D(n46), .Y(n49) );
  OAI21X1 U65 ( .A(n43), .B(n54), .C(n55), .Y(send_data_to_tx[28]) );
  NAND2X1 U66 ( .A(crc[11]), .B(n46), .Y(n55) );
  INVX1 U67 ( .A(data_stored_command[28]), .Y(n54) );
  OAI21X1 U68 ( .A(n56), .B(n57), .C(n58), .Y(send_data_to_tx[27]) );
  AOI21X1 U69 ( .A(data_stored_command[27]), .B(n42), .C(n51), .Y(n58) );
  INVX1 U70 ( .A(crc[10]), .Y(n57) );
  OAI21X1 U71 ( .A(n43), .B(n59), .C(n60), .Y(send_data_to_tx[26]) );
  NAND2X1 U72 ( .A(crc[9]), .B(n46), .Y(n60) );
  INVX1 U73 ( .A(data_stored_command[26]), .Y(n59) );
  OAI21X1 U74 ( .A(n56), .B(n61), .C(n62), .Y(send_data_to_tx[25]) );
  AOI21X1 U75 ( .A(data_stored_command[25]), .B(n42), .C(n51), .Y(n62) );
  NOR2X1 U76 ( .A(n63), .B(n64), .Y(n51) );
  INVX1 U77 ( .A(crc[8]), .Y(n61) );
  OAI21X1 U78 ( .A(n43), .B(n65), .C(n66), .Y(send_data_to_tx[24]) );
  NAND2X1 U79 ( .A(crc[7]), .B(n46), .Y(n66) );
  INVX1 U80 ( .A(data_stored_command[24]), .Y(n65) );
  OAI21X1 U81 ( .A(n43), .B(n67), .C(n68), .Y(send_data_to_tx[23]) );
  NAND2X1 U82 ( .A(crc[6]), .B(n46), .Y(n68) );
  INVX1 U83 ( .A(data_stored_command[23]), .Y(n67) );
  OAI21X1 U84 ( .A(n43), .B(n69), .C(n70), .Y(send_data_to_tx[22]) );
  NAND2X1 U85 ( .A(crc[5]), .B(n46), .Y(n70) );
  INVX1 U86 ( .A(data_stored_command[22]), .Y(n69) );
  OAI21X1 U87 ( .A(n43), .B(n71), .C(n72), .Y(send_data_to_tx[21]) );
  NAND2X1 U88 ( .A(crc[4]), .B(n46), .Y(n72) );
  INVX1 U89 ( .A(data_stored_command[21]), .Y(n71) );
  OAI21X1 U90 ( .A(n43), .B(n73), .C(n74), .Y(send_data_to_tx[20]) );
  NAND2X1 U91 ( .A(crc[3]), .B(n46), .Y(n74) );
  INVX1 U92 ( .A(data_stored_command[20]), .Y(n73) );
  AND2X1 U93 ( .A(n42), .B(data_stored_command[1]), .Y(send_data_to_tx[1]) );
  OAI21X1 U94 ( .A(n43), .B(n75), .C(n76), .Y(send_data_to_tx[19]) );
  NAND2X1 U95 ( .A(crc[2]), .B(n46), .Y(n76) );
  INVX1 U96 ( .A(data_stored_command[19]), .Y(n75) );
  OAI21X1 U97 ( .A(n43), .B(n77), .C(n78), .Y(send_data_to_tx[18]) );
  NAND2X1 U98 ( .A(crc[1]), .B(n46), .Y(n78) );
  INVX1 U99 ( .A(data_stored_command[18]), .Y(n77) );
  OAI21X1 U100 ( .A(n43), .B(n79), .C(n80), .Y(send_data_to_tx[17]) );
  NAND2X1 U101 ( .A(crc[0]), .B(n46), .Y(n80) );
  INVX1 U102 ( .A(data_stored_command[17]), .Y(n79) );
  AND2X1 U103 ( .A(n42), .B(data_stored_command[16]), .Y(send_data_to_tx[16])
         );
  AND2X1 U104 ( .A(n42), .B(data_stored_command[15]), .Y(send_data_to_tx[15])
         );
  AND2X1 U105 ( .A(n42), .B(data_stored_command[14]), .Y(send_data_to_tx[14])
         );
  AND2X1 U106 ( .A(n42), .B(data_stored_command[13]), .Y(send_data_to_tx[13])
         );
  AND2X1 U107 ( .A(n42), .B(data_stored_command[12]), .Y(send_data_to_tx[12])
         );
  AND2X1 U108 ( .A(n42), .B(data_stored_command[11]), .Y(send_data_to_tx[11])
         );
  AND2X1 U109 ( .A(n42), .B(data_stored_command[10]), .Y(send_data_to_tx[10])
         );
  AND2X1 U110 ( .A(n42), .B(data_stored_command[0]), .Y(send_data_to_tx[0]) );
  NAND2X1 U111 ( .A(n81), .B(n303), .Y(n43) );
  NAND3X1 U112 ( .A(n56), .B(n82), .C(n83), .Y(rollover_val[2]) );
  NAND3X1 U113 ( .A(n83), .B(n82), .C(n84), .Y(rollover_val[0]) );
  NAND3X1 U114 ( .A(n85), .B(n56), .C(n86), .Y(next_state[2]) );
  INVX1 U115 ( .A(n87), .Y(n86) );
  OAI21X1 U116 ( .A(n88), .B(n82), .C(n89), .Y(n87) );
  NAND3X1 U117 ( .A(n90), .B(n89), .C(n91), .Y(next_state[1]) );
  AOI22X1 U118 ( .A(n303), .B(n88), .C(n92), .D(n304), .Y(n91) );
  INVX1 U119 ( .A(n93), .Y(n89) );
  AND2X1 U120 ( .A(n83), .B(n85), .Y(n90) );
  OR2X1 U121 ( .A(n94), .B(n95), .Y(next_state[0]) );
  OAI21X1 U122 ( .A(n83), .B(n53), .C(n96), .Y(n95) );
  OAI21X1 U123 ( .A(n56), .B(n97), .C(n98), .Y(n94) );
  AOI21X1 U124 ( .A(n99), .B(n100), .C(n93), .Y(n98) );
  NOR2X1 U125 ( .A(state[2]), .B(state[1]), .Y(n99) );
  INVX1 U126 ( .A(n101), .Y(n97) );
  NAND2X1 U127 ( .A(n102), .B(n_rst), .Y(n268) );
  MUX2X1 U128 ( .B(data_stored_command[0]), .A(command[0]), .S(sync2), .Y(n102) );
  NAND2X1 U129 ( .A(n103), .B(n_rst), .Y(n269) );
  MUX2X1 U130 ( .B(data_stored_command[1]), .A(command[1]), .S(sync2), .Y(n103) );
  NAND2X1 U131 ( .A(n104), .B(n_rst), .Y(n270) );
  MUX2X1 U132 ( .B(data_stored_command[2]), .A(command[2]), .S(sync2), .Y(n104) );
  NAND2X1 U133 ( .A(n105), .B(n_rst), .Y(n271) );
  MUX2X1 U134 ( .B(data_stored_command[3]), .A(command[3]), .S(sync2), .Y(n105) );
  NAND2X1 U135 ( .A(n106), .B(n_rst), .Y(n272) );
  MUX2X1 U136 ( .B(data_stored_command[4]), .A(command[4]), .S(sync2), .Y(n106) );
  NAND2X1 U137 ( .A(n107), .B(n_rst), .Y(n273) );
  MUX2X1 U138 ( .B(data_stored_command[5]), .A(command[5]), .S(sync2), .Y(n107) );
  NAND2X1 U139 ( .A(n108), .B(n_rst), .Y(n274) );
  MUX2X1 U140 ( .B(data_stored_command[6]), .A(command[6]), .S(sync2), .Y(n108) );
  NAND2X1 U141 ( .A(n109), .B(n_rst), .Y(n275) );
  MUX2X1 U142 ( .B(data_stored_command[7]), .A(command[7]), .S(n41), .Y(n109)
         );
  NAND2X1 U143 ( .A(n110), .B(n_rst), .Y(n276) );
  MUX2X1 U144 ( .B(data_stored_command[8]), .A(command[8]), .S(n41), .Y(n110)
         );
  NAND2X1 U145 ( .A(n111), .B(n_rst), .Y(n277) );
  MUX2X1 U146 ( .B(data_stored_command[9]), .A(command[9]), .S(n41), .Y(n111)
         );
  NAND2X1 U147 ( .A(n112), .B(n_rst), .Y(n278) );
  MUX2X1 U148 ( .B(data_stored_command[10]), .A(command[10]), .S(n41), .Y(n112) );
  NAND2X1 U149 ( .A(n113), .B(n_rst), .Y(n279) );
  MUX2X1 U150 ( .B(data_stored_command[11]), .A(command[11]), .S(n41), .Y(n113) );
  NAND2X1 U151 ( .A(n114), .B(n_rst), .Y(n280) );
  MUX2X1 U152 ( .B(data_stored_command[12]), .A(command[12]), .S(n41), .Y(n114) );
  NAND2X1 U153 ( .A(n115), .B(n_rst), .Y(n281) );
  MUX2X1 U154 ( .B(data_stored_command[13]), .A(command[13]), .S(n41), .Y(n115) );
  NAND2X1 U155 ( .A(n116), .B(n_rst), .Y(n282) );
  MUX2X1 U156 ( .B(data_stored_command[14]), .A(command[14]), .S(n41), .Y(n116) );
  NAND2X1 U157 ( .A(n117), .B(n_rst), .Y(n283) );
  MUX2X1 U158 ( .B(data_stored_command[15]), .A(command[15]), .S(n41), .Y(n117) );
  NAND2X1 U159 ( .A(n118), .B(n_rst), .Y(n284) );
  MUX2X1 U160 ( .B(data_stored_command[16]), .A(command[16]), .S(n41), .Y(n118) );
  NAND2X1 U161 ( .A(n119), .B(n_rst), .Y(n285) );
  MUX2X1 U162 ( .B(data_stored_command[17]), .A(command[17]), .S(n41), .Y(n119) );
  NAND2X1 U163 ( .A(n120), .B(n_rst), .Y(n286) );
  MUX2X1 U164 ( .B(data_stored_command[18]), .A(command[18]), .S(n41), .Y(n120) );
  NAND2X1 U165 ( .A(n121), .B(n_rst), .Y(n287) );
  MUX2X1 U166 ( .B(data_stored_command[19]), .A(command[19]), .S(n41), .Y(n121) );
  NAND2X1 U167 ( .A(n122), .B(n_rst), .Y(n288) );
  MUX2X1 U168 ( .B(data_stored_command[20]), .A(command[20]), .S(n41), .Y(n122) );
  NAND2X1 U169 ( .A(n123), .B(n_rst), .Y(n289) );
  MUX2X1 U170 ( .B(data_stored_command[21]), .A(command[21]), .S(n41), .Y(n123) );
  NAND2X1 U171 ( .A(n124), .B(n_rst), .Y(n290) );
  MUX2X1 U172 ( .B(data_stored_command[22]), .A(command[22]), .S(n41), .Y(n124) );
  NAND2X1 U173 ( .A(n125), .B(n_rst), .Y(n291) );
  MUX2X1 U174 ( .B(data_stored_command[23]), .A(command[23]), .S(n41), .Y(n125) );
  NAND2X1 U175 ( .A(n126), .B(n_rst), .Y(n292) );
  MUX2X1 U176 ( .B(data_stored_command[24]), .A(command[24]), .S(n41), .Y(n126) );
  NAND2X1 U177 ( .A(n127), .B(n_rst), .Y(n293) );
  MUX2X1 U178 ( .B(data_stored_command[25]), .A(command[25]), .S(n41), .Y(n127) );
  NAND2X1 U179 ( .A(n128), .B(n_rst), .Y(n294) );
  MUX2X1 U180 ( .B(data_stored_command[26]), .A(command[26]), .S(n41), .Y(n128) );
  NAND2X1 U181 ( .A(n129), .B(n_rst), .Y(n295) );
  MUX2X1 U182 ( .B(data_stored_command[27]), .A(command[27]), .S(n41), .Y(n129) );
  NAND2X1 U183 ( .A(n130), .B(n_rst), .Y(n296) );
  MUX2X1 U184 ( .B(data_stored_command[28]), .A(command[28]), .S(n41), .Y(n130) );
  NAND2X1 U185 ( .A(n131), .B(n_rst), .Y(n297) );
  MUX2X1 U186 ( .B(data_stored_command[29]), .A(command[29]), .S(n41), .Y(n131) );
  NAND2X1 U187 ( .A(n132), .B(n_rst), .Y(n298) );
  MUX2X1 U188 ( .B(data_stored_command[30]), .A(command[30]), .S(n41), .Y(n132) );
  NAND2X1 U189 ( .A(n133), .B(n_rst), .Y(n299) );
  MUX2X1 U190 ( .B(data_stored_command[31]), .A(command[31]), .S(n41), .Y(n133) );
  INVX1 U191 ( .A(n134), .Y(n301) );
  MUX2X1 U192 ( .B(rxd), .A(txd), .S(WRITE_CAN), .Y(n134) );
  INVX1 U193 ( .A(n135), .Y(read_fifo) );
  NAND2X1 U194 ( .A(n135), .B(n136), .Y(n421) );
  OAI21X1 U195 ( .A(n137), .B(n138), .C(WRITE_CAN), .Y(n136) );
  NAND2X1 U196 ( .A(loose), .B(n304), .Y(n138) );
  NAND2X1 U197 ( .A(n64), .B(n139), .Y(n137) );
  NAND3X1 U198 ( .A(win), .B(n304), .C(n140), .Y(n135) );
  NOR2X1 U199 ( .A(n92), .B(n81), .Y(n140) );
  OAI21X1 U200 ( .A(n40), .B(n142), .C(n143), .Y(n420) );
  NAND2X1 U201 ( .A(rx_data[0]), .B(n144), .Y(n143) );
  OAI21X1 U202 ( .A(n40), .B(n145), .C(n146), .Y(n419) );
  NAND2X1 U203 ( .A(rx_data[31]), .B(n144), .Y(n146) );
  OAI21X1 U204 ( .A(n40), .B(n147), .C(n148), .Y(n418) );
  NAND2X1 U205 ( .A(rx_data[30]), .B(n144), .Y(n148) );
  OAI21X1 U206 ( .A(n40), .B(n149), .C(n150), .Y(n417) );
  NAND2X1 U207 ( .A(rx_data[29]), .B(n144), .Y(n150) );
  OAI21X1 U208 ( .A(n40), .B(n151), .C(n152), .Y(n416) );
  NAND2X1 U209 ( .A(rx_data[28]), .B(n144), .Y(n152) );
  OAI21X1 U210 ( .A(n40), .B(n153), .C(n154), .Y(n415) );
  NAND2X1 U211 ( .A(rx_data[27]), .B(n144), .Y(n154) );
  OAI21X1 U212 ( .A(n40), .B(n155), .C(n156), .Y(n414) );
  NAND2X1 U213 ( .A(rx_data[26]), .B(n144), .Y(n156) );
  OAI21X1 U214 ( .A(n40), .B(n157), .C(n158), .Y(n413) );
  NAND2X1 U215 ( .A(rx_data[25]), .B(n144), .Y(n158) );
  OAI21X1 U216 ( .A(n40), .B(n159), .C(n160), .Y(n412) );
  NAND2X1 U217 ( .A(rx_data[24]), .B(n144), .Y(n160) );
  OAI21X1 U218 ( .A(n40), .B(n161), .C(n162), .Y(n411) );
  NAND2X1 U219 ( .A(rx_data[23]), .B(n144), .Y(n162) );
  OAI21X1 U220 ( .A(n40), .B(n163), .C(n164), .Y(n410) );
  NAND2X1 U221 ( .A(rx_data[22]), .B(n144), .Y(n164) );
  OAI21X1 U222 ( .A(n40), .B(n165), .C(n166), .Y(n409) );
  NAND2X1 U223 ( .A(rx_data[21]), .B(n144), .Y(n166) );
  OAI21X1 U224 ( .A(n40), .B(n167), .C(n168), .Y(n408) );
  NAND2X1 U225 ( .A(rx_data[20]), .B(n144), .Y(n168) );
  OAI21X1 U226 ( .A(n40), .B(n169), .C(n170), .Y(n407) );
  NAND2X1 U227 ( .A(rx_data[19]), .B(n144), .Y(n170) );
  OAI21X1 U228 ( .A(n40), .B(n171), .C(n172), .Y(n406) );
  NAND2X1 U229 ( .A(rx_data[18]), .B(n144), .Y(n172) );
  OAI21X1 U230 ( .A(n40), .B(n173), .C(n174), .Y(n405) );
  NAND2X1 U231 ( .A(rx_data[17]), .B(n144), .Y(n174) );
  OAI21X1 U232 ( .A(n40), .B(n175), .C(n176), .Y(n404) );
  NAND2X1 U233 ( .A(rx_data[16]), .B(n144), .Y(n176) );
  OAI21X1 U234 ( .A(n40), .B(n177), .C(n178), .Y(n403) );
  NAND2X1 U235 ( .A(rx_data[15]), .B(n144), .Y(n178) );
  OAI21X1 U236 ( .A(n40), .B(n179), .C(n180), .Y(n402) );
  NAND2X1 U237 ( .A(rx_data[14]), .B(n144), .Y(n180) );
  OAI21X1 U238 ( .A(n40), .B(n181), .C(n182), .Y(n401) );
  NAND2X1 U239 ( .A(rx_data[13]), .B(n144), .Y(n182) );
  OAI21X1 U240 ( .A(n40), .B(n183), .C(n184), .Y(n400) );
  NAND2X1 U241 ( .A(rx_data[12]), .B(n144), .Y(n184) );
  OAI21X1 U242 ( .A(n141), .B(n185), .C(n186), .Y(n399) );
  NAND2X1 U243 ( .A(rx_data[11]), .B(n144), .Y(n186) );
  OAI21X1 U244 ( .A(n141), .B(n187), .C(n188), .Y(n398) );
  NAND2X1 U245 ( .A(rx_data[10]), .B(n144), .Y(n188) );
  OAI21X1 U246 ( .A(n141), .B(n189), .C(n190), .Y(n397) );
  NAND2X1 U247 ( .A(rx_data[9]), .B(n144), .Y(n190) );
  OAI21X1 U248 ( .A(n141), .B(n191), .C(n192), .Y(n396) );
  NAND2X1 U249 ( .A(rx_data[8]), .B(n144), .Y(n192) );
  OAI21X1 U250 ( .A(n141), .B(n193), .C(n194), .Y(n395) );
  NAND2X1 U251 ( .A(rx_data[7]), .B(n144), .Y(n194) );
  OAI21X1 U252 ( .A(n141), .B(n195), .C(n196), .Y(n394) );
  NAND2X1 U253 ( .A(rx_data[6]), .B(n144), .Y(n196) );
  OAI21X1 U254 ( .A(n141), .B(n197), .C(n198), .Y(n393) );
  NAND2X1 U255 ( .A(rx_data[5]), .B(n144), .Y(n198) );
  OAI21X1 U256 ( .A(n141), .B(n199), .C(n200), .Y(n392) );
  NAND2X1 U257 ( .A(rx_data[4]), .B(n144), .Y(n200) );
  OAI21X1 U258 ( .A(n141), .B(n201), .C(n202), .Y(n391) );
  NAND2X1 U259 ( .A(rx_data[3]), .B(n144), .Y(n202) );
  OAI21X1 U260 ( .A(n141), .B(n203), .C(n204), .Y(n390) );
  NAND2X1 U261 ( .A(rx_data[2]), .B(n144), .Y(n204) );
  OAI21X1 U262 ( .A(n141), .B(n205), .C(n206), .Y(n389) );
  NAND2X1 U263 ( .A(rx_data[1]), .B(n144), .Y(n206) );
  NAND2X1 U264 ( .A(n_rst), .B(n207), .Y(n141) );
  NAND3X1 U265 ( .A(n46), .B(n81), .C(n_rst), .Y(n207) );
  INVX1 U266 ( .A(n56), .Y(n46) );
  OAI21X1 U267 ( .A(n142), .B(n208), .C(n209), .Y(n388) );
  NAND2X1 U268 ( .A(send_data[0]), .B(n39), .Y(n209) );
  INVX1 U269 ( .A(temp_rx_data[0]), .Y(n142) );
  OAI21X1 U270 ( .A(n205), .B(n208), .C(n211), .Y(n387) );
  NAND2X1 U271 ( .A(send_data[1]), .B(n39), .Y(n211) );
  INVX1 U272 ( .A(temp_rx_data[1]), .Y(n205) );
  OAI21X1 U273 ( .A(n203), .B(n208), .C(n212), .Y(n386) );
  NAND2X1 U274 ( .A(send_data[2]), .B(n39), .Y(n212) );
  INVX1 U275 ( .A(temp_rx_data[2]), .Y(n203) );
  OAI21X1 U276 ( .A(n201), .B(n208), .C(n213), .Y(n385) );
  NAND2X1 U277 ( .A(send_data[3]), .B(n39), .Y(n213) );
  INVX1 U278 ( .A(temp_rx_data[3]), .Y(n201) );
  OAI21X1 U279 ( .A(n199), .B(n208), .C(n214), .Y(n384) );
  NAND2X1 U280 ( .A(send_data[4]), .B(n39), .Y(n214) );
  INVX1 U281 ( .A(temp_rx_data[4]), .Y(n199) );
  OAI21X1 U282 ( .A(n197), .B(n208), .C(n215), .Y(n383) );
  NAND2X1 U283 ( .A(send_data[5]), .B(n39), .Y(n215) );
  INVX1 U284 ( .A(temp_rx_data[5]), .Y(n197) );
  OAI21X1 U285 ( .A(n195), .B(n208), .C(n216), .Y(n382) );
  NAND2X1 U286 ( .A(send_data[6]), .B(n39), .Y(n216) );
  INVX1 U287 ( .A(temp_rx_data[6]), .Y(n195) );
  OAI21X1 U288 ( .A(n193), .B(n208), .C(n217), .Y(n381) );
  NAND2X1 U289 ( .A(send_data[7]), .B(n39), .Y(n217) );
  INVX1 U290 ( .A(temp_rx_data[7]), .Y(n193) );
  OAI21X1 U291 ( .A(n191), .B(n208), .C(n218), .Y(n380) );
  NAND2X1 U292 ( .A(send_data[8]), .B(n39), .Y(n218) );
  INVX1 U293 ( .A(temp_rx_data[8]), .Y(n191) );
  OAI21X1 U294 ( .A(n189), .B(n208), .C(n219), .Y(n379) );
  NAND2X1 U295 ( .A(send_data[9]), .B(n39), .Y(n219) );
  INVX1 U296 ( .A(temp_rx_data[9]), .Y(n189) );
  OAI21X1 U297 ( .A(n187), .B(n208), .C(n220), .Y(n378) );
  NAND2X1 U298 ( .A(send_data[10]), .B(n39), .Y(n220) );
  INVX1 U299 ( .A(temp_rx_data[10]), .Y(n187) );
  OAI21X1 U300 ( .A(n185), .B(n208), .C(n221), .Y(n377) );
  NAND2X1 U301 ( .A(send_data[11]), .B(n39), .Y(n221) );
  INVX1 U302 ( .A(temp_rx_data[11]), .Y(n185) );
  OAI21X1 U303 ( .A(n183), .B(n208), .C(n222), .Y(n376) );
  NAND2X1 U304 ( .A(send_data[12]), .B(n39), .Y(n222) );
  INVX1 U305 ( .A(temp_rx_data[12]), .Y(n183) );
  OAI21X1 U306 ( .A(n181), .B(n208), .C(n223), .Y(n375) );
  NAND2X1 U307 ( .A(send_data[13]), .B(n39), .Y(n223) );
  INVX1 U308 ( .A(temp_rx_data[13]), .Y(n181) );
  OAI21X1 U309 ( .A(n179), .B(n208), .C(n224), .Y(n374) );
  NAND2X1 U310 ( .A(send_data[14]), .B(n39), .Y(n224) );
  INVX1 U311 ( .A(temp_rx_data[14]), .Y(n179) );
  OAI21X1 U312 ( .A(n177), .B(n208), .C(n225), .Y(n373) );
  NAND2X1 U313 ( .A(send_data[15]), .B(n39), .Y(n225) );
  INVX1 U314 ( .A(temp_rx_data[15]), .Y(n177) );
  OAI21X1 U315 ( .A(n175), .B(n208), .C(n226), .Y(n372) );
  NAND2X1 U316 ( .A(send_data[16]), .B(n39), .Y(n226) );
  INVX1 U317 ( .A(temp_rx_data[16]), .Y(n175) );
  OAI21X1 U318 ( .A(n173), .B(n208), .C(n227), .Y(n371) );
  NAND2X1 U319 ( .A(send_data[17]), .B(n39), .Y(n227) );
  INVX1 U320 ( .A(temp_rx_data[17]), .Y(n173) );
  OAI21X1 U321 ( .A(n171), .B(n208), .C(n228), .Y(n370) );
  NAND2X1 U322 ( .A(send_data[18]), .B(n39), .Y(n228) );
  INVX1 U323 ( .A(temp_rx_data[18]), .Y(n171) );
  OAI21X1 U324 ( .A(n169), .B(n208), .C(n229), .Y(n369) );
  NAND2X1 U325 ( .A(send_data[19]), .B(n39), .Y(n229) );
  INVX1 U326 ( .A(temp_rx_data[19]), .Y(n169) );
  OAI21X1 U327 ( .A(n167), .B(n208), .C(n230), .Y(n368) );
  NAND2X1 U328 ( .A(send_data[20]), .B(n39), .Y(n230) );
  INVX1 U329 ( .A(temp_rx_data[20]), .Y(n167) );
  OAI21X1 U330 ( .A(n165), .B(n208), .C(n231), .Y(n367) );
  NAND2X1 U331 ( .A(send_data[21]), .B(n39), .Y(n231) );
  INVX1 U332 ( .A(temp_rx_data[21]), .Y(n165) );
  OAI21X1 U333 ( .A(n163), .B(n208), .C(n232), .Y(n366) );
  NAND2X1 U334 ( .A(send_data[22]), .B(n39), .Y(n232) );
  INVX1 U335 ( .A(temp_rx_data[22]), .Y(n163) );
  OAI21X1 U336 ( .A(n161), .B(n208), .C(n233), .Y(n365) );
  NAND2X1 U337 ( .A(send_data[23]), .B(n39), .Y(n233) );
  INVX1 U338 ( .A(temp_rx_data[23]), .Y(n161) );
  OAI21X1 U339 ( .A(n159), .B(n208), .C(n234), .Y(n364) );
  NAND2X1 U340 ( .A(send_data[24]), .B(n39), .Y(n234) );
  INVX1 U341 ( .A(temp_rx_data[24]), .Y(n159) );
  OAI21X1 U342 ( .A(n157), .B(n208), .C(n235), .Y(n363) );
  NAND2X1 U343 ( .A(send_data[25]), .B(n39), .Y(n235) );
  INVX1 U344 ( .A(temp_rx_data[25]), .Y(n157) );
  OAI21X1 U345 ( .A(n155), .B(n208), .C(n236), .Y(n362) );
  NAND2X1 U346 ( .A(send_data[26]), .B(n39), .Y(n236) );
  INVX1 U347 ( .A(temp_rx_data[26]), .Y(n155) );
  OAI21X1 U348 ( .A(n153), .B(n208), .C(n237), .Y(n361) );
  NAND2X1 U349 ( .A(send_data[27]), .B(n39), .Y(n237) );
  INVX1 U350 ( .A(temp_rx_data[27]), .Y(n153) );
  OAI21X1 U351 ( .A(n151), .B(n208), .C(n238), .Y(n360) );
  NAND2X1 U352 ( .A(send_data[28]), .B(n39), .Y(n238) );
  INVX1 U353 ( .A(temp_rx_data[28]), .Y(n151) );
  OAI21X1 U354 ( .A(n149), .B(n208), .C(n239), .Y(n359) );
  NAND2X1 U355 ( .A(send_data[29]), .B(n39), .Y(n239) );
  INVX1 U356 ( .A(temp_rx_data[29]), .Y(n149) );
  OAI21X1 U357 ( .A(n147), .B(n208), .C(n240), .Y(n358) );
  NAND2X1 U358 ( .A(send_data[30]), .B(n39), .Y(n240) );
  INVX1 U359 ( .A(temp_rx_data[30]), .Y(n147) );
  OAI21X1 U360 ( .A(n145), .B(n208), .C(n241), .Y(n357) );
  NAND2X1 U361 ( .A(send_data[31]), .B(n39), .Y(n241) );
  MUX2X1 U362 ( .B(n242), .A(n52), .S(n85), .Y(n210) );
  INVX1 U363 ( .A(n243), .Y(n242) );
  NOR2X1 U364 ( .A(n85), .B(n243), .Y(write_fifo) );
  NAND2X1 U365 ( .A(correct), .B(n81), .Y(n243) );
  INVX1 U366 ( .A(temp_rx_data[31]), .Y(n145) );
  NOR2X1 U367 ( .A(n93), .B(n64), .Y(load_enable) );
  INVX1 U368 ( .A(n81), .Y(n64) );
  NOR2X1 U369 ( .A(n244), .B(rollover_val[1]), .Y(n93) );
  OR2X1 U370 ( .A(n52), .B(rollover_val[3]), .Y(rollover_val[1]) );
  NAND3X1 U371 ( .A(n56), .B(n82), .C(n63), .Y(rollover_val[3]) );
  INVX1 U372 ( .A(n83), .Y(n52) );
  OR2X1 U373 ( .A(n245), .B(n246), .Y(count_enable) );
  OAI21X1 U374 ( .A(n247), .B(n83), .C(n96), .Y(n246) );
  AOI22X1 U375 ( .A(n139), .B(n304), .C(n88), .D(n303), .Y(n96) );
  INVX1 U376 ( .A(n63), .Y(n304) );
  INVX1 U377 ( .A(n53), .Y(n247) );
  OAI22X1 U378 ( .A(n101), .B(n56), .C(n81), .D(n84), .Y(n245) );
  INVX1 U379 ( .A(n244), .Y(n84) );
  OR2X1 U380 ( .A(n248), .B(n249), .Y(clear) );
  OAI22X1 U381 ( .A(n63), .B(n139), .C(n82), .D(n88), .Y(n249) );
  NAND3X1 U382 ( .A(count_out[3]), .B(n250), .C(count_out[4]), .Y(n88) );
  NAND3X1 U383 ( .A(state[0]), .B(n251), .C(state[1]), .Y(n82) );
  INVX1 U384 ( .A(n92), .Y(n139) );
  NOR2X1 U385 ( .A(n252), .B(count_out[2]), .Y(n92) );
  NAND3X1 U386 ( .A(n253), .B(n251), .C(state[0]), .Y(n63) );
  OAI21X1 U387 ( .A(n83), .B(n53), .C(n254), .Y(n248) );
  AOI22X1 U388 ( .A(n81), .B(n244), .C(af_enable), .D(n101), .Y(n254) );
  NOR2X1 U389 ( .A(n252), .B(n255), .Y(n101) );
  NAND3X1 U390 ( .A(n256), .B(n257), .C(n258), .Y(n252) );
  NOR2X1 U391 ( .A(n259), .B(n260), .Y(n258) );
  NOR2X1 U392 ( .A(count_out[5]), .B(count_out[4]), .Y(n256) );
  OAI21X1 U393 ( .A(state[0]), .B(n261), .C(n85), .Y(n244) );
  NAND3X1 U394 ( .A(state[0]), .B(n253), .C(state[2]), .Y(n85) );
  XOR2X1 U395 ( .A(state[2]), .B(state[1]), .Y(n261) );
  NAND3X1 U396 ( .A(n260), .B(n262), .C(n250), .Y(n53) );
  INVX1 U397 ( .A(n263), .Y(n250) );
  NAND3X1 U398 ( .A(count_out[2]), .B(count_out[1]), .C(n264), .Y(n263) );
  NOR2X1 U399 ( .A(count_out[5]), .B(n257), .Y(n264) );
  NAND3X1 U400 ( .A(n100), .B(n251), .C(state[1]), .Y(n83) );
  INVX1 U401 ( .A(state[2]), .Y(n251) );
  NOR2X1 U402 ( .A(n56), .B(n81), .Y(af_enable) );
  NOR2X1 U403 ( .A(n265), .B(n266), .Y(n81) );
  NAND3X1 U404 ( .A(n259), .B(n255), .C(n257), .Y(n266) );
  INVX1 U405 ( .A(count_out[0]), .Y(n257) );
  INVX1 U406 ( .A(count_out[2]), .Y(n255) );
  INVX1 U407 ( .A(count_out[1]), .Y(n259) );
  NAND3X1 U408 ( .A(n262), .B(n267), .C(n260), .Y(n265) );
  INVX1 U409 ( .A(count_out[3]), .Y(n260) );
  INVX1 U410 ( .A(count_out[5]), .Y(n267) );
  INVX1 U411 ( .A(count_out[4]), .Y(n262) );
  NAND3X1 U412 ( .A(n100), .B(n253), .C(state[2]), .Y(n56) );
  INVX1 U413 ( .A(state[1]), .Y(n253) );
  INVX1 U414 ( .A(state[0]), .Y(n100) );
endmodule


module AHB2CAN_top_t ( HCLK, HRESETn, HWRITE, HSEL, HADDR, HWDATA, HTRANS, 
        HBURST, HSIZE, HRDATA, HRESP, HREADYOUT, rx_data, tx_data );
  input [31:0] HADDR;
  input [31:0] HWDATA;
  input [1:0] HTRANS;
  input [2:0] HBURST;
  input [2:0] HSIZE;
  output [31:0] HRDATA;
  input HCLK, HRESETn, HWRITE, HSEL, rx_data;
  output HRESP, HREADYOUT, tx_data;
  wire   slave_wait, renable, wenable, sensor_fifo_full, sensor_fifo_empty,
         command_fifo_full, command_fifo_empty, sensor_read, sensor_write,
         command_read, command_write, read_fifo, write_fifo;
  wire   [31:0] sensor_data;
  wire   [15:0] address;
  wire   [15:0] command_data;
  wire   [2:0] data_size;
  wire   [2:0] burst_size;
  wire   [31:0] command_rdata;
  wire   [31:0] command_wdata;
  wire   [31:0] sensor_rdata;
  wire   [31:0] sensor_wdata;
  wire   [31:0] CAN_rx_data;
  wire   [31:0] CAN_tx_data;

  AHB_Slave AHBS ( .HCLK(HCLK), .HRESETn(HRESETn), .HWRITE(HWRITE), .HSEL(HSEL), .HADDR(HADDR), .HWDATA(HWDATA), .HTRANS(HTRANS), .HBURST(HBURST), .HSIZE(
        HSIZE), .HRDATA(HRDATA), .HRESP(HRESP), .HREADYOUT(HREADYOUT), 
        .sensor_data(sensor_data), .slave_wait(slave_wait), .command_data(
        command_data), .address(address), .renable(renable), .wenable(wenable), 
        .data_size(data_size), .burst_size(burst_size) );
  Control_Unit CU ( .clk(HCLK), .n_rst(HRESETn), .command_data(command_data), 
        .address(address), .renable(renable), .wenable(wenable), .data_size(
        data_size), .burst_size(burst_size), .sensor_data(sensor_data), 
        .slave_wait(slave_wait), .sensor_fifo_full(sensor_fifo_full), 
        .sensor_fifo_empty(sensor_fifo_empty), .sensor_read(sensor_read), 
        .sensor_write(sensor_write), .command_fifo_full(command_fifo_full), 
        .command_fifo_empty(command_fifo_empty), .command_read(command_read), 
        .command_write(command_write), .command_rdata(command_rdata), 
        .sensor_rdata(sensor_rdata), .command_wdata(command_wdata), 
        .sensor_wdata(sensor_wdata), .rx_data(CAN_rx_data), .read_fifo(
        read_fifo), .write_fifo(write_fifo), .tx_data(CAN_tx_data) );
  Sensor_FIFO_storage SFIFO ( .write_clk(HCLK), .read_clk(HCLK), .n_rst(
        HRESETn), .write_command(sensor_write), .read_command(sensor_read), 
        .write_data(sensor_wdata), .fifo_full(sensor_fifo_full), .fifo_empty(
        sensor_fifo_empty), .read_data(sensor_rdata) );
  Command_FIFO_storage CFIFO ( .write_clk(HCLK), .read_clk(HCLK), .n_rst(
        HRESETn), .write_command(command_write), .read_command(command_read), 
        .write_data(command_wdata), .fifo_full(command_fifo_full), 
        .fifo_empty(command_fifo_empty), .read_data(command_rdata) );
  can_register CANbus ( .clk(HCLK), .n_rst(HRESETn), .command(CAN_tx_data), 
        .rxd(rx_data), .txd(tx_data), .write_fifo(write_fifo), .read_fifo(
        read_fifo), .send_data(CAN_rx_data) );
endmodule

module  AHB2CAN_top ( HCLK, HRESETn, HWRITE, HSEL, HADDR, HWDATA, HTRANS, HBURST, 
	HSIZE, HRDATA, HRESP, HREADYOUT, rx_data, tx_data );

input   [31:0] HADDR;
input   [31:0] HWDATA;
input   [1:0] HTRANS;
input   [2:0] HBURST;
input   [2:0] HSIZE;
input   HCLK, HRESETn, HWRITE, HSEL, rx_data;
output  [31:0] HRDATA;
output  HRESP, HREADYOUT, tx_data;
wire	nHCLK, nHRESETn, nHWRITE, nHSEL, nrx_data, nHRESP, nHREADYOUT, ntx_data;

wire	[31:0] nHADDR;
wire	[31:0] nHWDATA;
wire	[1:0] nHTRANS;
wire	[2:0] nHBURST;
wire	[2:0] nHSIZE;
wire	[31:0] nHRDATA;
        AHB2CAN_top_t I0 ( .HCLK(nHCLK), .HRESETn(nHRESETn), .HWRITE(nHWRITE), .HSEL(nHSEL), 
	.HADDR(nHADDR), .HWDATA(nHWDATA), .HTRANS(nHTRANS), .HBURST(nHBURST), .HSIZE(nHSIZE), 
	.HRDATA(nHRDATA), .HRESP(nHRESP), .HREADYOUT(nHREADYOUT), .rx_data(nrx_data), .tx_data(ntx_data) );

PADOUT U1 ( .DO(nHRDATA[0]), .YPAD(HRDATA[0]) );
PADOUT U2 ( .DO(nHRDATA[10]), .YPAD(HRDATA[10]) );
PADOUT U3 ( .DO(nHRDATA[11]), .YPAD(HRDATA[11]) );
PADOUT U4 ( .DO(nHRDATA[12]), .YPAD(HRDATA[12]) );
PADOUT U5 ( .DO(nHRDATA[13]), .YPAD(HRDATA[13]) );
PADOUT U6 ( .DO(nHRDATA[14]), .YPAD(HRDATA[14]) );
PADOUT U7 ( .DO(nHRDATA[15]), .YPAD(HRDATA[15]) );
PADOUT U8 ( .DO(nHRDATA[16]), .YPAD(HRDATA[16]) );
PADOUT U9 ( .DO(nHRDATA[17]), .YPAD(HRDATA[17]) );
PADOUT U10 ( .DO(nHRDATA[18]), .YPAD(HRDATA[18]) );
PADOUT U11 ( .DO(nHRDATA[19]), .YPAD(HRDATA[19]) );
PADOUT U12 ( .DO(nHRDATA[1]), .YPAD(HRDATA[1]) );
PADOUT U13 ( .DO(nHRDATA[20]), .YPAD(HRDATA[20]) );
PADOUT U14 ( .DO(nHRDATA[21]), .YPAD(HRDATA[21]) );
PADOUT U15 ( .DO(nHRDATA[22]), .YPAD(HRDATA[22]) );
PADOUT U16 ( .DO(nHRDATA[23]), .YPAD(HRDATA[23]) );
PADOUT U17 ( .DO(nHRDATA[24]), .YPAD(HRDATA[24]) );
PADOUT U18 ( .DO(nHRDATA[25]), .YPAD(HRDATA[25]) );
PADOUT U19 ( .DO(nHRDATA[26]), .YPAD(HRDATA[26]) );
PADOUT U20 ( .DO(nHRDATA[27]), .YPAD(HRDATA[27]) );
PADOUT U21 ( .DO(nHRDATA[28]), .YPAD(HRDATA[28]) );
PADOUT U22 ( .DO(nHRDATA[29]), .YPAD(HRDATA[29]) );
PADOUT U23 ( .DO(nHRDATA[2]), .YPAD(HRDATA[2]) );
PADOUT U24 ( .DO(nHRDATA[30]), .YPAD(HRDATA[30]) );
PADOUT U25 ( .DO(nHRDATA[31]), .YPAD(HRDATA[31]) );
PADOUT U26 ( .DO(nHRDATA[3]), .YPAD(HRDATA[3]) );
PADOUT U27 ( .DO(nHRDATA[4]), .YPAD(HRDATA[4]) );
PADOUT U28 ( .DO(nHRDATA[5]), .YPAD(HRDATA[5]) );
PADOUT U29 ( .DO(nHRDATA[6]), .YPAD(HRDATA[6]) );
PADOUT U30 ( .DO(nHRDATA[7]), .YPAD(HRDATA[7]) );
PADOUT U31 ( .DO(nHRDATA[8]), .YPAD(HRDATA[8]) );
PADOUT U32 ( .DO(nHRDATA[9]), .YPAD(HRDATA[9]) );
PADOUT U33 ( .DO(nHREADYOUT), .YPAD(HREADYOUT) );
PADOUT U34 ( .DO(nHRESP), .YPAD(HRESP) );
PADOUT U35 ( .DO(ntx_data), .YPAD(tx_data) );
PADINC U36 ( .DI(nHADDR[0]), .YPAD(HADDR[0]) );
PADINC U37 ( .DI(nHADDR[10]), .YPAD(HADDR[10]) );
PADINC U38 ( .DI(nHADDR[11]), .YPAD(HADDR[11]) );
PADINC U39 ( .DI(nHADDR[12]), .YPAD(HADDR[12]) );
PADINC U40 ( .DI(nHADDR[13]), .YPAD(HADDR[13]) );
PADINC U41 ( .DI(nHADDR[14]), .YPAD(HADDR[14]) );
PADINC U42 ( .DI(nHADDR[15]), .YPAD(HADDR[15]) );
PADINC U43 ( .DI(nHADDR[16]), .YPAD(HADDR[16]) );
PADINC U44 ( .DI(nHADDR[17]), .YPAD(HADDR[17]) );
PADINC U45 ( .DI(nHADDR[18]), .YPAD(HADDR[18]) );
PADINC U46 ( .DI(nHADDR[19]), .YPAD(HADDR[19]) );
PADINC U47 ( .DI(nHADDR[1]), .YPAD(HADDR[1]) );
PADINC U48 ( .DI(nHADDR[20]), .YPAD(HADDR[20]) );
PADINC U49 ( .DI(nHADDR[21]), .YPAD(HADDR[21]) );
PADINC U50 ( .DI(nHADDR[22]), .YPAD(HADDR[22]) );
PADINC U51 ( .DI(nHADDR[23]), .YPAD(HADDR[23]) );
PADINC U52 ( .DI(nHADDR[24]), .YPAD(HADDR[24]) );
PADINC U53 ( .DI(nHADDR[25]), .YPAD(HADDR[25]) );
PADINC U54 ( .DI(nHADDR[26]), .YPAD(HADDR[26]) );
PADINC U55 ( .DI(nHADDR[27]), .YPAD(HADDR[27]) );
PADINC U56 ( .DI(nHADDR[28]), .YPAD(HADDR[28]) );
PADINC U57 ( .DI(nHADDR[29]), .YPAD(HADDR[29]) );
PADINC U58 ( .DI(nHADDR[2]), .YPAD(HADDR[2]) );
PADINC U59 ( .DI(nHADDR[30]), .YPAD(HADDR[30]) );
PADINC U60 ( .DI(nHADDR[31]), .YPAD(HADDR[31]) );
PADINC U61 ( .DI(nHADDR[3]), .YPAD(HADDR[3]) );
PADINC U62 ( .DI(nHADDR[4]), .YPAD(HADDR[4]) );
PADINC U63 ( .DI(nHADDR[5]), .YPAD(HADDR[5]) );
PADINC U64 ( .DI(nHADDR[6]), .YPAD(HADDR[6]) );
PADINC U65 ( .DI(nHADDR[7]), .YPAD(HADDR[7]) );
PADINC U66 ( .DI(nHADDR[8]), .YPAD(HADDR[8]) );
PADINC U67 ( .DI(nHADDR[9]), .YPAD(HADDR[9]) );
PADINC U68 ( .DI(nHBURST[0]), .YPAD(HBURST[0]) );
PADINC U69 ( .DI(nHBURST[1]), .YPAD(HBURST[1]) );
PADINC U70 ( .DI(nHBURST[2]), .YPAD(HBURST[2]) );
PADINC U71 ( .DI(nHCLK), .YPAD(HCLK) );
PADINC U72 ( .DI(nHRESETn), .YPAD(HRESETn) );
PADINC U73 ( .DI(nHSEL), .YPAD(HSEL) );
PADINC U74 ( .DI(nHSIZE[0]), .YPAD(HSIZE[0]) );
PADINC U75 ( .DI(nHSIZE[1]), .YPAD(HSIZE[1]) );
PADINC U76 ( .DI(nHSIZE[2]), .YPAD(HSIZE[2]) );
PADINC U77 ( .DI(nHTRANS[0]), .YPAD(HTRANS[0]) );
PADINC U78 ( .DI(nHTRANS[1]), .YPAD(HTRANS[1]) );
PADINC U79 ( .DI(nHWDATA[0]), .YPAD(HWDATA[0]) );
PADINC U80 ( .DI(nHWDATA[10]), .YPAD(HWDATA[10]) );
PADINC U81 ( .DI(nHWDATA[11]), .YPAD(HWDATA[11]) );
PADINC U82 ( .DI(nHWDATA[12]), .YPAD(HWDATA[12]) );
PADINC U83 ( .DI(nHWDATA[13]), .YPAD(HWDATA[13]) );
PADINC U84 ( .DI(nHWDATA[14]), .YPAD(HWDATA[14]) );
PADINC U85 ( .DI(nHWDATA[15]), .YPAD(HWDATA[15]) );
PADINC U86 ( .DI(nHWDATA[16]), .YPAD(HWDATA[16]) );
PADINC U87 ( .DI(nHWDATA[17]), .YPAD(HWDATA[17]) );
PADINC U88 ( .DI(nHWDATA[18]), .YPAD(HWDATA[18]) );
PADINC U89 ( .DI(nHWDATA[19]), .YPAD(HWDATA[19]) );
PADINC U90 ( .DI(nHWDATA[1]), .YPAD(HWDATA[1]) );
PADINC U91 ( .DI(nHWDATA[20]), .YPAD(HWDATA[20]) );
PADINC U92 ( .DI(nHWDATA[21]), .YPAD(HWDATA[21]) );
PADINC U93 ( .DI(nHWDATA[22]), .YPAD(HWDATA[22]) );
PADINC U94 ( .DI(nHWDATA[23]), .YPAD(HWDATA[23]) );
PADINC U95 ( .DI(nHWDATA[24]), .YPAD(HWDATA[24]) );
PADINC U96 ( .DI(nHWDATA[25]), .YPAD(HWDATA[25]) );
PADINC U97 ( .DI(nHWDATA[26]), .YPAD(HWDATA[26]) );
PADINC U98 ( .DI(nHWDATA[27]), .YPAD(HWDATA[27]) );
PADINC U99 ( .DI(nHWDATA[28]), .YPAD(HWDATA[28]) );
PADINC U100 ( .DI(nHWDATA[29]), .YPAD(HWDATA[29]) );
PADINC U101 ( .DI(nHWDATA[2]), .YPAD(HWDATA[2]) );
PADINC U102 ( .DI(nHWDATA[30]), .YPAD(HWDATA[30]) );
PADINC U103 ( .DI(nHWDATA[31]), .YPAD(HWDATA[31]) );
PADINC U104 ( .DI(nHWDATA[3]), .YPAD(HWDATA[3]) );
PADINC U105 ( .DI(nHWDATA[4]), .YPAD(HWDATA[4]) );
PADINC U106 ( .DI(nHWDATA[5]), .YPAD(HWDATA[5]) );
PADINC U107 ( .DI(nHWDATA[6]), .YPAD(HWDATA[6]) );
PADINC U108 ( .DI(nHWDATA[7]), .YPAD(HWDATA[7]) );
PADINC U109 ( .DI(nHWDATA[8]), .YPAD(HWDATA[8]) );
PADINC U110 ( .DI(nHWDATA[9]), .YPAD(HWDATA[9]) );
PADINC U111 ( .DI(nHWRITE), .YPAD(HWRITE) );
PADINC U112 ( .DI(nrx_data), .YPAD(rx_data) );

endmodule
