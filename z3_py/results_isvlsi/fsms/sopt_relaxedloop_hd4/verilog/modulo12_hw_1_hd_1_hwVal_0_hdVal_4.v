module modulo12 (RST, CLK, ptext, rtext);
//user interface
	input RST, CLK;
	input [0:0] ptext;
	output[0:0] rtext;
	reg [0:0] rtext;
//STATE ASSIGNMENTS
	`include "modulo12_stassign.v";
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
		if(ptext[0] == 0 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1 )
 		  NextState <= st_st1;
		rtext <= 'b0;
	  end
	  st_st1: begin
		if(ptext[0] == 0 )
 		  NextState <= st_st1;
		else if(ptext[0] == 1 )
 		  NextState <= st_st2;
		rtext <= 'b0;
	  end
	  st_st2: begin
		if(ptext[0] == 0 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1 )
 		  NextState <= st_st3;
		rtext <= 'b0;
	  end
	  st_st3: begin
		if(ptext[0] == 0 )
 		  NextState <= st_st3;
		else if(ptext[0] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b0;
	  end
	  st_st4: begin
		if(ptext[0] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1 )
 		  NextState <= st_st5;
		rtext <= 'b0;
	  end
	  st_st5: begin
		if(ptext[0] == 0 )
 		  NextState <= st_st5;
		else if(ptext[0] == 1 )
 		  NextState <= st_st6;
		rtext <= 'b0;
	  end
	  st_st6: begin
		if(ptext[0] == 0 )
 		  NextState <= st_st6;
		else if(ptext[0] == 1 )
 		  NextState <= st_st7;
		rtext <= 'b0;
	  end
	  st_st7: begin
		if(ptext[0] == 0 )
 		  NextState <= st_st7;
		else if(ptext[0] == 1 )
 		  NextState <= st_st8;
		rtext <= 'b0;
	  end
	  st_st8: begin
		if(ptext[0] == 0 )
 		  NextState <= st_st8;
		else if(ptext[0] == 1 )
 		  NextState <= st_st9;
		rtext <= 'b0;
	  end
	  st_st9: begin
		if(ptext[0] == 0 )
 		  NextState <= st_st9;
		else if(ptext[0] == 1 )
 		  NextState <= st_st10;
		rtext <= 'b0;
	  end
	  st_st10: begin
		if(ptext[0] == 0 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1 )
 		  NextState <= st_st11;
		rtext <= 'b0;
	  end
	  st_st11: begin
		if(ptext[0] == 0 )
 		  NextState <= st_st11;
		else if(ptext[0] == 1 )
 		  NextState <= st_st0;
		rtext <= 'b0;
	  end
      endcase // case ( State )
   end // always @ (State or ptext)   
endmodule // fsm
