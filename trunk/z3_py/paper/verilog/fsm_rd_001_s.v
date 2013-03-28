module fsm_rd_001_s (RST, CLK, ptext, rtext);
//user interface
	input RST, CLK;
	input [1:0] ptext;
	output[7:0] rtext;
	reg [7:0] rtext;
//STATE ASSIGNMENTS
	`include "fsm_rd_001_s_stassign.v";
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
		if($ptext[0] == 1 )
 		  NextState <= st2;
		else if($ptext[0] == 0 )
 		  NextState <= st20;
		rtext <= 'b00111011;
	  end
	  st10: begin
		if(1)
 		  NextState <= st11;
		rtext <= 'b01001011;
	  end
	  st11: begin
		if($ptext[0] == 1 )
 		  NextState <= st10;
		else if($ptext[0] == 0 )
 		  NextState <= st12;
		rtext <= 'b11110011;
	  end
	  st12: begin
		if(1)
 		  NextState <= st13;
		rtext <= 'b00101000;
	  end
	  st13: begin
		if(1)
 		  NextState <= st14;
		rtext <= 'b11011111;
	  end
	  st14: begin
		if($ptext[1] == 1 )
 		  NextState <= st13;
		else if($ptext[1] == 0 )
 		  NextState <= st15;
		rtext <= 'b11100011;
	  end
	  st15: begin
		if($ptext[0] == 0 )
 		  NextState <= st15_n;
		else if($ptext[0] == 1 )
 		  NextState <= st16;
		rtext <= 'b11100011;
	  end
	  st15_n: begin
		if($ptext[0] == 0 )
 		  NextState <= st15;
		else if($ptext[0] == 1 )
 		  NextState <= st16;
		rtext <= 'b11000011;
	  end
	  st16: begin
		if($ptext[1] == 1 )
 		  NextState <= st16_n;
		else if($ptext[1] == 0 )
 		  NextState <= st17;
		rtext <= 'b11000011;
	  end
	  st16_n: begin
		if($ptext[1] == 1 )
 		  NextState <= st16;
		else if($ptext[1] == 0 )
 		  NextState <= st17;
		rtext <= 'b11010011;
	  end
	  st17: begin
		if($ptext[1] == 1 )
 		  NextState <= st17_n;
		else if($ptext[1] == 0 )
 		  NextState <= st18;
		rtext <= 'b11010011;
	  end
	  st17_n: begin
		if($ptext[1] == 1 )
 		  NextState <= st17;
		else if($ptext[1] == 0 )
 		  NextState <= st18;
		rtext <= 'b01000011;
	  end
	  st18: begin
		if($ptext[0] == 1 )
 		  NextState <= st17;
		else if($ptext[0] == 0 )
 		  NextState <= st19;
		rtext <= 'b00110011;
	  end
	  st19: begin
		if($ptext[1] == 0 )
 		  NextState <= st19_n;
		else if($ptext[1] == 1 )
 		  NextState <= st20;
		rtext <= 'b00110011;
	  end
	  st19_n: begin
		if($ptext[1] == 0 )
 		  NextState <= st19;
		else if($ptext[1] == 1 )
 		  NextState <= st20;
		rtext <= 'b11111111;
	  end
	  st2: begin
		if($ptext[0] == 0  && $ptext[1] == 0 )
 		  NextState <= st1;
		else if($ptext[0] == 1  && $ptext[1] == 0 )
 		  NextState <= st2_n;
		else if($ptext[1] == 1 )
 		  NextState <= st3;
		rtext <= 'b10110011;
	  end
	  st20: begin
		if(1)
 		  NextState <= st1;
		rtext <= 'b11111111;
	  end
	  st2_n: begin
		if($ptext[0] == 0  && $ptext[1] == 0 )
 		  NextState <= st1;
		else if($ptext[0] == 1  && $ptext[1] == 0 )
 		  NextState <= st2;
		else if($ptext[1] == 1 )
 		  NextState <= st3;
		rtext <= 'b00010011;
	  end
	  st3: begin
		if($ptext[0] == 0 )
 		  NextState <= st2;
		else if($ptext[0] == 1 )
 		  NextState <= st4;
		rtext <= 'b11101111;
	  end
	  st4: begin
		if($ptext[0] == 0  && $ptext[1] == 0 )
 		  NextState <= st3;
		else if($ptext[0] == 1  && $ptext[1] == 1 )
 		  NextState <= st4_n;
		else if($ptext[0] == 1  && $ptext[1] == 0 )
 		  NextState <= st5;
		rtext <= 'b11101111;
	  end
	  st4_n: begin
		if($ptext[0] == 0  && $ptext[1] == 0 )
 		  NextState <= st3;
		else if($ptext[0] == 1  && $ptext[1] == 1 )
 		  NextState <= st4;
		else if($ptext[0] == 1  && $ptext[1] == 0 )
 		  NextState <= st5;
		rtext <= 'b00001000;
	  end
	  st5: begin
		if($ptext[1] == 1 )
 		  NextState <= st4;
		else if($ptext[1] == 0 )
 		  NextState <= st6;
		rtext <= 'b00011011;
	  end
	  st6: begin
		if($ptext[1] == 1 )
 		  NextState <= st6_n;
		else if($ptext[1] == 0 )
 		  NextState <= st7;
		rtext <= 'b00011011;
	  end
	  st6_n: begin
		if($ptext[1] == 1 )
 		  NextState <= st6;
		else if($ptext[1] == 0 )
 		  NextState <= st7;
		rtext <= 'b10111111;
	  end
	  st7: begin
		if(1)
 		  NextState <= st8;
		rtext <= 'b00100000;
	  end
	  st8: begin
		if($ptext[1] == 1 )
 		  NextState <= st7;
		else if($ptext[1] == 0 )
 		  NextState <= st9;
		rtext <= 'b11001111;
	  end
	  st9: begin
		if($ptext[0] == 1 )
 		  NextState <= st10;
		else if($ptext[0] == 0 )
 		  NextState <= st9_n;
		rtext <= 'b11001111;
	  end
	  st9_n: begin
		if($ptext[0] == 1 )
 		  NextState <= st10;
		else if($ptext[0] == 0 )
 		  NextState <= st9;
		rtext <= 'b11001111;
	  end
      endcase // case ( State )
   end // always @ (State or ptext)   
endmodule // fsm
