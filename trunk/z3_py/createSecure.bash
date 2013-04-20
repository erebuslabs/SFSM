#/usr/bin/bash


for file in $@; do

    base=${file%%.*}; #"/data.exl" ;
    secfile=$base"_s.kiss2";
    
    gv=$base".gv";
    sgv=$base"_s.gv";

    dot=$base".png";
    sdot=$base"_s.png";

    echo " "
    echo "v=v=v==========$base=============v=v=v"
    echo "Converting the $base file to secure $secfile";
    ./hscripts/exl2Secexl.pl $file > $secfile
    echo "Converting both files to dot file";
    echo "=Converting the $base file to $gv";
#    ./hscripts/exl2dot.pl $base > $gv;
    echo "=Converting the $secfile file to  $sgv";
#    ./hscripts/exl2dot.pl $secfile > $sgv;
    echo "Converting $gv to $dot";
#   neato -Tpng $gv -o $dot 

    echo "Converting $sgv to $sdot";
#    dot -Tpng $sgv -o $sdot 


   # fname=$(echo $file | cut -d'/' -f2)
   # echo "copying $base bmarks/orig/$fname.exl";
   # cp $base bmarks/orig/$fname.exl

 #   echo "moving $secfile bmarks/secure/.";
 #   mv $secfile bmarks/secure/.;

#    echo "moving $dot results/viz/gv/.";
#    mv $gv results/viz/gv/.;

 #   echo "moving $sdot results/viz/gv/.";
  #  mv $sgv results/viz/gv/.;

  #  echo "moving $dot results/viz/gv/.";
  #  mv $dot results/viz/png/.;

#    echo "moving $sdot results/viz/gv/.";
#    mv $sdot results/viz/png/.;

    echo "^=^=^==========$base=============^=^=^"
    echo " "
done


