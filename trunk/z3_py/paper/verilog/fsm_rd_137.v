module fsm_rd_137 (RST, CLK, ptext, rtext);
//user interface
	input RST, CLK;
	input [1:0] ptext;
	output[7:0] rtext;
	reg [7:0] rtext;
//STATE ASSIGNMENTS
	`include "fsm_rd_137_stassign.v";
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
		if($ptext[0] == 1  && $ptext[1] == 1 )
 		  NextState <= st2;
		else if($ptext[0] == 0  && $ptext[1] == 0 )
 		  NextState <= st1;
		else if($ptext[0] == 0  && $ptext[1] == 1 )
 		  NextState <= st2;
		else if($ptext[0] == 1  && $ptext[1] == 0 )
 		  NextState <= st3;
		rtext <= 'b00111000;
	  end
	  st2: begin
		if($ptext[0] == 0  && $ptext[1] == 0 )
 		  NextState <= st1;
		else if($ptext[0] == 1  && $ptext[1] == 0 )
 		  NextState <= st1;
		else if($ptext[0] == 0  && $ptext[1] == 1 )
 		  NextState <= st2;
		else if($ptext[0] == 1  && $ptext[1] == 1 )
 		  NextState <= st4;
		rtext <= 'b01100100;
	  end
	  st3: begin
		if($ptext[0] == 1  && $ptext[1] == 1 )
 		  NextState <= st1;
		else if($ptext[0] == 1  && $ptext[1] == 0 )
 		  NextState <= st3;
		else if($ptext[0] == 0  && $ptext[1] == 0 )
 		  NextState <= st4;
		else if($ptext[0] == 0  && $ptext[1] == 1 )
 		  NextState <= st3;
		rtext <= 'b11100100;
	  end
	  st4: begin
		if($ptext[1] == 0 )
 		  NextState <= st3;
		else if($ptext[1] == 1 )
 		  NextState <= st2;
		rtext <= 'b10011000;
	  end
      endcase // case ( State )
   end // always @ (State or ptext)   
endmodule // fsm
