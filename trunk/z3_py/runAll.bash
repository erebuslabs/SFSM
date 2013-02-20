#/usr/bin/bash

for file in $@; do
    base=$file;#"/data.exl" ;
    pythres=$file".py"; 
    satres=$file".out";
    final=$file".csv";
    echo " "
    echo "v=v=v==========$base=============v=v=v"
    echo "Converting the $base file";
    ./hscripts/exlz3py.pl $base > $pythres
    echo "Running Z3 theorem prover on $pythres";
    (time (timeout 1600 python $pythres > $satres;)) 2>&1
    echo "Converting result to binary";
    ./hscripts/z3toBin.pl $satres > $final;
    echo "moving $pythres results/python/.";
    mv $pythres results/python/.;
    echo "moving $satres results/raw/.";
    mv $satres results/raw/.;
    echo "moving $final results/final/.";
    mv $final results/final/.;
    echo "^=^=^==========$base=============^=^=^"
    echo " "
done


