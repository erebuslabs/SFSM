#!/usr/bin/perl
use Switch;
use enum qw(st0 st0_n st1 st1_n st2 st2_n st3 st3_n st4 st4_n st5 st5_n st6 st6_n st7 st7_n st8 st8_n st9 st9_n );
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
		case(st0){
			if($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st0_n; $trans = st0.".".st0_n; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st0_n; $trans = st0.".".st0_n; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st0_n; $trans = st0.".".st0_n; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st0_n; $trans = st0.".".st0_n; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st1; $trans = st0.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st4; $trans = st0.".".st4; $HW = 4;$HD = 4;}
		}
		case(st0_n){
			if($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st0; $trans = st0_n.".".st0; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st0; $trans = st0_n.".".st0; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st0; $trans = st0_n.".".st0; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st0; $trans = st0_n.".".st0; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st1; $trans = st0_n.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st4; $trans = st0_n.".".st4; $HW = 4;$HD = 4;}
		}
		case(st1){
			if($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st1_n; $trans = st1.".".st1_n; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st1_n; $trans = st1.".".st1_n; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st1_n; $trans = st1.".".st1_n; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st0; $trans = st1.".".st0; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st2; $trans = st1.".".st2; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st4; $trans = st1.".".st4; $HW = 4;$HD = 4;}
		}
		case(st1_n){
			if($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st1; $trans = st1_n.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st1; $trans = st1_n.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st1; $trans = st1_n.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st0; $trans = st1_n.".".st0; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st2; $trans = st1_n.".".st2; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st4; $trans = st1_n.".".st4; $HW = 4;$HD = 4;}
		}
		case(st2){
			if($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st2_n; $trans = st2.".".st2_n; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st2_n; $trans = st2.".".st2_n; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st2_n; $trans = st2.".".st2_n; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st1; $trans = st2.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st3; $trans = st2.".".st3; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st4; $trans = st2.".".st4; $HW = 4;$HD = 4;}
		}
		case(st2_n){
			if($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st2; $trans = st2_n.".".st2; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st2; $trans = st2_n.".".st2; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st2; $trans = st2_n.".".st2; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st1; $trans = st2_n.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st3; $trans = st2_n.".".st3; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st4; $trans = st2_n.".".st4; $HW = 4;$HD = 4;}
		}
		case(st3){
			if($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st3_n; $trans = st3.".".st3_n; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st3_n; $trans = st3.".".st3_n; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st3_n; $trans = st3.".".st3_n; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st7; $trans = st3.".".st7; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st3_n; $trans = st3.".".st3_n; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st4; $trans = st3.".".st4; $HW = 4;$HD = 4;}
		}
		case(st3_n){
			if($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st3; $trans = st3_n.".".st3; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st3; $trans = st3_n.".".st3; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st3; $trans = st3_n.".".st3; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st7; $trans = st3_n.".".st7; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st3; $trans = st3_n.".".st3; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st4; $trans = st3_n.".".st4; $HW = 4;$HD = 4;}
		}
		case(st4){
			if($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st4_n; $trans = st4.".".st4_n; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st4_n; $trans = st4.".".st4_n; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st4_n; $trans = st4.".".st4_n; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st0; $trans = st4.".".st0; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st1; $trans = st4.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st5; $trans = st4.".".st5; $HW = 4;$HD = 4;}
		}
		case(st4_n){
			if($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st4; $trans = st4_n.".".st4; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st4; $trans = st4_n.".".st4; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st4; $trans = st4_n.".".st4; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st0; $trans = st4_n.".".st0; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st1; $trans = st4_n.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st5; $trans = st4_n.".".st5; $HW = 4;$HD = 4;}
		}
		case(st5){
			if($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st5_n; $trans = st5.".".st5_n; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st5_n; $trans = st5.".".st5_n; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st5_n; $trans = st5.".".st5_n; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st4; $trans = st5.".".st4; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st1; $trans = st5.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st6; $trans = st5.".".st6; $HW = 4;$HD = 4;}
		}
		case(st5_n){
			if($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st5; $trans = st5_n.".".st5; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st5; $trans = st5_n.".".st5; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st5; $trans = st5_n.".".st5; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st4; $trans = st5_n.".".st4; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st1; $trans = st5_n.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st6; $trans = st5_n.".".st6; $HW = 4;$HD = 4;}
		}
		case(st6){
			if($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st6_n; $trans = st6.".".st6_n; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st6_n; $trans = st6.".".st6_n; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st6_n; $trans = st6.".".st6_n; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st7; $trans = st6.".".st7; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st1; $trans = st6.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st6_n; $trans = st6.".".st6_n; $HW = 4;$HD = 4;}
		}
		case(st6_n){
			if($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st6; $trans = st6_n.".".st6; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st6; $trans = st6_n.".".st6; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st6; $trans = st6_n.".".st6; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st7; $trans = st6_n.".".st7; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st1; $trans = st6_n.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st6; $trans = st6_n.".".st6; $HW = 4;$HD = 4;}
		}
		case(st7){
			if($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st7_n; $trans = st7.".".st7_n; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st7_n; $trans = st7.".".st7_n; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st7_n; $trans = st7.".".st7_n; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st8; $trans = st7.".".st8; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st1; $trans = st7.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st4; $trans = st7.".".st4; $HW = 4;$HD = 4;}
		}
		case(st7_n){
			if($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st7; $trans = st7_n.".".st7; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st7; $trans = st7_n.".".st7; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st7; $trans = st7_n.".".st7; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st8; $trans = st7_n.".".st8; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st1; $trans = st7_n.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st4; $trans = st7_n.".".st4; $HW = 4;$HD = 4;}
		}
		case(st8){
			if($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st8_n; $trans = st8.".".st8_n; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st8_n; $trans = st8.".".st8_n; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st8_n; $trans = st8.".".st8_n; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st9; $trans = st8.".".st9; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st1; $trans = st8.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st4; $trans = st8.".".st4; $HW = 4;$HD = 4;}
		}
		case(st8_n){
			if($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st8; $trans = st8_n.".".st8; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st8; $trans = st8_n.".".st8; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st8; $trans = st8_n.".".st8; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st9; $trans = st8_n.".".st9; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st1; $trans = st8_n.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st4; $trans = st8_n.".".st4; $HW = 4;$HD = 4;}
		}
		case(st9){
			if($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st9_n; $trans = st9.".".st9_n; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st9_n; $trans = st9.".".st9_n; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st9_n; $trans = st9.".".st9_n; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st0; $trans = st9.".".st0; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st1; $trans = st9.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st4; $trans = st9.".".st4; $HW = 4;$HD = 4;}
		}
		case(st9_n){
			if($ptext[2] == 0  && $ptext[3] == 1 ){$nextState = st9; $trans = st9_n.".".st9; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 1  && $ptext[3] == 0 ){$nextState = st9; $trans = st9_n.".".st9; $HW = 4;$HD = 4;}
			elsif($ptext[2] == 0  && $ptext[3] == 0 ){$nextState = st9; $trans = st9_n.".".st9; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 0  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st0; $trans = st9_n.".".st0; $HW = 4;$HD = 4;}
			elsif($ptext[1] == 1  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st1; $trans = st9_n.".".st1; $HW = 4;$HD = 4;}
			elsif($ptext[0] == 1  && $ptext[1] == 0  && $ptext[2] == 1  && $ptext[3] == 1 ){$nextState = st4; $trans = st9_n.".".st4; $HW = 4;$HD = 4;}
		}
	}
print "$trans\t$HW\t$HD\n";
	$currState = $nextState;
}#endwhile
close(FILE);