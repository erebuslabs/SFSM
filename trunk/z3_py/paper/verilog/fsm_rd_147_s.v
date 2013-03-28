module fsm_rd_147_s (RST, CLK, ptext, rtext);
//user interface
	input RST, CLK;
	input [3:0] ptext;
	output[5:0] rtext;
	reg [5:0] rtext;
//STATE ASSIGNMENTS
	`include "fsm_rd_147_s_stassign.v";
   //process modeling state register
   always @ (posedge RST or posedge CLK) begin
      if( RST == 1) begin
	 State <= st1;
	 //NextState <= WT;
      end
      else
	State <= NextState;
   end
   always @ (State or ptext) begin
      case ( State )
	  st1: begin
		if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st2;
		else if(ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st1_n;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st4;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st5;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st7;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st8;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st10;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st11;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st12;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st17;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st19;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st22;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st26;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st29;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st4;
		rtext <= 'b010100;
	  end
	  st1_n: begin
		if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st2;
		else if(ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st1;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st4;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st5;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st7;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st8;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st10;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st11;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st12;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st17;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st19;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st22;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st26;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st29;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st4;
		rtext <= 'b000001;
	  end
	  st2: begin
		if(ptext[0] == 0  && ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st1;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st3;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st2_n;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st1;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st3;
		else if(ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st3;
		else if(ptext[0] == 1  && ptext[3] == 1 )
 		  NextState <= st2_n;
		rtext <= 'b000001;
	  end
	  st2_n: begin
		if(ptext[0] == 0  && ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st1;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st3;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st2;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st1;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st3;
		else if(ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st3;
		else if(ptext[0] == 1  && ptext[3] == 1 )
 		  NextState <= st2;
		rtext <= 'b100011;
	  end
	  st3: begin
		if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st2;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st4;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st3_n;
		else if(ptext[0] == 0  && ptext[2] == 0 )
 		  NextState <= st2;
		else if(ptext[0] == 1  && ptext[3] == 0 )
 		  NextState <= st4;
		else if(ptext[0] == 0  && ptext[2] == 1 )
 		  NextState <= st3_n;
		rtext <= 'b100011;
	  end
	  st3_n: begin
		if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st2;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st4;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st3;
		else if(ptext[0] == 0  && ptext[2] == 0 )
 		  NextState <= st2;
		else if(ptext[0] == 1  && ptext[3] == 0 )
 		  NextState <= st4;
		else if(ptext[0] == 0  && ptext[2] == 1 )
 		  NextState <= st3;
		rtext <= 'b110011;
	  end
	  st4: begin
		if(ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st3;
		else if(ptext[0] == 0  && ptext[2] == 0 )
 		  NextState <= st1;
		else if(ptext[0] == 1 )
 		  NextState <= st3;
		else if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st1;
		rtext <= 'b100010;
	  end
	  st5: begin
		if(ptext[0] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st1;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st6;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st5_n;
		else if(ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st1;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st6;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st6;
		else if(ptext[0] == 1  && ptext[2] == 1 )
 		  NextState <= st5_n;
		rtext <= 'b100010;
	  end
	  st5_n: begin
		if(ptext[0] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st1;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st6;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st5;
		else if(ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st1;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st6;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st6;
		else if(ptext[0] == 1  && ptext[2] == 1 )
 		  NextState <= st5;
		rtext <= 'b100111;
	  end
	  st6: begin
		if(ptext[0] == 0  && ptext[3] == 0 )
 		  NextState <= st5;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st7;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st6_n;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st5;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st7;
		else if(ptext[0] == 1  && ptext[2] == 1 )
 		  NextState <= st6_n;
		rtext <= 'b100111;
	  end
	  st6_n: begin
		if(ptext[0] == 0  && ptext[3] == 0 )
 		  NextState <= st5;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st7;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st6;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st5;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st7;
		else if(ptext[0] == 1  && ptext[2] == 1 )
 		  NextState <= st6;
		rtext <= 'b001010;
	  end
	  st7: begin
		if(ptext[0] == 1  && ptext[2] == 1 )
 		  NextState <= st6;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st1;
		else if(ptext[0] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st7_n;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st6;
		else if(ptext[0] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st1;
		else if(ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st7_n;
		rtext <= 'b001010;
	  end
	  st7_n: begin
		if(ptext[0] == 1  && ptext[2] == 1 )
 		  NextState <= st6;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st1;
		else if(ptext[0] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st7;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st6;
		else if(ptext[0] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st1;
		else if(ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st7;
		rtext <= 'b011100;
	  end
	  st8: begin
		if(ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st1;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st9;
		else if(ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st8_n;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st14;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st18;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st20;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st23;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st27;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st9;
		rtext <= 'b011100;
	  end
	  st8_n: begin
		if(ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st1;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st9;
		else if(ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st8;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st14;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st18;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st20;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st23;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st27;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st9;
		rtext <= 'b011110;
	  end
	  st9: begin
		if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st8;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st1;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st9_n;
		else if(ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st8;
		else if(ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st1;
		else if(ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st9_n;
		rtext <= 'b011110;
	  end
	  st9_n: begin
		if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st8;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st1;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st9;
		else if(ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st8;
		else if(ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st1;
		else if(ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st9;
		rtext <= 'b001111;
	  end
	  st10: begin
		if(ptext[0] == 0  && ptext[2] == 0 )
 		  NextState <= st1;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st11;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st10_n;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st1;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st11;
		else if(ptext[0] == 1  && ptext[3] == 1 )
 		  NextState <= st10_n;
		rtext <= 'b001111;
	  end
	  st10_n: begin
		if(ptext[0] == 0  && ptext[2] == 0 )
 		  NextState <= st1;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st11;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st10;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st1;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st11;
		else if(ptext[0] == 1  && ptext[3] == 1 )
 		  NextState <= st10;
		rtext <= 'b010000;
	  end
	  st11: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st10;
		else if(ptext[0] == 0  && ptext[3] == 1 )
 		  NextState <= st1;
		else if(ptext[3] == 0 )
 		  NextState <= st10;
		else if(ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st1;
		rtext <= 'b001010;
	  end
	  st12: begin
		if(ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st13;
		else if(ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st12_n;
		else if(ptext[2] == 0 )
 		  NextState <= st13;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st12_n;
		rtext <= 'b001010;
	  end
	  st12_n: begin
		if(ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st13;
		else if(ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st12;
		else if(ptext[2] == 0 )
 		  NextState <= st13;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st12;
		rtext <= 'b000100;
	  end
	  st13: begin
		if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st12;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st1;
		else if(ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st13_n;
		else if(ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st12;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st1;
		else if(ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st13_n;
		rtext <= 'b000100;
	  end
	  st13_n: begin
		if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st12;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st1;
		else if(ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st13;
		else if(ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st12;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st1;
		else if(ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st13;
		rtext <= 'b011100;
	  end
	  st14: begin
		if(ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st8;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st15;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st14_n;
		else if(ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st8;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st15;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st14_n;
		rtext <= 'b011100;
	  end
	  st14_n: begin
		if(ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st8;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st15;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st14;
		else if(ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st8;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st15;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st14;
		rtext <= 'b011110;
	  end
	  st15: begin
		if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st14;
		else if(ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st16;
		else if(ptext[1] == 1 )
 		  NextState <= st14;
		else if(ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st16;
		rtext <= 'b101100;
	  end
	  st16: begin
		if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st15;
		else if(ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st17;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st16_n;
		else if(ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st15;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st17;
		else if(ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st16_n;
		rtext <= 'b101100;
	  end
	  st16_n: begin
		if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st15;
		else if(ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st17;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st16;
		else if(ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st15;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st17;
		else if(ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st16;
		rtext <= 'b010000;
	  end
	  st17: begin
		if(ptext[0] == 0  && ptext[2] == 1 )
 		  NextState <= st1;
		else if(ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st17_n;
		else if(ptext[1] == 0 )
 		  NextState <= st1;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st17_n;
		rtext <= 'b010000;
	  end
	  st17_n: begin
		if(ptext[0] == 0  && ptext[2] == 1 )
 		  NextState <= st1;
		else if(ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st17;
		else if(ptext[1] == 0 )
 		  NextState <= st1;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st17;
		rtext <= 'b000101;
	  end
	  st18: begin
		if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st8;
		else if(ptext[0] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st19;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st18_n;
		else if(ptext[0] == 0  && ptext[3] == 1 )
 		  NextState <= st8;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st19;
		else if(ptext[0] == 1  && ptext[3] == 1 )
 		  NextState <= st18_n;
		rtext <= 'b000101;
	  end
	  st18_n: begin
		if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st8;
		else if(ptext[0] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st19;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st18;
		else if(ptext[0] == 0  && ptext[3] == 1 )
 		  NextState <= st8;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st19;
		else if(ptext[0] == 1  && ptext[3] == 1 )
 		  NextState <= st18;
		rtext <= 'b101000;
	  end
	  st19: begin
		if(ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st18;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st1;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st19_n;
		else if(ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st18;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st1;
		else if(ptext[1] == 1  && ptext[3] == 0 )
 		  NextState <= st19_n;
		rtext <= 'b101000;
	  end
	  st19_n: begin
		if(ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st18;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st1;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st19;
		else if(ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st18;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st1;
		else if(ptext[1] == 1  && ptext[3] == 0 )
 		  NextState <= st19;
		rtext <= 'b000010;
	  end
	  st20: begin
		if(ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st8;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st21;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st20_n;
		else if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st8;
		else if(ptext[0] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st21;
		else if(ptext[1] == 1  && ptext[3] == 0 )
 		  NextState <= st20_n;
		rtext <= 'b000010;
	  end
	  st20_n: begin
		if(ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st8;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st21;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st20;
		else if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st8;
		else if(ptext[0] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st21;
		else if(ptext[1] == 1  && ptext[3] == 0 )
 		  NextState <= st20;
		rtext <= 'b010100;
	  end
	  st21: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st22;
		else if(ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st21_n;
		else if(ptext[2] == 0 )
 		  NextState <= st22;
		else if(ptext[0] == 0  && ptext[2] == 1 )
 		  NextState <= st21_n;
		rtext <= 'b010100;
	  end
	  st21_n: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st22;
		else if(ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st21;
		else if(ptext[2] == 0 )
 		  NextState <= st22;
		else if(ptext[0] == 0  && ptext[2] == 1 )
 		  NextState <= st21;
		rtext <= 'b001101;
	  end
	  st22: begin
		if(ptext[0] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st21;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st1;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st22_n;
		else if(ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st21;
		else if(ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st1;
		else if(ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st22_n;
		rtext <= 'b001101;
	  end
	  st22_n: begin
		if(ptext[0] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st21;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st1;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st22;
		else if(ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st21;
		else if(ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st1;
		else if(ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st22;
		rtext <= 'b011101;
	  end
	  st23: begin
		if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st8;
		else if(ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st24;
		else if(ptext[1] == 0 )
 		  NextState <= st8;
		else if(ptext[1] == 1  && ptext[3] == 0 )
 		  NextState <= st24;
		rtext <= 'b011111;
	  end
	  st24: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st23;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[3] == 0 )
 		  NextState <= st25;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st24_n;
		else if(ptext[0] == 1  && ptext[2] == 1 )
 		  NextState <= st23;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st25;
		else if(ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st24_n;
		rtext <= 'b011111;
	  end
	  st24_n: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st23;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[3] == 0 )
 		  NextState <= st25;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st24;
		else if(ptext[0] == 1  && ptext[2] == 1 )
 		  NextState <= st23;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st25;
		else if(ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st24;
		rtext <= 'b000001;
	  end
	  st25: begin
		if(ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st24;
		else if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st26;
		else if(ptext[3] == 0 )
 		  NextState <= st24;
		else if(ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st26;
		rtext <= 'b111010;
	  end
	  st26: begin
		if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st25;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st1;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st26_n;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st30;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st33;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st34;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st35;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st36;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st38;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st39;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st42;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st43;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st45;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st1;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st26_n;
		rtext <= 'b111010;
	  end
	  st26_n: begin
		if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st25;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st1;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st26;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st30;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st33;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st34;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st35;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st36;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st38;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st39;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st42;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st43;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st45;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st1;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st26;
		rtext <= 'b000001;
	  end
	  st27: begin
		if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st8;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st28;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st27_n;
		else if(ptext[0] == 0  && ptext[3] == 1 )
 		  NextState <= st8;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st28;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st28;
		else if(ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st27_n;
		rtext <= 'b000001;
	  end
	  st27_n: begin
		if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st8;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st28;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st27;
		else if(ptext[0] == 0  && ptext[3] == 1 )
 		  NextState <= st8;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st28;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st28;
		else if(ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st27;
		rtext <= 'b111000;
	  end
	  st28: begin
		if(ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st27;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st29;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st28_n;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st27;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st29;
		else if(ptext[0] == 0  && ptext[2] == 1 )
 		  NextState <= st28_n;
		rtext <= 'b111000;
	  end
	  st28_n: begin
		if(ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st27;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st29;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st28;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st27;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st29;
		else if(ptext[0] == 0  && ptext[2] == 1 )
 		  NextState <= st28;
		rtext <= 'b111001;
	  end
	  st29: begin
		if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st28;
		else if(ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st1;
		else if(ptext[0] == 1  && ptext[2] == 1 )
 		  NextState <= st29_n;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st28;
		else if(ptext[0] == 0  && ptext[3] == 1 )
 		  NextState <= st1;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st29_n;
		rtext <= 'b111001;
	  end
	  st29_n: begin
		if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st28;
		else if(ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st1;
		else if(ptext[0] == 1  && ptext[2] == 1 )
 		  NextState <= st29;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st28;
		else if(ptext[0] == 0  && ptext[3] == 1 )
 		  NextState <= st1;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st29;
		rtext <= 'b100010;
	  end
	  st30: begin
		if(ptext[0] == 0  && ptext[3] == 0 )
 		  NextState <= st26;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st31;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st30_n;
		else if(ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st26;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st31;
		else if(ptext[0] == 1  && ptext[3] == 0 )
 		  NextState <= st30_n;
		rtext <= 'b100010;
	  end
	  st30_n: begin
		if(ptext[0] == 0  && ptext[3] == 0 )
 		  NextState <= st26;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st31;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st30;
		else if(ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st26;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st31;
		else if(ptext[0] == 1  && ptext[3] == 0 )
 		  NextState <= st30;
		rtext <= 'b110000;
	  end
	  st31: begin
		if(ptext[0] == 1  && ptext[2] == 1 )
 		  NextState <= st30;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st32;
		else if(ptext[3] == 1 )
 		  NextState <= st30;
		else if(ptext[0] == 0  && ptext[3] == 0 )
 		  NextState <= st32;
		rtext <= 'b100101;
	  end
	  st32: begin
		if(ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st31;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st33;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st32_n;
		else if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st31;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st33;
		else if(ptext[0] == 0  && ptext[2] == 0 )
 		  NextState <= st32_n;
		rtext <= 'b100101;
	  end
	  st32_n: begin
		if(ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st31;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st33;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st32;
		else if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st31;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st33;
		else if(ptext[0] == 0  && ptext[2] == 0 )
 		  NextState <= st32;
		rtext <= 'b011011;
	  end
	  st33: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st26;
		else if(ptext[0] == 0  && ptext[3] == 0 )
 		  NextState <= st33_n;
		else if(ptext[3] == 1 )
 		  NextState <= st26;
		else if(ptext[1] == 1  && ptext[3] == 0 )
 		  NextState <= st33_n;
		rtext <= 'b011011;
	  end
	  st33_n: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st26;
		else if(ptext[0] == 0  && ptext[3] == 0 )
 		  NextState <= st33;
		else if(ptext[3] == 1 )
 		  NextState <= st26;
		else if(ptext[1] == 1  && ptext[3] == 0 )
 		  NextState <= st33;
		rtext <= 'b011011;
	  end
	  st34: begin
		if(ptext[0] == 0  && ptext[2] == 0 )
 		  NextState <= st26;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st35;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[3] == 0 )
 		  NextState <= st34_n;
		else if(ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st26;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st35;
		else if(ptext[0] == 1  && ptext[2] == 0 )
 		  NextState <= st34_n;
		rtext <= 'b011011;
	  end
	  st34_n: begin
		if(ptext[0] == 0  && ptext[2] == 0 )
 		  NextState <= st26;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st35;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[3] == 0 )
 		  NextState <= st34;
		else if(ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st26;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st35;
		else if(ptext[0] == 1  && ptext[2] == 0 )
 		  NextState <= st34;
		rtext <= 'b010010;
	  end
	  st35: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st34;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st26;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st35_n;
		else if(ptext[0] == 1  && ptext[3] == 0 )
 		  NextState <= st34;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st26;
		else if(ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st35_n;
		rtext <= 'b010010;
	  end
	  st35_n: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st34;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st26;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st35;
		else if(ptext[0] == 1  && ptext[3] == 0 )
 		  NextState <= st34;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st26;
		else if(ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st35;
		rtext <= 'b000000;
	  end
	  st36: begin
		if(ptext[0] == 0  && ptext[1] == 1  && ptext[3] == 0 )
 		  NextState <= st26;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st37;
		else if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st36_n;
		else if(ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st26;
		else if(ptext[0] == 1  && ptext[2] == 1 )
 		  NextState <= st37;
		else if(ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st36_n;
		rtext <= 'b000000;
	  end
	  st36_n: begin
		if(ptext[0] == 0  && ptext[1] == 1  && ptext[3] == 0 )
 		  NextState <= st26;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st37;
		else if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st36;
		else if(ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st26;
		else if(ptext[0] == 1  && ptext[2] == 1 )
 		  NextState <= st37;
		else if(ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st36;
		rtext <= 'b101111;
	  end
	  st37: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st38;
		else if(ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st37_n;
		else if(ptext[2] == 1 )
 		  NextState <= st38;
		else if(ptext[0] == 1  && ptext[2] == 0 )
 		  NextState <= st37_n;
		rtext <= 'b101111;
	  end
	  st37_n: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st38;
		else if(ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st37;
		else if(ptext[2] == 1 )
 		  NextState <= st38;
		else if(ptext[0] == 1  && ptext[2] == 0 )
 		  NextState <= st37;
		rtext <= 'b111110;
	  end
	  st38: begin
		if(ptext[0] == 0  && ptext[2] == 1 )
 		  NextState <= st37;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st26;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st38_n;
		else if(ptext[0] == 0  && ptext[3] == 0 )
 		  NextState <= st37;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st26;
		else if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st38_n;
		rtext <= 'b111110;
	  end
	  st38_n: begin
		if(ptext[0] == 0  && ptext[2] == 1 )
 		  NextState <= st37;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st26;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st38;
		else if(ptext[0] == 0  && ptext[3] == 0 )
 		  NextState <= st37;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st26;
		else if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st38;
		rtext <= 'b001010;
	  end
	  st39: begin
		if(ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st26;
		else if(ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st40;
		else if(ptext[2] == 0 )
 		  NextState <= st26;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st40;
		rtext <= 'b001101;
	  end
	  st40: begin
		if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st39;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st41;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st40_n;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st49;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st51;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st54;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st58;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st61;
		rtext <= 'b001101;
	  end
	  st40_n: begin
		if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st39;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st41;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st40;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st49;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st51;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st54;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st58;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st61;
		rtext <= 'b000000;
	  end
	  st41: begin
		if(ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st40;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st42;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st46;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st41_n;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st50;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[3] == 0 )
 		  NextState <= st52;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st55;
		else if(ptext[0] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st59;
		rtext <= 'b000000;
	  end
	  st41_n: begin
		if(ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st40;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st42;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st46;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st41;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st50;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[3] == 0 )
 		  NextState <= st52;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st55;
		else if(ptext[0] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st59;
		rtext <= 'b011100;
	  end
	  st42: begin
		if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st41;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st26;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st42_n;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st41;
		else if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st26;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st42_n;
		rtext <= 'b011100;
	  end
	  st42_n: begin
		if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st41;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st26;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st42;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st41;
		else if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st26;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st42;
		rtext <= 'b110001;
	  end
	  st43: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st26;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st44;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st43_n;
		else if(ptext[0] == 0  && ptext[3] == 0 )
 		  NextState <= st26;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st44;
		else if(ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st43_n;
		rtext <= 'b110001;
	  end
	  st43_n: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st26;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st44;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st43;
		else if(ptext[0] == 0  && ptext[3] == 0 )
 		  NextState <= st26;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st44;
		else if(ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st43;
		rtext <= 'b100101;
	  end
	  st44: begin
		if(ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st43;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st45;
		else if(ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st44_n;
		else if(ptext[0] == 0  && ptext[2] == 1 )
 		  NextState <= st43;
		else if(ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st45;
		else if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st44_n;
		rtext <= 'b100101;
	  end
	  st44_n: begin
		if(ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st43;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st45;
		else if(ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st44;
		else if(ptext[0] == 0  && ptext[2] == 1 )
 		  NextState <= st43;
		else if(ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st45;
		else if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st44;
		rtext <= 'b010010;
	  end
	  st45: begin
		if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st44;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st26;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st45_n;
		else if(ptext[0] == 1  && ptext[3] == 0 )
 		  NextState <= st44;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st26;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st26;
		else if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st45_n;
		rtext <= 'b010010;
	  end
	  st45_n: begin
		if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st44;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st26;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st45;
		else if(ptext[0] == 1  && ptext[3] == 0 )
 		  NextState <= st44;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st26;
		else if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st26;
		else if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st45;
		rtext <= 'b111111;
	  end
	  st46: begin
		if(ptext[0] == 1  && ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st41;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st47;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st46_n;
		else if(ptext[0] == 1  && ptext[2] == 0 )
 		  NextState <= st41;
		else if(ptext[0] == 0  && ptext[2] == 1 )
 		  NextState <= st47;
		else if(ptext[0] == 0  && ptext[2] == 0 )
 		  NextState <= st46_n;
		rtext <= 'b111111;
	  end
	  st46_n: begin
		if(ptext[0] == 1  && ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st41;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st47;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st46;
		else if(ptext[0] == 1  && ptext[2] == 0 )
 		  NextState <= st41;
		else if(ptext[0] == 0  && ptext[2] == 1 )
 		  NextState <= st47;
		else if(ptext[0] == 0  && ptext[2] == 0 )
 		  NextState <= st46;
		rtext <= 'b011101;
	  end
	  st47: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st46;
		else if(ptext[0] == 0  && ptext[3] == 1 )
 		  NextState <= st48;
		else if(ptext[3] == 0 )
 		  NextState <= st46;
		else if(ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st48;
		rtext <= 'b101101;
	  end
	  st48: begin
		if(ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st47;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st49;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st48_n;
		else if(ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st47;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st49;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st48_n;
		rtext <= 'b101101;
	  end
	  st48_n: begin
		if(ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st47;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st49;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st48;
		else if(ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st47;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st49;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st48;
		rtext <= 'b110001;
	  end
	  st49: begin
		if(ptext[1] == 1  && ptext[3] == 0 )
 		  NextState <= st40;
		else if(ptext[0] == 0  && ptext[3] == 1 )
 		  NextState <= st49_n;
		else if(ptext[0] == 1 )
 		  NextState <= st40;
		else if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st49_n;
		rtext <= 'b110001;
	  end
	  st49_n: begin
		if(ptext[1] == 1  && ptext[3] == 0 )
 		  NextState <= st40;
		else if(ptext[0] == 0  && ptext[3] == 1 )
 		  NextState <= st49;
		else if(ptext[0] == 1 )
 		  NextState <= st40;
		else if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st49;
		rtext <= 'b010101;
	  end
	  st50: begin
		if(ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st41;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st51;
		else if(ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st50_n;
		else if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st41;
		else if(ptext[0] == 0  && ptext[3] == 0 )
 		  NextState <= st51;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st50_n;
		rtext <= 'b010101;
	  end
	  st50_n: begin
		if(ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st41;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st51;
		else if(ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st50;
		else if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st41;
		else if(ptext[0] == 0  && ptext[3] == 0 )
 		  NextState <= st51;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st50;
		rtext <= 'b111010;
	  end
	  st51: begin
		if(ptext[0] == 0  && ptext[3] == 0 )
 		  NextState <= st50;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st40;
		else if(ptext[0] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st51_n;
		else if(ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st50;
		else if(ptext[0] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st40;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st51_n;
		rtext <= 'b111010;
	  end
	  st51_n: begin
		if(ptext[0] == 0  && ptext[3] == 0 )
 		  NextState <= st50;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st40;
		else if(ptext[0] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st51;
		else if(ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st50;
		else if(ptext[0] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st40;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st51;
		rtext <= 'b011000;
	  end
	  st52: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st41;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st53;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st52_n;
		else if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st41;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st53;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st53;
		else if(ptext[0] == 1  && ptext[3] == 1 )
 		  NextState <= st52_n;
		rtext <= 'b011000;
	  end
	  st52_n: begin
		if(ptext[0] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st41;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st53;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st52;
		else if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st41;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st53;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st53;
		else if(ptext[0] == 1  && ptext[3] == 1 )
 		  NextState <= st52;
		rtext <= 'b111110;
	  end
	  st53: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st54;
		else if(ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st53_n;
		else if(ptext[2] == 1 )
 		  NextState <= st54;
		else if(ptext[0] == 0  && ptext[2] == 0 )
 		  NextState <= st53_n;
		rtext <= 'b111110;
	  end
	  st53_n: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st54;
		else if(ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st53;
		else if(ptext[2] == 1 )
 		  NextState <= st54;
		else if(ptext[0] == 0  && ptext[2] == 0 )
 		  NextState <= st53;
		rtext <= 'b110101;
	  end
	  st54: begin
		if(ptext[0] == 0  && ptext[1] == 1  && ptext[3] == 0 )
 		  NextState <= st53;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st40;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st54_n;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st53;
		else if(ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st40;
		else if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st54_n;
		rtext <= 'b110101;
	  end
	  st54_n: begin
		if(ptext[0] == 0  && ptext[1] == 1  && ptext[3] == 0 )
 		  NextState <= st53;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st40;
		else if(ptext[0] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st54;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st53;
		else if(ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st40;
		else if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st54;
		rtext <= 'b011001;
	  end
	  st55: begin
		if(ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st41;
		else if(ptext[0] == 1  && ptext[3] == 0 )
 		  NextState <= st56;
		else if(ptext[0] == 0 )
 		  NextState <= st41;
		else if(ptext[0] == 1  && ptext[2] == 0 )
 		  NextState <= st56;
		rtext <= 'b111000;
	  end
	  st56: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st55;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st57;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st56_n;
		else if(ptext[0] == 1  && ptext[2] == 0 )
 		  NextState <= st55;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st57;
		else if(ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st56_n;
		rtext <= 'b111000;
	  end
	  st56_n: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st55;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st57;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st56;
		else if(ptext[0] == 1  && ptext[2] == 0 )
 		  NextState <= st55;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st57;
		else if(ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st56;
		rtext <= 'b000100;
	  end
	  st57: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st56;
		else if(ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st58;
		else if(ptext[3] == 1 )
 		  NextState <= st56;
		else if(ptext[0] == 1  && ptext[3] == 0 )
 		  NextState <= st58;
		rtext <= 'b000010;
	  end
	  st58: begin
		if(ptext[0] == 1  && ptext[1] == 1  && ptext[3] == 0 )
 		  NextState <= st57;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st40;
		else if(ptext[0] == 0  && ptext[3] == 0 )
 		  NextState <= st58_n;
		else if(ptext[0] == 1  && ptext[2] == 0 )
 		  NextState <= st57;
		else if(ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st40;
		else if(ptext[0] == 0  && ptext[2] == 0 )
 		  NextState <= st58_n;
		rtext <= 'b000010;
	  end
	  st58_n: begin
		if(ptext[0] == 1  && ptext[1] == 1  && ptext[3] == 0 )
 		  NextState <= st57;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st40;
		else if(ptext[0] == 0  && ptext[3] == 0 )
 		  NextState <= st58;
		else if(ptext[0] == 1  && ptext[2] == 0 )
 		  NextState <= st57;
		else if(ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st40;
		else if(ptext[0] == 0  && ptext[2] == 0 )
 		  NextState <= st58;
		rtext <= 'b111100;
	  end
	  st59: begin
		if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st41;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st60;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st59_n;
		else if(ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st41;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st60;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st59_n;
		rtext <= 'b111100;
	  end
	  st59_n: begin
		if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st41;
		else if(ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st60;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1 )
 		  NextState <= st59;
		else if(ptext[1] == 1  && ptext[3] == 1 )
 		  NextState <= st41;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st60;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st59;
		rtext <= 'b110000;
	  end
	  st60: begin
		if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st59;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st61;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st60_n;
		else if(ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st59;
		else if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st61;
		else if(ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st60_n;
		rtext <= 'b110000;
	  end
	  st60_n: begin
		if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st59;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st61;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0 )
 		  NextState <= st60;
		else if(ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st59;
		else if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st61;
		else if(ptext[1] == 0  && ptext[3] == 0 )
 		  NextState <= st60;
		rtext <= 'b100011;
	  end
	  st61: begin
		if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st60;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st40;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st61_n;
		else if(ptext[0] == 0  && ptext[2] == 0 )
 		  NextState <= st60;
		else if(ptext[0] == 1  && ptext[2] == 1 )
 		  NextState <= st40;
		else if(ptext[0] == 1  && ptext[2] == 0 )
 		  NextState <= st61_n;
		rtext <= 'b100011;
	  end
	  st61_n: begin
		if(ptext[0] == 0  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st60;
		else if(ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st40;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1 )
 		  NextState <= st61;
		else if(ptext[0] == 0  && ptext[2] == 0 )
 		  NextState <= st60;
		else if(ptext[0] == 1  && ptext[2] == 1 )
 		  NextState <= st40;
		else if(ptext[0] == 1  && ptext[2] == 0 )
 		  NextState <= st61;
		rtext <= 'b110001;
	  end
      endcase // case ( State )
   end // always @ (State or ptext)   
endmodule // fsm
