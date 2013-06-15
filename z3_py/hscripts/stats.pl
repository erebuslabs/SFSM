#!/usr/bin/perl -w
#use strict;


use POSIX;
use Statistics::Descriptive;
use Graphics::GnuplotIF qw(GnuplotIF);
use List::Util qw(sum min max);

use List::MoreUtils qw(uniq minmax);
#use Math::GSL::Statistics qw /:all/;
#use PDL::Stats::Basic;

use Statistics::Basic qw(:all nofill);
sub jpdf (\@\@);
sub jprob($$\@\@);
sub MI(\@\@);
sub hh2aa(\%);
sub xmarg($\@\@);
sub ymarg($\@\@);
#############


my $localstats = Statistics::Descriptive::Full->new();

my ($datfile, $delay, $vectors, $clkperiod, $sampleRate, $oracle) = @ARGV; 

my $runcompStats = 1;

if($#ARGV < 4 || $#ARGV > 5){
    print "USAGE: ./stats.pl datafile delay numvectors clkper samplerate [oracle]\n";
    exit(0);
}elsif($#ARGV != 5){
    $runcompStats = 0;
}

my $compTime = $vectors * $clkperiod;
my $totalTime = $compTime + $delay;
my $dpPUT = $sampleRate; #dpPUT: datapoint per Unit Time
my $delayEnd = $sampleRate * $delay;
my (@data, @row, @qrow);

