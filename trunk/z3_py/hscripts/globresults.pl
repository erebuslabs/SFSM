#!/usr/bin/perl

#this script returns the state names and assignments
#Uses the raw data file as a starting point
#Secondary, will log all jobs that need to be rerun (e.g. empty file or misprint)

my $filename = $ARGV[0];
open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my (@line1, @line2, @line3) = ();
while(my $lof =  <$fh>) {
    chomp $lof;
    
    @line3 = @line2;
    @line2 = @line1;
    @line1 = split(/,/ , $lof);

}#end parse by line

if($line1[0] eq NotSat && length(@line2)==length(@line3) && $line2[1]==$line3[1]){
    #awesome, we just use @line3 for state names, and @line2 for assignment
    print "using the two previous lines!\n";
    print "l2 and l3 match\n";
    print (@line2);
    print "\n";
    print (@line3);
    print "\n";
}#else check to see if the last two lines contain the same number of elements
elsif(length(@line1)== length(@line2) && $line1[1]==$line2[1]){
    print "l1 and l2 match in size\n";
    print (@line1);
    print "\n";
    print (@line2);
    print "\n";
}
elsif(length(@line2)== length(@line3) && $line2[1]==$line3[1]){
    print "l2 and l3 match in size\n";
    print (@line2);
    print "\n";
    print (@line3);
    print "\n";
}
