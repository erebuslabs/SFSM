module planet (RST, CLK, ptext, rtext);
//user interface
	input RST, CLK;
	input [6:0] ptext;
	output[18:0] rtext;
	reg [18:0] rtext;
//STATE ASSIGNMENTS
	`include "planet_stassign.v";
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
	  st_st0: begin
		if(1)
 		  NextState <= st_st1;
		rtext <= 'bxxxxxxxx0000000xxx0;
	  end
	  st_st1: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st1;
		else if(ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st1;
		else if(ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st2;
		rtext <= 'b1010010010000000000;
	  end
	  st_st2: begin
		if(ptext[6] == 0 )
 		  NextState <= st_st3;
		else if(ptext[3] == 0 )
 		  NextState <= st_st3;
		else if(ptext[3] == 1  && ptext[6] == 1 )
 		  NextState <= st_st0;
		rtext <= 'b001111101000000x010;
	  end
	  st_st3: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 0  && ptext[2] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st4;
		else if(ptext[0] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st42;
		else if(ptext[0] == 0  && ptext[2] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 0  && ptext[2] == 1  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st4;
		else if(ptext[0] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st42;
		else if(ptext[0] == 0  && ptext[2] == 1  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st4;
		rtext <= 'b1010010010000000000;
	  end
	  st_st4: begin
		if(1)
 		  NextState <= st_st5;
		rtext <= 'b1000011110000000001;
	  end
	  st_st5: begin
		if(ptext[2] == 0 )
 		  NextState <= st_st6;
		else if(ptext[2] == 1 )
 		  NextState <= st_st6;
		rtext <= 'b101001001000000x000;
	  end
	  st_st6: begin
		if(ptext[1] == 1  && ptext[6] == 0 )
 		  NextState <= st_st7;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0  && ptext[6] == 1 )
 		  NextState <= st_st7;
		else if(ptext[1] == 1  && ptext[2] == 0  && ptext[6] == 1 )
 		  NextState <= st_st41;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1  && ptext[6] == 1 )
 		  NextState <= st_st38;
		else if(ptext[1] == 0 )
 		  NextState <= st_st7;
		rtext <= 'b0001101010010000000;
	  end
	  st_st7: begin
		if(ptext[2] == 1 )
 		  NextState <= st_st8;
		else if(ptext[2] == 0 )
 		  NextState <= st_st8;
		rtext <= 'b1010010010000000000;
	  end
	  st_st8: begin
		if(ptext[2] == 0 )
 		  NextState <= st_st10;
		else if(ptext[2] == 1 )
 		  NextState <= st_st9;
		rtext <= 'b001011101001000x000;
	  end
	  st_st9: begin
		if(ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st_st11;
		else if(ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st_st11;
		else if(ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st_st11;
		else if(ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st_st11;
		rtext <= 'b0010xxxx10010000001;
	  end
	  st_st10: begin
		if(ptext[2] == 1 )
 		  NextState <= st_st12;
		else if(ptext[2] == 0 )
 		  NextState <= st_st12;
		rtext <= 'b1010010010000000000;
	  end
	  st_st11: begin
		if(1)
 		  NextState <= st_st13;
		rtext <= 'b1010010010000000000;
	  end
	  st_st12: begin
		if(1)
 		  NextState <= st_st14;
		rtext <= 'b010110011001000x000;
	  end
	  st_st13: begin
		if(ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st_st15;
		else if(ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st_st15;
		else if(ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st_st15;
		else if(ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st_st15;
		rtext <= 'b0101xxxx10010000001;
	  end
	  st_st14: begin
		if(ptext[2] == 1 )
 		  NextState <= st_st15;
		else if(ptext[2] == 0 )
 		  NextState <= st_st15;
		rtext <= 'b1010010010000000000;
	  end
	  st_st15: begin
		if(1)
 		  NextState <= st_st16;
		rtext <= 'b0110010110010000001;
	  end
	  st_st16: begin
		if(ptext[2] == 1 )
 		  NextState <= st_st17;
		else if(ptext[2] == 0 )
 		  NextState <= st_st17;
		rtext <= 'b1010010010000000000;
	  end
	  st_st17: begin
		if(ptext[3] == 0 )
 		  NextState <= st_st18;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st_st19;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 1  && ptext[6] == 0 )
 		  NextState <= st_st19;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 1  && ptext[6] == 1 )
 		  NextState <= st_st46;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st_st24;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 1  && ptext[6] == 0 )
 		  NextState <= st_st24;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 1  && ptext[6] == 1 )
 		  NextState <= st_st18;
		rtext <= 'b1000111110010000000;
	  end
	  st_st18: begin
		if(ptext[2] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 0  && ptext[2] == 0 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1  && ptext[2] == 0 )
 		  NextState <= st_st2;
		rtext <= 'b100101001000000x0x0;
	  end
	  st_st19: begin
		if(ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st_st20;
		else if(ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st_st20;
		else if(ptext[2] == 1 )
 		  NextState <= st_st25;
		rtext <= 'b101001001000000x0x0;
	  end
	  st_st20: begin
		if(ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st_st19;
		else if(ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st_st21;
		else if(ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st_st19;
		else if(ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st_st21;
		rtext <= 'b001111111000000x0x0;
	  end
	  st_st21: begin
		if(ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st_st22;
		else if(ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st_st23;
		else if(ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st_st22;
		else if(ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st_st23;
		rtext <= 'b10100100100000000x0;
	  end
	  st_st22: begin
		if(1)
 		  NextState <= st_st19;
		rtext <= 'b101001001000000xx00;
	  end
	  st_st23: begin
		if(1)
 		  NextState <= st_st24;
		rtext <= 'b100011111000000xx00;
	  end
	  st_st24: begin
		if(1)
 		  NextState <= st_st25;
		rtext <= 'b101001001000000xxx0;
	  end
	  st_st25: begin
		if(ptext[3] == 0  && ptext[6] == 0 )
 		  NextState <= st_st26;
		else if(ptext[3] == 1  && ptext[6] == 0 )
 		  NextState <= st_st28;
		else if(ptext[6] == 1 )
 		  NextState <= st_st30;
		rtext <= 'bxxxxxxxx0000100xxx0;
	  end
	  st_st26: begin
		if(ptext[2] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st27;
		else if(ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st27;
		else if(ptext[2] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st27;
		else if(ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st42;
		else if(ptext[2] == 1 )
 		  NextState <= st_st25;
		rtext <= 'b101001001000000xxx0;
	  end
	  st_st27: begin
		if(1)
 		  NextState <= st_st26;
		rtext <= 'b011001011000000xx01;
	  end
	  st_st28: begin
		if(1)
 		  NextState <= st_st29;
		rtext <= 'b101001001000000xxx0;
	  end
	  st_st29: begin
		if(ptext[3] == 1 )
 		  NextState <= st_st26;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st3;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_st3;
		rtext <= 'b100001111000000xxx1;
	  end
	  st_st30: begin
		if(1)
 		  NextState <= st_st31;
		rtext <= 'b101001001000000xxx0;
	  end
	  st_st31: begin
		if(ptext[3] == 0 )
 		  NextState <= st_st26;
		else if(ptext[3] == 1 )
 		  NextState <= st_st32;
		rtext <= 'b100101011000000xxx0;
	  end
	  st_st32: begin
		if(ptext[2] == 0 )
 		  NextState <= st_st33;
		else if(ptext[2] == 1 )
 		  NextState <= st_st35;
		rtext <= 'b101001001000000xxx0;
	  end
	  st_st33: begin
		if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st32;
		else if(ptext[2] == 0 )
 		  NextState <= st_st34;
		else if(ptext[3] == 1 )
 		  NextState <= st_st34;
		rtext <= 'b011011011001000xx00;
	  end
	  st_st34: begin
		if(ptext[2] == 1 )
 		  NextState <= st_st35;
		else if(ptext[2] == 0 )
 		  NextState <= st_st35;
		rtext <= 'b101001001000000xx00;
	  end
	  st_st35: begin
		if(1)
 		  NextState <= st_st36;
		rtext <= 'b011011101000000xx00;
	  end
	  st_st36: begin
		if(ptext[2] == 0 )
 		  NextState <= st_st37;
		else if(ptext[2] == 1 )
 		  NextState <= st_st37;
		rtext <= 'b1010010010000000100;
	  end
	  st_st37: begin
		if(1)
 		  NextState <= st_st9;
		rtext <= 'bxxxxxxxx0000100xxx0;
	  end
	  st_st38: begin
		if(ptext[2] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st39;
		else if(ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st39;
		else if(ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st42;
		else if(ptext[2] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st39;
		else if(ptext[2] == 1 )
 		  NextState <= st_st40;
		rtext <= 'b101001001000000xxx0;
	  end
	  st_st39: begin
		if(1)
 		  NextState <= st_st38;
		rtext <= 'b101001001000000xx10;
	  end
	  st_st40: begin
		if(1)
 		  NextState <= st_st41;
		rtext <= 'b011011011000000xxx0;
	  end
	  st_st41: begin
		if(1)
 		  NextState <= st_st42;
		rtext <= 'b101001001000000xx00;
	  end
	  st_st42: begin
		if(1)
 		  NextState <= st_st43;
		rtext <= 'b011011101000000xx00;
	  end
	  st_st43: begin
		if(ptext[2] == 0 )
 		  NextState <= st_st44;
		else if(ptext[2] == 1 )
 		  NextState <= st_st44;
		rtext <= 'b101001001000000xx00;
	  end
	  st_st44: begin
		if(1)
 		  NextState <= st_st45;
		rtext <= 'b0111001110000000100;
	  end
	  st_st45: begin
		if(ptext[2] == 0 )
 		  NextState <= st_st6;
		else if(ptext[2] == 1 )
 		  NextState <= st_st6;
		rtext <= 'b1000xxxx1000000xxx1;
	  end
	  st_st46: begin
		if(ptext[2] == 0 )
 		  NextState <= st_st47;
		else if(ptext[2] == 1 )
 		  NextState <= st_st0;
		rtext <= 'b101001001000000xxx0;
	  end
	  st_st47: begin
		if(1)
 		  NextState <= st_st46;
		rtext <= 'b101001001000000xxx0;
	  end
      endcase // case ( State )
   end // always @ (State or ptext)   
endmodule // fsm
