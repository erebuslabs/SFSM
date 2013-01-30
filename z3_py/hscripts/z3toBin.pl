#!/usr/bin/perl

my $filename = $ARGV[0];

open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

while (my $line = <$fh>) {
    chomp $line;
    @info = split(/,/, $line);
    print "\n$info[0] \t,\t";
    printf "%#b", ($info[1]);    
}
print "\n";
