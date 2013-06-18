module dk512_s (RST, CLK, ptext, rtext);
//user interface
	input RST, CLK;
	input [0:0] ptext;
	output[2:0] rtext;
	reg [2:0] rtext;
//STATE ASSIGNMENTS
	`include "dk512_s_stassign.v";
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
	  st_state_1: begin
		if(ptext[0] == 0 )
 		  NextState <= st_state_8;
		rtext <= 'b000;
	  end
	  st_state_2: begin
		if(ptext[0] == 0 )
 		  NextState <= st_state_4;
		rtext <= 'b000;
	  end
	  st_state_3: begin
		if(ptext[0] == 0 )
 		  NextState <= st_state_5;
		rtext <= 'b000;
	  end
	  st_state_4: begin
		if(ptext[0] == 0 )
 		  NextState <= st_state_8;
		rtext <= 'b000;
	  end
	  st_state_5: begin
		if(ptext[0] == 0 )
 		  NextState <= st_state_8;
		rtext <= 'b000;
	  end
	  st_state_6: begin
		if(ptext[0] == 0 )
 		  NextState <= st_state_13;
		rtext <= 'b000;
	  end
	  st_state_7: begin
		if(ptext[0] == 0 )
 		  NextState <= st_state_4;
		rtext <= 'b001;
	  end
	  st_state_8: begin
		if(ptext[0] == 0 )
 		  NextState <= st_state_1;
		rtext <= 'b000;
	  end
	  st_state_9: begin
		if(ptext[0] == 0 )
 		  NextState <= st_state_4;
		rtext <= 'b010;
	  end
	  st_state_10: begin
		if(ptext[0] == 0 )
 		  NextState <= st_state_1;
		rtext <= 'b010;
	  end
	  st_state_11: begin
		if(ptext[0] == 0 )
 		  NextState <= st_state_3;
		rtext <= 'b100;
	  end
	  st_state_12: begin
		if(ptext[0] == 0 )
 		  NextState <= st_state_4;
		rtext <= 'b100;
	  end
	  st_state_13: begin
		if(ptext[0] == 0 )
 		  NextState <= st_state_5;
		rtext <= 'b100;
	  end
	  st_state_14: begin
		if(ptext[0] == 0 )
 		  NextState <= st_state_3;
		rtext <= 'b000;
	  end
	  st_state_15: begin
		if(ptext[0] == 0 )
 		  NextState <= st_state_4;
		rtext <= 'b000;
	  end
	  st_state_1: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state_9;
		rtext <= 'b000;
	  end
	  st_state_2: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state_3;
		rtext <= 'b000;
	  end
	  st_state_3: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state_6;
		rtext <= 'b000;
	  end
	  st_state_4: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state_11;
		rtext <= 'b000;
	  end
	  st_state_5: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state_12;
		rtext <= 'b000;
	  end
	  st_state_6: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state_14;
		rtext <= 'b000;
	  end
	  st_state_7: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state_15;
		rtext <= 'b001;
	  end
	  st_state_8: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state_2;
		rtext <= 'b001;
	  end
	  st_state_9: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state_3;
		rtext <= 'b010;
	  end
	  st_state_10: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state_2;
		rtext <= 'b010;
	  end
	  st_state_11: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state_4;
		rtext <= 'b001;
	  end
	  st_state_12: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state_3;
		rtext <= 'b100;
	  end
	  st_state_13: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state_6;
		rtext <= 'b100;
	  end
	  st_state_14: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state_7;
		rtext <= 'b000;
	  end
	  st_state_15: begin
		if(ptext[0] == 1 )
 		  NextState <= st_state_6;
		rtext <= 'b000;
	  end
      endcase // case ( State )
   end // always @ (State or ptext)   
endmodule // fsm
