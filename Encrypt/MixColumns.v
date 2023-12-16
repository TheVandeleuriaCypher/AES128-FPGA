`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Jason Li
// 
// Module Name:  MixColumns
// Project Name: AES128
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//Step 1) Takes input of an 128 bit number, inData
//Step 2) Performs matrix multiplication with the hill cipher: can multiply by 1,2 or 3
//Step 3) Calls the mult functio when the matrices are expanded, as we need to account for 
//Step 4) Returns it as outData
//////////////////////////////////////////////////////////////////////////////////
module MixColumns(
	 input inData,
	 output outData
    );
	 
	 wire [7:0] s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15;
	 wire [7:0] t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15;
	 assign s0 = inData[7:0];
	 assign s1 = inData[15:8];
	 assign s2 = inData[23:16];
	 assign s3 = inData[31:24];
	 assign s4 = inData[39:32];
	 assign s5 = inData[47:40];
	 assign s6 = inData[55:48];
	 assign s7 = inData[63:56];
	 assign s8 = inData[71:64];
	 assign s9 = inData[79:72];
	 assign s10 = inData[87:80];
	 assign s11 = inData[95:88];
	 assign s12 = inData[103:96];
	 assign s13 = inData[111:104];
	 assign s14 = inData[119:112];
	 assign s15 = inData[127:120];
	 
	 
	 //Step 2
	 always @(*)
	 begin
		  t15 = mult(s15,2) ^ mult(s14,3) ^ s13 ^ s12;
		  t14 = s15 ^ mult(s14,2) ^ mult(s13,3) ^ s12;
		  t13 = s15 ^ s14 ^ mult(s13,2) ^ mult(s12,3);
		  t12 = mult(s15,3) ^ s14 ^ s13 ^ mult(s12,2);
		  
		  t11 = mult(s11,2) ^ mult(s10,3) ^ s9 ^ s8;
		  t10 = s11 ^ mult(s10,2) ^ mult(s9,3) ^ s8;
		  t9 = s11 ^ s10 ^ mult(s9,2) ^ mult(s8,3);
		  t8 = mult(s11,3) ^ s10 ^ s9 ^ mult(s8,2);
		  
		  t7 = mult(s7,2) ^ mult(s6,3) ^ s5 ^ s4;
		  t6 = s7 ^ mult(s6,2) ^ mult(s5,3) ^ s4;
		  t5 = s7 ^ s6 ^ mult(s5,2) ^ mult(s4,3);
		  t4 = mult(s7,3) ^ s6 ^ s5 ^ mult(s4,2);
		  
		  t3 = mult(s3,2) ^ mult(s2,3) ^ s1 ^ s0;
		  t2 = s3 ^ mult(s2,2) ^ mult(s1,3) ^ s0;
		  t1 = s3 ^ s2 ^ mult(s1,2) ^ mult(s0,3);
		  t0 = mult(s3,3) ^ s2 ^ s1 ^ mult(s0,2);
	 end
	 
	 assign outData[7:0] = t0;
	 assign outData[15:8] = t1;
	 assign outData[23:16] = t2;
	 assign outData[31:24] = t3;
	 assign outData[39:32] = t4;
	 assign outData[47:40] = t5;
	 assign outData[55:48] = t6;
	 assign outData[63:56] = t7;
	 assign outData[71:64] = t8;
	 assign outData[79:72] = t9;
	 assign outData[87:80] = t10;
	 assign outData[95:88] = t11;
	 assign outData[103:96] = t12;
	 assign outData[111:104] = t13;
	 assign outData[119:112] = t14;
	 assign outData[127:120] = t15;
	 
	 //Step 3
	 //function to perform the individual matrix multiplications of each element multiplication
	 function integer mult(input integer num1, input integer num2);
		  case(num2)
				//4'd1: mult = num1;
				//for the case that num2 is either 2 or 3, we need to account for the use of Irreducible Polynomial Theorem
				//e.g. in the case of numbers greater than 8 bits, e.g. 1100 0000 shifted into 1 1000 0000, then the 1 in the 9th digit slot should be subsituted to be 0001 1011 or 1b
				//we AND with 8'hff to remove any digits at positions more than the 8th bit
				4'd2: mult = (a<8'h80)?num1<<1:((num1<<1)&8'hff)^8'h1b;
				4'd3: mult = (a<8'h80)?num1<<1^num1:((num1<<1)&8'hff)^8'h1b^num1;
		  endcase
	 endfunction

endmodule
