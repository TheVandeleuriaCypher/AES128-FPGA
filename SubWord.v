`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Jason Li
// 
// Module Name:  subWord
// Project Name: AES128
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//Step 1) Takes input of an 8 bit number, sIn
//Step 2) Compares it hexadecimal value to the various cases statement as shown below
//Step 3) Perform the worb substituion using S-box substituion
//Step 4) Returns it as sOut
//////////////////////////////////////////////////////////////////////////////////
module SubWord(
    input [7:0] sIn,
    output [7:0] sOut
    );
	 
	 always@(sIn)
	 //uses a long case statement to compare the invalue and return the corresponding value from the Rjindael S-Box
	 begin
		  case(sIn)
				8'h00: sOut=8'h63;
				8'h01: sOut=8'h7C;
				8'h02: sOut=8'h77;
				8'h03: sOut=8'h7B;
				8'h04: sOut=8'hF2;
				8'h05: sOut=8'h6B;
				8'h06: sOut=8'h6F;
				8'h07: sOut=8'hC5;
				8'h08: sOut=8'h30;
				8'h09: sOut=8'h01;
				8'h0A: sOut=8'h61;
				8'h0B: sOut=8'h2B;
				8'h0C: sOut=8'hFE;
				8'h0D: sOut=8'hD7;
				8'h0E: sOut=8'hAB;
				8'h0F: sOut=8'h76;
				8'h10: sOut=8'hCA;
				8'h11: sOut=8'h82;
				8'h12: sOut=8'hC9;
				8'h13: sOut=8'h7D;
				8'h14: sOut=8'hFA;
				8'h15: sOut=8'h59;
				8'h16: sOut=8'h47;
				8'h17: sOut=8'hF0;
				8'h18: sOut=8'hAD;
				8'h19: sOut=8'hD4;
				8'h1A: sOut=8'hA2;
				8'h1B: sOut=8'hAF;
				8'h1C: sOut=8'h9C;
				8'h1D: sOut=8'hA4;
				8'h1E: sOut=8'h72;
				8'h1F: sOut=8'hC0;
				8'h20: sOut=8'hB7;
				8'h21: sOut=8'hFD;
				8'h22: sOut=8'h93;
				8'h23: sOut=8'h26;
				8'h24: sOut=8'h36;
				8'h25: sOut=8'h3F;
				8'h26: sOut=8'hF7;
				8'h27: sOut=8'hCC;
				8'h28: sOut=8'h34;
				8'h29: sOut=8'hA5;
				8'h2A: sOut=8'hE5;
				8'h2B: sOut=8'hF1;
				8'h2C: sOut=8'h71;
				8'h2D: sOut=8'hD8;
				8'h2E: sOut=8'h31;
				8'h2F: sOut=8'h15;
				8'h30: sOut=8'h04;
				8'h31: sOut=8'hC7;
				8'h32: sOut=8'h23;
				8'h33: sOut=8'hC3;
				8'h34: sOut=8'h18;
				8'h35: sOut=8'h96;
				8'h36: sOut=8'h05;
				8'h37: sOut=8'h9A;
				8'h38: sOut=8'h07;
				8'h39: sOut=8'h12;
				8'h3A: sOut=8'h80;
				8'h3B: sOut=8'hE2;
				8'h3C: sOut=8'hEB;
				8'h3D: sOut=8'h27;
				8'h3E: sOut=8'hB2;
				8'h3F: sOut=8'h75;
				8'h40: sOut=8'h09;
				8'h41: sOut=8'h83;
				8'h42: sOut=8'h2C;
				8'h43: sOut=8'h1A;
				8'h44: sOut=8'h1B;
				8'h45: sOut=8'h6E;
				8'h46: sOut=8'h5A;
				8'h47: sOut=8'hA0;
				8'h48: sOut=8'h52;
				8'h49: sOut=8'h3B;
				8'h4A: sOut=8'hD6;
				8'h4B: sOut=8'hB3;
				8'h4C: sOut=8'h29;
				8'h4D: sOut=8'hE3;
				8'h4E: sOut=8'h2F;
				8'h4F: sOut=8'h84;
				8'h50: sOut=8'h53;
				8'h51: sOut=8'hD1;
				8'h52: sOut=8'h00;
				8'h53: sOut=8'hED;
				8'h54: sOut=8'h20;
				8'h55: sOut=8'hFC;
				8'h56: sOut=8'hB1;
				8'h57: sOut=8'h5B;
				8'h58: sOut=8'h6A;
				8'h59: sOut=8'hCB;
				8'h5A: sOut=8'hBE;
				8'h5B: sOut=8'h39;
				8'h5C: sOut=8'h4A;
				8'h5D: sOut=8'h4C;
				8'h5E: sOut=8'h58;
				8'h5F: sOut=8'hCF;
				8'h60: sOut=8'hD0;
				8'h61: sOut=8'hEF;
				8'h62: sOut=8'hAA;
				8'h63: sOut=8'hFB;
				8'h64: sOut=8'h43;
				8'h65: sOut=8'h4D;
				8'h66: sOut=8'h33;
				8'h67: sOut=8'h85;
				8'h68: sOut=8'h45;
				8'h69: sOut=8'hF9;
				8'h6A: sOut=8'h02;
				8'h6B: sOut=8'h7F;
				8'h6C: sOut=8'h50;
				8'h6D: sOut=8'h3C;
				8'h6E: sOut=8'h9F;
				8'h6F: sOut=8'hA8;
				8'h70: sOut=8'h51;
				8'h71: sOut=8'hA3;
				8'h72: sOut=8'h40;
				8'h73: sOut=8'h8F;
				8'h74: sOut=8'h92;
				8'h75: sOut=8'h9D;
				8'h76: sOut=8'h38;
				8'h77: sOut=8'hF5;
				8'h78: sOut=8'hBC;
				8'h79: sOut=8'hB6;
				8'h7A: sOut=8'hDA;
				8'h7B: sOut=8'h21;
				8'h7C: sOut=8'h10;
				8'h7D: sOut=8'hFF;
				8'h7E: sOut=8'hF3;
				8'h7F: sOut=8'hD2;
				8'h80: sOut=8'hCD;
				8'h81: sOut=8'h0C;
				8'h82: sOut=8'h13;
				8'h83: sOut=8'hEC;
				8'h84: sOut=8'h5F;
				8'h85: sOut=8'h97;
				8'h86: sOut=8'h44;
				8'h87: sOut=8'h17;
				8'h88: sOut=8'hC4;
				8'h89: sOut=8'hA7;
				8'h8A: sOut=8'h7E;
				8'h8B: sOut=8'h3D;
				8'h8C: sOut=8'h64;
				8'h8D: sOut=8'h5D;
				8'h8E: sOut=8'h19;
				8'h8F: sOut=8'h73;
				8'h90: sOut=8'h60;
				8'h91: sOut=8'h81;
				8'h92: sOut=8'h4F;
				8'h93: sOut=8'hDC;
				8'h94: sOut=8'h22;
				8'h95: sOut=8'h2A;
				8'h96: sOut=8'h90;
				8'h97: sOut=8'h88;
				8'h98: sOut=8'h46;
				8'h99: sOut=8'hEE;
				8'h9A: sOut=8'hB8;
				8'h9B: sOut=8'h14;
				8'h9C: sOut=8'hDE;
				8'h9D: sOut=8'h5E;
				8'h9E: sOut=8'h0B;
				8'h9F: sOut=8'hDB;
				8'hA0: sOut=8'hE0;
				8'hA1: sOut=8'h32;
				8'hA2: sOut=8'h3A;
				8'hA3: sOut=8'h0A;
				8'hA4: sOut=8'h49;
				8'hA5: sOut=8'h06;
				8'hA6: sOut=8'h24;
				8'hA7: sOut=8'h5C;
				8'hA8: sOut=8'hC2;
				8'hA9: sOut=8'hD3;
				8'hAA: sOut=8'hAC;
				8'hAB: sOut=8'h62;
				8'hAC: sOut=8'h91;
				8'hAD: sOut=8'h95;
				8'hAE: sOut=8'hE4;
				8'hAF: sOut=8'h79;
				8'hB0: sOut=8'hE7;
				8'hB1: sOut=8'hC8;
				8'hB2: sOut=8'h37;
				8'hB3: sOut=8'h6D;
				8'hB4: sOut=8'h8D;
				8'hB5: sOut=8'hD5;
				8'hB6: sOut=8'h4E;
				8'hB7: sOut=8'hA9;
				8'hB8: sOut=8'h6C;
				8'hB9: sOut=8'h56;
				8'hBA: sOut=8'hF4;
				8'hBB: sOut=8'hEA;
				8'hBC: sOut=8'h65;
				8'hBD: sOut=8'h7A;
				8'hBE: sOut=8'hAE;
				8'hBF: sOut=8'h08;
				8'hC0: sOut=8'hBA;
				8'hC1: sOut=8'h78;
				8'hC2: sOut=8'h25;
				8'hC3: sOut=8'h2E;
				8'hC4: sOut=8'h1C;
				8'hC5: sOut=8'hA6;
				8'hC6: sOut=8'hB4;
				8'hC7: sOut=8'hC6;
				8'hC8: sOut=8'hE8;
				8'hC9: sOut=8'hDD;
				8'hCA: sOut=8'h74;
				8'hCB: sOut=8'h1F;
				8'hCC: sOut=8'h4B;
				8'hCD: sOut=8'hBD;
				8'hCE: sOut=8'h8B;
				8'hCF: sOut=8'h8A;
				8'hD0: sOut=8'h70;
				8'hD1: sOut=8'h3E;
				8'hD2: sOut=8'hB5;
				8'hD3: sOut=8'h66;
				8'hD4: sOut=8'h48;
				8'hD5: sOut=8'h03;
				8'hD6: sOut=8'hF6;
				8'hD7: sOut=8'h0E;
				8'hD8: sOut=8'h61;
				8'hD9: sOut=8'h35;
				8'hDA: sOut=8'h57;
				8'hDB: sOut=8'hB9;
				8'hDC: sOut=8'h86;
				8'hDD: sOut=8'hC1;
				8'hDE: sOut=8'h1D;
				8'hDF: sOut=8'h9E;
				8'hE0: sOut=8'hE1;
				8'hE1: sOut=8'hF8;
				8'hE2: sOut=8'h98;
				8'hE3: sOut=8'h11;
				8'hE4: sOut=8'h69;
				8'hE5: sOut=8'hD9;
				8'hE6: sOut=8'h8E;
				8'hE7: sOut=8'h94;
				8'hE8: sOut=8'h9B;
				8'hE9: sOut=8'h1E;
				8'hEA: sOut=8'h87;
				8'hEB: sOut=8'hE9;
				8'hEC: sOut=8'hCE;
				8'hED: sOut=8'h55;
				8'hEE: sOut=8'h28;
				8'hEF: sOut=8'hDF;
				8'hF0: sOut=8'h8C;
				8'hF1: sOut=8'hA1;
				8'hF2: sOut=8'h89;
				8'hF3: sOut=8'h0D;
				8'hF4: sOut=8'hBF;
				8'hF5: sOut=8'hE6;
				8'hF6: sOut=8'h42;
				8'hF7: sOut=8'h68;
				8'hF8: sOut=8'h41;
				8'hF9: sOut=8'h99;
				8'hFA: sOut=8'h2D;
				8'hFB: sOut=8'h0F;
				8'hFC: sOut=8'hB0;
				8'hFD: sOut=8'h54;
				8'hFE: sOut=8'hBB;
				8'hFF: sOut=8'h16;
		  endcase
	     
	 end


endmodule
