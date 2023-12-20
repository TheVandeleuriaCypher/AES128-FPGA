`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Jason Li
// 
// Module Name:  encrypt_round
// Project Name: AES128
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//Step 1) Takes input of inputKey and inputData
//Step 2) Performs SubBytes
//Step 3) Performs ShiftRows
//Step 4) Performs MixColumns
//Step 5) Performs AddRoundKey
//Step 6) The value is then returned as outputData
//////////////////////////////////////////////////////////////////////////////////
module encrypt_round(
	 input CLK,
	 input [127:0] inputData,
	 input [127:0] inputKey,
	 output wire [127:0] outputData
    );
	 
	 wire [127:0] SubBytesIn,ShiftRowsIn,MixColumnsIn,RoundKeyIn;
	 wire [127:0] SubBytesOut,ShiftRowsOut,MixColumnsOut,RoundKeyOut;
	 assign SubBytesIn = inputData;
	 assign ShiftRowsIn = SubBytesOut;
	 assign MixColumnsIn = ShiftRowsOut;
	 assign RoundKeyIn = MixColumnsOut;
	 
	 //Step 2
	 //Performs SubBytes
	 genvar i;
	 for(i=0;i<16;i=i+1) 
	 begin: SubWord
		  SubWord sub_bytes(.subIn(SubBytesIn[(8*i+7):8*i]),.subOut(SubBytesOut[(8*i+7):8*i])); 	
	 end
	 
	 //Step 3
	 //Perform shiftrows
	 ShiftRows shift_rows(.inData(ShiftRowsIn),.outData(ShiftRowsOut));
	 
	 //Step 4
	 //Perform mixcolumns
	 MixColumns mix_columns(.inData(MixColumnsIn),.outData(MixColumnsOut));
	 
	 //Step 5
	 //Perform addroundkey
	 AddRoundKey add_round_key(.inputKey(inputKey),.inputData(RoundKeyIn),.outputData(RoundKeyOut));
	
	 //Step 6
	 //Value is returned out as outputData
	 assign outputData = RoundKeyOut;
endmodule
