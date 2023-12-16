`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Jason Li
// 
// Module Name:  ShiftRows
// Project Name: AES128
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//Step 1) Takes input of an 128 bit number, inData
//Step 2) Breaks down the components into 8 bit parts
//Step 3) Shifts all the corresponding 8 bit parts according to standard AES specifications for shifting rows
//Step 4) Returns it as outData
//////////////////////////////////////////////////////////////////////////////////
module ShiftRows(
	 input [127:0]inData,
	 output [127:0]outData
    );
	 wire [127:0] shiftData;
	 
	 always @(*)
	 begin
		  //Step 3
		  assign shiftData[127:120] = inData[127:120];
		  assign shiftData[119:112] = inData[87:80];
		  assign shiftData[111:104] = inData[47:40];
		  assign shiftData[103:96] = inData[7:0];
		  
		  assign shiftData[95:88] = inData[95:88];
		  assign shiftData[87:80] = inData[55:48];
		  assign shiftData[79:72] = inData[15:8];
		  assign shiftData[71:64] = inData[103:96];
		  
		  assign shiftData[63:56] = inData[63:56];
		  assign shiftData[55:48] = inData[23:16];
		  assign shiftData[47:40] = inData[111:104];
		  assign shiftData[39:32] = inData[71:64];
		  
		  assign shiftData[31:24] = inData[31:24];
		  assign shiftData[23:16] = inData[119:112];
		  assign shiftData[15:8] = inData[79:72];
		  assign shiftData[7:0] = inData[39:32];
	 end
	 //Step 4
	 assign outData = shiftData;

endmodule
