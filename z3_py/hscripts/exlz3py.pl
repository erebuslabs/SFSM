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
$defaultxor;
$count = 0;
for $source (sort keys %HoH) {
    for $dest (sort keys %{ $HoH{$source} } ){
	if ($source eq $dest){ #cycle detected
	    delete($HoH{$source}{$source});
	    $newSource = $source."_n";
	    %{$HoH{$newSource}} = %{$HoH{$source}};
	    $HoH{$source}{$newSource} = 1;
	    $HoH{$newSource}{$source} = 1;
	    $count = $ count+1;
	} #end cycle fix
	else{
	    $defaultxor = "($source ^ $dest)";	    
	}
    }
    $count = $ count+1;
}


print "from z3 import *\n";
print "from math import *\n";
print "for bits in range(int(ceil(log($count)/log(2))), $count):\n";
print "\t";
print(join(', ',sort keys %HoH)," = BitVecs(\'");

print(join(' ',sort keys %HoH),"\',bits)\n\n");

print "\ts = Solver();\n\ts.add(Distinct(";
print(join(',',sort keys %HoH),"))\n\n");


for $source (sort keys %HoH) {
    for $dest (sort keys %{ $HoH{$source} } ){
	print addRule($source , $dest, bits);
	print addRule("($source ^ $dest)", $defaultxor, bits);
    }
}

print <<"EOT";

        if(s.check() == sat):
          print "Sat, %d," %(bits),
          m = s.model()
          for d in m.decls():
              print "%s," % (d.name()),
          print " "
          print "ASSIGN, %d," %(bits),
          for d in m.decls():
              print "%s," % (m[d]),
        else:
           print "NotSat, %d, " %(bits),
        print " "
EOT

##############################################################
#for $source (sort keys %HoH) {
#    print "\n$source: ";
#    for $dest (sort keys %{ $HoH{$source} } ){
#	print " $dest ";
#    }
#}
#print "\n";




#############################################################

sub addRule
{
   ($term1, $term2, $bits) = @_;
   $rule = "\ts.add(\n";
   $rule .= printHam($term1, $bits);
   $rule .= " ==\n";
   $rule .= printHam($term2, $bits);
   $rule .= "\n\t)\n";
   return $rule;
}


sub printHam
{
    ($term, $bits) = @_;
    return "\tSum([(($term & (2**(i)))/(2**(i))) for i in range($bits)])";
}
