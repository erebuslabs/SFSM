#!/usr/bin/perl

use POSIX;
my ($datfile, $delay, $vectors, $clkperiod, $sampleRate, $oracle) = @ARGV; #($ARGV[0], $ARGV[1]);
my $runcompStats = true;

if($#ARGV < 4 || $#ARGV > 5){
    print "USAGE: ./stats.pl datafile delay vec clk samplerate [oracle]\n";
    exit(0);
}elsif($#ARGV == 5){
    $runcompStat = false;
}

my $compTime = $vectors * $clkperiod;
my $totalTime = $compTime + $delay;
my $dpPUT = $sampleRate; #dpPUT: datapoint per Unit Time

my $delayEnd = $sampleRate * $delay;



my (@data, @row);

### READ DAT FILE and Construct
my $idx = 0;
my $VecCnt = 0;
open(my $dfm, $datfile) or die("ack error - $!");
#@time_val = <$dfm>;
while(<$dfm>){
    if(m/^(\d+)\s+([-\d]+)\s*$/ && $idx > $delayEnd){
	my $current = sprintf("%f",$2);
	my $absIdx = ($idx - $delayEnd) % ($sampleRate*$clkperiod);
	push(@data, $current);
	if($absIdx == 0){
	    $VecCnt++;
	    push @row, [@data];
	    delete @data[0..$#data];
	}
    }
    $idx++;
}

close $dfm;

foreach $ridx (0..$VecCnt-1){
    foreach $dpidx (0..($sampleRate*$clkperiod)-1) {
	print $row[$ridx][$dpidx] . ",";
    }
    print "\n";
}
#my @curr;



#DFMLINE: foreach $row (@time_val){
#    (my $n , $val) = split('\s+',$row);  
#    push(@curr, $val);
#} 

#$realTime = scalar(@curr);



#$realCTotalVec = $vectors * $clkperiod * $dpPUT;
#$realDelay = $realTime - $realCTotalVec;
#$realCTPVec = $clkperiod * $dpPUT;

#$realDelay = $dpPUT * $delay;
#$realComputingTime = $dpPUT * $compTime;
#$realCTPVec = $realComputingTime / $vectors;#

#print "\n=========DELAY DP===========\n";
#foreach $row (0..($realDelay-1)){
#    print $curr[$row] . "--$row --\n";
#}
#print "\n=========END DP===========\n";#

#foreach $vec (0..($vectors-1)){
#    print "\nv========Vector $vec Start==========v\n";
#    $offset = $realDelay + $vec*$realCTPVec;
#    my $n = 1;
#    foreach $row ($offset..($offset+$realCTPVec-1)){
#	print $curr[$row] . "--$row - $n--\n";#
#	$n++;
#    }
#    print $realCTPVec-1;
#    print "\n^========Vector $vec End==========^\n";

#}

### Comparative Stats
#if($runcompStat){
#    print "\n====Running Comparative Statistics====\n";
#
#}else{
#    print "\n====Skipping Comparative Statistics====\n";
#}
