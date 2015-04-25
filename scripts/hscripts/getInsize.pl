#!/usr/bin/perl
use List::MoreUtils qw/ uniq /;

my $filename = $ARGV[0];

open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my $inputs;
while (my $line = <$fh>) {
    $cline = $line;
    chomp $cline;
    if($cline =~ m/(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/g ){
	$inputs = $1;
    }
}

$numinputs = length($inputs);
print " $numinputs ";

