	parameter  st_st4 =  5'b00000;
	parameter  st_st7 =  5'b00001;
	parameter  st_st19 =  5'b00010;
	parameter  st_st15 =  5'b00011;
	parameter  st_st6 =  5'b00100;
	parameter  st_st18 =  5'b00101;
	parameter  st_10 =  5'b00110;
	parameter  st_st1 =  5'b00111;
	parameter  st_st20 =  5'b01000;
	parameter  st_st9 =  5'b01001;
	parameter  st_st3 =  5'b01010;
	parameter  st_st17 =  5'b01011;
	parameter  st_st14 =  5'b01100;
	parameter  st_st5 =  5'b01101;
	parameter  st_st10 =  5'b01110;
	parameter  st_st13 =  5'b01111;
	parameter  st_st12 =  5'b10000;
	parameter  st_st2 =  5'b10001;
	parameter  st_st11 =  5'b10010;
	parameter  st_st8 =  5'b10011;
	parameter  st_st16 =  5'b10100;
	reg[4:0] State;
	reg[4:0] NextState;