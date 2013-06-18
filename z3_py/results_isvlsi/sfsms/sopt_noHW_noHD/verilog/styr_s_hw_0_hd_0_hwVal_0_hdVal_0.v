module styr_s (RST, CLK, ptext, rtext);
//user interface
	input RST, CLK;
	input [8:0] ptext;
	output[9:0] rtext;
	reg [9:0] rtext;
//STATE ASSIGNMENTS
	`include "styr_s_stassign.v";
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
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st0_n;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st12;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[4] == 0 )
 		  NextState <= st_st12;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0_n;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0_n;
		rtext <= 'b0000xxxxxx;
	  end
	  st_st0_n: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st12;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[4] == 0 )
 		  NextState <= st_st12;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b0110010000;
	  end
	  st_st1: begin
		if(ptext[6] == 0 )
 		  NextState <= st_st2;
		else if(ptext[6] == 1 )
 		  NextState <= st_st8;
		rtext <= 'b010000xx00;
	  end
	  st_st2: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0  && ptext[6] == 0 )
 		  NextState <= st_st2_n;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st2_n;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[4] == 0 )
 		  NextState <= st_st2_n;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st3;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st2_n;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st2_n;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0  && ptext[6] == 1 )
 		  NextState <= st_st7;
		else if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b010000xx00;
	  end
	  st_st2_n: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0  && ptext[6] == 0 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[4] == 0 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st3;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0  && ptext[6] == 1 )
 		  NextState <= st_st7;
		else if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b010000xx00;
	  end
	  st_st3: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st3_n;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st3_n;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[4] == 0 )
 		  NextState <= st_st3_n;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st3_n;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st3_n;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b010000xx00;
	  end
	  st_st3_n: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st3;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st3;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[4] == 0 )
 		  NextState <= st_st3;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st3;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st3;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b0110010000;
	  end
	  st_st4: begin
		if(1)
 		  NextState <= st_st6;
		rtext <= 'b0110010100;
	  end
	  st_st5: begin
		if(1)
 		  NextState <= st_st1;
		rtext <= 'b010000xx00;
	  end
	  st_st6: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0  && ptext[6] == 0 )
 		  NextState <= st_st6_n;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st6_n;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[4] == 0 )
 		  NextState <= st_st6_n;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st6_n;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st6_n;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0  && ptext[6] == 1 )
 		  NextState <= st_st29;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b010000xx00;
	  end
	  st_st6_n: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0  && ptext[6] == 0 )
 		  NextState <= st_st6;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st6;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[4] == 0 )
 		  NextState <= st_st6;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st6;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st6;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st1;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0  && ptext[6] == 1 )
 		  NextState <= st_st29;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b110000xx00;
	  end
	  st_st7: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st7_n;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st7_n;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[4] == 0 )
 		  NextState <= st_st7_n;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st29;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st7_n;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st7_n;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b110000xx00;
	  end
	  st_st7_n: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st7;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st7;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[4] == 0 )
 		  NextState <= st_st7;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st29;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st7;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st7;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b110000xx00;
	  end
	  st_st29: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st29_n;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st29_n;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[4] == 0 )
 		  NextState <= st_st29_n;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st29_n;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st29_n;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st29_n;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b110000xx00;
	  end
	  st_st29_n: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st29;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st29;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[4] == 0 )
 		  NextState <= st_st29;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st29;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st29;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st29;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b0110010000;
	  end
	  st_st8: begin
		if(1)
 		  NextState <= st_st9;
		rtext <= 'b010000xx00;
	  end
	  st_st9: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0  && ptext[6] == 0 )
 		  NextState <= st_st9_n;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st9_n;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[4] == 0 )
 		  NextState <= st_st9_n;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1 )
 		  NextState <= st_st9_n;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st9_n;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0  && ptext[6] == 1 )
 		  NextState <= st_st28;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b010000xx00;
	  end
	  st_st9_n: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0  && ptext[6] == 0 )
 		  NextState <= st_st9;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st9;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[4] == 0 )
 		  NextState <= st_st9;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1 )
 		  NextState <= st_st9;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st9;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0  && ptext[6] == 1 )
 		  NextState <= st_st28;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b110000xx00;
	  end
	  st_st28: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st28_n;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st28_n;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[4] == 0 )
 		  NextState <= st_st28_n;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1 )
 		  NextState <= st_st28_n;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b110000xx00;
	  end
	  st_st28_n: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st28;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st28;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[4] == 0 )
 		  NextState <= st_st28;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1 )
 		  NextState <= st_st28;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b0000xxxx00;
	  end
	  st_st10: begin
		if(ptext[0] == 1  && ptext[3] == 0  && ptext[7] == 0  && ptext[8] == 0 )
 		  NextState <= st_st10_n;
		else if(ptext[0] == 1  && ptext[4] == 0  && ptext[7] == 0  && ptext[8] == 0 )
 		  NextState <= st_st10_n;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[4] == 0  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[8] == 1 )
 		  NextState <= st_st11;
		else if(ptext[0] == 1  && ptext[4] == 0  && ptext[8] == 1 )
 		  NextState <= st_st11;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b0000xxxx00;
	  end
	  st_st10_n: begin
		if(ptext[0] == 1  && ptext[3] == 0  && ptext[7] == 0  && ptext[8] == 0 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[4] == 0  && ptext[7] == 0  && ptext[8] == 0 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[4] == 0  && ptext[7] == 1  && ptext[8] == 0 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[8] == 1 )
 		  NextState <= st_st11;
		else if(ptext[0] == 1  && ptext[4] == 0  && ptext[8] == 1 )
 		  NextState <= st_st11;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b0000xxxx00;
	  end
	  st_st11: begin
		if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st11_n;
		else if(ptext[0] == 1  && ptext[4] == 0  && ptext[7] == 0 )
 		  NextState <= st_st11_n;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[4] == 0  && ptext[7] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[7] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b0000xxxx00;
	  end
	  st_st11_n: begin
		if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1  && ptext[7] == 0 )
 		  NextState <= st_st11;
		else if(ptext[0] == 1  && ptext[4] == 0  && ptext[7] == 0 )
 		  NextState <= st_st11;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0  && ptext[7] == 0 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[4] == 0  && ptext[7] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[7] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b0000xxxxxx;
	  end
	  st_st12: begin
		if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st12_n;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st12_n;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st12_n;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st13;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b0000xxxxxx;
	  end
	  st_st12_n: begin
		if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st12;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st12;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st12;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st13;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b0000xxxxxx;
	  end
	  st_st13: begin
		if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st13_n;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1 )
 		  NextState <= st_st13_n;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st14;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st14;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b0000xxxxxx;
	  end
	  st_st13_n: begin
		if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st13;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1 )
 		  NextState <= st_st13;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st14;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st14;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b0000xxxx00;
	  end
	  st_st14: begin
		if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st14_n;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1 )
 		  NextState <= st_st14_n;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st14_n;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st15;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b0000xxxx00;
	  end
	  st_st14_n: begin
		if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st14;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1 )
 		  NextState <= st_st14;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st14;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st15;
		else if(ptext[0] == 1  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b0010010000;
	  end
	  st_st15: begin
		if(ptext[2] == 1 )
 		  NextState <= st_st16;
		else if(ptext[2] == 0 )
 		  NextState <= st_st22;
		rtext <= 'b000000xx00;
	  end
	  st_st16: begin
		if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st16_n;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st19;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st17;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st16_n;
		else if(ptext[0] == 1  && ptext[3] == 1 )
 		  NextState <= st_st16_n;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b000000xx00;
	  end
	  st_st16_n: begin
		if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st16;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st19;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st17;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st16;
		else if(ptext[0] == 1  && ptext[3] == 1 )
 		  NextState <= st_st16;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b000000xx00;
	  end
	  st_st17: begin
		if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st17_n;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st18;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st20;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st17_n;
		else if(ptext[0] == 1  && ptext[3] == 1 )
 		  NextState <= st_st17_n;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b000000xx00;
	  end
	  st_st17_n: begin
		if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st17;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st18;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st20;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st17;
		else if(ptext[0] == 1  && ptext[3] == 1 )
 		  NextState <= st_st17;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b0010010100;
	  end
	  st_st18: begin
		if(1)
 		  NextState <= st_st19;
		rtext <= 'b0010010000;
	  end
	  st_st19: begin
		if(1)
 		  NextState <= st_st16;
		rtext <= 'b0010010000;
	  end
	  st_st20: begin
		if(1)
 		  NextState <= st_st21;
		rtext <= 'b000000xx00;
	  end
	  st_st21: begin
		if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st21_n;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st19;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st20;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st21_n;
		else if(ptext[0] == 1  && ptext[3] == 1 )
 		  NextState <= st_st21_n;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b000000xx00;
	  end
	  st_st21_n: begin
		if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st21;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st19;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st20;
		else if(ptext[0] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st21;
		else if(ptext[0] == 1  && ptext[3] == 1 )
 		  NextState <= st_st21;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b000000xx00;
	  end
	  st_st22: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st22_n;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st25;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st23;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st22_n;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[2] == 1 )
 		  NextState <= st_st12;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b000000xx00;
	  end
	  st_st22_n: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st22;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st25;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st23;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st22;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[2] == 1 )
 		  NextState <= st_st12;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b000000xx00;
	  end
	  st_st23: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st23_n;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st24;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st26;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st23_n;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[2] == 1 )
 		  NextState <= st_st12;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b000000xx00;
	  end
	  st_st23_n: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st23;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st24;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st26;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st23;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[2] == 1 )
 		  NextState <= st_st12;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b0010010100;
	  end
	  st_st24: begin
		if(1)
 		  NextState <= st_st25;
		rtext <= 'b0010010000;
	  end
	  st_st25: begin
		if(1)
 		  NextState <= st_st22;
		rtext <= 'b0010010000;
	  end
	  st_st26: begin
		if(1)
 		  NextState <= st_st27;
		rtext <= 'b000000xx00;
	  end
	  st_st27: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st27_n;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st25;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st26;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st27_n;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[2] == 1 )
 		  NextState <= st_st12;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b000000xx00;
	  end
	  st_st27_n: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 0 )
 		  NextState <= st_st27;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[5] == 1 )
 		  NextState <= st_st25;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 0 )
 		  NextState <= st_st26;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[5] == 1 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0 )
 		  NextState <= st_st27;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[2] == 1 )
 		  NextState <= st_st12;
		else if(ptext[0] == 0 )
 		  NextState <= st_st0;
		rtext <= 'b0000xxxxxx;
	  end
      endcase // case ( State )
   end // always @ (State or ptext)   
endmodule // fsm
