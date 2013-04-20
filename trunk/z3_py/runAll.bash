#/usr/bin/bash

for file in $@; do

    base=$file;

    search_dist=6;
    hdon=0;
    hwon=0;
    hd_val=0;
    hw_val=0;
    timeout=600000;
    
    optstring="_hw_"$hwon"_hd_"$hdon"_hwVal_"$hw_val"_hdVal_"$hd_val;
    
#    $optstring= ${optstring//1/on};   
#    $optstring=${optstring//0/off};  
#    $optstring.="_hwVal_$hw_val_hdVal_$hd_val";
#    $optstring=${optstring/0/eq};

    pythres=$file$optstring"_.py"; 
    
    satres=$file$optstring".out";
    final=$file$optstring".csv";

    echo " "
    echo "v=v=v==========$base=============v=v=v"
    echo "Converting the $base file";
    ./hscripts/exlz3py.pl $base $search_dist $hwon $hdon $hw_val $hd_val $timeout > $pythres
    echo "Running Z3 theorem prover on $pythres";
    (time (python $pythres > $satres;)) 2>&1
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


