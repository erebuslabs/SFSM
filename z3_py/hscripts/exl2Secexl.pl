#!/usr/bin/perl

my $filename = $ARGV[0];

open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my (%HoH); 

while (my $line = <$fh>) {
    $cline = $line;
    chomp $cline;
    if($cline =~ m/(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/g ){
	push@{$HoH{$3}{$5}}, ($1, $7);
    }
}


$defaultxor;
$count = $newcount = $origcount = 0;
$tran = $newtran = $origtran = 0;
my @array;
for $source (sort keys %HoH) {
    for $dest (sort keys %{ $HoH{$source} } ){
	$origtran++;
	if ($source eq $dest){ #cycle detected
	    @arry = @{$HoH{$source}{$source}};
	    delete($HoH{$source}{$source});
	    $newSource = $source."_n";
	    %{$HoH{$newSource}} = %{$HoH{$source}};	    
	    push@{$HoH{$source}{$newSource}}, @arry;
	    push@{$HoH{$newSource}{$source}}, @arry;
	    $newcount = $newcount+1;
	    $newtran = $newtran +1 + scalar(keys(%{$HoH{$source}})); #+2 -1 + count
	} #end cycle fix
    }
    $origcount = $origcount+1;
}

$count = $origcount + $newcount;
$tran = $origtran + $newtran;

#print "#Total states is $count, including $origcount states and $newcount newstates\n";
#print "#Total transisions is $tran, including $origtran transistions and $newtran new transitions\n";

print ".i ".length($arry[0])."\n";
print ".o ".length($arry[1])."\n";
print ".p ".$tran."\n";
print ".s ".$count."\n\n\n";



for $source (sort keys %HoH) {
    for $dest (sort keys %{ $HoH{$source} } ){
	print "$HoH{$source}{$dest}[0]\t$source\t$dest\t$HoH{$source}{$dest}[1]\n";
    }
}
print ".e \n";

