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
my $filename = $ARGV[0];

open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my @farray = <$fh>;
my @states = grep /parameter/, @farray;
my $bitsneeded  = ceil(log($#states+1)/log(2));


for($i = 0; $i < $#states+1; $i++){
    $bineqv = $i;
    #my $statenum = $i;
    $bineqv = substr(unpack("B32", pack("N", $bineqv)), -1*$bitsneeded);
    $states[$i] =~ s/\d+\'b\d+;/$bitsneeded\'b$bineqv;/g;
    print $states[$i]; #"\tparameter $states[$i] = $bitsneeded\'b$bineqv;\n";
}

$len = $bitsneeded-1;
print "\treg[$len:0] State;\n";
print "\treg[$len:0] NextState;\n";


