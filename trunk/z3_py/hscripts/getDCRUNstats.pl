#!/usr/bin/perl

use List::MoreUtils qw/ uniq /;

#my $filename = $ARGV[0];

#should add check loops in this listing...

($filename, @searchstrings) = (@ARGV);

open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

while (my $line = <$fh>) {
    chomp $line;
    if($line =~ m/ $_:\s+(S+)\s*/g) for @searchstrings{
	print $1 ","
    }
}
print "\n";

