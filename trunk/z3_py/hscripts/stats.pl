#!/usr/bin/perl

use POSIX;
my ($datfile, $delay, $vectors, $clkperiod, $oracle) = @ARGV; #($ARGV[0], $ARGV[1]);
my $runcompStats = true;

if($#ARGV < 3 || $#ARGV > 4){
    print "USAGE: ./stats.pl datafile delay vec clk [oracle]\n";
    exit(0);
}elsif($#ARGV == 4){
    $runcompStat = false;
}

my $compTime = $vectors * $clkperiod;
my $totalTime = $compTime + $delay;

### READ DAT FILE and Construct

open(my $dfm, $datfile) or die("ack error - $!");
@time_val = <$dfm>;
close $dfm;
my @curr;





DFMLINE: foreach $row (@time_val){
    (my $n , $val) = split('\s+',$row);  
    push(@curr, $val);
} 

$realTime = scalar(@curr);
$dpPUT = ($realTime/$totalTime); #dpPUT: datapoint per Unit Time
print $dpPUT;
$realDelay = $dpPUT * $delay;
$realComputingTime = $dpPUT * $compTime;
$realCTPVec = $realComputingTime / $vectors;#

print "\n=========DELAY DP===========\n";
foreach $row (0..($realDelay-1)){
    print $curr[$row] . "--$row --\n";
}
print "\n=========END DP===========\n";#

foreach $vec (0..($vectors-1)){
    print "\nv========Vector $vec Start==========v\n";
    $offset = $realDelay + $vec*$realCTPVec;
    my $n = 1;
    foreach $row ($offset..($offset+$realCTPVec-1)){
	print $curr[$row] . "--$row - $n--\n";#
	$n++;
    }
    print $realCTPVec-1;
    print "\n^========Vector $vec End==========^\n";

}

### Comparative Stats
if($runcompStat){
    print "\n====Running Comparative Statistics====\n";

}else{
    print "\n====Skipping Comparative Statistics====\n";
}
