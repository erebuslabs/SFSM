#!/bin/bash

loc="ben_new"
mkdir $loc;

base="m"
maxsize=50
loops=100
connect=20

for ((i=5; i <=$maxsize; i=i+10))
do

    for((j=0; j <= $loops; j=$j+25))
    do
	fname=${base}"_node_"$i"_loop_"$j"_conp_"$connect".kiss2"
	./hscripts/genFSMBen.pl $i $j $connect > $loc/$fname
    done
done



