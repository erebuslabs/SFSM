#!/usr/bin/bash

for file in $@; do
    base=$file; 
    fname=$(echo $base | rev | cut -d'/' -f1 | rev);
    $fname=$(echo {$fname%.*});
    rname=$(echo $fname | cut -d'_' -f1);


    verstassign=${rname}"_hw_0_hd_0_hwVal_0_hdVal_0_stassign.v";
 
    echo " "
    echo "v=v=v==========$base=============v=v=v"
    echo "Converting the $base file";
    ./hscripts/automin.pl $base > $verstassign 

#    mv $verstassign results/verilog/.;
    echo "^=^=^==========$base=============^=^=^"

done


