module ex1_s (RST, CLK, ptext, rtext);
//user interface
	input RST, CLK;
	input [8:0] ptext;
	output[18:0] rtext;
	reg [18:0] rtext;
//STATE ASSIGNMENTS
	`include "ex1_s_stassign.v";
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
	  st_st1: begin
		if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_st3;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st1_n;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_st2;
		rtext <= 'b1111100000000000000;
	  end
	  st_st1_n: begin
		if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_st3;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st1;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_st2;
		rtext <= 'b0101100100000000000;
	  end
	  st_st2: begin
		if(ptext[1] == 1  && ptext[4] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[4] == 1 )
 		  NextState <= st_st6;
		else if(ptext[1] == 0  && ptext[4] == 0 )
 		  NextState <= st_st2_n;
		rtext <= 'b0101100100000000000;
	  end
	  st_st2_n: begin
		if(ptext[1] == 1  && ptext[4] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[4] == 1 )
 		  NextState <= st_st6;
		else if(ptext[1] == 0  && ptext[4] == 0 )
 		  NextState <= st_st2;
		rtext <= 'b0111101010000000000;
	  end
	  st_st3: begin
		if(ptext[1] == 0 )
 		  NextState <= st_st7;
		rtext <= 'b1111100000000000000;
	  end
	  st_st4: begin
		if(ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st2;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_st3;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st1;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_st2;
		rtext <= 'b0000000001000000000;
	  end
	  st_st5: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[4] == 1  && ptext[5] == 0  && ptext[6] == 0 )
 		  NextState <= st_st5_n;
		else if(ptext[4] == 1  && ptext[5] == 1  && ptext[6] == 0 )
 		  NextState <= st_st5_n;
		else if(ptext[4] == 1  && ptext[5] == 0  && ptext[6] == 1 )
 		  NextState <= st_st8;
		else if(ptext[4] == 1  && ptext[5] == 1  && ptext[6] == 1 )
 		  NextState <= st_st8;
		rtext <= 'b0000000001000000000;
	  end
	  st_st5_n: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[4] == 1  && ptext[5] == 0  && ptext[6] == 0 )
 		  NextState <= st_st5;
		else if(ptext[4] == 1  && ptext[5] == 1  && ptext[6] == 0 )
 		  NextState <= st_st5;
		else if(ptext[4] == 1  && ptext[5] == 0  && ptext[6] == 1 )
 		  NextState <= st_st8;
		else if(ptext[4] == 1  && ptext[5] == 1  && ptext[6] == 1 )
 		  NextState <= st_st8;
		rtext <= 'b0000000001000000000;
	  end
	  st_st6: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1 )
 		  NextState <= st_st9;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st6_n;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1 )
 		  NextState <= st_st10;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1 )
 		  NextState <= st_st9;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st6_n;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1 )
 		  NextState <= st_10;
		rtext <= 'b0000000001000000000;
	  end
	  st_st6_n: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1 )
 		  NextState <= st_st9;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st6;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1 )
 		  NextState <= st_st10;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1 )
 		  NextState <= st_st9;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st6;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1 )
 		  NextState <= st_10;
		rtext <= 'b0111101000000000000;
	  end
	  st_st7: begin
		if(ptext[1] == 0  && ptext[4] == 0 )
 		  NextState <= st_st7_n;
		else if(ptext[1] == 1  && ptext[4] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1 )
 		  NextState <= st_st11;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1 )
 		  NextState <= st_st12;
		rtext <= 'b0111101000000000000;
	  end
	  st_st7_n: begin
		if(ptext[1] == 0  && ptext[4] == 0 )
 		  NextState <= st_st7;
		else if(ptext[1] == 1  && ptext[4] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1 )
 		  NextState <= st_st11;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1 )
 		  NextState <= st_st12;
		rtext <= 'b0000000001000110000;
	  end
	  st_st8: begin
		if(ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[5] == 0 )
 		  NextState <= st_st1;
		rtext <= 'b0000000001000000000;
	  end
	  st_st9: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1 )
 		  NextState <= st_st13;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st9_n;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1 )
 		  NextState <= st_st14;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1 )
 		  NextState <= st_st13;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st9_n;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1 )
 		  NextState <= st_st14;
		rtext <= 'b0000000001000000000;
	  end
	  st_st9_n: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1 )
 		  NextState <= st_st13;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st9;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1 )
 		  NextState <= st_st14;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1 )
 		  NextState <= st_st13;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st9;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1 )
 		  NextState <= st_st14;
		rtext <= 'b0000000001000000000;
	  end
	  st_st10: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1 )
 		  NextState <= st_st15;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st10_n;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1 )
 		  NextState <= st_st15;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st10_n;
		rtext <= 'b0000000001000000000;
	  end
	  st_st10_n: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1 )
 		  NextState <= st_st15;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st10;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1 )
 		  NextState <= st_st15;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st10;
		rtext <= 'b0000000001000000000;
	  end
	  st_st11: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st16;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st11_n;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st16;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st13;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st13;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st12;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st16;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st11_n;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st16;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st13;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st13;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st12;
		rtext <= 'b0000000001000000000;
	  end
	  st_st11_n: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st16;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st11;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st16;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st13;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st13;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st12;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st16;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st11;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st16;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st13;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st13;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st12;
		rtext <= 'b0000000001000000000;
	  end
	  st_st12: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st15;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st12_n;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st15;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st15;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st12_n;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st15;
		rtext <= 'b0000000001000000000;
	  end
	  st_st12_n: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st15;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st12;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st15;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st15;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st12;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st15;
		rtext <= 'b0000000001000000000;
	  end
	  st_st13: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st15;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st13_n;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st15;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st15;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st13_n;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st15;
		rtext <= 'b0000000001000000000;
	  end
	  st_st13_n: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st15;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st13;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st15;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st15;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st13;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st15;
		rtext <= 'b0000000001000000000;
	  end
	  st_st14: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st16;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st14_n;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st16;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st13;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st13;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st16;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st14_n;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st16;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st13;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st13;
		rtext <= 'b0000000001000000000;
	  end
	  st_st14_n: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st16;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st14;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st16;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st13;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st13;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st16;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st14;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st16;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st13;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st13;
		rtext <= 'b0000000001000000000;
	  end
	  st_st15: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1 )
 		  NextState <= st_st17;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st15_n;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1 )
 		  NextState <= st_st17;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st15_n;
		rtext <= 'b0000000001000000000;
	  end
	  st_st15_n: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1 )
 		  NextState <= st_st17;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st15;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1 )
 		  NextState <= st_st17;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st15;
		rtext <= 'b0000000001000000000;
	  end
	  st_st16: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st16_n;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st16_n;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st16_n;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st16_n;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st16_n;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st16_n;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st13;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st13;
		rtext <= 'b0000000001000000000;
	  end
	  st_st16_n: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st16;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st16;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st16;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st16;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st16;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st16;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 1 )
 		  NextState <= st_st13;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st13;
		rtext <= 'b0000000001000000000;
	  end
	  st_st17: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st17_n;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1 )
 		  NextState <= st_st18;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st17_n;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1 )
 		  NextState <= st_st18;
		rtext <= 'b0000000001000000000;
	  end
	  st_st17_n: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st17;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1 )
 		  NextState <= st_st18;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st17;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1 )
 		  NextState <= st_st18;
		rtext <= 'b0000000001000000000;
	  end
	  st_st18: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st18_n;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1 )
 		  NextState <= st_st19;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st18_n;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1 )
 		  NextState <= st_st19;
		rtext <= 'b0000000001000000000;
	  end
	  st_st18_n: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st18;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1 )
 		  NextState <= st_st19;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st18;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1 )
 		  NextState <= st_st19;
		rtext <= 'b0000000001000000000;
	  end
	  st_st19: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st19_n;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1 )
 		  NextState <= st_st20;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st19_n;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1 )
 		  NextState <= st_st20;
		rtext <= 'b0000000001000000000;
	  end
	  st_st19_n: begin
		if(ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[1] == 1  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st5;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st19;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 1 )
 		  NextState <= st_st20;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st19;
		else if(ptext[1] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 1 )
 		  NextState <= st_st20;
		rtext <= 'b0000000001000100000;
	  end
	  st_st20: begin
		if(ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[5] == 0 )
 		  NextState <= st_st1;
		rtext <= 'b0000000000000100000;
	  end
      endcase // case ( State )
   end // always @ (State or ptext)   
endmodule // fsm
