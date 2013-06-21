#!/bin/bash

for file in $@; do
    base=${file:0:${#file}-6};
    search_dist=30;
    hdon=1;
    hwon=1;
    hd_val=2;
    hw_val=0;
    timeout=10000000;
    
    optstring="_hw_"$hwon"_hd_"$hdon"_hwVal_"$hw_val"_hdVal_"$hd_val;
    
#    $optstring=${optstring//1/on};   
#    $optstring=${optstring//0/off};  
#    $optstring.="_hwVal_$hw_val_hdVal_$hd_val";
#    $optstring=${optstring/0/eq};

    pythres=$base$optstring".py"; 
    satres=$base$optstring".out";
    final=$base$optstring".csv";
    vermain=$base$optstring".v";
    verstassign=$base$optstring"_stassign.v";

    echo " "
    echo "v=v=v==========$base=============v=v=v"
    echo "Converting the $base file";
    ./hscripts/exlz3py.pl $file $search_dist $hwon $hdon $hw_val $hd_val $timeout > $pythres
    echo "Running Z3 theorem prover on $pythres";
    (time (timeout 250000 python $pythres > $satres;)) 2>&1
    echo "Converting result to binary";
    ./hscripts/z3toBin.pl $satres > $final;
    
    ./hscripts/exl2verilog.pl $file > $vermain
    ./hscripts/createSassign.pl $satres > $verstassign

    echo "moving $pythres results/python/.";
    mv $pythres results/python/.;
    echo "moving $satres results/raw/.";
    mv $satres results/raw/.;
    echo "moving $final results/final/.";
    mv $final results/final/.;

    echo "moving $vermain results/verilog/.";
    mv $vermain results/verilog/.;

    echo "moving $final results/verilog/.";
    mv $verstassign results/verilog/.;


    echo "^=^=^==========$base=============^=^=^"
    echo " "
done


