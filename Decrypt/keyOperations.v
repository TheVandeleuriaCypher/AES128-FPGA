`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Jason Li
// 
// Module Name:  keyOperations
// Project Name: AES128
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//Step 1) Takes input of inData and performs three key operations
//Step 2) Perform word rotate to shift the word
//Step 3) Perform the word substituion using S-box substituion
//Step 4) Add the round constant to the first 8 bits
//////////////////////////////////////////////////////////////////////////////////
module keyOperations(
    input [31:0] inKey,
	 input [3:0] roundNo,
    output [31:0] outData
    );
	 wire [7:0] byte0,byte1,byte2,byte3; //4 x 8 bit values from the input key
	 reg [7:0] rcon; //the round constant, and this changes depending on the round number
	 wire [7:0] out0, out1, out2; //These are the 8 bit data that form the output
	 reg [7:0] out3;//has calculations performed upon it
	 wire [7:0] temp; //This is used to temporarily hold the data for the first bit to perform rcon
	 
	 //assignment and the bytes are rotated immediately
	 assign byte3 = inKey[31:24];
	 assign byte0 = inKey[23:16];
	 assign byte1 = inKey[15:8];
	 assign byte2 = inKey[7:0];
	 
	 //SubWord() is used to substitute the data within
	 SubWord b3 (.subIn(byte3),.subOut(temp));
	 SubWord b2 (.subIn(byte2),.subOut(out2));
	 SubWord b1 (.subIn(byte1),.subOut(out1));
	 SubWord b0 (.subIn(byte0),.subOut(out0));
	 
	 // Byte 1 is XORed with the round constant (rcon) dependent on the round number
	 
	 always @(*)
	 begin
		  case(roundNo)
				4'd01: rcon = 8'h01;
				4'd02: rcon = 8'h02;
				4'd03: rcon = 8'h04;
				4'd04: rcon = 8'h08;
				4'd05: rcon = 8'h10;
				4'd06: rcon = 8'h20;
				4'd07: rcon = 8'h40;
				4'd08: rcon = 8'h80;
				4'd09: rcon = 8'h1B;
				4'd10: rcon = 8'h36;
		  endcase
		  out3 = temp ^ rcon;
	 end
	 assign outData = {out3,out2,out1,out0};

endmodule
