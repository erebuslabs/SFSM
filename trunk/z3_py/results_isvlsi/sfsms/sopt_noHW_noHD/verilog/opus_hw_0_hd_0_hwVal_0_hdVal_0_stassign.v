	parameter  st_RMACK =  5'b00000;
	parameter  st_WMACK =  5'b00001;
	parameter  st_read1 =  5'b00010;
	parameter  st_init0_n =  5'b00011;
	parameter  st_init0 =  5'b00100;
	parameter  st_START =  5'b00101;
	parameter  st_init1_n =  5'b00110;
	parameter  st_write0 =  5'b00111;
	parameter  st_RMACK_n =  5'b01000;
	parameter  st_init4 =  5'b01001;
	parameter  st_IOwait_n =  5'b01010;
	parameter  st_WMACK_n =  5'b01011;
	parameter  st_init1 =  5'b01100;
	parameter  st_read0 =  5'b01101;
	parameter  st_init2 =  5'b01110;
	parameter  st_init4_n =  5'b01111;
	parameter  st_IOwait =  5'b10000;
	reg[4:0] State;
	reg[4:0] NextState;