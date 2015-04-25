#!/usr/bin/perl

# WARNING
# This script creates a minimal binary encoding 
# for states 0 - n (the number is obviously going to be wrong for duplicates)
# UM THIS SCRIPT IS BROKEN!

# Input  numberStates Prefix
# Output
# parameter st0 = 
#
#
#
#

use POSIX qw(ceil);
my $numStates = shift;
my $prefix = shift;


my $bitsneeded  = ceil(log($numStates)/log(2));
for($i = 0; $i < $numStates; $i++){
    $bineqv = $i;
    my $statenum = $i;
    $bineqv = substr(unpack("B32", pack("N", $bineqv)), -1*$bitsneeded);
    print "\tparameter $prefix$statenum = $values[1]\'b$bineqv;\n";
}

$len = $bitsneeded-1;
print "\treg[$len:0] State;\n";
print "\treg[$len:0] NextState;\n";


