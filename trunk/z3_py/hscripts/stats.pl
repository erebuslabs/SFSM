#!/usr/bin/perl -w
#use strict;


use POSIX;
use Statistics::Descriptive;
use Graphics::GnuplotIF qw(GnuplotIF);
use List::Util qw(sum);
use List::MoreUtils qw(uniq);
#use Math::GSL::Statistics qw /:all/;
#use PDL::Stats::Basic;

use Statistics::Basic qw(:all nofill);

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
my (@data, @row);

### READ DAT FILE and Construct
my $idx = 0;
my $VecCnt = 0;
open(my $dfm, $datfile) or die("ack error - $!");

my(@maxcurr, @varcurr);

while(<$dfm>){
    if(m/^(\d+)\s+([-\d]+)\s*$/ && $idx > $delayEnd){
	my $current = sprintf("%f",$2);
	if ($current < 0){ $current = 0;}
	my $absIdx = ($idx - $delayEnd) % ($sampleRate*$clkperiod);
	push(@data, $current);
	if($absIdx == 0){
	    $VecCnt++;
            #At this point,compute items concerning this single vec
	    #e.g. MAX curr 
	    $localstats->add_data(@data);
	    push @maxcurr, $localstats->max(); 
	    push @varcurr, $localstats->standard_deviation();
	    #push @meancurr, $localstats->mean(); 
	    push @row, [@data];    
	    delete @data[0..$#data];
	    $localstats->clear();
	}
    }
    $idx++;
}
close $dfm;

#Compute Agregate Stats for all entries
print "\nStatisticts n=",($VecCnt-1);
$localstats->add_data(@maxcurr);
print "\nmax curr,",$localstats->max(),",@",$localstats->maxdex();  
print "\nmean max curr,",$localstats->mean(); 
print "\nvar max curr,",$localstats->variance(); 
$localstats->clear();

$localstats->add_data(@varcurr);
print "\nmax variation,",$localstats->max(),",@",$localstats->maxdex();    
print "\nmean variation,",$localstats->mean(); 
print "\nvar variation,",$localstats->variance(); 

$localstats->clear();
#$localstats->add_data(@meancurr);
#print "\nmax of means,",$localstats->max();  
#print "\nmean of means,",$localstats->mean(); 
#print "\nvar of  means,",$localstats->variance(); 
#$localstats->clear();

#### Handle the models
my @Models;
my @modelCorr;

my $rndidx = 0;
if($runcompStats==1){
    print "\nRunning Stats based on Model File\n";
    open(my $dfmodel, $oracle) or die("ack error - $!");

    while(<$dfmodel>){
	@mentry = split(/\s+/);
	if($rndidx == 0){
	    my @tmp;
	    @Models = map{ [@tmp]} 0..$#mentry;
	}
	foreach $midx (0..$#mentry){
	    push(@{$Models[$midx]}, $mentry[$midx]); 
	}    
	$rndidx++;
    }
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


print3D(@row);

my (@mean, @variance, @std_dev, @corrdp);
my @allDPVecs;
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
    
    $localstats->clear();
    
    #compute the moment of the datapoint vector
    #my @PMoment_dpvec = map {$_ - $dpvec_mean } @dpvec;
    
    $model_idx = 0;
    #compute the correlation for against each model
    foreach $model (@Models){
	#compute the moment of the model
#	@PMoment_model = map{ $_ - $modMeans[$model_idx]}@{$model};;
	
#	print "@{$model} <--model\n";
#	print "@PMoment_model <--Moment model \n";

	## Compute correlation between Model,dpvec ##	
	##    ( PMoment_dpvec x PMoment_model )    ## 
	##    ---------------------------------    ##
	##      std_dev_dpvec x std_dev_model      ##

#	my $numerator = sum(map{($PMoment_dpvec[$_] * $PMoment_model[$_])/$#PMoment_dpvec} 0..$#PMoment_dpvec);
#	my $denomenator = ($dpvec_std_dev*$modStdDev[$model_idx]);

#	print "\n ($numerator)  $dpvec_std_dev * $modStdDev[$model_idx])\n";

	#my $pearsons=0;
	#if($denomenator!=0){
	#     $pearsons = ($numerator)/$denomenator;
	#}

#	print  "V#######\nArrayMODEL\n#####V";
#	print @$model;
#	print  "V#######\nArrayDPVEC\n#####V";
#	print @dpvec ;
	my $pearsons = 0;
	if(stddev(\@$model) != 0 && stddev(\@dpvec)!= 0)
	{	
	    $pearsons = correlation(\@$model,\@dpvec);
	}

#gsl_stats_mean($model,1,$#model+1);#

#	print "\nOld ".$pearsons;#." New ".$npearsons; 
	push(@{$modelCorr[$model_idx]}, abs($pearsons));

#	print "For this model at dp# $dpidx: corr=($numerator)/($denomenator)=$pearsons\n";
	$model_idx++;
    }    
    push (@allDPVecs, [@dpvec]);
    delete @dpvec[0..$#dpvec];
}

my @modelName = ("ACTUAL-STATE", "ACTUAL-TRANSITION", "HW-MODEL", "HD-MODEL");

#compute the maximum correlation between models and datapoint

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
    $maxcorridx = 591;

    my @activedpvector = @{$allDPVecs[$maxcorridx]};
    $localstats->add_data(@activedpvector);
    my $DPMAX = $localstats->max();
    my $DPMIN = $localstats->min();
  

    my @steppedarray = 
	map{ceil(($_-$DPMIN)/(($DPMAX-$DPMIN)/$MODELUNI)/1)} @activedpvector;

    #Compute the correlation between binned array and model
    

    $plot1->gnuplot_cmd('set y2label "Model"',
			"set y2range [$MODELMIN:$MODELMAX]",
			'set y2tics border',
			#"set y1range [:]",
			'set grid',
			'set key outside bottom',
			#'set linestyle 1 lt 2 lw 3',
			#'set key box linestyle 1',
	);

    
    #print out model and the data vector it correlated too

    #Create a generic X-axis
    my @x = [0 .. $#activedpvector-1];

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
    $plot1->gnuplot_plot_xy_style(@x, \%activedp, \%model1, \%binned);



    ##Let's check relation when the data is binned wrt to # of elements in the model 

    #number of unique elements in model?
  
    #%freq = $localstats->frequency_distribution($MODELUNI);
    #print $localstats->frequency_distribution();


#    for (sort {$a <=> $b} keys %freq) {
#	print "key = $_, count = $freq{$_}\n";
#    }
    
        

#print @steppedarray;	
    
    

    $localstats->clear();
    #$localstats->add_data(@{$model});    
	






    $modelidx++;
    print "\n";
}

sub print3D{ 
    my $plotvector = Graphics::GnuplotIF->new(
	title => "Original Current Source",
	ylabel=> 'Rounds',
	xlabel=> 'Time\n (normalized, unitless)',
	zlabel=> 'Current ',
#1	style => "pm3d",
	style => "lines",
	perrsist   => 1,
	plot_also  => 1,
	scriptfile => '3dplot.cmds',
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
    '3dplot.ps',
    'postscript color',
    'lw 2' );
    
    $plotvector->gnuplot_set_plot_titles("Current Trace Per Round");
    $plotvector->gnuplot_plot_3d(\@_);

}
    



