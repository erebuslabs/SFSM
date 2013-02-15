#!/usr/bin/perl

my $filename = $ARGV[0];

open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my (%HoH); 
my (@newStateStrings);
my @data;    
my $trans = 0;
my $state = 0;
my $inputlen, $outputlen;
while (my $line = <$fh>) {
    $cline = $line;
#    chomp $cline;
    if($cline =~ m/(\S+|[\-]+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/g ){
  	push(@data, ($3,$5,$1,$7));
	$inputlen = $1;
	$outputlen = $7;

    }
}

my $flag = 0;
my $currSourceState = "st1"; 
my (@dest_list, @in_list, @out_list);

for (my $idx = 0; $idx < $#data+1; $idx=$idx+4){
    my ($source, $dest, $input, $output) = @data[$idx..$idx+3];
    # print "($source, $dest, $input, $output) \n";
    if($source eq $currSourceState){
	#create matrix
	if($source eq $dest){$flag = 1;}
	push(@dest_list, $dest);
	push(@in_list, $input);
	push(@out_list, $output);
    }
    else{
	$state++;
	#new state check if we need to duplicate all the previous ones
	
	if($flag == 1){
	    $state++;
	    my $sourceLen = $#dest_list+1;
	    my @dup_list = @dest_list;
	    for(my $idx2 = 0; $idx2 < $sourceLen; $idx2++){
		if($dest_list[$idx2] eq $currSourceState){
		    $dest_list[$idx2] = $currSourceState."_n";
		}
		print "@in_list[$idx2]\t$currSourceState\t@dest_list[$idx2]\t@out_list[$idx2]\n";
		$trans++;
	    }
	    for(my $idx2 = 0; $idx2 < $sourceLen; $idx2++){
		print "@in_list[$idx2]\t".$currSourceState."_n\t@dup_list[$idx2]\t@out_list[$idx2]\n";
		$trans++;
	    }
	    $flag = 0;
	}
	else{
	    my $sourceLen = $#dest_list+1;
	    for(my $idx2 = 0; $idx2 < $sourceLen; $idx2++){
		print "@in_list[$idx2]\t$currSourceState\t@dest_list[$idx2]\t@out_list[$idx2]\n";
		$trans++;
	    }
	}
	
	$currSourceState = $source;	
	@dest_list =  $dest;
	@in_list = $input;
	@out_list, $output;
	
    }
}

$state++;
#need to grab the last entry
if($flag == 1){
    $state++;
    my $sourceLen = $#dest_list+1;
    my @dup_list = @dest_list;
    for(my $idx2 = 0; $idx2 < $sourceLen; $idx2++){
	if($dest_list[$idx2] eq $currSourceState){
	    $dest_list[$idx2] = $currSourceState."_n";
	}
	print "@in_list[$idx2]\t$currSourceState\t@dest_list[$idx2]\t@out_list[$idx2]\n";
	$trans++;
    }
    for(my $idx2 = 0; $idx2 < $sourceLen; $idx2++){
	print "@in_list[$idx2]\t".$currSourceState."_n\t@dup_list[$idx2]\t@out_list[$idx2]\n";
	$trans++;
    }
    $flag = 0;
}
else{
    my $sourceLen = $#dest_list+1;
    for(my $idx2 = 0; $idx2 < $sourceLen; $idx2++){
	print "@in_list[$idx2]\t$currSourceState\t@dest_list[$idx2]\t@out_list[$idx2]\n";
	$trans++;
    }
}


print ".i ".length($inputlen)."\n";
print ".o ".length($outputlen)."\n";
print ".p ".$trans."\n";
print ".s ".$state."\n\n\n";
print ".e \n";

