`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Jason Li
// 
// Module Name:  AddRoundKey
// Project Name: AES128
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//Step 1) Takes input of inputKey and inputData
//Step 2) Perform a XOR operation to combine the two together
//Step 3) The value is then returned as outputData
//////////////////////////////////////////////////////////////////////////////////
module AddRoundKey(
    	input [127:0] inputKey,
    	input [127:0] inputData,
    	output [127:0] outputData
    );
	 
	 always @(inputData)//whenever different data is detected, the output data is recalculated
	 begin
		  assign outputData = inputKey ^ inputData;//assigns it to the output register
	 end

endmodule
