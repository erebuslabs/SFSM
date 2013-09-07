#!/usr/bin/perl

use POSIX qw(ceil);
use List::Util qw(sum);

my ($states, $slpercent, $connectfeq) = (shift, shift, shift);

my @connectMatrix;

my @diag = rndvec($slpercent, $states);
my @final;
my $globmax = 0;

my $out ="";

for(my $ridx = 0; $ridx < $states; $ridx++){
    my @row;
    my @trow = rndvec($connectfeq, $states-1); #(0) x $states;
    push @row, @trow[0..($ridx-1)];
    push @row, "0" ;
    push @row, @trow[($ridx)..($states-1)];
    $row[rand($ridx)] = 1;
    $row[$ridx] = $diag[$ridx];
    my $lmax = sum(@row);
    if($lmax > $globmax){
	$globmax = $lmax;
    }
    push(@final, [@row]);
}

my $srcidx = 0; 
my $tcount = 0;

foreach $row (@final){
    my $desidx = 0; #$states-1;    
    my $curr = 0;
    foreach $elm (@{$row}){
	if($elm){
	    $out .= ohdecide($curr, $globmax);
	    $out .= " st${srcidx} st${desidx} ";
	    $out .= dec2bin(($desidx+$srcidx), ceil(log($states)/log(2)));
	    $out .= "\n";
	    $curr++;
	    $tcount++;
	}
	$desidx++;
    }
    $srcidx++;
}

print ".i $globmax\n";
print ".o ",ceil(log($states)/log(2)),"\n";
print ".p $tcount\n";
print ".s $states\n";
print $out;

sub ohdecide{
    my ($loc, $gmax) = (shift, shift);
    my @temp = ("-")x$gmax;
    $temp[$loc] = 1;
    return join("",@temp);

}

sub dec2bin { 
    my ($val, $idx) = (shift, shift);
    my $str = unpack("B32", pack("N", $val)); 
    return substr $str, (-1*$idx);
}

sub bineqv{
    my $num = (shift);
    return sprintf "%b", $num;
}

#Takes % of self loops and number of states,
#returns vector of 1s,0s - connected/not connected
sub rndvec{
    my ($lperc, $length) = (shift, shift);
    $lperc = $lperc/100;
    my $onbits = sprintf("%.0f",$lperc*$length);
    do{
	@vec = map{ int(rand() < $lperc) } (1..$length);
    }while(sum(@vec) != $onbits);
    return @vec;
}
