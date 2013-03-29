#!/usr/bin/perl


use List::MoreUtils qw/ uniq /;
use File::ReadBackwards;


#print $#ARGV ;
#if($#ARGV != 0 || $#ARGV !=1 ){
#    print "usage: exl2oracle.pl fsm.kiss2 [encoding]\n";
#    exit;
#}

my $encfile = "";
my %enchash = {};

if($#ARGV == 1){
    $encfile = $ARGV[1];
    open(my $fh, $encfile) or die("ack - $!");
    my $states = <$fh>;
    close $fh;
    my $encoding  = File::ReadBackwards->new($encfile)->readline;
#    print $encoding;
    $states =~ s/st_//g;
    $states =~ s/\s//g;
    $encoding =~ s/\s//g;
    @stNames =  split(',',$states);
#    @stNames = map {qq|"$_"|} @stNames;

    @encs =split(',',$encoding);


#    foreach $encstring (@encs){
#	print ($encstring) . "\n";
#    }

    #create mapping
    @enchash {@stNames} = @encs;


}

#while ( my ($key, $value) = each(%enchash) ) {
#    print "$key => ", oct($value), "\n";
#}

my $filename = $ARGV[0];
open($fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my (@HoH); 
$obits = 0;
$ibits = 0;
my $currSourceState = -1;
my $newSourceState = 0;

my $switch_clause = "\tswitch(\$currState){\n";

while (my $line = <$fh>) {
    $cline = $line;
    chomp $cline;
    if($cline =~ m/(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/g ){
	my $needed = 0;

	$ibits = length($1)-1;
	$obits = length($7)-1;
	push @{$HoH{$3}{$5}}, ($1, $7);
	my $ivec =  $1;
	$newSourceState = $3;
	$dest = $5; 
	if($newSourceState ne $currSourceState){
	    if($currSourceState > -1){$switch_clause .= "\t\t}\n";}
	    $currSourceState = $newSourceState;
	    $switch_clause .=  "\t\tcase($currSourceState){\n";
	    $switch_clause .= "\t\t\tif(";
	}else{
	    $switch_clause .= "\t\t\telsif(";
	}

	for (my $i = 0; $i < length($ivec); $i++){
	    $key = substr($ivec,$i,1);
	    if($key ne '-'){
		if($needed == 1){ $switch_clause .= " && ";}
		$switch_clause .= "\$ptext[$i] == $key ";
		$needed = 1;
	    }	    
	}
	if($needed == 0){ 
	    $switch_clause .= "1";
	}
	
	my $hwtemp = $enchash{$dest};
	#determine the number of bits used
	my $blength = length($hwtemp)-1;
	$HW = substr(unpack("B32", pack("N", oct($enchash{$dest}) )), -1*$blength) =~ tr/1//;
	$HD = substr(unpack("B32", pack("N", oct($enchash{$dest})^oct($enchash{$currSourceState}))), -1*$blength) =~ tr/1//;

	#$HD = (unpack("%32b*", oct($HW))); # =~ tr/1//);

#	my $HW = (unpack("b$blength", oct($enchash{$dest}) ) =~ tr/1//);
#	my $HD = (unpack("b$blength", (oct($enchash{$currSourceState})^oct($enchash{$dest})) ) =~ tr/1//); 

	$switch_clause .=  "){\$nextState = $dest; \$trans = $currSourceState.\".\".$dest; \$HW = $HW;\$HD = $HD;}\n";
    }

}

$switch_clause .= "\t\t}\n\t}\n";

$count = $newcount = $origcount = 0;
$tran = $newtran = $origtran = 0;

my @states = ();
for $source (sort keys %HoH) {
    push(@states, $source);
}
@states = uniq @states;

#Generate Perl Code
print "#!/usr/bin/perl\n";
print "use Switch;\n";
print "use enum qw(";
foreach (@states){
    print $_, " ";
}
print ");\n";
print "\$currState = 0;\n";
print "#Open Data File from command line\n";
print "my \$filename = \$ARGV[0];\n";

print "open  (fh, \"<\", \$filename);\n";



print "#every $ibits+1 are used as a single round input\n";

print "my \@inputs = (\$data =~ \/";
print "(\d)\s*" x ($ibits+1);
print "\/g);\n";
print "my \$HW;\n";
print "my \$HD;\n";

print "foreach \$temp (\<fh\>) {\n";
print "chomp(\$temp);\n";
print "\@ptext = split(\' \',\$temp);\n";
#print "print \"\@ptext\\t\";\n";
print "print \"\$currState\\t\";\n";
print "my \$nextState = \$currState;\n";
print "my \$trans = -1;\n";

print $switch_clause;

print "print \"\$trans\\t\$HW\\t\$HD\\n\";\n";


print "\t\$currState = \$nextState;\n";
print "}#endwhile\n";
print "close(FILE);\n";

