`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Jason Li
// 
// Module Name:  encrypt_final_round
// Project Name: AES128
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//Step 1) Takes input of inputKey and inputData
//Step 2) Performs SubBytes
//Step 3) Performs ShiftRows
//Step 4) Performs AddRoundKey
//Step 5) The value is then returned as outputData
//////////////////////////////////////////////////////////////////////////////////
module encrypt_final_round(
    	 input CLK,
    	 input [127:0]inputKey,
    	 input [127:0]inputData,
    	 output [127:0]outData
    );
	 wire [127:0] SubBytesIn,ShiftRowsIn,RoundKeyIn;
	 wire [127:0] SubBytesOut,ShiftRowsOut,RoundKeyOut;
	 assign SubBytesIn = inputData;
	 assign ShiftRowsIn = SubBytesOut;
	 assign RoundKeyIn = ShiftRowsOut;
	 
	 //Step 2
	 //Substitute all the bytes in the SubWord lookup table module
	 genvar i;
	 for(i=0;i<16;i=i+1) 
	 begin: SubBytes
		  SubWord sub_bytes(.subIn(SubBytesIn[(8*i+7):8*i]),.subOut(SubBytesOut[(8*i+7):8*i])); 	
	 end
	 
	 //Step 3
	 //Perform shiftrows
	 ShiftRows shift_rows(.inData(ShiftRowsIn),.outData(ShiftRowsOut));
	 
	 //Step 4
	 //Perform addroundkey
	 AddRoundKey add_round_key(.inputKey(inputKey),.inputData(RoundKeyIn),.outputData(RoundKeyOut));
	
	 //Step 5
	 //Value is returned out as outputData
	 assign outputData = RoundKeyOut;

endmodule
