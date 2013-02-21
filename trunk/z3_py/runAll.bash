#/usr/bin/bash

for file in $@; do
    base=$file;#"/data.exl" ;
    pythres=$file"_hd4.py"; 
    satres=$file"_hd4.out";
    final=$file"_hd4.csv";
    echo " "
    echo "v=v=v==========$base=============v=v=v"
    echo "Converting the $base file";
    ./hscripts/exlz3py.pl $base > $pythres
    echo "Running Z3 theorem prover on $pythres";
    (time (timeout 1600 python $pythres > $satres;)) 2>&1
    echo "Converting result to binary";
    ./hscripts/z3toBin.pl $satres > $final;
#    echo "moving $pythres isvlis/results/python/.";
#    mv $pythres isvlsi/results/python/.;
#    echo "moving $satres results/raw/.";
#    mv $satres isvlsi/results/raw/.;
#    echo "moving $final results/final/.";
#    mv $final isvlsi/results/final/.;
    echo "^=^=^==========$base=============^=^=^"
    echo " "
done


