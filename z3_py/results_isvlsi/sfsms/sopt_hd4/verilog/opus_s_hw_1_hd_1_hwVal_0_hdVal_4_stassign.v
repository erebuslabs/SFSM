	parameter  st_RMACK =  7'b0101110;
	parameter  st_WMACK =  7'b0110101;
	parameter  st_read1 =  7'b1001110;
	parameter  st_init0_n =  7'b1001011;
	parameter  st_init0 =  7'b0110011;
	parameter  st_START =  7'b1101010;
	parameter  st_init1_n =  7'b1100110;
	parameter  st_write0 =  7'b1011100;
	parameter  st_RMACK_n =  7'b0011101;
	parameter  st_init4 =  7'b0100111;
	parameter  st_IOwait_n =  7'b1110010;
	parameter  st_WMACK_n =  7'b0111010;
	parameter  st_init1 =  7'b1010101;
	parameter  st_read0 =  7'b1101001;
	parameter  st_init2 =  7'b0111100;
	parameter  st_init4_n =  7'b1110001;
	parameter  st_IOwait =  7'b0011011;
	reg[6:0] State;
	reg[6:0] NextState;