`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Jason Li
// 
// Module Name:  decrypt_round
// Project Name: AES128
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//Step 1) Takes input of inputKey and inputData
//Step 2) Performs InvShiftRows
//Step 3) Performs InvSubBytes
//Step 4) Performs AddRoundKey
//Step 5) Performs InvMixColumns
//Step 6) The value is then returned as outputData
//////////////////////////////////////////////////////////////////////////////////
module decrypt_round(
   	 input CLK,
   	 input [127:0] inputData,
   	 input [127:0] inputKey,
   	 output [127:0] outputData
    );
	 
	 wire [127:0] InvShiftRowsIn,InvSubWordIn,AddRoundKeyIn,InvMixColumnsIn;
	 wire [127:0] InvShiftRowsOut,InvSubWordOut,AddRoundKeyOut,InvMixColumnsOut;
	 assign InvShiftRowsIn = inputData;
	 assign InvSubWordIn = InvShiftRowsOut;
	 assign AddRoundKeyIn = InvSubWordOut;
	 assign InvMixColumnsIn = AddRoundKeyOut;
	 
	 //Step 2
	 //Performs InvShiftRows
	 InvShiftRows inv_shift_rows(.inData(InvShiftRowsIn),.outData(InvShiftRowsOut));
	 
	 //Step 3) 
	 //Performs InvSubBytes
	 genvar i;
	 for(i=0;i<16;i=i+1) 
	 begin: InvSubWord
		  InvSubWord inv_sub_bytes(.invSubIn(InvSubWordIn[(8*i+7):8*i]),.invSubOut(InvSubWordOut[(8*i+7):8*i])); 	
	 end
	 
	 //Step 4
	 //Perform addroundkey
	 AddRoundKey add_round_key(.inputKey(inputKey),.inputData(AddRoundKeyIn),.outputData(AddRoundKeyOut));
	 
	 //Step 5
	 //Perform invmixcolumns
	 InvMixColumns inv_mix_columns(.inData(InvMixColumnsIn),.outData(InvMixColumnsOut));
	 
	 //Step 6
	 //Value is returned out as outputData
	 assign outputData = InvMixColumnsOut;

endmodule
