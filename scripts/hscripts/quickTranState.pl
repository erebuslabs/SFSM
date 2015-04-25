#!/usr/bin/perl
use List::MoreUtils qw/ uniq /;

my $filename = $ARGV[0];

open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my @states, @trans =();
my $inputs;
while (my $line = <$fh>) {
    $cline = $line;
    chomp $cline;
    if($cline =~ m/(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/g ){
	$inputs = $1;
	push(@states, ($3, $5));
	push(@trans, "$3-$5");
    }
}

$numinputs = length($inputs);
$numstates = scalar(uniq(@states));
$numtrans = scalar(uniq(@trans));
$products = scalar(@trans);
print "$numinputs\n";
print "$numstates, $products, $numtrans, \n";
