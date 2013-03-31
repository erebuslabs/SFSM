#/usr/bin/bash

for file in $@; do

    base=$file;

    search_dist=4;
    hd_on=1;
    hw_on=1;
    hd_val=0;
    hw_val=0;
    
    
    optstring="_hw_"$hw_on"_hd_"$hd_on;
    $optstring =  ${optstring//1/on}   
    $optstring =  ${optstring//0/off}  
    $optstring .= "hwVal_"$hw_val"_hdVal_"$hd_val;
    $optstring =  ${optstring//0/equal}

    pythres=$file$optstring"_.py"; 
    
    satres=$file$optstring".out";
    final=$file$optstring".csv";

    echo " "
    echo "v=v=v==========$base=============v=v=v"
    echo "Converting the $base file";
    ./hscripts/exlz3py.pl $base $search_dist $hw_on $hd_on $hw_val $hd_val > $pythres
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


