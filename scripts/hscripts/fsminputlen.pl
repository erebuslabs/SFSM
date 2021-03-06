#!/usr/bin/perl

my $filename = $ARGV[0];
my $rawfname;

if($filename =~ m/(fsm_rd_\d+[_s]*)/){
    $rawfname = $1;
}
elsif($filename =~ m/^(.+)\/(.+)\.kiss2(_s)*/){
  $rawfname = $2.$3;
}
elsif($filename =~ m/^(.+)\.kiss2(_s)*/){
    $rawfname = $1.$2;
}
else{
    $rawfname = "genfsm";
}

open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my (%HoH); 
$obits = 0;
$ibits = 0;

my $switch_clause = "";
my $moutput;
my $currSourceState = "";
my $newSourceState = "b";
my $dest ;
while (my $line = <$fh>) {
    $cline = $line;
    chomp $cline;

    if($cline =~ m/(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/g ){
	($input, $output, $source, $dest) = ($1, $7, $3, $5);
	print length($input);
	exit();
    }
}



