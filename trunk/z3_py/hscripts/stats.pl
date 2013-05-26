#!/usr/bin/perl -w

use POSIX;
use Statistics::Descriptive;
use Graphics::GnuplotIF qw(GnuplotIF);
use List::Util qw(sum);
use List::MoreUtils qw(uniq);

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
	if ($current < 0){ $current = 0;}
	my $absIdx = ($idx - $delayEnd) % ($sampleRate*$clkperiod);
	push(@data, $current);
	if($absIdx == 0){
	    $VecCnt++;
            #At this point,compute items concerning this single vec
	    #e.g. MAX curr 
	    $localstats->add_data(@data);
	    push @maxcurr, $localstats->max(); 
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

my $plotvector = Graphics::GnuplotIF->new(title => "Original Current Source",
					  ylabel=> 'Rounds',
					  xlabel=> 'Current ',
					  style => "pm3d",
					  perrsist   => 1,
					  plot_also  => 1,
					  scriptfile => '3dplot.cmds',
);

$plotvector->gnuplot_cmd(
    'set pm3d',
#			 'set palette rgbformulae 34,35,36',
#			 'set palette rgbformulae 30,31,32',
    'set palette gray',
    'set ticslevel 0',
    'set dgrid3d 100,50',
  #  'set grid 500,50',
    'set isosample 100,100',
#			 'set key center bottom',
    'unset key', 
#			 'set linestyle 1 lt 2 lw 3',
#			 'set key box linestyle 1'
    );

$plotvector->gnuplot_hardcopy( '3dplot.ps',
                            'postscript color',
                            'lw 2' );
#$plotvector->gnuplot_cmd( 'set terminal png ',#
#			  'set output "3dplot.png" ' );

$plotvector->gnuplot_set_plot_titles("Current Trace Per Round");
$plotvector->gnuplot_plot_3d(\@row);
#$plotvector->gnuplot_pause(10);



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
    my @PMoment_dpvec = map {$_ - $dpvec_mean } @dpvec;
    
    $model_idx = 0;
    #compute the correlation for against each model
    foreach $model (@Models){
	#compute the moment of the model
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

    my $plot1 = Graphics::GnuplotIF->new(title => $title,
					 style => "points", ylabel=> 'Curr',
					 y2label=> 'Model',
					 xlabel=> 'Rounds ',
					 perrsist    => 1,
					 plot_also   => 1,
					 scriptfile  => "${modelidx}_plot.cmds"
	) ;


    my @activedpvector = @{$allDPVecs[$maxcorridx]};
    $localstats->clear();
    $localstats->add_data(@activedpvector);
    my $DPMAX = $localstats->max();
    my $DPMIN = $localstats->min();
  


    my @steppedarray = map{ceil(($_-$DPMIN)/(($DPMAX-$DPMIN)/$MODELUNI)/1)} @activedpvector;


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
    
    my @x = [0 .. $#activedpvector-1];


    my %activedp = ('x_values'=> @x, 
		    'y_values'=>\@activedpvector, 
		    'style_spec' => "lines axes x1y1"); 
    my %model1 = ('x_values'=>@x,
		  'y_values'=>\@{$model},
		  'style_spec' => "lines axes x1y2");
    
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
    print "\n";

#    for (sort {$a <=> $b} keys %freq) {
#	print "key = $_, count = $freq{$_}\n";
#    }
    
        

#print @steppedarray;	
    
    

    $localstats->clear();
    #$localstats->add_data(@{$model});    
	






    $modelidx++;
}
  
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

    

