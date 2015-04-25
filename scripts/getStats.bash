#/usr/bin/bash

for file in $@; do
    base=$file ;
    echo -ne ${base} ," "
    ./hscripts/quickTranState.pl $base
done


