module sand_s (RST, CLK, ptext, rtext);
//user interface
	input RST, CLK;
	input [10:0] ptext;
	output[8:0] rtext;
	reg [8:0] rtext;
//STATE ASSIGNMENTS
	`include "sand_s_stassign.v";
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
		if(ptext[9] == 0 )
 		  NextState <= st_st0_n;
		else if(ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st0_n;
		else if(ptext[4] == 1  && ptext[8] == 1  && ptext[9] == 1 )
 		  NextState <= st_st5;
		else if(ptext[4] == 1  && ptext[8] == 0  && ptext[9] == 1 )
 		  NextState <= st_st1;
		rtext <= 'b000001xxx;
	  end
	  st_st0_n: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st0;
		else if(ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st0;
		else if(ptext[4] == 1  && ptext[8] == 1  && ptext[9] == 1 )
 		  NextState <= st_st5;
		else if(ptext[4] == 1  && ptext[8] == 0  && ptext[9] == 1 )
 		  NextState <= st_st1;
		rtext <= 'b0001x0000;
	  end
	  st_st1: begin
		if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1_n;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1_n;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1_n;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1_n;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1_n;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1_n;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1_n;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1_n;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1_n;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1_n;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1_n;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1_n;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[7] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[7] == 0 )
 		  NextState <= st_st3;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1  && ptext[6] == 1  && ptext[7] == 0 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1  && ptext[6] == 0  && ptext[7] == 0 )
 		  NextState <= st_st1_n;
		else if(ptext[7] == 1 )
 		  NextState <= st_st0;
		rtext <= 'b0001x0000;
	  end
	  st_st1_n: begin
		if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st1;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[7] == 0 )
 		  NextState <= st_st4;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[7] == 0 )
 		  NextState <= st_st3;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1  && ptext[6] == 1  && ptext[7] == 0 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1  && ptext[6] == 0  && ptext[7] == 0 )
 		  NextState <= st_st1;
		else if(ptext[7] == 1 )
 		  NextState <= st_st0;
		rtext <= 'b0000x0000;
	  end
	  st_st2: begin
		if(ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st2_n;
		else if(ptext[7] == 0  && ptext[9] == 1  && ptext[10] == 0 )
 		  NextState <= st_st1;
		else if(ptext[4] == 0  && ptext[6] == 0  && ptext[7] == 0  && ptext[9] == 1  && ptext[10] == 1 )
 		  NextState <= st_st1;
		else if(ptext[4] == 1  && ptext[6] == 0  && ptext[7] == 0  && ptext[9] == 1  && ptext[10] == 1 )
 		  NextState <= st_st2_n;
		else if(ptext[6] == 1  && ptext[7] == 0  && ptext[9] == 1  && ptext[10] == 1 )
 		  NextState <= st_st0;
		else if(ptext[7] == 1 )
 		  NextState <= st_st0;
		rtext <= 'b0000x0000;
	  end
	  st_st2_n: begin
		if(ptext[7] == 0  && ptext[9] == 0 )
 		  NextState <= st_st2;
		else if(ptext[7] == 0  && ptext[9] == 1  && ptext[10] == 0 )
 		  NextState <= st_st1;
		else if(ptext[4] == 0  && ptext[6] == 0  && ptext[7] == 0  && ptext[9] == 1  && ptext[10] == 1 )
 		  NextState <= st_st1;
		else if(ptext[4] == 1  && ptext[6] == 0  && ptext[7] == 0  && ptext[9] == 1  && ptext[10] == 1 )
 		  NextState <= st_st2;
		else if(ptext[6] == 1  && ptext[7] == 0  && ptext[9] == 1  && ptext[10] == 1 )
 		  NextState <= st_st0;
		else if(ptext[7] == 1 )
 		  NextState <= st_st0;
		rtext <= 'b11x0xxx01;
	  end
	  st_st3: begin
		if(ptext[6] == 1  && ptext[7] == 0  && ptext[10] == 1 )
 		  NextState <= st_st0;
		else if(ptext[5] == 0  && ptext[6] == 1  && ptext[7] == 0  && ptext[10] == 0 )
 		  NextState <= st_st3_n;
		else if(ptext[5] == 1  && ptext[6] == 1  && ptext[7] == 0  && ptext[10] == 0 )
 		  NextState <= st_st1;
		else if(ptext[4] == 1  && ptext[6] == 0  && ptext[7] == 0  && ptext[10] == 1 )
 		  NextState <= st_st3_n;
		else if(ptext[4] == 0  && ptext[6] == 0  && ptext[7] == 0  && ptext[10] == 1 )
 		  NextState <= st_st1;
		else if(ptext[6] == 0  && ptext[7] == 0  && ptext[10] == 0 )
 		  NextState <= st_st1;
		else if(ptext[7] == 1 )
 		  NextState <= st_st0;
		rtext <= 'b11x0xxx01;
	  end
	  st_st3_n: begin
		if(ptext[6] == 1  && ptext[7] == 0  && ptext[10] == 1 )
 		  NextState <= st_st0;
		else if(ptext[5] == 0  && ptext[6] == 1  && ptext[7] == 0  && ptext[10] == 0 )
 		  NextState <= st_st3;
		else if(ptext[5] == 1  && ptext[6] == 1  && ptext[7] == 0  && ptext[10] == 0 )
 		  NextState <= st_st1;
		else if(ptext[4] == 1  && ptext[6] == 0  && ptext[7] == 0  && ptext[10] == 1 )
 		  NextState <= st_st3;
		else if(ptext[4] == 0  && ptext[6] == 0  && ptext[7] == 0  && ptext[10] == 1 )
 		  NextState <= st_st1;
		else if(ptext[6] == 0  && ptext[7] == 0  && ptext[10] == 0 )
 		  NextState <= st_st1;
		else if(ptext[7] == 1 )
 		  NextState <= st_st0;
		rtext <= 'b0000x0000;
	  end
	  st_st4: begin
		if(ptext[6] == 1  && ptext[7] == 0  && ptext[9] == 0  && ptext[10] == 0 )
 		  NextState <= st_st4_n;
		else if(ptext[6] == 1  && ptext[7] == 0  && ptext[9] == 0  && ptext[10] == 1 )
 		  NextState <= st_st0;
		else if(ptext[6] == 0  && ptext[7] == 0  && ptext[9] == 0  && ptext[10] == 0 )
 		  NextState <= st_st1;
		else if(ptext[4] == 1  && ptext[6] == 0  && ptext[7] == 0  && ptext[10] == 1 )
 		  NextState <= st_st4_n;
		else if(ptext[4] == 0  && ptext[6] == 0  && ptext[7] == 0  && ptext[10] == 1 )
 		  NextState <= st_st3;
		else if(ptext[6] == 1  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st1;
		else if(ptext[7] == 1 )
 		  NextState <= st_st0;
		rtext <= 'b0000x0000;
	  end
	  st_st4_n: begin
		if(ptext[6] == 1  && ptext[7] == 0  && ptext[9] == 0  && ptext[10] == 0 )
 		  NextState <= st_st4;
		else if(ptext[6] == 1  && ptext[7] == 0  && ptext[9] == 0  && ptext[10] == 1 )
 		  NextState <= st_st0;
		else if(ptext[6] == 0  && ptext[7] == 0  && ptext[9] == 0  && ptext[10] == 0 )
 		  NextState <= st_st1;
		else if(ptext[4] == 1  && ptext[6] == 0  && ptext[7] == 0  && ptext[10] == 1 )
 		  NextState <= st_st4;
		else if(ptext[4] == 0  && ptext[6] == 0  && ptext[7] == 0  && ptext[10] == 1 )
 		  NextState <= st_st3;
		else if(ptext[6] == 1  && ptext[7] == 0  && ptext[9] == 1 )
 		  NextState <= st_st1;
		else if(ptext[7] == 1 )
 		  NextState <= st_st0;
		rtext <= 'b000100000;
	  end
	  st_st5: begin
		if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st5_n;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[9] == 1 )
 		  NextState <= st_st31;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[9] == 0 )
 		  NextState <= st_st5_n;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[9] == 1 )
 		  NextState <= st_st25;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st5_n;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[9] == 1 )
 		  NextState <= st_st19;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st6;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st5_n;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[9] == 1 )
 		  NextState <= st_st29;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[9] == 0 )
 		  NextState <= st_st5_n;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[9] == 1 )
 		  NextState <= st_st23;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st5_n;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0  && ptext[9] == 1 )
 		  NextState <= st_st17;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1  && ptext[9] == 0 )
 		  NextState <= st_st5_n;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1  && ptext[9] == 1 )
 		  NextState <= st_st13;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st5_n;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[9] == 1 )
 		  NextState <= st_st27;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[9] == 0 )
 		  NextState <= st_st5_n;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[9] == 1 )
 		  NextState <= st_st21;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st5_n;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[9] == 1 )
 		  NextState <= st_st15;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st6;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_st12;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st7;
		rtext <= 'b000100000;
	  end
	  st_st5_n: begin
		if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[9] == 1 )
 		  NextState <= st_st31;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[9] == 0 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[9] == 1 )
 		  NextState <= st_st25;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[9] == 1 )
 		  NextState <= st_st19;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st6;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[9] == 1 )
 		  NextState <= st_st29;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[9] == 0 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[9] == 1 )
 		  NextState <= st_st23;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0  && ptext[9] == 1 )
 		  NextState <= st_st17;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1  && ptext[9] == 0 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1  && ptext[9] == 1 )
 		  NextState <= st_st13;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st5;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[9] == 1 )
 		  NextState <= st_st27;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[9] == 0 )
 		  NextState <= st_st5;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[9] == 1 )
 		  NextState <= st_st21;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st5;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[9] == 1 )
 		  NextState <= st_st15;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st6;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0 )
 		  NextState <= st_st12;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1 )
 		  NextState <= st_st10;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st7;
		rtext <= 'b000100000;
	  end
	  st_st6: begin
		if(ptext[10] == 0 )
 		  NextState <= st_st5;
		else if(ptext[4] == 0  && ptext[6] == 0  && ptext[10] == 1 )
 		  NextState <= st_st5;
		else if(ptext[4] == 1  && ptext[6] == 0  && ptext[10] == 1 )
 		  NextState <= st_st7;
		rtext <= 'b100000000;
	  end
	  st_st7: begin
		if(ptext[5] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8;
		else if(ptext[5] == 0  && ptext[9] == 1 )
 		  NextState <= st_st0;
		else if(ptext[9] == 0 )
 		  NextState <= st_st7_n;
		rtext <= 'b100000000;
	  end
	  st_st7_n: begin
		if(ptext[5] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8;
		else if(ptext[5] == 0  && ptext[9] == 1 )
 		  NextState <= st_st0;
		else if(ptext[9] == 0 )
 		  NextState <= st_st7;
		rtext <= 'b000000000;
	  end
	  st_st8: begin
		if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[9] == 0 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1  && ptext[9] == 0 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st9;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[9] == 0 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1  && ptext[9] == 0 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[9] == 0 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1  && ptext[9] == 0 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st9;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st9;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[9] == 0 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st9;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8_n;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st8_n;
		rtext <= 'b000000000;
	  end
	  st_st8_n: begin
		if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[9] == 0 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1  && ptext[9] == 0 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st9;
		else if(ptext[0] == 0  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[9] == 0 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1  && ptext[9] == 0 )
 		  NextState <= st_st8;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 0  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st8;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[9] == 0 )
 		  NextState <= st_st8;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st8;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st5;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 0  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1  && ptext[9] == 0 )
 		  NextState <= st_st8;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st9;
		else if(ptext[0] == 1  && ptext[1] == 0  && ptext[2] == 1  && ptext[3] == 1  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[9] == 0 )
 		  NextState <= st_st8;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st9;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 0  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[9] == 0 )
 		  NextState <= st_st8;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 0  && ptext[9] == 1 )
 		  NextState <= st_st9;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 0  && ptext[3] == 1  && ptext[4] == 1  && ptext[9] == 1 )
 		  NextState <= st_st8;
		else if(ptext[0] == 1  && ptext[1] == 1  && ptext[2] == 1  && ptext[3] == 1 )
 		  NextState <= st_st8;
		rtext <= 'b001001000;
	  end
	  st_st9: begin
		if(ptext[10] == 1 )
 		  NextState <= st_st8;
		else if(ptext[10] == 0 )
 		  NextState <= st_st8;
		rtext <= 'bxxx000010;
	  end
	  st_st10: begin
		if(ptext[6] == 1  && ptext[9] == 1  && ptext[10] == 0 )
 		  NextState <= st_st11;
		else if(ptext[6] == 1  && ptext[9] == 0  && ptext[10] == 0 )
 		  NextState <= st_st10_n;
		else if(ptext[6] == 1  && ptext[10] == 1 )
 		  NextState <= st_st0;
		else if(ptext[6] == 0  && ptext[10] == 0 )
 		  NextState <= st_st5;
		else if(ptext[4] == 0  && ptext[6] == 0  && ptext[10] == 1 )
 		  NextState <= st_st5;
		else if(ptext[4] == 1  && ptext[6] == 0  && ptext[10] == 1 )
 		  NextState <= st_st10_n;
		rtext <= 'bxxx000010;
	  end
	  st_st10_n: begin
		if(ptext[6] == 1  && ptext[9] == 1  && ptext[10] == 0 )
 		  NextState <= st_st11;
		else if(ptext[6] == 1  && ptext[9] == 0  && ptext[10] == 0 )
 		  NextState <= st_st10;
		else if(ptext[6] == 1  && ptext[10] == 1 )
 		  NextState <= st_st0;
		else if(ptext[6] == 0  && ptext[10] == 0 )
 		  NextState <= st_st5;
		else if(ptext[4] == 0  && ptext[6] == 0  && ptext[10] == 1 )
 		  NextState <= st_st5;
		else if(ptext[4] == 1  && ptext[6] == 0  && ptext[10] == 1 )
 		  NextState <= st_st10;
		rtext <= 'bxxx000000;
	  end
	  st_st11: begin
		if(ptext[5] == 0 )
 		  NextState <= st_st11_n;
		else if(ptext[5] == 1 )
 		  NextState <= st_st5;
		rtext <= 'bxxx000000;
	  end
	  st_st11_n: begin
		if(ptext[5] == 0 )
 		  NextState <= st_st11;
		else if(ptext[5] == 1 )
 		  NextState <= st_st5;
		rtext <= 'b001100000;
	  end
	  st_st12: begin
		if(ptext[6] == 1  && ptext[9] == 1  && ptext[10] == 0 )
 		  NextState <= st_st5;
		else if(ptext[6] == 1  && ptext[9] == 0  && ptext[10] == 0 )
 		  NextState <= st_st12_n;
		else if(ptext[6] == 1  && ptext[10] == 1 )
 		  NextState <= st_st7;
		else if(ptext[6] == 0  && ptext[10] == 0 )
 		  NextState <= st_st5;
		else if(ptext[4] == 0  && ptext[6] == 0  && ptext[10] == 1 )
 		  NextState <= st_st5;
		else if(ptext[4] == 1  && ptext[6] == 0  && ptext[10] == 1 )
 		  NextState <= st_st12_n;
		rtext <= 'b001100000;
	  end
	  st_st12_n: begin
		if(ptext[6] == 1  && ptext[9] == 1  && ptext[10] == 0 )
 		  NextState <= st_st5;
		else if(ptext[6] == 1  && ptext[9] == 0  && ptext[10] == 0 )
 		  NextState <= st_st12;
		else if(ptext[6] == 1  && ptext[10] == 1 )
 		  NextState <= st_st7;
		else if(ptext[6] == 0  && ptext[10] == 0 )
 		  NextState <= st_st5;
		else if(ptext[4] == 0  && ptext[6] == 0  && ptext[10] == 1 )
 		  NextState <= st_st5;
		else if(ptext[4] == 1  && ptext[6] == 0  && ptext[10] == 1 )
 		  NextState <= st_st12;
		rtext <= 'b000110000;
	  end
	  st_st13: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st13_n;
		else if(ptext[9] == 1 )
 		  NextState <= st_st14;
		rtext <= 'b000110000;
	  end
	  st_st13_n: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st13;
		else if(ptext[9] == 1 )
 		  NextState <= st_st14;
		rtext <= 'b000100000;
	  end
	  st_st14: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st14_n;
		else if(ptext[9] == 1 )
 		  NextState <= st_st15;
		rtext <= 'b000100000;
	  end
	  st_st14_n: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st14;
		else if(ptext[9] == 1 )
 		  NextState <= st_st15;
		rtext <= 'b000110000;
	  end
	  st_st15: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st15_n;
		else if(ptext[9] == 1 )
 		  NextState <= st_st16;
		rtext <= 'b000110000;
	  end
	  st_st15_n: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st15;
		else if(ptext[9] == 1 )
 		  NextState <= st_st16;
		rtext <= 'b000100000;
	  end
	  st_st16: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st16_n;
		else if(ptext[9] == 1 )
 		  NextState <= st_st17;
		rtext <= 'b000100000;
	  end
	  st_st16_n: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st16;
		else if(ptext[9] == 1 )
 		  NextState <= st_st17;
		rtext <= 'b000110000;
	  end
	  st_st17: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st17_n;
		else if(ptext[9] == 1 )
 		  NextState <= st_st18;
		rtext <= 'b000110000;
	  end
	  st_st17_n: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st17;
		else if(ptext[9] == 1 )
 		  NextState <= st_st18;
		rtext <= 'b000100000;
	  end
	  st_st18: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st18_n;
		else if(ptext[9] == 1 )
 		  NextState <= st_st19;
		rtext <= 'b000100000;
	  end
	  st_st18_n: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st18;
		else if(ptext[9] == 1 )
 		  NextState <= st_st19;
		rtext <= 'b000110000;
	  end
	  st_st19: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st19_n;
		else if(ptext[9] == 1 )
 		  NextState <= st_st20;
		rtext <= 'b000110000;
	  end
	  st_st19_n: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st19;
		else if(ptext[9] == 1 )
 		  NextState <= st_st20;
		rtext <= 'b000100000;
	  end
	  st_st20: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st20_n;
		else if(ptext[9] == 1 )
 		  NextState <= st_st21;
		rtext <= 'b000100000;
	  end
	  st_st20_n: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st20;
		else if(ptext[9] == 1 )
 		  NextState <= st_st21;
		rtext <= 'b000110000;
	  end
	  st_st21: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st21_n;
		else if(ptext[9] == 1 )
 		  NextState <= st_st22;
		rtext <= 'b000110000;
	  end
	  st_st21_n: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st21;
		else if(ptext[9] == 1 )
 		  NextState <= st_st22;
		rtext <= 'b000100000;
	  end
	  st_st22: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st22_n;
		else if(ptext[9] == 1 )
 		  NextState <= st_st23;
		rtext <= 'b000100000;
	  end
	  st_st22_n: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st22;
		else if(ptext[9] == 1 )
 		  NextState <= st_st23;
		rtext <= 'b000110000;
	  end
	  st_st23: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st23_n;
		else if(ptext[9] == 1 )
 		  NextState <= st_st24;
		rtext <= 'b000110000;
	  end
	  st_st23_n: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st23;
		else if(ptext[9] == 1 )
 		  NextState <= st_st24;
		rtext <= 'b000100000;
	  end
	  st_st24: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st24_n;
		else if(ptext[9] == 1 )
 		  NextState <= st_st25;
		rtext <= 'b000100000;
	  end
	  st_st24_n: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st24;
		else if(ptext[9] == 1 )
 		  NextState <= st_st25;
		rtext <= 'b000110000;
	  end
	  st_st25: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st25_n;
		else if(ptext[9] == 1 )
 		  NextState <= st_st26;
		rtext <= 'b000110000;
	  end
	  st_st25_n: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st25;
		else if(ptext[9] == 1 )
 		  NextState <= st_st26;
		rtext <= 'b000100000;
	  end
	  st_st26: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st26_n;
		else if(ptext[9] == 1 )
 		  NextState <= st_st27;
		rtext <= 'b000100000;
	  end
	  st_st26_n: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st26;
		else if(ptext[9] == 1 )
 		  NextState <= st_st27;
		rtext <= 'b000110000;
	  end
	  st_st27: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st27_n;
		else if(ptext[9] == 1 )
 		  NextState <= st_st28;
		rtext <= 'b000110000;
	  end
	  st_st27_n: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st27;
		else if(ptext[9] == 1 )
 		  NextState <= st_st28;
		rtext <= 'b000100000;
	  end
	  st_st28: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st28_n;
		else if(ptext[9] == 1 )
 		  NextState <= st_st29;
		rtext <= 'b000100000;
	  end
	  st_st28_n: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st28;
		else if(ptext[9] == 1 )
 		  NextState <= st_st29;
		rtext <= 'b000110000;
	  end
	  st_st29: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st29_n;
		else if(ptext[9] == 1 )
 		  NextState <= st_st30;
		rtext <= 'b000110000;
	  end
	  st_st29_n: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st29;
		else if(ptext[9] == 1 )
 		  NextState <= st_st30;
		rtext <= 'b000100000;
	  end
	  st_st30: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st30_n;
		else if(ptext[9] == 1 )
 		  NextState <= st_st31;
		rtext <= 'b000100000;
	  end
	  st_st30_n: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st30;
		else if(ptext[9] == 1 )
 		  NextState <= st_st31;
		rtext <= 'b000110000;
	  end
	  st_st31: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st31_n;
		else if(ptext[9] == 1  && ptext[10] == 0 )
 		  NextState <= st_st5;
		else if(ptext[6] == 1  && ptext[9] == 1  && ptext[10] == 1 )
 		  NextState <= st_st7;
		else if(ptext[4] == 0  && ptext[6] == 0  && ptext[9] == 1  && ptext[10] == 1 )
 		  NextState <= st_st5;
		else if(ptext[4] == 1  && ptext[6] == 0  && ptext[9] == 1  && ptext[10] == 1 )
 		  NextState <= st_st7;
		rtext <= 'b000110000;
	  end
	  st_st31_n: begin
		if(ptext[9] == 0 )
 		  NextState <= st_st31;
		else if(ptext[9] == 1  && ptext[10] == 0 )
 		  NextState <= st_st5;
		else if(ptext[6] == 1  && ptext[9] == 1  && ptext[10] == 1 )
 		  NextState <= st_st7;
		else if(ptext[4] == 0  && ptext[6] == 0  && ptext[9] == 1  && ptext[10] == 1 )
 		  NextState <= st_st5;
		else if(ptext[4] == 1  && ptext[6] == 0  && ptext[9] == 1  && ptext[10] == 1 )
 		  NextState <= st_st7;
		rtext <= 'b011101000;
	  end
      endcase // case ( State )
   end // always @ (State or ptext)   
endmodule // fsm
