module fsm_rd_086 (RST, CLK, ptext, rtext);
//user interface
	input RST, CLK;
	input [1:0] ptext;
	output[2:0] rtext;
	reg [2:0] rtext;
//STATE ASSIGNMENTS
	`include "fsm_rd_086_stassign.v";
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
		if(1)
 		  NextState <= st2;
		rtext <= 'b000;
	  end
	  st2: begin
		if($ptext[0] == 1 )
 		  NextState <= st3;
		else if($ptext[0] == 0 )
 		  NextState <= st2;
		rtext <= 'b001;
	  end
	  st3: begin
		if(1)
 		  NextState <= st4;
		rtext <= 'b010;
	  end
	  st4: begin
		if($ptext[1] == 0 )
 		  NextState <= st3;
		else if($ptext[1] == 1 )
 		  NextState <= st5;
		rtext <= 'b100;
	  end
	  st5: begin
		if($ptext[0] == 1 )
 		  NextState <= st1;
		else if($ptext[0] == 0 )
 		  NextState <= st5;
		rtext <= 'b100;
	  end
      endcase // case ( State )
   end // always @ (State or ptext)   
endmodule // fsm
