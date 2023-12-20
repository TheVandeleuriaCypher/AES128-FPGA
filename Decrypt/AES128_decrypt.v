`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Jason Li
// 
// Module Name:  AES128_decrypt
// Project Name: AES128
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//Step 1) Activate key scheduler to return all key variants from 0-10
//Step 2) Perform the AddRoundKey Module with K10
//Step 3) Perform InvShiftRows, InvSubBytes, AddRoundKey and InvMixColumns Modules loop 9 times with the various keys in order
//Step 4) For the last loop, ignore InvMixColumns, but perform the rest with key 0
//Step 5) Return the value to the main module and output opComplete as complete
//////////////////////////////////////////////////////////////////////////////////
module AES128_decrypt(
	 input CLK,
	 input decEnable,
	 input [127:0] dataToOperate,
	 input [127:0] keyToOperate,
	 output opComplete,
	 output [127:0] opRetValue
    );
	 
	 reg isComplete; //register holding boolean value on whether the module has finished encrypting
	 //returns 1 when the entire system finishes processing
	 assign opComplete = isComplete;
	 //outputs the key for each round of encryption
	 wire [127:0] outKey0,outKey1,outKey2,outKey3,outKey4,outKey5,outKey6,outKey7,outKey8,outKey9,outKey10;
	 //output data after each round of encryption
	 wire [127:0] outData0,outData1,outData2,outData3,outData4,outData5,outData6,outData7,outData8,outData9,outData10;
	 //input data from the previous round of encryption
	 wire [127:0] inData1,inData2,inData3,inData4,inData5,inData6,inData7,inData8,inData9,inData10;
	 
	 assign inData1 = outData0;
	 assign inData2 = outData1;
	 assign inData3 = outData2;
	 assign inData4 = outData3;
	 assign inData5 = outData4;
	 assign inData6 = outData5;
	 assign inData7 = outData6;
	 assign inData8 = outData7;
	 assign inData9 = outData8;
	 assign inData10 = outData9;
	 
	 //Step 1
	 //Key scheduler activated and the output keys have been returned
	 AES128_keyScheduler keyScheduler (.inKey(keyToOperate),.outKey0(outKey0),.outKey1(outKey1),.outKey2(outKey2),.outKey3(outKey3),.outKey4(outKey4),.outKey5(outKey5),.outKey6(outKey6),.outKey7(outKey7),.outKey8(outKey8),.outKey9(outKey9),.outKey10(outKey10));
	 
	 //Step 2
	 //Performing the AddRoundKey Module using K10
	 AddRoundKey addRoundKey10 (.inputKey(outKey10),.inputData(dataToOperate),.outputData(outData0));
	 
	 //Step 3
	 //Perform InvShiftRows, InvSubBytes, AddRoundKey and InvMixColumns Modules loop 9 times with the various keys in order
	 //Pass 1
    decrypt_round round1decrypt (.CLK(CLK),.inputKey(outKey9),.inputData(inData1),.outputData(outData1));
	 //Pass 2
    decrypt_round round2decrypt (.CLK(CLK),.inputKey(outKey8),.inputData(inData2),.outputData(outData2));
	 //Pass 3
    decrypt_round round3decrypt (.CLK(CLK),.inputKey(outKey7),.inputData(inData3),.outputData(outData3));
	 //Pass 4
    decrypt_round round4decrypt (.CLK(CLK),.inputKey(outKey6),.inputData(inData4),.outputData(outData4));
	 //Pass 5
    decrypt_round round5decrypt (.CLK(CLK),.inputKey(outKey5),.inputData(inData5),.outputData(outData5));
	 //Pass 6
    decrypt_round round6decrypt (.CLK(CLK),.inputKey(outKey4),.inputData(inData6),.outputData(outData6));
	 //Pass 7
    decrypt_round round7decrypt (.CLK(CLK),.inputKey(outKey3),.inputData(inData7),.outputData(outData7));
	 //Pass 8
    decrypt_round round8decrypt (.CLK(CLK),.inputKey(outKey2),.inputData(inData8),.outputData(outData8));
	 //Pass 9
    decrypt_round round9decrypt (.CLK(CLK),.inputKey(outKey1),.inputData(inData9),.outputData(outData9));
	 
	 //Step 4
	 //Pass 10
    decrypt_final_round round10decrypt (.CLK(CLK),.inputKey(outKey0),.inputData(inData10),.outputData(outData10));
	 
	 assign opRetValue = outData10;
endmodule
