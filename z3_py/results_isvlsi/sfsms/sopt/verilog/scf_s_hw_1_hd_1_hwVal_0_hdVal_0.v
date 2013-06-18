module scf_s (RST, CLK, ptext, rtext);
//user interface
	input RST, CLK;
	input [26:0] ptext;
	output[55:0] rtext;
	reg [55:0] rtext;
//STATE ASSIGNMENTS
	`include "scf_s_stassign.v";
   //process modeling state register
   always @ (posedge RST or posedge CLK) begin
      if( RST == 1) begin
	 State <= st_st1;
      end
      else
	State <= NextState;
   end
   always @ (State or ptext) begin
      case ( State )
	  st_START: begin
		if(ptext[0] == 0 )
 		  NextState <= st_state1;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state1: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state3;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state2: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state1;
		rtext <= 'b00000010010000001x0000000x00x0001001000010x0xxxxx00x0xxx;
	  end
	  st_state3: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state4;
		rtext <= 'b00000010000000000x0000000x00x0000000110101x0xxxxx00x0xxx;
	  end
	  st_state4: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state5;
		rtext <= 'b00000001000000000x0000000x00x0000000001000x0xxxxx00x0xxx;
	  end
	  st_state5: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state7;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state6: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state2;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state7: begin
		if(ptext[0] == 1  && ptext[6] == 0 )
 		  NextState <= st_state9;
		else if(ptext[0] == 1  && ptext[6] == 1 )
 		  NextState <= st_state8;
		rtext <= 'b00000010000000000x0000000x00x0000000001000x0xxxxx00x0xxx;
	  end
	  st_state8: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state17;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state9: begin
		if(ptext[0] == 1  && ptext[5] == 0 )
 		  NextState <= st_state12;
		else if(ptext[0] == 1  && ptext[5] == 1 )
 		  NextState <= st_state10;
		rtext <= 'b00000010000000000x0000001x00x0000000000001x0xxxxx00x0xxx;
	  end
	  st_state10: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state11;
		rtext <= 'b00000000000000000x0000000x00x0000010000000x0xxxxx00x0xxx;
	  end
	  st_state11: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state12;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state12: begin
		if(ptext[0] == 1  && ptext[4] == 0 )
 		  NextState <= st_state15;
		else if(ptext[0] == 1  && ptext[4] == 1 )
 		  NextState <= st_state13;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state13: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state29;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state14: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state17;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state15: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state59;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state16: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state17;
		rtext <= 'b0000000000010100001000000x10x000000000000011xxxxx00x0xxx;
	  end
	  st_state17: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state18;
		rtext <= 'b00100000000000000x0000000x00x0000000000000x0000xx00x0xxx;
	  end
	  st_state18: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state19;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state19: begin
		if(ptext[0] == 1  && ptext[3] == 0 )
 		  NextState <= st_state21;
		else if(ptext[0] == 1  && ptext[3] == 1 )
 		  NextState <= st_state20;
		rtext <= 'b00000001000000000x0000000x00x0000000100000x0xxxxx00x0xxx;
	  end
	  st_state20: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state21;
		rtext <= 'b01000000000100000x0000000x10x100000000000000000001001xxx;
	  end
	  st_state21: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state22;
		rtext <= 'b00010000000000000x0000000x00x0000000000000x0000xx01x0xxx;
	  end
	  st_state22: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state23;
		rtext <= 'b00000000100000000x0000000x00x0000000000000x0xxx0000x0xxx;
	  end
	  st_state23: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state24;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state24: begin
		if(ptext[0] == 1  && ptext[2] == 0 )
 		  NextState <= st_state26;
		else if(ptext[0] == 1  && ptext[2] == 1 )
 		  NextState <= st_state25;
		rtext <= 'b00000001000000000x0000000x00x0000000010000x0xxxxx00x0xxx;
	  end
	  st_state25: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state26;
		rtext <= 'b00000000010000010x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state26: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state28;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state27;
		rtext <= 'b00000000000000000x0000000x00x0010000000000x0xxxxx00x0xxx;
	  end
	  st_state27: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state28;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state28: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state7;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state29: begin
		if(ptext[0] == 1  && ptext[7] == 1 )
 		  NextState <= st_state36;
		else if(ptext[0] == 1  && ptext[7] == 0  && ptext[8] == 1 )
 		  NextState <= st_state36;
		else if(ptext[0] == 1  && ptext[7] == 0  && ptext[8] == 0  && ptext[9] == 1  && ptext[10] == 1 )
 		  NextState <= st_state36;
		else if(ptext[0] == 1  && ptext[7] == 0  && ptext[8] == 0  && ptext[9] == 1  && ptext[10] == 0 )
 		  NextState <= st_state34;
		else if(ptext[0] == 1  && ptext[7] == 0  && ptext[8] == 0  && ptext[9] == 0  && ptext[10] == 1 )
 		  NextState <= st_state32;
		else if(ptext[0] == 1  && ptext[7] == 0  && ptext[8] == 0  && ptext[9] == 0  && ptext[10] == 0 )
 		  NextState <= st_state30;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state30: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state38;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state31: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state37;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state32: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state55;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state33: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state37;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state34: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state57;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state35: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state37;
		rtext <= 'b00000001000000000x0000000x00x0000000010000x0xxxxx00x0xxx;
	  end
	  st_state36: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state37;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state37: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state14;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state38: begin
		if(ptext[0] == 1  && ptext[11] == 1 )
 		  NextState <= st_state43;
		else if(ptext[0] == 1  && ptext[11] == 0  && ptext[12] == 1 )
 		  NextState <= st_state43;
		else if(ptext[0] == 1  && ptext[11] == 0  && ptext[12] == 0  && ptext[13] == 1 )
 		  NextState <= st_state43;
		else if(ptext[0] == 1  && ptext[11] == 0  && ptext[12] == 0  && ptext[13] == 0  && ptext[14] == 1 )
 		  NextState <= st_state41;
		else if(ptext[0] == 1  && ptext[11] == 0  && ptext[12] == 0  && ptext[13] == 0  && ptext[14] == 0 )
 		  NextState <= st_state39;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state39: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state45;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state40: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state44;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state41: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state50;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state42: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state44;
		rtext <= 'b00000001000000000x0000000x00x0000000010000x0xxxxx00x0xxx;
	  end
	  st_state43: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state44;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state44: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state31;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state45: begin
		if(ptext[0] == 1  && ptext[15] == 0 )
 		  NextState <= st_state48;
		else if(ptext[0] == 1  && ptext[15] == 1 )
 		  NextState <= st_state46;
		rtext <= 'b0000000001000101001000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state46: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state47;
		rtext <= 'b00000000000000000x0000000x00x0000100000000x0xxxxx00x0xxx;
	  end
	  st_state47: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state49;
		rtext <= 'b0000000000100000111001010x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state48: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state49;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state49: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state40;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state50: begin
		if(ptext[0] == 1  && ptext[15] == 0 )
 		  NextState <= st_state52;
		else if(ptext[0] == 1  && ptext[15] == 1 )
 		  NextState <= st_state51;
		rtext <= 'b0000000000100000111001010x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state51: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state54;
		rtext <= 'b0000000000000101001000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state52: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state53;
		rtext <= 'b00000000000000000x0000000x00x0000100000000x0xxxxx00x0xxx;
	  end
	  st_state53: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state54;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state54: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state42;
		rtext <= 'b0000000000100000111001010x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state55: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state56;
		rtext <= 'b00000000000000000x0000000x00x0000100000000x0xxxxx00x0xxx;
	  end
	  st_state56: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state33;
		rtext <= 'b00000000001000001x0001000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state57: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state58;
		rtext <= 'b00000000000000000x0000000x00x0000100000000x0xxxxx00x0xxx;
	  end
	  st_state58: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state35;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state59: begin
		if(ptext[0] == 1  && ptext[16] == 0 )
 		  NextState <= st_state67;
		else if(ptext[0] == 1  && ptext[16] == 1 )
 		  NextState <= st_state60;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state60: begin
		if(ptext[0] == 1  && ptext[7] == 1 )
 		  NextState <= st_state67;
		else if(ptext[0] == 1  && ptext[7] == 0  && ptext[8] == 1 )
 		  NextState <= st_state67;
		else if(ptext[0] == 1  && ptext[7] == 0  && ptext[8] == 0  && ptext[9] == 1  && ptext[10] == 1 )
 		  NextState <= st_state67;
		else if(ptext[0] == 1  && ptext[7] == 0  && ptext[8] == 0  && ptext[9] == 1  && ptext[10] == 0 )
 		  NextState <= st_state65;
		else if(ptext[0] == 1  && ptext[7] == 0  && ptext[8] == 0  && ptext[9] == 0  && ptext[10] == 1 )
 		  NextState <= st_state63;
		else if(ptext[0] == 1  && ptext[7] == 0  && ptext[8] == 0  && ptext[9] == 0  && ptext[10] == 0 )
 		  NextState <= st_state61;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state61: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state82;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state62: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state67;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state63: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state83;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state64: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state67;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state65: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state89;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state66: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state81;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state67: begin
		if(ptext[0] == 1  && ptext[7] == 1 )
 		  NextState <= st_state80;
		else if(ptext[0] == 1  && ptext[7] == 0  && ptext[8] == 1  && ptext[9] == 1 )
 		  NextState <= st_state80;
		else if(ptext[0] == 1  && ptext[7] == 0  && ptext[8] == 1  && ptext[9] == 0  && ptext[10] == 1 )
 		  NextState <= st_state78;
		else if(ptext[0] == 1  && ptext[7] == 0  && ptext[8] == 1  && ptext[9] == 0  && ptext[10] == 0 )
 		  NextState <= st_state76;
		else if(ptext[0] == 1  && ptext[7] == 0  && ptext[8] == 0  && ptext[9] == 1  && ptext[10] == 1 )
 		  NextState <= st_state74;
		else if(ptext[0] == 1  && ptext[7] == 0  && ptext[8] == 0  && ptext[9] == 1  && ptext[10] == 0 )
 		  NextState <= st_state72;
		else if(ptext[0] == 1  && ptext[7] == 0  && ptext[8] == 0  && ptext[9] == 0  && ptext[10] == 1 )
 		  NextState <= st_state70;
		else if(ptext[0] == 1  && ptext[7] == 0  && ptext[8] == 0  && ptext[9] == 0  && ptext[10] == 0 )
 		  NextState <= st_state68;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state68: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state96;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state69: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state81;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state70: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state98;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state71: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state81;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state72: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state103;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state73: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state81;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state74: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state107;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state75: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state81;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state76: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state115;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state77: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state81;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state78: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state117;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state79: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state81;
		rtext <= 'b00000001000000000x0000000x00x0000000010000x0xxxxx00x0xxx;
	  end
	  st_state80: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state81;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state81: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state16;
		rtext <= 'b00000001000000000x0000000x00x0000000010000x0xxxxx00x0xxx;
	  end
	  st_state82: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state62;
		rtext <= 'b00000001000000000x0000000x00x0000000001000x0xxxxx00x0xxx;
	  end
	  st_state83: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state84;
		rtext <= 'b00001000000001001x0000000x00x0000000000000x0100xx00x0xxx;
	  end
	  st_state84: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state86;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state85: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state64;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state86: begin
		if(ptext[0] == 1  && ptext[17] == 0 )
 		  NextState <= st_state88;
		else if(ptext[0] == 1  && ptext[17] == 1 )
 		  NextState <= st_state87;
		rtext <= 'b00000001000000000x0000000x00x0000100001000x0xxxxx00x0xxx;
	  end
	  st_state87: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state16;
		rtext <= 'b00000000000000000x0000000x00x0000100000000x0xxxxx00x0xxx;
	  end
	  st_state88: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state86;
		rtext <= 'b00001001000000000x0000000x00x0001000001000x0xxxxx00x0xxx;
	  end
	  st_state89: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state91;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state90: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state66;
		rtext <= 'b00000010000000000x0000000x00x0000000000000x0010xx00x0xxx;
	  end
	  st_state91: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state92;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state92: begin
		if(ptext[0] == 1  && ptext[3] == 0 )
 		  NextState <= st_state95;
		else if(ptext[0] == 1  && ptext[3] == 1 )
 		  NextState <= st_state93;
		rtext <= 'b00000000000100001x0000000x10x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state93: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state94;
		rtext <= 'b00000000000000000x0000000x00x0000100000000x0xxxxx00x0xxx;
	  end
	  st_state94: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state16;
		rtext <= 'b00000000000000000x0000000x00x0010100000000x0xxxxx00x0xxx;
	  end
	  st_state95: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state91;
		rtext <= 'b00000100000001000x0000000x00x000000000000011101111011101;
	  end
	  st_state96: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state97;
		rtext <= 'b001000010000000100101010010110100000000001x0xxxxx00x0xxx;
	  end
	  st_state97: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state69;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state98: begin
		if(ptext[0] == 1  && ptext[15] == 0 )
 		  NextState <= st_state101;
		else if(ptext[0] == 1  && ptext[15] == 1 )
 		  NextState <= st_state99;
		rtext <= 'b00000100000001000x0000000x00x000000000000011101111011101;
	  end
	  st_state99: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state100;
		rtext <= 'b001000010000000100101010010110100000000001x0xxxxx00x0xxx;
	  end
	  st_state100: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state102;
		rtext <= 'b00000100000001001x0000000x00x0000000001000x0100xx00x0xxx;
	  end
	  st_state101: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state102;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state102: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state71;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state103: begin
		if(ptext[0] == 1  && ptext[15] == 0 )
 		  NextState <= st_state105;
		else if(ptext[0] == 1  && ptext[15] == 1 )
 		  NextState <= st_state104;
		rtext <= 'b0000000000000101001000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state104: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state106;
		rtext <= 'b00000100000001001x0000000x00x0000000001000x0100xx00x0xxx;
	  end
	  st_state105: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state106;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state106: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state73;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state107: begin
		if(ptext[0] == 1  && ptext[15] == 0 )
 		  NextState <= st_state112;
		else if(ptext[0] == 1  && ptext[15] == 1 )
 		  NextState <= st_state108;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state108: begin
		if(ptext[0] == 1  && ptext[18] == 0  && ptext[19] == 0  && ptext[20] == 0  && ptext[21] == 0  && ptext[22] == 0  && ptext[23] == 0  && ptext[24] == 0  && ptext[25] == 0 )
 		  NextState <= st_state110;
		else if(ptext[0] == 1  && ptext[18] == 1 )
 		  NextState <= st_state110;
		else if(ptext[0] == 1  && ptext[18] == 0  && ptext[19] == 1 )
 		  NextState <= st_state110;
		else if(ptext[0] == 1  && ptext[18] == 0  && ptext[19] == 0  && ptext[20] == 1 )
 		  NextState <= st_state110;
		else if(ptext[0] == 1  && ptext[18] == 0  && ptext[19] == 0  && ptext[20] == 0  && ptext[21] == 1 )
 		  NextState <= st_state110;
		else if(ptext[0] == 1  && ptext[18] == 0  && ptext[19] == 0  && ptext[20] == 0  && ptext[21] == 0  && ptext[22] == 1 )
 		  NextState <= st_state110;
		else if(ptext[0] == 1  && ptext[18] == 0  && ptext[19] == 0  && ptext[20] == 0  && ptext[21] == 0  && ptext[22] == 0  && ptext[23] == 1 )
 		  NextState <= st_state110;
		else if(ptext[0] == 1  && ptext[18] == 0  && ptext[19] == 0  && ptext[20] == 0  && ptext[21] == 0  && ptext[22] == 0  && ptext[23] == 0  && ptext[24] == 1 )
 		  NextState <= st_state110;
		else if(ptext[0] == 1  && ptext[18] == 0  && ptext[19] == 0  && ptext[20] == 0  && ptext[21] == 0  && ptext[22] == 0  && ptext[23] == 0  && ptext[24] == 0  && ptext[25] == 1 )
 		  NextState <= st_state109;
		rtext <= 'b0000000000001100101000000x00x0000000000000x0xxxxx00x0100;
	  end
	  st_state109: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state112;
		rtext <= 'b0000010000000101001010000x0000100000000000111000110x0100;
	  end
	  st_state110: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state111;
		rtext <= 'b00000001000000000x0000100001x0000000000001x0xxxxx00x0xxx;
	  end
	  st_state111: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state114;
		rtext <= 'b00000100000001001x0000000x00x0000000000000x0100xx00x0xxx;
	  end
	  st_state112: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state113;
		rtext <= 'b00000001000000000x0000000x00x0000000001000x0xxxxx00x0xxx;
	  end
	  st_state113: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state114;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state114: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state75;
		rtext <= 'b00001000000010001x0010000x00x0000000000000x01011010x0101;
	  end
	  st_state115: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state116;
		rtext <= 'b10000001000000000x0000100x00x0001000001101x0xxxxx00x0xxx;
	  end
	  st_state116: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state77;
		rtext <= 'b00000010000000000x0000000x00x0000000000000x0xxxxx00x0011;
	  end
	  st_state117: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state118;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state118: begin
		if(ptext[0] == 1  && ptext[26] == 0 )
 		  NextState <= st_state121;
		else if(ptext[0] == 1  && ptext[26] == 1 )
 		  NextState <= st_state119;
		rtext <= 'b0000010000001000001000000x00x0000000000000111011010x0101;
	  end
	  st_state119: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state120;
		rtext <= 'b00010010000000010x000000000110100000000100x0xxxxx00x0xxx;
	  end
	  st_state120: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state16;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
	  st_state121: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state79;
		rtext <= 'b00000000000000000x0000000x00x0000000000000x0xxxxx00x0xxx;
	  end
      endcase // case ( State )
   end // always @ (State or ptext)   
endmodule // fsm
