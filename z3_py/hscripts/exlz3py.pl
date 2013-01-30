#!/usr/bin/perl

my $filename = $ARGV[0];

open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my (%HoH); 
while (my $line = <$fh>) {
    chomp $line;
    if($line =~ m/(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/g ){
	$HoH{$3}{$5} = 1;
    }
}

for $source (sort keys %HoH) {
    for $dest (sort keys %{ $HoH{$source} } ){
	if ($source eq $dest){ #cycle detected
	    delete($HoH{$source}{$source});
	    $newSource = $source."_n";
	    %{$HoH{$newSource}} = %{$HoH{$source}};
	    $HoH{$source}{$newSource} = 1;
	    $HoH{$newSource}{$source} = 1;
	} #end cycle fix
    }
}

##############################################################
for $source (sort keys %HoH) {
    print "\n$source: ";
    for $dest (sort keys %{ $HoH{$source} } ){
	print " $dest ";
    }
}
print "\n";

#############################################################

sub add
{
   ($numbera, $numberb) = @_;

   $result = $numbera + $numberb;
   print "The result was: $result\n";
}
