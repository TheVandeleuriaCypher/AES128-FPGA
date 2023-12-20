`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Jason Li
// 
// Module Name:  InvShiftRows
// Project Name: AES128
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//Step 1) Takes input of an 128 bit number, inData
//Step 2) Breaks down the components into 8 bit parts
//Step 3) Shifts all the corresponding 8 bit parts according to standard AES specifications for inverse shifting rows
//Step 4) Returns it as outData
//////////////////////////////////////////////////////////////////////////////////
module InvShiftRows(
	 input [127:0]inData,
	 output [127:0]outData
    );
	 reg [127:0] shiftData;
	 
	 always @(*)
	 begin
		  //Step 3
		  shiftData[127:120] = inData[127:120];
		  shiftData[119:112] = inData[23:16];
		  shiftData[111:104] = inData[47:40];
		  shiftData[103:96] = inData[71:64];
			
		  shiftData[95:88] = inData[95:88];
		  shiftData[87:80] = inData[119:112];
		 shiftData[79:72] = inData[15:8];
		  shiftData[71:64] = inData[39:32];
		  
		  shiftData[63:56] = inData[63:56];
		  shiftData[55:48] = inData[87:80];
		  shiftData[47:40] = inData[111:104];
		  shiftData[39:32] = inData[7:0];
		  
		  shiftData[31:24] = inData[31:24];
		  shiftData[23:16] = inData[55:48];
		  shiftData[15:8] = inData[79:72];
		  shiftData[7:0] = inData[103:96];
	 end
	 //Step 4
	 assign outData = shiftData;

endmodule
