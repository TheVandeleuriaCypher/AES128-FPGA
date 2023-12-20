`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Jason Li
// 
// Module Name:  AES128_keyScheduler
// Project Name: AES128
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//Step 1) Takes input of inKey and splits it up into wo-w3, or 4 parts of 32 bits each
//Step 2) Perform operations, RotWord, SubWord and Rcon on w3
//Step 3) XOR this with w0 to produce w4, XOR w4 with w1 to produce w5, XOR w5 with w2 to produce w6, XOR w6 with w3 to produce w7
//Step 4) Repeat this with w7 as w3 to produce the next key
//Step 5) Repeat until 10 keys are created
//////////////////////////////////////////////////////////////////////////////////
module AES128_keyScheduler(
    input [127:0] inKey,
    output wire [127:0] outKey0,
    output wire [127:0] outKey1,
    output wire [127:0] outKey2,
    output wire [127:0] outKey3,
    output wire [127:0] outKey4,
    output wire [127:0] outKey5,
    output wire [127:0] outKey6,
    output wire [127:0] outKey7,
    output wire [127:0] outKey8,
    output wire [127:0] outKey9,
    output wire [127:0] outKey10
    );
	 
	 wire [31:0] out1,out2,out3,out4,out5,out6,out7,out8,out9,out10;
	 
	 //assigns w0-w43, which are the 11 keys split into 4 parts each of 32 bits
	 wire [31:0] w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27,w28,w29,w30,w31,w32,w33,w34,w35,w36,w37,w38,w39,w40,w41,w42,w43;
	 
	 //Assigns the first words from the input key
	 assign w0 = inKey[127:96];
	 assign w1 = inKey[95:64];
	 assign w2 = inKey[63:32];
	 assign w3 = inKey[31:0];
	 
	 //Returns the input key as the first output key
	 assign outKey0 = {w0,w1,w2,w3};
	 
	 //Key operations is calculated using the last word of the key
	 keyOperations k0(.inKey(w3),.roundNo(4'd1),.outData(out1));
	 
	 //the xor calculations are performed using the previous word and the corresponding word from the previous key
	 assign w4 = w0^out1;
	 assign w5 = w1^w4;
	 assign w6 = w2^w5;
	 assign w7 = w3^w6;
	 //This is assigned to the respective output key
	 assign outKey1 = {w4,w5,w6,w7};
	 
	 //This is repeated for all keys
	 //Key 2
	 keyOperations k1(.inKey(w7),.roundNo(4'd2),.outData(out2));
	 
	 assign w8 = w4^out2;
	 assign w9 = w5^w8;
	 assign w10 = w6^w9;
	 assign w11 = w7^w10;
	 
	 assign outKey2 = {w8,w9,w10,w11};
	 
	 //Key 3
	 keyOperations k2(.inKey(w11),.roundNo(4'd3),.outData(out3));
	 
	 assign w12 = w8^out3;
	 assign w13 = w9^w12;
	 assign w14 = w10^w13;
	 assign w15 = w11^w14;
	 
	 assign outKey3 = {w12,w13,w14,w15};
	 
	 //Key 4
	 keyOperations k3(.inKey(w15),.roundNo(4'd4),.outData(out4));
	 
	 assign w16 = w12^out4;
	 assign w17 = w13^w16;
	 assign w18 = w14^w17;
	 assign w19 = w15^w18;
	 
	 assign outKey4 = {w16,w17,w18,w19};
	 
	 //Key 5
	 keyOperations k4(.inKey(w19),.roundNo(4'd5),.outData(out5));
	 
	 assign w20 = w16^out5;
	 assign w21 = w17^w20;
	 assign w22 = w18^w21;
	 assign w23 = w19^w22;
	 
	 assign outKey5 = {w20,w21,w22,w23};
	 
	 //Key 6
	 keyOperations k5(.inKey(w23),.roundNo(4'd6),.outData(out6));
	 
	 assign w24 = w20^out6;
	 assign w25 = w21^w24;
	 assign w26 = w22^w25;
	 assign w27 = w23^w26;
	 
	 assign outKey6 = {w24,w25,w26,w27};
	 
	 //Key 7
	 keyOperations k6(.inKey(w27),.roundNo(4'd7),.outData(out7));
	 
	 assign w28 = w24^out7;
	 assign w29 = w25^w28;
	 assign w30 = w26^w29;
	 assign w31 = w27^w30;
	 
	 assign outKey7 = {w28,w29,w30,w31};
	 
	 //Key 8
	 keyOperations k7(.inKey(w31),.roundNo(4'd8),.outData(out8));
	 
	 assign w32 = w28^out8;
	 assign w33 = w29^w32;
	 assign w34 = w30^w33;
	 assign w35 = w31^w34;
	 
	 assign outKey8 = {w32,w33,w34,w35};
	 
	 //Key 9
	 keyOperations k8(.inKey(w35),.roundNo(4'd9),.outData(out9));
	 
	 assign w36 = w32^out9;
	 assign w37 = w33^w36;
	 assign w38 = w34^w37;
	 assign w39 = w35^w38;
	 
	 assign outKey9 = {w36,w37,w38,w39};
	 
	 //Key 10
	 keyOperations k9(.inKey(w39),.roundNo(4'd10),.outData(out10));
	 
	 assign w40 = w36^out10;
	 assign w41 = w37^w40;
	 assign w42 = w38^w41;
	 assign w43 = w39^w42;
	 
	 assign outKey10 = {w40,w41,w42,w43};
	 

endmodule
