module dk16 (RST, CLK, ptext, rtext);
//user interface
	input RST, CLK;
	input [1:0] ptext;
	output[2:0] rtext;
	reg [2:0] rtext;
//STATE ASSIGNMENTS
	`include "dk16_stassign.v";
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
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_3;
		rtext <= 'b001;
	  end
	  st_state_2: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_1;
		rtext <= 'b001;
	  end
	  st_state_3: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_4;
		rtext <= 'b010;
	  end
	  st_state_4: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_4;
		rtext <= 'b010;
	  end
	  st_state_5: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_1;
		rtext <= 'b010;
	  end
	  st_state_6: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_3;
		rtext <= 'b010;
	  end
	  st_state_7: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_9;
		rtext <= 'b010;
	  end
	  st_state_8: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_15;
		rtext <= 'b000;
	  end
	  st_state_9: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_1;
		rtext <= 'b000;
	  end
	  st_state_10: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_14;
		rtext <= 'b000;
	  end
	  st_state_11: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_3;
		rtext <= 'b000;
	  end
	  st_state_12: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_20;
		rtext <= 'b101;
	  end
	  st_state_13: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_3;
		rtext <= 'b101;
	  end
	  st_state_14: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_1;
		rtext <= 'b101;
	  end
	  st_state_15: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_4;
		rtext <= 'b000;
	  end
	  st_state_16: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_20;
		rtext <= 'b010;
	  end
	  st_state_17: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_15;
		rtext <= 'b100;
	  end
	  st_state_18: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_4;
		rtext <= 'b100;
	  end
	  st_state_19: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_18;
		rtext <= 'b100;
	  end
	  st_state_20: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_19;
		rtext <= 'b100;
	  end
	  st_state_21: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_2;
		rtext <= 'b000;
	  end
	  st_state_22: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_3;
		rtext <= 'b100;
	  end
	  st_state_23: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_2;
		rtext <= 'b000;
	  end
	  st_state_24: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_14;
		rtext <= 'b010;
	  end
	  st_state_25: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_15;
		rtext <= 'b000;
	  end
	  st_state_26: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_20;
		rtext <= 'b010;
	  end
	  st_state_27: begin
		if(ptext[0] == 0  && ptext[1] == 0 )
 		  NextState <= st_state_15;
		rtext <= 'b001;
	  end
	  st_state_1: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_10;
		rtext <= 'b001;
	  end
	  st_state_2: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_2;
		rtext <= 'b001;
	  end
	  st_state_3: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_5;
		rtext <= 'b010;
	  end
	  st_state_4: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_5;
		rtext <= 'b010;
	  end
	  st_state_5: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_2;
		rtext <= 'b010;
	  end
	  st_state_6: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_21;
		rtext <= 'b010;
	  end
	  st_state_7: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_18;
		rtext <= 'b000;
	  end
	  st_state_8: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_26;
		rtext <= 'b000;
	  end
	  st_state_9: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_5;
		rtext <= 'b000;
	  end
	  st_state_10: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_13;
		rtext <= 'b000;
	  end
	  st_state_11: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_23;
		rtext <= 'b000;
	  end
	  st_state_12: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_19;
		rtext <= 'b101;
	  end
	  st_state_13: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_10;
		rtext <= 'b101;
	  end
	  st_state_14: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_2;
		rtext <= 'b101;
	  end
	  st_state_15: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_5;
		rtext <= 'b000;
	  end
	  st_state_16: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_19;
		rtext <= 'b000;
	  end
	  st_state_17: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_23;
		rtext <= 'b010;
	  end
	  st_state_18: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_5;
		rtext <= 'b010;
	  end
	  st_state_19: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_23;
		rtext <= 'b010;
	  end
	  st_state_20: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_20;
		rtext <= 'b010;
	  end
	  st_state_21: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_1;
		rtext <= 'b010;
	  end
	  st_state_22: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_3;
		rtext <= 'b010;
	  end
	  st_state_23: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_1;
		rtext <= 'b000;
	  end
	  st_state_24: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_13;
		rtext <= 'b010;
	  end
	  st_state_25: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_3;
		rtext <= 'b000;
	  end
	  st_state_26: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_19;
		rtext <= 'b010;
	  end
	  st_state_27: begin
		if(ptext[0] == 0  && ptext[1] == 1 )
 		  NextState <= st_state_3;
		rtext <= 'b001;
	  end
	  st_state_1: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_11;
		rtext <= 'b001;
	  end
	  st_state_2: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_8;
		rtext <= 'b001;
	  end
	  st_state_3: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_6;
		rtext <= 'b010;
	  end
	  st_state_4: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_6;
		rtext <= 'b010;
	  end
	  st_state_5: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_16;
		rtext <= 'b010;
	  end
	  st_state_6: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_10;
		rtext <= 'b010;
	  end
	  st_state_7: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_19;
		rtext <= 'b010;
	  end
	  st_state_8: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_13;
		rtext <= 'b000;
	  end
	  st_state_9: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_6;
		rtext <= 'b000;
	  end
	  st_state_10: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_1;
		rtext <= 'b000;
	  end
	  st_state_11: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_24;
		rtext <= 'b000;
	  end
	  st_state_12: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_18;
		rtext <= 'b101;
	  end
	  st_state_13: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_11;
		rtext <= 'b101;
	  end
	  st_state_14: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_8;
		rtext <= 'b101;
	  end
	  st_state_15: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_6;
		rtext <= 'b010;
	  end
	  st_state_16: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_13;
		rtext <= 'b000;
	  end
	  st_state_17: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_18;
		rtext <= 'b100;
	  end
	  st_state_18: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_6;
		rtext <= 'b100;
	  end
	  st_state_19: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_24;
		rtext <= 'b100;
	  end
	  st_state_20: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_9;
		rtext <= 'b100;
	  end
	  st_state_21: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_13;
		rtext <= 'b100;
	  end
	  st_state_22: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_15;
		rtext <= 'b010;
	  end
	  st_state_23: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_13;
		rtext <= 'b100;
	  end
	  st_state_24: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_13;
		rtext <= 'b000;
	  end
	  st_state_25: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_15;
		rtext <= 'b000;
	  end
	  st_state_26: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_18;
		rtext <= 'b100;
	  end
	  st_state_27: begin
		if(ptext[0] == 1  && ptext[1] == 0 )
 		  NextState <= st_state_13;
		rtext <= 'b001;
	  end
	  st_state_1: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_12;
		rtext <= 'b001;
	  end
	  st_state_2: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_9;
		rtext <= 'b001;
	  end
	  st_state_3: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_7;
		rtext <= 'b010;
	  end
	  st_state_4: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_7;
		rtext <= 'b010;
	  end
	  st_state_5: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_17;
		rtext <= 'b010;
	  end
	  st_state_6: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_22;
		rtext <= 'b010;
	  end
	  st_state_7: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_20;
		rtext <= 'b010;
	  end
	  st_state_8: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_14;
		rtext <= 'b000;
	  end
	  st_state_9: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_7;
		rtext <= 'b000;
	  end
	  st_state_10: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_2;
		rtext <= 'b000;
	  end
	  st_state_11: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_25;
		rtext <= 'b000;
	  end
	  st_state_12: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_15;
		rtext <= 'b101;
	  end
	  st_state_13: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_12;
		rtext <= 'b101;
	  end
	  st_state_14: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_9;
		rtext <= 'b101;
	  end
	  st_state_15: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_7;
		rtext <= 'b010;
	  end
	  st_state_16: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_14;
		rtext <= 'b000;
	  end
	  st_state_17: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_27;
		rtext <= 'b100;
	  end
	  st_state_18: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_7;
		rtext <= 'b100;
	  end
	  st_state_19: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_25;
		rtext <= 'b100;
	  end
	  st_state_20: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_26;
		rtext <= 'b100;
	  end
	  st_state_21: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_14;
		rtext <= 'b000;
	  end
	  st_state_22: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_15;
		rtext <= 'b010;
	  end
	  st_state_23: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_14;
		rtext <= 'b100;
	  end
	  st_state_24: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_14;
		rtext <= 'b000;
	  end
	  st_state_25: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_15;
		rtext <= 'b000;
	  end
	  st_state_26: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_21;
		rtext <= 'b100;
	  end
	  st_state_27: begin
		if(ptext[0] == 1  && ptext[1] == 1 )
 		  NextState <= st_state_14;
		rtext <= 'b100;
	  end
      endcase // case ( State )
   end // always @ (State or ptext)   
endmodule // fsm
