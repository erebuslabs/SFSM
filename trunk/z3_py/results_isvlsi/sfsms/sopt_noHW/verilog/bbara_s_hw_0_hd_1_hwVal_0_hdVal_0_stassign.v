	parameter  st_st4 =  7'b0000100;
	parameter  st_st7 =  7'b1110110;
	parameter  st_st3_n =  7'b1010001;
	parameter  st_st0_n =  7'b1001001;
	parameter  st_st4_n =  7'b0111110;
	parameter  st_st6 =  7'b0001110;
	parameter  st_st9_n =  7'b1011101;
	parameter  st_st1 =  7'b0010011;
	parameter  st_st9 =  7'b0101001;
	parameter  st_st3 =  7'b1001010;
	parameter  st_st6_n =  7'b1101011;
	parameter  st_st7_n =  7'b0101010;
	parameter  st_st5 =  7'b1100010;
	parameter  st_st2_n =  7'b0101111;
	parameter  st_st0 =  7'b1110000;
	parameter  st_st2 =  7'b1100001;
	parameter  st_st1_n =  7'b0111101;
	parameter  st_st5_n =  7'b0111000;
	parameter  st_st8 =  7'b1011000;
	parameter  st_st8_n =  7'b1001111;
	reg[6:0] State;
	reg[6:0] NextState;