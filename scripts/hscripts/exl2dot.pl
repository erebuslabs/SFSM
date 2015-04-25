#!/usr/bin/perl

my $filename = $ARGV[0];

open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my (%HoH); 

while (my $line = <$fh>) {
    $cline = $line;
    chomp $cline;
    if($cline =~ m/(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/g ){
	push@{$HoH{$3}{$5}}, ($1, $7);
    }
}


$defaultxor;
$count = $newcount = $origcount = 0;
$tran = $newtran = $origtran = 0;

$count = $origcount + $newcount;
$tran = $origtran + $newtran-$newcount;

print "#Total states is $count, including $origcount states and $newcount newstates\n";
print "#Total transisions is $tran, including $origtran transistions and $newtran new transitions\n";
print "digraph finite_state_machine {\n";
print "\trankdir=LR;\n";
print "\tsize=\"20,20\";\n";
print "\tresolution=\"300\";\n";

print "\toverlap=false;\n";
print "\n\tnode [shape = circle, fixedsize=true, width = 1, color = red, style = filled];\n";
for $source (sort keys %HoH) {
    if(substr($source,-2, 2) eq '_n'){
	print "\t$source;\n ";
    }
}
#print ";\n";
print "\n\tnode [shape = circle, color = black, style = unfilled];\n";
for $source (sort keys %HoH) {
    if(substr($source,-2, 2) ne '_n'){
	print "\t$source;\n ";
    }
}

for $source (sort keys %HoH) {
    for $dest (sort keys %{ $HoH{$source} } ){
	print "\t$source -> $dest;\n";
    }
}
print "}\n";

