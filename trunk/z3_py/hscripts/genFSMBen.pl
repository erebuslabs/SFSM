#!/usr/bin/perl

use POSIX qw(ceil);

my ($minstates, $maxstates, $stepstate) = (shift, shift, shift);


for (my $s_itt = $minstates; $s_itt <= $maxstates; $s_itt+=$stepstate){

    print "\n***Creating FSM Family with $s_itt States\n";
    ###GENERATE $s_itt states###
    for (my $selfloop_itt =  0; $selfloop_itt <= $s_itt ; $selfloop_itt=ceil($selfloop_itt+($s_itt/100))) {
	
	###SELECT $selfloop_itt states to create self loops###

	###Itterate through available population Schemes: MST to Fully Connected
	###POPULATE Connection Matrix####
	for(my $con_itt = $s_itt-1 ; $con_itt <= ($s_itt*(s_itt+1))/2; $con_itt+=$s_itt){
	    print "\n***Creating FSM Family with $s_itt States; $selfloop_itt self loops and $con_itt connections\n";

	}
    } 

}