### READ DAT FILE and Construct###
my $idx = 0;
my $VecCnt = 0;
my $tmpvectCnt = 0;
open(my $dfm, $datfile) or die("ack error - $!");
my(@maxcurr, @meancurr);
my $slopmean = 1;
while(<$dfm>){
    if(m/^(\d+)\s+([-\d]+)\s*$/ && $idx > $delayEnd){
	my $current = sprintf("%f",$2);
	if ($current < 0){ $current = $slopmean;}
	my $absIdx = ($idx - $delayEnd) % ($sampleRate*$clkperiod);
	push(@data, $current);
	
	if($absIdx == 0){
	    $tmpvectCnt++;
	    if($tmpvectCnt >= 10 && $tmpvectCnt+10 <= $vectors){
		$VecCnt++;
		
#At this point,compute items concerning this single vec
		#e.g. MAX curr 
		#my @qa = quantize(15, @data);
		my @qa = linearq(15, @data);
		$localstats->add_data(@data);
		
		push @maxcurr, $localstats->max(); #maxcurr holds maxcurr per round 
		$slopmean = $localstats->mean();
		push @meancurr, $slopmean; #meancurr per round
		push @row, [@data];    
		push @qrow, [@qa];
		$localstats->clear();	    		

	    }
	    delete @data[0..$#data];

	}
    }
    $idx++;
}
close $dfm;


### END READ DAT FILE and Construct###
################################################################################
#Compute Agregate Stats for all entries
print "\nStatisticts n=",($VecCnt-1);
$localstats->add_data(@maxcurr);
print "\nmax curr,",$localstats->max();
print "\nmean max curr,",$localstats->mean(); 
$localstats->clear();
$localstats->add_data(@meancurr);
print "\nmean curr,",$localstats->mean(); 
$localstats->clear();

#### Handle the models
my @Models;
my @modelCorr;

my $rndidx = 0;
if($runcompStats==1){
    print "\nRunning Stats based on Model File\n";
    open(my $dfmodel, $oracle) or die("ack error - $!");

    while(<$dfmodel>){
	@mentry = split(/\s+/);
	$rndidx++;	
	if($rndidx == 1){
	    my @tmp;
	    @Models = map{ [@tmp]} 0..$#mentry;
	}
	if($rndidx >= 10 && ($rndidx+10) <= $vectors){
	    foreach $midx (0..$#mentry){
		push(@{$Models[$midx]}, $mentry[$midx]); 
		
	    }    

	}
	
	
    }
    print "Rounds in model used: ",$rndidx;
    close $dfmodel;
}
else{
### TEMP FOR RAND VECTOR TESTING ONLY ###
    print "\nRunning Stats based on Rand Data Models \n";
    my @rand = map { int(rand(4)+1 ) } (1..$VecCnt);
    push(@Models, [@rand]);
    @rand = map { int(rand(4)+1 ) } (1..$VecCnt);
    push(@Models, [@rand]);
}


my (@modMeans, @modStdDev, @modVariance, @modMin, @modMax, @modUniq); 
my @temp = ();
foreach $model (@Models){
    my @tempdata = @{$model};
    $localstats->add_data(@tempdata);
    push(@modMeans, $localstats->mean());
    push(@modVariance, $localstats->variance());
    push(@modStdDev, $localstats->standard_deviation());
    push(@modMin, $localstats->min());
    push(@modMax, $localstats->max());
    push(@modUniq, scalar(uniq(@tempdata)));
    $localstats->clear();
    #dynamic array of arrays creation
    push(@modelCorr, [@temp]);
}


#print3D(@row);

my (@mean, @variance, @std_dev, @corrdp, @kurtosis);
my (@allDPVecs, @allQAVecs);
my $model_idx = 0;

#Itterate over each datapoint 
foreach $dpidx (0..($sampleRate*$clkperiod)-1){ 
    #WHAT INFO IS NICE OVER EACH dp : mean, var, CORRELATION pvec, 
    #create a datapoint vector 
    foreach $ridx(0..$VecCnt-1){
	push @dpvec, $row[$ridx][$dpidx];
   }
    #compute local stats
    $localstats->add_data(@dpvec);
    #need mean and std later
    my $dpvec_mean = $localstats->mean();
    my $dpvec_std_dev = $localstats->standard_deviation(); 

    push(@mean, $dpvec_mean);
    push(@variance, $localstats->variance());
    push(@std_dev, $dpvec_std_dev);
    push(@kurtosis, $localstats->kurtosis()); 
    
    $localstats->clear();
    
    $model_idx = 0;
    #compute the correlation for against each model
#    my @qavec = quantize(15, @dpvec);
    my @qavec = linearq(15, @dpvec);
    foreach $model (@Models){
	my $pearsons = 0;
#	print "\nLength of Model ", scalar(@$model);
	#Working with Quantized vector instead of "real one"
	#are we quantizing correctly??? HERE
	if(stddev(\@$model) != 0 && stddev(\@qavec)!= 0){	
	    $pearsons = correlation(\@$model,\@qavec);
	}

#	if(stddev(\@$model) != 0 && stddev(\@dpvec)!= 0){	
#	    $pearsons = correlation(\@$model,\@dpvec);
#	}
	push(@{$modelCorr[$model_idx]}, $pearsons);
	$model_idx++;
    }
    
    push (@allDPVecs, [@dpvec]);
    delete @dpvec[0..$#dpvec];
    push (@allQAVecs, [@qavec]);
    delete @qavec[0..$#qavec];
}


##What points are we interested in?
#Highest Correlation?
#Where highest variation occurs?
#

$localstats->clear();
$localstats->add_data(@variance);
print "\nMax variance,",$localstats->max(),", @",$localstats->maxdex();
$localstats->clear();
$localstats->add_data(@kurtosis);
print "\nMax kurtosis,",$localstats->max(),", @",$localstats->maxdex();
print "\nMin kurtosis,",$localstats->min(),", @",$localstats->mindex();

#Print / plot the correlation vectors for each model as well as the current variation


my $plotCorrVecs = Graphics::GnuplotIF->new(
    title => "Correlation Vectors with Current Variation",
    style => "points", ylabel=> 'i variance',
    y2label=> 'Correlation',
    xlabel=> 'Datapoints ',
    perrsist    => 1,
    plot_also   => 1,
    scriptfile  => "corrvec_curr_var_plot.cmds"
    ) ;

$plotCorrVecs->gnuplot_cmd('set y2label "Model"',
		    "set y2range [-1:1]",
		    'set y2tics border',
		    #"set yrange [:]",
		    'set grid',
		    'set key outside bottom',
		    #'set linestyle 1 lt 2 lw 3',
			#'set key box linestyle 1',
    );

    #Create a generic X-axis
    my @x = [0 .. $VecCnt];

    #create hashes
    my %dpvariance = ('x_values'=> @x, 
		    'y_values'=>\@{$allQAVecs[618]}, 
		    'style_spec' => "lines axes x1y1"); 

    my %model1 = ('x_values'=>@x,
		  'y_values'=>\@{$Models[0]},
		  'style_spec' => "lines axes x1y2");

    my %model2 = ('x_values'=>@x,
		  'y_values'=>\@{$Models[1]},
		  'style_spec' => "lines axes x1y2");

    my %model3 = ('x_values'=>@x,
		  'y_values'=>\@{$Models[2]},
		  'style_spec' => "lines axes x1y2");
    my %model4 = ('x_values'=>@x,
		  'y_values'=>\@{$Models[3]},
		  'style_spec' => "lines axes x1y2");
    
    #Normalized DP vector
my $fname = "varainceAndModelCorr.ps";

$plotCorrVecs->gnuplot_hardcopy( $fname,
			  'postscript color',
			  'lw 2' );

#$plotCorrVecs->gnuplot_set_plot_titles("Variance", "ActualState", "ActualTran", "HW","HD");
$plotCorrVecs->gnuplot_set_plot_titles("ActualState", "ActualTran", "HW","HD");
#$plotCorrVecs->gnuplot_plot_xy_style(@x, \%dpvariance, \%model1, \%model2, \%model3, \%model4);
$plotCorrVecs->gnuplot_plot_xy_style(@x, \%model1, \%model2, \%model3, \%model4);






my @modelName = ("ACTUAL-STATE", "ACTUAL-TRANSITION", "HW-MODEL", "HD-MODEL");
#plot the point which has the maximum correlation between models and datapoint
#TODO: Use the Maximum current variation location instead?
my $modelidx = 0;
foreach $model (@Models){
    $localstats->clear();
    $localstats->add_data(@{$model});    

    my $MODELMIN = ($localstats->min())-5;
    my $MODELMAX = ($localstats->max())+5;
    my $MODELUNI = scalar(uniq(@{$model})); 
    
    $localstats->clear(); 
    $localstats->add_data(@{$modelCorr[$modelidx]});    
    print "\nModel Correlation,".$modelName[$modelidx];
    my $maxcorridx = $localstats->maxdex();

   my $mincorridx = $localstats->mindex();
    my $corrMin =$localstats->min();
    my $corrMax = $localstats->max();

    print "\nMin,",$corrMin,",",$mincorridx;
    print "\nMax,",$corrMax,",",$maxcorridx;

    my %mypdf = pdf(@{$model});
    my $mentropy = entropy(@{$model});
    print "\nModel PDF (e=$mentropy)::\n";
    foreach my $key (sort keys %mypdf){
	print "$key, $mypdf{$key}\n";

    }    

    my $title =  "Max Correlation ("
	.$corrMax.") of "
	.$modelName[$modelidx]
	." and Datapoints at t=".$maxcorridx; 

    my $plot1 = Graphics::GnuplotIF->new(
	title => $title,
	style => "points", ylabel=> 'Curr',
	y2label=> 'Model',
	xlabel=> 'Rounds ',
	perrsist    => 1,
	plot_also   => 1,
	scriptfile  => "${modelidx}_plot.cmds"
	) ;



    $localstats->clear();

#    $maxcorridx = 611;


    my @activedpvector = @{$allDPVecs[$maxcorridx]};
    
    #my @steppedarray = @{$allQAVecs[$maxcorridx]};
#    my $model_el = ($MODEL_MAX - $MODEL_MIN)   
    my @steppedarray = linearq(16, @activedpvector);
    $localstats->add_data(@activedpvector);
    my $DPMAX = $localstats->max();
    my $DPMIN = $localstats->min();
  

    %mypdf = pdf(@steppedarray);
    my $mentropy = entropy(@steppedarray);

    print "\nPDF of stepped array (e=$mentropy) \@ idx = $maxcorridx ::\n";

    foreach my $key (sort keys %mypdf){
	print "$key, $mypdf{$key}\n";

    }


    my %myjpdf = ();
    %myjpdf = jpdf(@steppedarray, @$model);

    my $mymi = MI(@steppedarray, @$model);
#    my $maxmi = MI(@steppedarray, @steppedarray);
    print "\nMI= $mymi \n";#JPDF::\n";
    foreach my $key1 (sort keys %myjpdf){
	print "\n $key1 | ";
	for my $key2 (sort keys %{$myjpdf{$key1}}){

	    print "$myjpdf{$key1}{$key2}\t";
	}

    }
    print3D($modelName[$modelidx], hh2aa(%myjpdf));
    undef(%myjpdf);

    my $DATAMIN = min(@activedpvector);
    my $DATAMAX = max(@activedpvector);

    ####PRINTING STUFF FOLLOWS#########
    $plot1->gnuplot_cmd('set y2label "Model"',
#			"set y2range [$MODELMIN:$MODELMAX]",
			'set y2tics border',
#			"set yrange [$DATAMIN:$DATAMAX]",
                        #"set yrange [:]",
			'set grid',
			'set key outside bottom',
			#'set linestyle 1 lt 2 lw 3',
			#'set key box linestyle 1',
	);

    
    #print out model and the data vector it correlated too

    #Create a generic X-axis
    my @x = [0 .. $#activedpvector];


    #create hashes
    my %activedp = ('x_values'=> @x, 
		    'y_values'=>\@activedpvector, 
		    'style_spec' => "lines axes x1y1"); 

    my %model1 = ('x_values'=>@x,
		  'y_values'=>\@{$model},
		  'style_spec' => "lines axes x1y2");
    
    #Normalized DP vector
    my %binned =  ('x_values'=>@x,
		  'y_values'=>\@steppedarray,
		  'style_spec' => "lines axes x1y2");
    
    my %related = ('x_values'=>\@{$model},
		   'y_values'=>\@activedpvector,
		   'style_spec'=>"dots axes x1y1");
    
    my $fname = $modelName[$modelidx].".ps";


    $plot1->gnuplot_hardcopy( $fname,
                            'postscript color',
                            'lw 2' );

    $plot1->gnuplot_set_plot_titles("Datapoints", "Model", "Binned");
   $plot1->gnuplot_plot_xy(@x, \@{$model}, \@steppedarray);
#   $plot1->gnuplot_plot_xy(\@x, \@steppedarray, \@activedpvector);
#$plot1->gnuplot_plot_xy(\@steppedarray, \@activedpvector);
    ####END PRINTING GRAPHICS STUFF#######


    $localstats->clear();
    $modelidx++;
    print "\n";
}

sub print3D{ 
    my($name,@printable) = (shift, @_);
    my $plotvector = Graphics::GnuplotIF->new(
	title => "Original Current Source",
	ylabel=> 'Rounds',
	xlabel=> 'Time\n (normalized, unitless)',
	zlabel=> 'Current ',
#1	style => "pm3d",
	style => "lines",
	perrsist   => 1,
	plot_also  => 1,
	scriptfile => $name.'3d.cmds',
	);
$plotvector->gnuplot_cmd(
    'set zlabel "i"',
    'set hidden3d',
    'set palette gray',
    'set ticslevel 0',
    'set dgrid3d 30,50',
    #'set grid 0 10 ',
    'set view 70,10',
    'set isosample 100,100',
    'unset key', 
    'set contour base'
    );
$plotvector->gnuplot_hardcopy( 
    $name.'3d.ps',
    'postscript color',
    'lw 2' );
    
    $plotvector->gnuplot_set_plot_titles("Current Trace Per Round");
    $plotvector->gnuplot_plot_3d(\@printable);

}
    



sub quantize{
    my($bits, @y) = (shift, @_);
    my $eps = 0;
    my ($min,$max) = minmax(@y);
#    print $min, "-",$max,"\n";
    if($min!=$max){
	return map {floor($bits * log(($_+$eps)/($min+$eps))/(log(($max+$eps)/($min+$eps))))} @y;
    }
    else{
	return @y;
    }
}

sub linearq{
   my($bits, @y) = (shift, @_);
   my ($min,$max) = minmax(@y);
   my $stepsize = ceil(($max-$min)/$bits);
   return map{ ($_<=>0)*floor((abs($_)/$stepsize)+.5) }@y;
}


sub prob{
   # return probability of val occurance
    my($val, @datv) = (shift, @_);
    my $length = scalar @datv; 
    return sum(map { $_==$val } @datv)/$length;
}

sub xmarg($\@\@){
   my($x,$xarref,$yarref) = @_;
   my @xarr = @$xarref;
   my @yarr = @$yarref;
   my @uniqys = uniq(@yarr);

   return sum(map{jprob($x,$_,@xarr,@yarr)} @uniqys);

}

sub ymarg($\@\@){
   my($y,$xarref,$yarref) = @_;
   my @xarr = @$xarref;
   my @yarr = @$yarref;
   my @uniqxs = uniq(@xarr);

   return sum(map{jprob($_,$y,@xarr,@yarr)} @uniqxs);
}


sub pdf{
    #return pdf hash
    my(@datv) = @_; 
    return map{ $_ => prob($_, @datv) } uniq(@datv);	
}

sub jprob ($$\@\@){
    my($x,$y,$xarref,$yarref) = @_;
    my @xarr = @$xarref;
    my @yarr = @$yarref;

    #create a 0/1 array based on wheter $yarref contains y
    my @yvalid = map{ $_== $y } @yarr;
    my $ycount = sum(@yvalid);
    my $temp = sum( map{$yvalid[$_]*($xarr[$_]==$x) } (0..$#yarr));
    return $temp/$#yarr ;#$ycount;
}	
	

sub jpdf (\@\@){
    my($xref,$yref) = @_;
    my @xa = @{$xref};
    my @ya = @{$yref};
    my %mjpdf;

    foreach $xel (uniq(@xa)){
	foreach $yel (uniq(@ya)){
	    $mjpdf{$xel}{$yel} = jprob($xel, $yel, @xa, @ya);     
	}
    }
    return %mjpdf;
}

sub MI(\@\@){
    my($xref,$yref) = @_;
    my @xa = @{$xref};
    my @ya = @{$yref};
    my $count = 0;
    foreach $xel (sort(uniq(@xa))){
	foreach $yel (sort(uniq(@ya))){
	    my $xy = jprob($xel, $yel, @xa, @ya);
	    my $inner = $xy/(xmarg($xel,@xa,@ya)*ymarg($yel,@xa,@ya));
#(prob($xel,@xa)*prob($yel,@ya));
	    if($inner != 0){
	       $count+= $xy*log2($inner);
	    }
	}
    }
    return $count;
}

sub hh2aa(\%){
    my($href) = @_;
    my %hash = %{$href};
    my @final;

    foreach $key1 (sort keys %hash){
	my @inarray;
	foreach $key2 (sort keys %{$hash{$key1}}){	    
	    push (@inarray, $hash{$key1}{$key2});
	}
	push (@final, [@inarray]);
    }
    return @final;
}

sub entropy{
    my @vect = @_;
    return -1*sum( map{prob($_,@vect)*log2(prob($_,@vect))} uniq(@vect));
}

sub log2{
    return log(shift)/log(2);
}
