module bbara (RST, CLK, ptext, rtext);
//user interface
	input RST, CLK;
	input [3:0] ptext;
	output[1:0] rtext;
	reg [1:0] rtext;
//STATE ASSIGNMENTS
	`include "bbara_stassign.v";
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
		if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_st0;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st0;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_st0;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st0;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st1;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b00;
	  end
	  st_st1: begin
		if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_st1;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st1;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_st1;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st0;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b00;
	  end
	  st_st2: begin
		if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_st2;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st2;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_st2;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st1;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st3;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b10;
	  end
	  st_st3: begin
		if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_st3;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st3;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_st3;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st7;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st3;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b00;
	  end
	  st_st4: begin
		if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_st4;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st4;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st0;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st1;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st5;
		rtext <= 'b00;
	  end
	  st_st5: begin
		if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_st5;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st5;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st4;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st1;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st6;
		rtext <= 'b01;
	  end
	  st_st6: begin
		if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_st6;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st6;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_st6;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st7;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st1;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st6;
		rtext <= 'b00;
	  end
	  st_st7: begin
		if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_st7;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st7;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_st7;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st8;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st1;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b00;
	  end
	  st_st8: begin
		if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_st8;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st8;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st9;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st1;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b00;
	  end
	  st_st9: begin
		if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_st9;
		else if(ptext[2] == 1  && ptext[3] == 0 )
 		  NextState <= st_st9;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_st9;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st0;
		else if(ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st1;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st4;
		rtext <= 'b00;
	  end
      endcase // case ( State )
   end // always @ (State or ptext)   
endmodule // fsm
