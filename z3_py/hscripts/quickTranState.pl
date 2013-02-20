#!/usr/bin/perl
use List::MoreUtils qw/ uniq /;

my $filename = $ARGV[0];

open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my @states, @trans =();

while (my $line = <$fh>) {
    $cline = $line;
    chomp $cline;
    if($cline =~ m/(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/g ){
	push(@states, ($3, $5));
	push(@trans, "$3-$5");
    }
}


$numstates = scalar(uniq(@states));
$numtrans = scalar(uniq(@trans));
$products = scalar(@trans);

print "$numstates, $products, $numtrans, \n";
