module sse_s (RST, CLK, ptext, rtext);
//user interface
	input RST, CLK;
	input [6:0] ptext;
	output[6:0] rtext;
	reg [6:0] rtext;
//STATE ASSIGNMENTS
	`include "sse_s_stassign.v";
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
	  st_st11: begin
		if(ptext[0] == 0 )
 		  NextState <= st_st11_n;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[6] == 0 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[6] == 1 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[6] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[6] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b0000000;
	  end
	  st_st11_n: begin
		if(ptext[0] == 0 )
 		  NextState <= st_st11;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[6] == 0 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[6] == 1 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[6] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[6] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b00000x0;
	  end
	  st_st10: begin
		if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st_st10_n;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1 )
 		  NextState <= st_st12;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 0 )
 		  NextState <= st_st7;
		else if(ptext[0] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b00000x0;
	  end
	  st_st10_n: begin
		if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 1 )
 		  NextState <= st_st12;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[4] == 0 )
 		  NextState <= st_st7;
		else if(ptext[0] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b00000x0;
	  end
	  st_st7: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_st6;
		else if(ptext[0] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b10000x0;
	  end
	  st_st6: begin
		if(ptext[0] == 1  && ptext[1] == 0  && ptext[4] == 0 )
 		  NextState <= st_st7;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[4] == 1 )
 		  NextState <= st_st12;
		else if(ptext[0] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b00000x0;
	  end
	  st_st12: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_st1;
		else if(ptext[0] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b10000x0;
	  end
	  st_st1: begin
		if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 1 )
 		  NextState <= st_st12;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[4] == 1 )
 		  NextState <= st_st12;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 0  && ptext[4] == 0 )
 		  NextState <= st_st0;
		else if(ptext[0] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b0100000;
	  end
	  st_st0: begin
		if(ptext[0] == 1  && ptext[1] == 0  && ptext[5] == 0 )
 		  NextState <= st_st0_n;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[5] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b0100000;
	  end
	  st_st0_n: begin
		if(ptext[0] == 1  && ptext[1] == 0  && ptext[5] == 0 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[5] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b0000010;
	  end
	  st_st8: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_st9;
		else if(ptext[0] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b0000000;
	  end
	  st_st9: begin
		if(ptext[0] == 1  && ptext[1] == 0  && ptext[5] == 0 )
 		  NextState <= st_st9_n;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[5] == 1 )
 		  NextState <= st_st3;
		else if(ptext[0] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b0000000;
	  end
	  st_st9_n: begin
		if(ptext[0] == 1  && ptext[1] == 0  && ptext[5] == 0 )
 		  NextState <= st_st9;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[5] == 1 )
 		  NextState <= st_st3;
		else if(ptext[0] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b00000x0;
	  end
	  st_st3: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_st2;
		else if(ptext[0] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b00000x0;
	  end
	  st_st2: begin
		if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_st2_n;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 0  && ptext[4] == 1 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 0  && ptext[4] == 0 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st3;
		else if(ptext[0] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b00000x0;
	  end
	  st_st2_n: begin
		if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 0  && ptext[4] == 1 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[3] == 0  && ptext[4] == 0 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st3;
		else if(ptext[0] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b000xx00;
	  end
	  st_st4: begin
		if(ptext[0] == 0  && ptext[5] == 0 )
 		  NextState <= st_st4_n;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[5] == 0 )
 		  NextState <= st_st4_n;
		else if(ptext[0] == 0  && ptext[5] == 1 )
 		  NextState <= st_st11;
		else if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		rtext <= 'b000xx00;
	  end
	  st_st4_n: begin
		if(ptext[0] == 0  && ptext[5] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[5] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 0  && ptext[5] == 1 )
 		  NextState <= st_st11;
		else if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[5] == 1 )
 		  NextState <= st_st5;
		rtext <= 'b00001x0;
	  end
	  st_st5: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_st5_n;
		else if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_st10;
		else if(ptext[0] == 0 )
 		  NextState <= st_st4;
		rtext <= 'b00001x0;
	  end
	  st_st5_n: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_st10;
		else if(ptext[0] == 0 )
 		  NextState <= st_st4;
		rtext <= 'b000xx10;
	  end
	  st_st13: begin
		if(ptext[0] == 0 )
 		  NextState <= st_st4;
		rtext <= 'b000xx10;
	  end
	  st_st14: begin
		if(ptext[0] == 0 )
 		  NextState <= st_st4;
		rtext <= 'b000xx10;
	  end
	  st_st15: begin
		if(ptext[0] == 0 )
 		  NextState <= st_st4;
		rtext <= 'b000xx10;
	  end
      endcase // case ( State )
   end // always @ (State or ptext)   
endmodule // fsm
