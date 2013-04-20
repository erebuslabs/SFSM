#!/usr/bin/perl -w

use POSIX;
use Statistics::Descriptive;
use Graphics::GnuplotIF qw(GnuplotIF);
use List::Util qw(sum);

my $localstats = Statistics::Descriptive::Full->new();

my ($datfile, $delay, $vectors, $clkperiod, $sampleRate, $oracle) = @ARGV; #($ARGV[0], $ARGV[1]);
my $runcompStats = true;

if($#ARGV < 4 || $#ARGV > 5){
    print "USAGE: ./stats.pl datafile delay vec clk samplerate [oracle]\n";
    exit(0);
}elsif($#ARGV == 5){
    $runcompStat = false;
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
#@time_val = <$dfm>;
while(<$dfm>){
    if(m/^(\d+)\s+([-\d]+)\s*$/ && $idx > $delayEnd){
	my $current = sprintf("%f",$2);
	my $absIdx = ($idx - $delayEnd) % ($sampleRate*$clkperiod);
	push(@data, $current);
	if($absIdx == 0){
	    $VecCnt++;
	    push @row, [@data];
	    delete @data[0..$#data];
	}
    }
    $idx++;
}
close $dfm;

#### Handle the models
my @Models;
my @modelCorr;
if($runcompStat){
    my $ridx = 0;
    open(my $dfmodel, $oracle) or die("ack error - $!");
    while(<$dfmodel>){
	@mentry = split(/\s+/);
	if($ridx == 0){
	    my @tmp;
	    @Models = map{ [@tmp]} 0..$#mentry;
	}
	foreach $midx (0..$#mentry){
	    push(@{@Models[$midx]}, $mentry[$midx]); 
	}
    
	$ridx++;
    }
    close $dfmodel;
}
else{
### TEMP FOR RAND VECTOR TESTING ONLY ###
    my @rand = map { int(rand(4)+1 ) } (1..$VecCnt);
    push(@Models, [@rand]);
    @rand = map { int(rand(4)+1 ) } (1..$VecCnt);
    push(@Models, [@rand]);
}

my (@modMeans, @modStdDev); 

foreach $model (@Models){
    my @tempdata = @{$model};
    $localstats->add_data(@tempdata);
    push(@modMeans, $localstats->mean());
#    push(@variance, $localstats->variance());
    push(@modStdDev, $localstats->standard_deviation());
    $localstats->clear();
    my @temp = ();
    push(@modelCorr, [@temp]);
}

@mean, @variance, @std_dev;
my @corrdp;
foreach $dpidx (0..($sampleRate*$clkperiod)-1) {
    my @dpvec;
    foreach $ridx (0..$VecCnt-1){
	push @dpvec, $row[$ridx][$dpidx];
    }
    #compute local stats

    $localstats->add_data(@dpvec);
    
    $dpvec_mean = $localstats->mean();
    push(@mean, $dpvec_mean);
    
    push(@variance, $localstats->variance());
    
    $dpvec_std_dev = $localstats->standard_deviation(); 
    push(@std_dev, $dpvec_std_dev);
    
    $localstats->clear();


    @PMoment_dpvec = map {$_ - $dpvec_mean } @dpvec;
    my $model_idx = 0;
  

    foreach $model (@Models){
	
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

	my $pearsons = ($numerator)/$denomenator;
	
	push(@{@modelCorr[$model_idx]}, $pearsons);

	#print "For this model at dp# $dpidx: corr=($numerator)/($denomenator)=$pearsons\n";
	$model_idx++;
    }    
    delete @dpvec[0..$#dpvec];
}

my  $plot1 = Graphics::GnuplotIF->new(title => "line", style => "points", plot_titles =>["State", "tran", "HW", "HD"]);


#$plot1->gnuplot_plot_y( \@mean );                
#$plot1->gnuplot_pause( 5 );                     
#$plot1->gnuplot_plot_y( \@variance );            
#$plot1->gnuplot_pause( 5 );                     
#$plot1->gnuplot_plot_y( \@std_dev );            
#$plot1->gnuplot_pause( 5 );    

$plot1->gnuplot_plot_y(@modelCorr);
$plot1->gnuplot_pause( 10 );
    

