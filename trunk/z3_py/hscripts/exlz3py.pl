#!/usr/bin/perl

my $filename = $ARGV[0];

open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my (%HoH); 
while (my $line = <$fh>) {
    chomp $line;
    if($line =~ m/(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/g ){
	$i = $3; $j = $5;
	#$i =~s/[^\d.]//g;
	#$j =~s/[^\d.]//g;
	$HoH{$i}{$j} = 1;
    }
}


for $source (sort keys %HoH) {
    for $dest (sort keys %{ $HoH{$source} } ){
	if ($source eq $dest){
	    delete($HoH{$source}{$source});
	    $newSource = $source."_n";
	    %{$HoH{$newSource}} = %{$HoH{$source}};
	    $HoH{$source}{$newSource} = 1;
	    $HoH{$newSource}{$source} = 1;
	}
    }
}

for $source (sort keys %HoH) {
    print "\n$source: ";
    for $dest (sort keys %{ $HoH{$source} } ){
	print " $dest ";
    }
}
print "\n";
