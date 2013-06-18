module opus_s (RST, CLK, ptext, rtext);
//user interface
	input RST, CLK;
	input [4:0] ptext;
	output[5:0] rtext;
	reg [5:0] rtext;
//STATE ASSIGNMENTS
	`include "opus_s_stassign.v";
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
	  st_START: begin
		if(ptext[2] == 1 )
 		  NextState <= st_init0;
		rtext <= 'b110000;
	  end
	  st_init0: begin
		if(ptext[2] == 1 )
 		  NextState <= st_init0_n;
		else if(ptext[2] == 0 )
 		  NextState <= st_init1;
		rtext <= 'b110000;
	  end
	  st_init0_n: begin
		if(ptext[2] == 1 )
 		  NextState <= st_init0;
		else if(ptext[2] == 0 )
 		  NextState <= st_init1;
		rtext <= 'b110000;
	  end
	  st_init1: begin
		if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_init1_n;
		else if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_init2;
		rtext <= 'b110000;
	  end
	  st_init1_n: begin
		if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_init1;
		else if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_init2;
		rtext <= 'b110100;
	  end
	  st_init2: begin
		if(ptext[2] == 0 )
 		  NextState <= st_init4;
		rtext <= 'b110100;
	  end
	  st_init4: begin
		if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_init4_n;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_IOwait;
		rtext <= 'b110100;
	  end
	  st_init4_n: begin
		if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_init4;
		else if(ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_IOwait;
		rtext <= 'b000000;
	  end
	  st_IOwait: begin
		if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_IOwait_n;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_init1;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0 )
 		  NextState <= st_read0;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0 )
 		  NextState <= st_write0;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1 )
 		  NextState <= st_RMACK;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1 )
 		  NextState <= st_WMACK;
		else if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_init2;
		rtext <= 'b000000;
	  end
	  st_IOwait_n: begin
		if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_IOwait;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_init1;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0 )
 		  NextState <= st_read0;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0 )
 		  NextState <= st_write0;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1 )
 		  NextState <= st_RMACK;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1 )
 		  NextState <= st_WMACK;
		else if(ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_init2;
		rtext <= 'b100000;
	  end
	  st_RMACK: begin
		if(ptext[2] == 0  && ptext[4] == 0 )
 		  NextState <= st_RMACK_n;
		else if(ptext[2] == 0  && ptext[4] == 1 )
 		  NextState <= st_read0;
		rtext <= 'b100000;
	  end
	  st_RMACK_n: begin
		if(ptext[2] == 0  && ptext[4] == 0 )
 		  NextState <= st_RMACK;
		else if(ptext[2] == 0  && ptext[4] == 1 )
 		  NextState <= st_read0;
		rtext <= 'b100000;
	  end
	  st_WMACK: begin
		if(ptext[2] == 0  && ptext[4] == 0 )
 		  NextState <= st_WMACK_n;
		else if(ptext[2] == 0  && ptext[4] == 1 )
 		  NextState <= st_write0;
		rtext <= 'b100000;
	  end
	  st_WMACK_n: begin
		if(ptext[2] == 0  && ptext[4] == 0 )
 		  NextState <= st_WMACK;
		else if(ptext[2] == 0  && ptext[4] == 1 )
 		  NextState <= st_write0;
		rtext <= 'b101001;
	  end
	  st_read0: begin
		if(ptext[2] == 0 )
 		  NextState <= st_read1;
		rtext <= 'b000000;
	  end
	  st_read1: begin
		if(ptext[2] == 0 )
 		  NextState <= st_IOwait;
		rtext <= 'b000000;
	  end
	  st_write0: begin
		if(ptext[2] == 0 )
 		  NextState <= st_IOwait;
		rtext <= 'b000000;
	  end
      endcase // case ( State )
   end // always @ (State or ptext)   
endmodule // fsm
