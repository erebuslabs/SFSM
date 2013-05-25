#!/usr/bin/perl -w

use POSIX;
use Statistics::Descriptive;
use Graphics::GnuplotIF qw(GnuplotIF);
use List::Util qw(sum);

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

my(@maxcurr);

while(<$dfm>){
    if(m/^(\d+)\s+([-\d]+)\s*$/ && $idx > $delayEnd){
	my $current = sprintf("%f",$2);
	my $absIdx = ($idx - $delayEnd) % ($sampleRate*$clkperiod);
	push(@data, $current);
	if($absIdx == 0){
	    $VecCnt++;
            #At this point,compute items concerning this single vec
	    #e.g. MAX curr 
	    $localstats->add_data(@data);
	    push @maxcurr, $localstats->max(); 
	    push @meancurr, $localstats->mean(); 
	    push @row, [@data];    
	    delete @data[0..$#data];
	    $localstats->clear();
	}
    }
    $idx++;
}
close $dfm;

#Compute Agregate Stats for all entries
print "\nCurrent Statisticts n=",($VecCnt-1);
$localstats->add_data(@maxcurr);
print "\nmax,",$localstats->max();  
print "\nmean max,",$localstats->mean(); 
print "\nvar max,",$localstats->variance(); 

$localstats->clear();
#$localstats->add_data(@meancurr);
#print "\nmax of means,",$localstats->max();  
#print "\nmean of means,",$localstats->mean(); 
#print "\nvar of  means,",$localstats->variance(); 
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


my (@modMeans, @modStdDev, @modVariance); 
my @temp = ();
foreach $model (@Models){
    my @tempdata = @{$model};
    $localstats->add_data(@tempdata);
    push(@modMeans, $localstats->mean());
    push(@modVariance, $localstats->variance());
    push(@modStdDev, $localstats->standard_deviation());
    $localstats->clear();
    #dynamic array of arrays creation
    push(@modelCorr, [@temp]);
}

my  $plotvector = Graphics::GnuplotIF->new(title => "Checkit", style => "boxes");

$plotvector->gnuplot_cmd('set grid',
			 'set key outside bottom',
			 'set linestyle 1 lt 2 lw 3',
			 'set key box linestyle 1'
    );


$plotvector->gnuplot_set_plot_titles("Model Mean", "Model Var", "Model StdDev");
#$plotvector->gnuplot_plot_y(\@modMeans, \@modVariance, \@modStdDev);
$plotvector->gnuplot_plot_y(\@maxvar);
$plotvector->gnuplot_pause(60 );



my (@mean, @variance, @std_dev, @corrdp);

#Itterate over each datapoint 
foreach $dpidx (0..($sampleRate*$clkperiod)-1) {
    #WHAT INFO IS NICE OVER EACH dp : mean, var, CORRELATION pvec, 

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
    my @PMoment_dpvec = map {$_ - $dpvec_mean } @dpvec;
    my $model_idx = 0;
  
    foreach $model (@Models){
	#computer the moment of the model
	@PMoment_model = map{ $_ - $modMeans[$model_idx]}@{$model};;
	
#	print "@{$model} <--model\n";
#	print "@PMoment_model <--Moment model \n";

	## Compute correlation between Model,dpvec ##	
	##    ( PMoment_dpvec x PMoment_model )    ## 
	##    ---------------------------------    ##
	##      std_dev_dpvec x std_dev_model      ##

	my $numerator = sum(map{($PMoment_dpvec[$_] * $PMoment_model[$_])/$#PMoment_dpvec} 0..$#PMoment_dpvec);
	my $denomenator = ($dpvec_std_dev*$modStdDev[$model_idx]);

#	print "\n ($numerator)  $dpvec_std_dev * $modStdDev[$model_idx])\n";

	my $pearsons=0;
	if($denomenator!=0){
	     $pearsons = ($numerator)/$denomenator;
	}
	push(@{$modelCorr[$model_idx]}, $pearsons);

	#print "For this model at dp# $dpidx: corr=($numerator)/($denomenator)=$pearsons\n";
	$model_idx++;
    }    
    delete @dpvec[0..$#dpvec];
}

my $plot1 = Graphics::GnuplotIF->new(title => "line", style => "points") ;

$plot1->gnuplot_cmd('set grid',
		    'set key outside bottom',
		    'set linestyle 1 lt 2 lw 3',
		    'set key box linestyle 1'
    );

#$plot1->gnuplot_set_plot_titles("Mean");
#$plot1->gnuplot_plot_y( \@mean );                
#$plot1->gnuplot_pause(10 );

#$plot1->gnuplot_set_plot_titles("Variance");
#$plot1->gnuplot_plot_y( \@row );            
#$plot1->gnuplot_pause(10 );

#$plot1->gnuplot_set_plot_titles("STD DEV");
#$plot1->gnuplot_plot_y( \@std_dev );            
#$plot1->gnuplot_pause(10 );


#my  $plotF = Graphics::GnuplotIF->new(title => "line", style => "points", plot_titles =>["State", "tran", "HW", "HD"]);

#$plotF->gnuplot_cmd('set grid',
#		    'set key outside bottom',
#		    'set linestyle 1 lt 2 lw 3',
#		    'set key box linestyle 1'
#    );
#$plotF->gnuplot_plot_y(@modelCorr);
#$plotF->gnuplot_pause(30 );

    

