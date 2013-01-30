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
for $source (sort keys %HoH) {
    for $dest (sort keys %{ $HoH{$source} } ){
	if ($source eq $dest){ #cycle detected
	    delete($HoH{$source}{$source});
	    $newSource = $source."_n";
	    %{$HoH{$newSource}} = %{$HoH{$source}};
	    $HoH{$source}{$newSource} = 1;
	    $HoH{$newSource}{$source} = 1;
	} #end cycle fix
	else{
	    $defaultxor = "($source ^ $dest)";
	}
    }
}


print "from z3 import *\n";

print(join(', ',sort keys %HoH)," = BitVecs(\'");
print(join(' ',sort keys %HoH),"\',8)\n\n");

print "s = Solver();\ns.add(Distinct(";
print(join(',',sort keys %HoH),"))\n\n");


for $source (sort keys %HoH) {
    for $dest (sort keys %{ $HoH{$source} } ){
	print addRule($source , $dest, 8);
	print addRule("($source ^ $dest)", $defaultxor, 8);
    }
}

print <<"EOT";

if(s.check() == sat):
  m = s.model()
  for d in m.decls():
      print "%s, %s" % (d.name(), m[d])
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
   $rule = "s.add(\n";
   $rule .= printHam($term1, $bits);
   $rule .= " ==\n";
   $rule .= printHam($term2, $bits);
   $rule .= "\n)\n";
   return $rule;
}


sub printHam
{
    ($term, $bits) = @_;
    return "Sum([(($term & (2**(i)))/(2**(i))) for i in range($bits)])";
}
