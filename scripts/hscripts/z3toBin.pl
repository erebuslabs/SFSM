#!/usr/bin/perl

my $filename = $ARGV[0];

open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my %hash = ();
$flag = true;
$not_stat = "";
while (my $line = <$fh>) {
    chomp $line;
    @info = split(/,/, $line);
    if($info[0] eq "NotSat"){
	$not_stat .=  "$info[1],\n" ;
    }
    elsif($info[0] eq "Sat"){
	@keys = @info;
    }
    elsif($info[0] eq "ASSIGN"){
	foreach my $idx (2..$#info){
	    if($keys[$idx] =~ m/\S+/){
		$hash{$keys[$idx]} = $info[$idx];
	    }
	} 
	if($flag){
	    print "bits, ";
	    foreach $key (sort keys %hash){
		print "$key, ";
	    }
	    print "\n";
	    $flag = 0;
	}
	print "$info[1], ";
	foreach $key (sort keys %hash){
	    print "$hash{$key}, ";
	}
	print "\n";
	print "$info[1], ";
	foreach $key (sort keys %hash){
	    #Yes I know what I'm doing, leave me alone =)
	    $binStr = substr(unpack("B32", pack("N", $hash{$key})), -1*$info[1]);
	    print "0b$binStr, ";
	}
	print "\n";
    }
}


