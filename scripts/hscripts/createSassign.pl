#!/usr/bin/perl

#this script returns the state names and assignments
#Uses the raw data file as a starting point
#Secondary, will log all jobs that need to be rerun (e.g. empty file or misprint)

my $filename = $ARGV[0];
open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my (@line1, @line2, @line3, @states, @values) = ();

while(my $lof =  <$fh>) {
#    print "-->$lof\n";
#    print $lof;
    chomp ($lof);    
    if(substr($lof, 0,6) ne "NotSat" && (substr($lof,0,6) eq "ASSIGN" || substr($lof,0,3) eq "Sat"))    {

	@line3 = @line2;
	@line2 = @line1;
	@line1 = split(/\,/ , $lof);
#	print (@line1) . "\n";
    }
}#end parse by line


if($line1[0] eq 'NotSat' && length(@line2)==length(@line3) && $line2[1]==$line3[1]){
    #awesome, we just use @line3 for state names, and @line2 for assignment
  #  print "l2 and l3 have ".(scalar(@line2)-3)." states\n";
  #  print (@line2);

#    print "\n";
#    print (@line3);
#    print "\n";
    @values = @line2;
    @states = @line3;
}#else check to see if the last two lines contain the same number of elements
elsif(length(@line1)== length(@line2) && $line1[1]==$line2[1]){
   # print "l1 and l2 have ".(scalar(@line2)-3)." states\n";
   # print (@line1);
   # print "\n";
   # print (@line2);
   # print "\n";
    @values = @line1;
    @states = @line2;
}
elsif(length(@line2) == length(@line3) && $line2[1]==$line3[1]){
  #  print "l2 and l3 have ".(scalar(@line2)-3)." states\n";
  #  print (@line2);
  #  print "\n";
  #  print (@line3);
  #  print "\n";
    @values = @line2;
    @states = @line3;
}

for($i = 2; $i < scalar(@states)-1; $i++){
    $bineqv = $values[$i];
    $bineqv = substr(unpack("B32", pack("N", $values[$i])), -1*$values[1]);
    print "\tparameter $states[$i] = $values[1]\'b$bineqv;\n";
}

$len = $values[1]-1;
print "\treg[$len:0] State;\n";
print "\treg[$len:0] NextState;\n";


