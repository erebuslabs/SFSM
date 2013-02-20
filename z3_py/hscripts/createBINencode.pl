#!/usr/bin/perl
use POSIX qw(ceil);
#this script returns the state names and assignments
#Uses the raw data file as a starting point
#Secondary, will log all jobs that need to be rerun (e.g. empty file or misprint)

my $numStates = $ARGV[0];

my $bitsneeded  = ceil(log($numStates)/log(2));

for($i = 0; $i < $numStates; $i++){
    $bineqv = $i;
    my $statenum = $i+1;
    $bineqv = substr(unpack("B32", pack("N", $bineqv)), -1*$bitsneeded);
    print "\tparameter st$statenum = $values[1]\'b$bineqv;\n";
}

$len = $bitsneeded-1;
print "\treg[$len:0] State;\n";
print "\treg[$len:0] NextState;\n";


