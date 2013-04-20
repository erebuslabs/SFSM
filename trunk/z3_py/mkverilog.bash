#/usr/bin/bash

for file in $@; do

    base=$file; #"/data.exl" ;
    vermain=${file:0:${#file}-4}".v";

    fname=$(echo $base | rev | cut -d'/' -f1 | rev);
    $fname=$(echo {$fname%.*});

    resultloc="results/raw/"$fname"*.out"


    verstassign=${fname:0:${#fname}-4}"_stassign.v";

#    pythres=$file".py"; 
#    satres=$file".out";
#    final=$file".csv";
 
    echo " "
    echo "v=v=v==========$base=============v=v=v"
    echo "Converting the $base file";

    ./hscripts/exl2verilog.pl $base > $vermain
    ./hscripts/createSassign.pl $resultloc > $verstassign

    mv $vermain results/verilog/.;
    mv $verstassign results/verilog/.;
    echo "^=^=^==========$base=============^=^=^"
#    echo " "
done


