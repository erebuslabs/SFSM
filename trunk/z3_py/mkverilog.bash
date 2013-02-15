#/usr/bin/bash

for file in $@; do
    base=$file"/data.exl" ;
    vermain=$file".v";
    verstassign=$file"_stassign.v";
    resultloc="results/raw/"${file:(-10)}".out"
#    pythres=$file".py"; 
#    satres=$file".out";
#    final=$file".csv";
 
    echo " "
    echo "v=v=v==========$base=============v=v=v"
    echo "Converting the $base file";
    ./hscripts/exl2verilog.pl $base > $vermain
    ./hscripts/createSassign.pl $resultloc > $verstassign
#    echo "Running Z3 theorem prover on $pythres";
#    (time (timeout 1600 python $pythres > $satres;)) 2>&1
#    echo "Converting result to binary";
#    ./hscripts/z3toBin.pl $satres > $final;
#    echo "moving $pythres results/python/.";
#    mv $pythres results/python/.;
#    echo "moving $satres results/raw/.";
#    mv $satres results/raw/.;
#    echo "moving $final results/final/.";
#    mv $final results/final/.;
    mv $vermain results/verilog/.;
    mv $verstassign results/verilog/.;
    echo "^=^=^==========$base=============^=^=^"
#    echo " "
done


