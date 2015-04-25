#!/usr/bin/perl
$max_numbers = 5000;
for (my $loop=0 ; $loop < $max_numbers ; $loop++)
{
    # Get random number from 0 to 10 exclusive. 
    $random_number = rand (10);  
    # Only get the first digit of the random number.
    $first_random_digit = $random_number % 2;
    
    # Print random digit to the file.
    print "$first_random_digit";
 }
