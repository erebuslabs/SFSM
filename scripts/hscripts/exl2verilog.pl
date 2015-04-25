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
    my $needed = 0;
    $cline = $line;
    chomp $cline;
    if($cline =~ m/(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/g ){
#	push@{$HoH{$3}{$5}}, ($1, $7);
	($input, $output, $source, $dest) = ($1, $7, $3, $5);

	$ibits = length($input)-1;
	$obits = length($output)-1;
	$moutput = $output;
	my $ivec =  $1;
	$moutput =~ s/-/x/g; 
	$newSourceState = $source;

	if($newSourceState ne $currSourceState){ 
	    if($currSourceState ne ""){
		$switch_clause .= "\t\trtext <= $numbits\'b$moutput;\n"; 
		$switch_clause .= "\t  end\n";
	    }
	    $currSourceState = $newSourceState;
	    $switch_clause .=  "\t  st_$newSourceState: begin\n";
	    $switch_clause .=  "\t\tif(";
	}else{
	    $switch_clause .= "\t\telse if(";
	}

	for (my $i = 0; $i < length($ivec); $i++){
	    $key = substr($ivec,$i,1);
	    if($key ne '-'){
		if($needed == 1){ $switch_clause .= " && ";}
		$switch_clause .= "ptext[$i] == $key ";
		$needed = 1;
	    }
#	    
	}
	if($needed == 0){ $switch_clause .= "1";};
	$switch_clause .=  ")\n \t\t  NextState <= st_$dest;\n";
    }
}

$switch_clause .= "\t\trtext <= $numbits\'b$moutput;\n"; 
$switch_clause .= "\t  end\n";



print "module $rawfname (RST, CLK, ptext, rtext);\n";
print "//user interface\n";
print "\tinput RST, CLK;\n";
print "\tinput [$ibits:0] ptext;\n";
print "\toutput[$obits:0] rtext;\n";
print "\treg [$obits:0] rtext;\n";

print "//STATE ASSIGNMENTS\n";
$raw_assign = $rawfname."_stassign.v";
print "\t`include \"$raw_assign\";\n";

print <<"EOT";
   //process modeling state register
   always @ (posedge RST or posedge CLK) begin
      if( RST == 1) begin
	 State <= st_st1;
      end
      else
	State <= NextState;
   end
   always @ (State or ptext) begin
      case ( State )
EOT

    print $switch_clause;
print <<"EOT";
      endcase // case ( State )
   end // always @ (State or ptext)   
endmodule // fsm
EOT
