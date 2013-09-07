#!/usr/bin/perl
use Switch;
use enum qw(st1 st10 st11 st12 st13 st14 st15 st16 st17 st18 st19 st2 st20 st21 st22 st23 st24 st25 st26 st27 st28 st29 st3 st30 st31 st32 st33 st34 st35 st36 st37 st38 st39 st4 st40 st41 st42 st43 st44 st45 st46 st47 st48 st49 st5 st50 st51 st52 st53 st54 st55 st56 st57 st58 st59 st6 st60 st7 st8 st9 );
$currState = 0;
#Open Data File from command line
my $filename = $ARGV[0];
open  (fh, "<", $filename);
#every 3+1 are used as a single round input
my @inputs = ($data =~ /(d)s*(d)s*(d)s*(d)s*/g);
my $HW;
my $HD;
foreach $temp (<fh>) {
chomp($temp);
@ptext = split(' ',$temp);
print "$currState\t";
my $nextState = $currState;
my $trans = -1;
	switch($currState){
		case(st1){
			if($ptext[0] == 0  && $ptext[1] == 1  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st2; $trans = st1.".".st2; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st1; $trans = st1.".".st1; $HW = 4;$HD = 0;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st4; $trans = st1.".".st4; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st6; $trans = st1.".".st6; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st7; $trans = st1.".".st7; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st7; $trans = st1.".".st7; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st8; $trans = st1.".".st8; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st8; $trans = st1.".".st8; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st9; $trans = st1.".".st9; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st9; $trans = st1.".".st9; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st10; $trans = st1.".".st10; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st12; $trans = st1.".".st12; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st1; $trans = st1.".".st1; $HW = 4;$HD = 0;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st4; $trans = st1.".".st4; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st6; $trans = st1.".".st6; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st7; $trans = st1.".".st7; $HW = 4;$HD = 4;}
		}
		case(st2){
			if($ptext[1] == 1  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st3; $trans = st2.".".st3; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st2; $trans = st2.".".st2; $HW = 4;$HD = 0;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st13; $trans = st2.".".st13; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st17; $trans = st2.".".st17; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st21; $trans = st2.".".st21; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[3] == 0 ){$nextState = st22; $trans = st2.".".st22; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st27; $trans = st2.".".st27; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[3] == 0 ){$nextState = st2; $trans = st2.".".st2; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st13; $trans = st2.".".st13; $HW = 4;$HD = 4;}
		}
		case(st3){
			if($ptext[0] == 0  && $ptext[2] == 0 ){$nextState = st1; $trans = st3.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 1 ){$nextState = st3; $trans = st3.".".st3; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 1 ){$nextState = st1; $trans = st3.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0 ){$nextState = st3; $trans = st3.".".st3; $HW = 4;$HD = 0;}
		}
		case(st4){
			if($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st1; $trans = st4.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[3] == 0 ){$nextState = st5; $trans = st4.".".st5; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[2] == 0 ){$nextState = st4; $trans = st4.".".st4; $HW = 4;$HD = 0;}
			elsif($ptext[0] == 1  && $ptext[3] == 0 ){$nextState = st1; $trans = st4.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[2] == 1 ){$nextState = st5; $trans = st4.".".st5; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[3] == 1 ){$nextState = st4; $trans = st4.".".st4; $HW = 4;$HD = 0;}
		}
		case(st5){
			if($ptext[0] == 0  && $ptext[3] == 1 ){$nextState = st4; $trans = st5.".".st4; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[3] == 0 ){$nextState = st6; $trans = st5.".".st6; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[3] == 0 ){$nextState = st5; $trans = st5.".".st5; $HW = 4;$HD = 0;}
			elsif($ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st4; $trans = st5.".".st4; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st6; $trans = st5.".".st6; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[2] == 0 ){$nextState = st5; $trans = st5.".".st5; $HW = 4;$HD = 0;}
		}
		case(st6){
			if($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 0 ){$nextState = st5; $trans = st6.".".st5; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st1; $trans = st6.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st6; $trans = st6.".".st6; $HW = 4;$HD = 0;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st5; $trans = st6.".".st5; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st1; $trans = st6.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st1; $trans = st6.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[2] == 0 ){$nextState = st6; $trans = st6.".".st6; $HW = 4;$HD = 0;}
		}
		case(st7){
			if($ptext[0] == 0  && $ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st1; $trans = st7.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st1; $trans = st7.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[3] == 0 ){$nextState = st7; $trans = st7.".".st7; $HW = 4;$HD = 0;}
			elsif($ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st1; $trans = st7.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[2] == 0 ){$nextState = st1; $trans = st7.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st7; $trans = st7.".".st7; $HW = 4;$HD = 0;}
		}
		case(st8){
			if($ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st1; $trans = st8.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st1; $trans = st8.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st8; $trans = st8.".".st8; $HW = 4;$HD = 0;}
			elsif($ptext[0] == 1  && $ptext[1] == 1 ){$nextState = st1; $trans = st8.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[2] == 1 ){$nextState = st1; $trans = st8.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[3] == 1 ){$nextState = st1; $trans = st8.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 1 ){$nextState = st8; $trans = st8.".".st8; $HW = 4;$HD = 0;}
		}
		case(st9){
			if($ptext[0] == 0  && $ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st1; $trans = st9.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st1; $trans = st9.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[3] == 0 ){$nextState = st9; $trans = st9.".".st9; $HW = 4;$HD = 0;}
			elsif($ptext[0] == 1  && $ptext[2] == 0 ){$nextState = st1; $trans = st9.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0 ){$nextState = st1; $trans = st9.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[2] == 1 ){$nextState = st9; $trans = st9.".".st9; $HW = 4;$HD = 0;}
		}
		case(st10){
			if($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 0 ){$nextState = st1; $trans = st10.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st11; $trans = st10.".".st11; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 0 ){$nextState = st10; $trans = st10.".".st10; $HW = 4;$HD = 0;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 0 ){$nextState = st45; $trans = st10.".".st45; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st49; $trans = st10.".".st49; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st53; $trans = st10.".".st53; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st54; $trans = st10.".".st54; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[3] == 0 ){$nextState = st59; $trans = st10.".".st59; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st11; $trans = st10.".".st11; $HW = 4;$HD = 4;}
		}
		case(st11){
			if($ptext[0] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st10; $trans = st11.".".st10; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st12; $trans = st11.".".st12; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st11; $trans = st11.".".st11; $HW = 4;$HD = 0;}
			elsif($ptext[0] == 0  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st16; $trans = st11.".".st16; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st20; $trans = st11.".".st20; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st21; $trans = st11.".".st21; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[3] == 0 ){$nextState = st26; $trans = st11.".".st26; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1 ){$nextState = st12; $trans = st11.".".st12; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 1 ){$nextState = st11; $trans = st11.".".st11; $HW = 4;$HD = 0;}
		}
		case(st12){
			if($ptext[0] == 1  && $ptext[1] == 0 ){$nextState = st11; $trans = st12.".".st11; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[3] == 0 ){$nextState = st1; $trans = st12.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1 ){$nextState = st12; $trans = st12.".".st12; $HW = 4;$HD = 0;}
			elsif($ptext[0] == 1  && $ptext[3] == 0 ){$nextState = st11; $trans = st12.".".st11; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 0 ){$nextState = st1; $trans = st12.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[3] == 1 ){$nextState = st12; $trans = st12.".".st12; $HW = 4;$HD = 0;}
		}
		case(st13){
			if($ptext[0] == 1  && $ptext[1] == 1 ){$nextState = st14; $trans = st13.".".st14; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[2] == 0 ){$nextState = st13; $trans = st13.".".st13; $HW = 4;$HD = 0;}
			elsif($ptext[2] == 1 ){$nextState = st14; $trans = st13.".".st14; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 0 ){$nextState = st13; $trans = st13.".".st13; $HW = 4;$HD = 0;}
		}
		case(st14){
			if($ptext[1] == 1  && $ptext[3] == 0 ){$nextState = st15; $trans = st14.".".st15; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 0 ){$nextState = st14; $trans = st14.".".st14; $HW = 4;$HD = 0;}
			elsif($ptext[2] == 1 ){$nextState = st15; $trans = st14.".".st15; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st14; $trans = st14.".".st14; $HW = 4;$HD = 0;}
		}
		case(st15){
			if($ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st14; $trans = st15.".".st14; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st16; $trans = st15.".".st16; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1 ){$nextState = st15; $trans = st15.".".st15; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st32; $trans = st15.".".st32; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st36; $trans = st15.".".st36; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st37; $trans = st15.".".st37; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st42; $trans = st15.".".st42; $HW = 4;$HD = 4;}
		}
		case(st16){
			if($ptext[0] == 1  && $ptext[1] == 1 ){$nextState = st11; $trans = st16.".".st11; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[3] == 0 ){$nextState = st16; $trans = st16.".".st16; $HW = 4;$HD = 0;}
			elsif($ptext[3] == 1 ){$nextState = st11; $trans = st16.".".st11; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[3] == 0 ){$nextState = st16; $trans = st16.".".st16; $HW = 4;$HD = 0;}
		}
		case(st17){
			if($ptext[0] == 0  && $ptext[1] == 1  && $ptext[2] == 1 ){$nextState = st2; $trans = st17.".".st2; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st18; $trans = st17.".".st18; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[3] == 0 ){$nextState = st17; $trans = st17.".".st17; $HW = 4;$HD = 0;}
			elsif($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st2; $trans = st17.".".st2; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st18; $trans = st17.".".st18; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st18; $trans = st17.".".st18; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 1 ){$nextState = st17; $trans = st17.".".st17; $HW = 4;$HD = 0;}
		}
		case(st18){
			if($ptext[0] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st17; $trans = st18.".".st17; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st19; $trans = st18.".".st19; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st18; $trans = st18.".".st18; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st29; $trans = st18.".".st29; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[2] == 0 ){$nextState = st33; $trans = st18.".".st33; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 0 ){$nextState = st37; $trans = st18.".".st37; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 0 ){$nextState = st38; $trans = st18.".".st38; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st43; $trans = st18.".".st43; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st19; $trans = st18.".".st19; $HW = 4;$HD = 4;}
		}
		case(st19){
			if($ptext[0] == 0  && $ptext[3] == 0 ){$nextState = st18; $trans = st19.".".st18; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st20; $trans = st19.".".st20; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st19; $trans = st19.".".st19; $HW = 4;$HD = 0;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st18; $trans = st19.".".st18; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[3] == 1 ){$nextState = st20; $trans = st19.".".st20; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[2] == 1 ){$nextState = st19; $trans = st19.".".st19; $HW = 4;$HD = 0;}
		}
		case(st20){
			if($ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st19; $trans = st20.".".st19; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st11; $trans = st20.".".st11; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st20; $trans = st20.".".st20; $HW = 4;$HD = 0;}
			elsif($ptext[0] == 0  && $ptext[1] == 1 ){$nextState = st19; $trans = st20.".".st19; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 1 ){$nextState = st11; $trans = st20.".".st11; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[3] == 0 ){$nextState = st11; $trans = st20.".".st11; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 1 ){$nextState = st20; $trans = st20.".".st20; $HW = 4;$HD = 0;}
		}
		case(st21){
			if($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st2; $trans = st21.".".st2; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st11; $trans = st21.".".st11; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st21; $trans = st21.".".st21; $HW = 4;$HD = 0;}
			elsif($ptext[0] == 0  && $ptext[1] == 1 ){$nextState = st2; $trans = st21.".".st2; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 1 ){$nextState = st11; $trans = st21.".".st11; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1 ){$nextState = st21; $trans = st21.".".st21; $HW = 4;$HD = 0;}
		}
		case(st22){
			if($ptext[1] == 1  && $ptext[3] == 0 ){$nextState = st2; $trans = st22.".".st2; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st23; $trans = st22.".".st23; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0 ){$nextState = st2; $trans = st22.".".st2; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 1 ){$nextState = st23; $trans = st22.".".st23; $HW = 4;$HD = 4;}
		}
		case(st23){
			if($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 0 ){$nextState = st22; $trans = st23.".".st22; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st24; $trans = st23.".".st24; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st23; $trans = st23.".".st23; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 0  && $ptext[3] == 0 ){$nextState = st22; $trans = st23.".".st22; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st24; $trans = st23.".".st24; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st24; $trans = st23.".".st24; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1 ){$nextState = st23; $trans = st23.".".st23; $HW = 4;$HD = 0;}
		}
		case(st24){
			if($ptext[0] == 1  && $ptext[1] == 0  && $ptext[3] == 0 ){$nextState = st23; $trans = st24.".".st23; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st25; $trans = st24.".".st25; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0 ){$nextState = st24; $trans = st24.".".st24; $HW = 4;$HD = 0;}
			elsif($ptext[0] == 1  && $ptext[2] == 0 ){$nextState = st23; $trans = st24.".".st23; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1 ){$nextState = st25; $trans = st24.".".st25; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[2] == 0 ){$nextState = st24; $trans = st24.".".st24; $HW = 4;$HD = 0;}
		}
		case(st25){
			if($ptext[0] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st24; $trans = st25.".".st24; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[3] == 1 ){$nextState = st26; $trans = st25.".".st26; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st25; $trans = st25.".".st25; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 0  && $ptext[2] == 1 ){$nextState = st24; $trans = st25.".".st24; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 0 ){$nextState = st26; $trans = st25.".".st26; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 0 ){$nextState = st25; $trans = st25.".".st25; $HW = 4;$HD = 0;}
		}
		case(st26){
			if($ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st25; $trans = st26.".".st25; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st11; $trans = st26.".".st11; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st26; $trans = st26.".".st26; $HW = 4;$HD = 0;}
			elsif($ptext[0] == 1  && $ptext[2] == 1 ){$nextState = st25; $trans = st26.".".st25; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st11; $trans = st26.".".st11; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[2] == 1 ){$nextState = st11; $trans = st26.".".st11; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 0 ){$nextState = st26; $trans = st26.".".st26; $HW = 4;$HD = 0;}
		}
		case(st27){
			if($ptext[0] == 0  && $ptext[1] == 1 ){$nextState = st2; $trans = st27.".".st2; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[3] == 0 ){$nextState = st28; $trans = st27.".".st28; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 1 ){$nextState = st27; $trans = st27.".".st27; $HW = 4;$HD = 0;}
			elsif($ptext[0] == 0  && $ptext[3] == 0 ){$nextState = st2; $trans = st27.".".st2; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 0 ){$nextState = st28; $trans = st27.".".st28; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st27; $trans = st27.".".st27; $HW = 4;$HD = 0;}
		}
		case(st28){
			if($ptext[0] == 1  && $ptext[3] == 1 ){$nextState = st11; $trans = st28.".".st11; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st28; $trans = st28.".".st28; $HW = 4;$HD = 0;}
			elsif($ptext[2] == 0 ){$nextState = st11; $trans = st28.".".st11; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[2] == 1 ){$nextState = st28; $trans = st28.".".st28; $HW = 4;$HD = 0;}
		}
		case(st29){
			if($ptext[1] == 0  && $ptext[2] == 0 ){$nextState = st30; $trans = st29.".".st30; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[3] == 0 ){$nextState = st29; $trans = st29.".".st29; $HW = 4;$HD = 0;}
			elsif($ptext[3] == 1 ){$nextState = st30; $trans = st29.".".st30; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st29; $trans = st29.".".st29; $HW = 4;$HD = 0;}
		}
		case(st30){
			if($ptext[1] == 1  && $ptext[2] == 1 ){$nextState = st31; $trans = st30.".".st31; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[3] == 0 ){$nextState = st30; $trans = st30.".".st30; $HW = 4;$HD = 0;}
			elsif($ptext[3] == 1 ){$nextState = st31; $trans = st30.".".st31; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st30; $trans = st30.".".st30; $HW = 4;$HD = 0;}
		}
		case(st31){
			if($ptext[0] == 0  && $ptext[1] == 1  && $ptext[2] == 1 ){$nextState = st30; $trans = st31.".".st30; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st32; $trans = st31.".".st32; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st31; $trans = st31.".".st31; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 0  && $ptext[3] == 0 ){$nextState = st30; $trans = st31.".".st30; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st32; $trans = st31.".".st32; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st32; $trans = st31.".".st32; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 0 ){$nextState = st31; $trans = st31.".".st31; $HW = 4;$HD = 0;}
		}
		case(st32){
			if($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st15; $trans = st32.".".st15; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 1 ){$nextState = st32; $trans = st32.".".st32; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 1 ){$nextState = st15; $trans = st32.".".st15; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[3] == 0 ){$nextState = st32; $trans = st32.".".st32; $HW = 4;$HD = 0;}
		}
		case(st33){
			if($ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st18; $trans = st33.".".st18; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st34; $trans = st33.".".st34; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[3] == 1 ){$nextState = st33; $trans = st33.".".st33; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 0  && $ptext[2] == 0 ){$nextState = st18; $trans = st33.".".st18; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[3] == 1 ){$nextState = st34; $trans = st33.".".st34; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st33; $trans = st33.".".st33; $HW = 4;$HD = 0;}
		}
		case(st34){
			if($ptext[0] == 0  && $ptext[1] == 1  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st33; $trans = st34.".".st33; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 0 ){$nextState = st35; $trans = st34.".".st35; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st34; $trans = st34.".".st34; $HW = 4;$HD = 0;}
			elsif($ptext[0] == 1  && $ptext[2] == 1 ){$nextState = st33; $trans = st34.".".st33; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st35; $trans = st34.".".st35; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[2] == 1 ){$nextState = st34; $trans = st34.".".st34; $HW = 4;$HD = 0;}
		}
		case(st35){
			if($ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st34; $trans = st35.".".st34; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st36; $trans = st35.".".st36; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[3] == 1 ){$nextState = st35; $trans = st35.".".st35; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 0  && $ptext[2] == 1 ){$nextState = st34; $trans = st35.".".st34; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[3] == 1 ){$nextState = st36; $trans = st35.".".st36; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st35; $trans = st35.".".st35; $HW = 4;$HD = 0;}
		}
		case(st36){
			if($ptext[0] == 0  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st35; $trans = st36.".".st35; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1 ){$nextState = st15; $trans = st36.".".st15; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[3] == 0 ){$nextState = st36; $trans = st36.".".st36; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 1  && $ptext[3] == 0 ){$nextState = st35; $trans = st36.".".st35; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st15; $trans = st36.".".st15; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[3] == 1 ){$nextState = st36; $trans = st36.".".st36; $HW = 4;$HD = 0;}
		}
		case(st37){
			if($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st18; $trans = st37.".".st18; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st15; $trans = st37.".".st15; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st37; $trans = st37.".".st37; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 0  && $ptext[3] == 0 ){$nextState = st18; $trans = st37.".".st18; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st15; $trans = st37.".".st15; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1 ){$nextState = st37; $trans = st37.".".st37; $HW = 4;$HD = 0;}
		}
		case(st38){
			if($ptext[1] == 1  && $ptext[2] == 1 ){$nextState = st18; $trans = st38.".".st18; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[2] == 0 ){$nextState = st39; $trans = st38.".".st39; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0 ){$nextState = st18; $trans = st38.".".st18; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0 ){$nextState = st39; $trans = st38.".".st39; $HW = 4;$HD = 4;}
		}
		case(st39){
			if($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st38; $trans = st39.".".st38; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st40; $trans = st39.".".st40; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st39; $trans = st39.".".st39; $HW = 4;$HD = 0;}
			elsif($ptext[0] == 1  && $ptext[1] == 0 ){$nextState = st38; $trans = st39.".".st38; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[3] == 0 ){$nextState = st40; $trans = st39.".".st40; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1 ){$nextState = st40; $trans = st39.".".st40; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[3] == 0 ){$nextState = st39; $trans = st39.".".st39; $HW = 4;$HD = 0;}
		}
		case(st40){
			if($ptext[0] == 0  && $ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st39; $trans = st40.".".st39; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st41; $trans = st40.".".st41; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[2] == 0 ){$nextState = st40; $trans = st40.".".st40; $HW = 4;$HD = 0;}
			elsif($ptext[0] == 1  && $ptext[3] == 1 ){$nextState = st39; $trans = st40.".".st39; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0 ){$nextState = st41; $trans = st40.".".st41; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[3] == 0 ){$nextState = st40; $trans = st40.".".st40; $HW = 4;$HD = 0;}
		}
		case(st41){
			if($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 1 ){$nextState = st40; $trans = st41.".".st40; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st42; $trans = st41.".".st42; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[3] == 1 ){$nextState = st41; $trans = st41.".".st41; $HW = 4;$HD = 0;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st40; $trans = st41.".".st40; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st42; $trans = st41.".".st42; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st42; $trans = st41.".".st42; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 1 ){$nextState = st41; $trans = st41.".".st41; $HW = 4;$HD = 0;}
		}
		case(st42){
			if($ptext[0] == 0  && $ptext[2] == 0 ){$nextState = st41; $trans = st42.".".st41; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st15; $trans = st42.".".st15; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st42; $trans = st42.".".st42; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 0  && $ptext[2] == 0 ){$nextState = st41; $trans = st42.".".st41; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1 ){$nextState = st15; $trans = st42.".".st15; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1 ){$nextState = st42; $trans = st42.".".st42; $HW = 4;$HD = 0;}
		}
		case(st43){
			if($ptext[0] == 0  && $ptext[1] == 1  && $ptext[3] == 1 ){$nextState = st18; $trans = st43.".".st18; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st44; $trans = st43.".".st44; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st43; $trans = st43.".".st43; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st48; $trans = st43.".".st48; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st52; $trans = st43.".".st52; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[3] == 1 ){$nextState = st53; $trans = st43.".".st53; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st58; $trans = st43.".".st58; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st44; $trans = st43.".".st44; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 0 ){$nextState = st43; $trans = st43.".".st43; $HW = 4;$HD = 0;}
		}
		case(st44){
			if($ptext[0] == 1  && $ptext[1] == 0 ){$nextState = st15; $trans = st44.".".st15; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[2] == 1 ){$nextState = st44; $trans = st44.".".st44; $HW = 4;$HD = 0;}
			elsif($ptext[2] == 0 ){$nextState = st15; $trans = st44.".".st15; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1 ){$nextState = st44; $trans = st44.".".st44; $HW = 4;$HD = 0;}
		}
		case(st45){
			if($ptext[1] == 1  && $ptext[2] == 0 ){$nextState = st46; $trans = st45.".".st46; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st45; $trans = st45.".".st45; $HW = 4;$HD = 0;}
			elsif($ptext[3] == 0 ){$nextState = st46; $trans = st45.".".st46; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st45; $trans = st45.".".st45; $HW = 4;$HD = 0;}
		}
		case(st46){
			if($ptext[0] == 1  && $ptext[3] == 0 ){$nextState = st47; $trans = st46.".".st47; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[3] == 1 ){$nextState = st46; $trans = st46.".".st46; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 0 ){$nextState = st47; $trans = st46.".".st47; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1 ){$nextState = st46; $trans = st46.".".st46; $HW = 4;$HD = 0;}
		}
		case(st47){
			if($ptext[0] == 0  && $ptext[1] == 0 ){$nextState = st46; $trans = st47.".".st46; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[2] == 1 ){$nextState = st48; $trans = st47.".".st48; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[2] == 0 ){$nextState = st47; $trans = st47.".".st47; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 0  && $ptext[3] == 0 ){$nextState = st46; $trans = st47.".".st46; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[3] == 0 ){$nextState = st48; $trans = st47.".".st48; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[3] == 1 ){$nextState = st47; $trans = st47.".".st47; $HW = 4;$HD = 0;}
		}
		case(st48){
			if($ptext[0] == 0  && $ptext[1] == 0 ){$nextState = st43; $trans = st48.".".st43; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[3] == 1 ){$nextState = st48; $trans = st48.".".st48; $HW = 4;$HD = 0;}
			elsif($ptext[3] == 0 ){$nextState = st43; $trans = st48.".".st43; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[3] == 1 ){$nextState = st48; $trans = st48.".".st48; $HW = 4;$HD = 0;}
		}
		case(st49){
			if($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 0 ){$nextState = st10; $trans = st49.".".st10; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st50; $trans = st49.".".st50; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st49; $trans = st49.".".st49; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st10; $trans = st49.".".st10; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[3] == 0 ){$nextState = st50; $trans = st49.".".st50; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st50; $trans = st49.".".st50; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1 ){$nextState = st49; $trans = st49.".".st49; $HW = 4;$HD = 0;}
		}
		case(st50){
			if($ptext[0] == 1  && $ptext[1] == 0 ){$nextState = st49; $trans = st50.".".st49; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1  && $ptext[3] == 0 ){$nextState = st51; $trans = st50.".".st51; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 1 ){$nextState = st50; $trans = st50.".".st50; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 0  && $ptext[3] == 0 ){$nextState = st49; $trans = st50.".".st49; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 0 ){$nextState = st51; $trans = st50.".".st51; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[3] == 1 ){$nextState = st50; $trans = st50.".".st50; $HW = 4;$HD = 0;}
		}
		case(st51){
			if($ptext[0] == 0  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st50; $trans = st51.".".st50; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st52; $trans = st51.".".st52; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1 ){$nextState = st51; $trans = st51.".".st51; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 1  && $ptext[3] == 1 ){$nextState = st50; $trans = st51.".".st50; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st52; $trans = st51.".".st52; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st52; $trans = st51.".".st52; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st51; $trans = st51.".".st51; $HW = 4;$HD = 0;}
		}
		case(st52){
			if($ptext[0] == 0  && $ptext[3] == 0 ){$nextState = st51; $trans = st52.".".st51; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[3] == 0 ){$nextState = st43; $trans = st52.".".st43; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1 ){$nextState = st52; $trans = st52.".".st52; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 1  && $ptext[3] == 1 ){$nextState = st51; $trans = st52.".".st51; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st43; $trans = st52.".".st43; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st52; $trans = st52.".".st52; $HW = 4;$HD = 0;}
		}
		case(st53){
			if($ptext[1] == 1  && $ptext[3] == 0 ){$nextState = st10; $trans = st53.".".st10; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[3] == 1 ){$nextState = st43; $trans = st53.".".st43; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 0 ){$nextState = st53; $trans = st53.".".st53; $HW = 4;$HD = 0;}
			elsif($ptext[0] == 0  && $ptext[3] == 1 ){$nextState = st10; $trans = st53.".".st10; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st43; $trans = st53.".".st43; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[3] == 0 ){$nextState = st53; $trans = st53.".".st53; $HW = 4;$HD = 0;}
		}
		case(st54){
			if($ptext[0] == 1  && $ptext[1] == 1 ){$nextState = st10; $trans = st54.".".st10; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[3] == 1 ){$nextState = st55; $trans = st54.".".st55; $HW = 4;$HD = 4;}
			elsif($ptext[3] == 0 ){$nextState = st10; $trans = st54.".".st10; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st55; $trans = st54.".".st55; $HW = 4;$HD = 4;}
		}
		case(st55){
			if($ptext[0] == 0  && $ptext[1] == 0  && $ptext[3] == 0 ){$nextState = st54; $trans = st55.".".st54; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st56; $trans = st55.".".st56; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 0 ){$nextState = st55; $trans = st55.".".st55; $HW = 4;$HD = 0;}
			elsif($ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st54; $trans = st55.".".st54; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st56; $trans = st55.".".st56; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st56; $trans = st55.".".st56; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[3] == 0 ){$nextState = st55; $trans = st55.".".st55; $HW = 4;$HD = 0;}
		}
		case(st56){
			if($ptext[1] == 1  && $ptext[3] == 1 ){$nextState = st55; $trans = st56.".".st55; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st57; $trans = st56.".".st57; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st56; $trans = st56.".".st56; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 1  && $ptext[2] == 1 ){$nextState = st55; $trans = st56.".".st55; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st57; $trans = st56.".".st57; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st56; $trans = st56.".".st56; $HW = 4;$HD = 0;}
		}
		case(st57){
			if($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 0 ){$nextState = st56; $trans = st57.".".st56; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st58; $trans = st57.".".st58; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[3] == 1 ){$nextState = st57; $trans = st57.".".st57; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 0  && $ptext[3] == 0 ){$nextState = st56; $trans = st57.".".st56; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[3] == 1 ){$nextState = st58; $trans = st57.".".st58; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[3] == 0 ){$nextState = st57; $trans = st57.".".st57; $HW = 4;$HD = 0;}
		}
		case(st58){
			if($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1 ){$nextState = st57; $trans = st58.".".st57; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st43; $trans = st58.".".st43; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st58; $trans = st58.".".st58; $HW = 4;$HD = 0;}
			elsif($ptext[1] == 1  && $ptext[3] == 0 ){$nextState = st57; $trans = st58.".".st57; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1  && $ptext[3] == 1 ){$nextState = st43; $trans = st58.".".st43; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st43; $trans = st58.".".st43; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0 ){$nextState = st58; $trans = st58.".".st58; $HW = 4;$HD = 0;}
		}
		case(st59){
			if($ptext[1] == 0  && $ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st10; $trans = st59.".".st10; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st60; $trans = st59.".".st60; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[3] == 0 ){$nextState = st59; $trans = st59.".".st59; $HW = 4;$HD = 0;}
			elsif($ptext[0] == 0  && $ptext[1] == 0 ){$nextState = st10; $trans = st59.".".st10; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 1 ){$nextState = st60; $trans = st59.".".st60; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 1 ){$nextState = st59; $trans = st59.".".st59; $HW = 4;$HD = 0;}
		}
		case(st60){
			if($ptext[1] == 1  && $ptext[3] == 1 ){$nextState = st43; $trans = st60.".".st43; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 0  && $ptext[2] == 0 ){$nextState = st60; $trans = st60.".".st60; $HW = 4;$HD = 0;}
			elsif($ptext[2] == 1 ){$nextState = st43; $trans = st60.".".st43; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st60; $trans = st60.".".st60; $HW = 4;$HD = 0;}
		}
	}
print "$trans\t$HW\t$HD\n";
	$currState = $nextState;
}#endwhile
close(FILE);
