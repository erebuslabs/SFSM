#!/usr/bin/perl


use List::MoreUtils qw/ uniq /;
use File::ReadBackwards;



#print $#ARGV ;
#if($#ARGV != 0 || $#ARGV !=1 ){
#    print "usage: exl2oracle.pl fsm.kiss2 [encoding]\n";
#    exit;
#}
my $encfile = "";
if($#ARGV == 1){
    $encfile = $ARGV[1];
    open(my $fh, $encfile) or die("ack - $!");
    my $states = <$fh>;
    close $fh;
    my $encoding  = File::ReadBackwards->new($encfile)->readline;
    $states =~ s/st_//g;
    @stNames =  split(',',$states);
    
    @encs =split(',',$encoding);
    foreach $encstring (@encs){
	print oct($encstring) . "\n";
    }
    print "--> @stNames\n";
    print "--> @encs\n";
    #create mapping

    #expecting this format:

}

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
#	    
	}
	if($needed == 0){ $switch_clause .= "1";};
	$switch_clause .=  "){\$nextState = $dest; \$trans = $currSourceState.\".\".$dest;}\n";
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

print "foreach \$temp (\<fh\>) {\n";
print "chomp(\$temp);\n";
print "\@ptext = split(\' \',\$temp);\n";
#print "print \"\@ptext\\t\";\n";
print "print \"\$currState\\t\";\n";
print "my \$nextState = \$currState;\n";
print "my \$trans = -1;\n";

print $switch_clause;

print "print \"\$trans\\n\";\n";
print "\t\$currState = \$nextState;\n";
print "}#endwhile\n";
print "close(FILE);\n";

