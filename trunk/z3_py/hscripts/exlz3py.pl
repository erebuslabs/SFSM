#!/usr/bin/perl
use List::MoreUtils qw/ uniq /;

#my $filename = $ARGV[0];

#should add check loops in this listing...
my ($search_dist, $hw_on, $hd_on, $hw_val, $hd_val, $timeout) = (4,1,1,0,0, 30000);

($filename, $search_dist, $hw_on, $hd_on, $hw_val, $hd_val, $timeout) = (shift, shift, shift, shift, shift, shift, shift);

open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my (%HoH); 
my @states, @trans;
my $defaultxor;

while (my $line = <$fh>) {
    chomp $line;
    if($line =~ m/(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/g ){
#	$HoH{$3}{$5} = 1;
	($source, $dest) = ($3, $5);
	if($source+0 == $source){
	    $source = "st_$source";
	}
	if($dest+0 == $dest){
	    $dest = "st_$dest";
	}
	push(@states, ($source, $dest));
	push(@trans, "$source:$dest");
	if($source ne $dest){
	    $defaultxor = "($source ^ $dest)";	    
#	    $defaultxor = "defaultBV";
	}
   }
}

@states = uniq(@states);
@trans = uniq(@trans);
$count = scalar(@states);



print "from z3 import *\n";
print "from math import *\n";

print "for bits in range(int(ceil(log($count)/log(2))+$search_dist),  int(ceil(log($count)/log(2))-1), -1):\n";
#print "for bits in range($count, int(ceil(log($count)/log(2))), -1):\n";
#print "for bits in range($count-1, $count):\n";
print "\t";


print(join(', ',@states)," = BitVecs(\'");
print(join(' ', @states),"\',bits)\n\n");

#print "\tdefaultBV = BitVecVal(1, bits)\n";

print "\ts = Solver();\n";
print "\ts.set(\"timeout\", $timeout)\n";

print "\ts.add(Distinct(";

print(join(',',@states),"))\n\n");

foreach $sdpair (@trans){
    ($source, $dest) = split(/:/, $sdpair);
 
    if($hw_on){
	if($hw_val <= 0){
	    print addEqHWRule($source , $dest, bits);
	}
	else{
	    print addEqBitsRule("$source", $hw_val , bits);#$defaultxor, bits);
	    print addEqBitsRule("$dest", $hw_val , bits);#$defaultxor, bits);
	}
    }
    if($source ne $dest){
	if($hd_on){
	    if($hd_val <= 0){
		print addEqHWRule("($source ^ $dest)", $defaultxor, bits);
	    }
	    else{
		print addEqBitsRule("($source ^ $dest)", $hd_val , bits);
	    }
	}
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
           print "NotSat, %d," %(bits),
           print " "
           sys.exit()
        print " "
        sys.stdout.flush()
EOT

#############################################################

sub addEqHWRule
{
   ($term1, $term2, $bits) = @_;
   $rule = "\ts.add(\n";
   $rule .= printHam($term1, $bits);
   $rule .= " ==\n";
   $rule .= printHam($term2, $bits);
   $rule .= "\n\t)\n";
   return $rule;
}

sub addEqBitsRule
{
   ($term1, $term2, $bits) = @_;
   $rule = "\ts.add(\n";
   $rule .= printHam($term1, $bits);
   $rule .= " ==";
 #  $rule .= printHam($term2, $bits);
   $rule .= $term2;
   $rule .= "\n\t)\n";
   return $rule;
}

sub printHam
{
    ($term, $bits) = @_;
#    $ceil = ceil(log($bits)/log(2))+1;
#    return "\tSum([(($term & (2**(i)))/(2**(i))) for i in range(bits)])";
   return "\tSum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,$term)) for i in range(bits) ])";

}
