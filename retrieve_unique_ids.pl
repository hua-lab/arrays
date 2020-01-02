#! /usr/bin/perl 

use strict;
use warnings;

my @array=("rice", "arabidopsis", "rice", "corn","corn", "maize", "arabidopsis","Arabidopsis","F-box", "ubiquitin","ubiquitylation","proteasome","e3","e3","e3","E3");


foreach my $value (@array) {

        $value=$value."\t";

                }

print "array2=", @array,"\n";

#Method 1
print "Method1\n";
    my %seen1;
    $seen1{$_}++ for @array; 
    print $seen1{$_} for @array;

    my @keys=keys %seen1; 
    my @common=sort{$seen1{$b} <=> $seen1{$a}}@keys;

    print "unique1_number=",scalar @keys,"\n";
    print "unique=";

    @keys=sort{$a cmp $b}@keys;

    for (@keys){

        print $_,"\t";

        }

    print "\nTop 3 common ones=",@common[0..2],"\n";
    
# Method 2
print "\n\nMethod2\n";    
    my %seen2;
    my @unique;
    my @dups;
    
    foreach my $value (@array) {
        $value=$value;
        if (!$seen2{$value}) {    
               push (@unique, $value);
               $seen2{$value} = "true";
                }
        else{
            push(@dups, $value);
                }
            }

    @unique=sort{$a cmp $b}@unique;
    @dups=sort{$a cmp $b}@dups;

    print "unique=",@unique,"\n";
    print "dups=",@dups,"\n";

#Method 3
print "\n\nMethod3\n";   
    my %seen3;
    my @uniq=grep { !$seen3{$_}++ }@array;
    @uniq=sort{$a cmp $b}@uniq;
    foreach my $uniq(@uniq){
        print $uniq,"\t";
            }

#Method 4
print "\n\nMethod4\n";
    my @u=uniq(@array);
    @u=sort{$a cmp $b}@u;
    foreach my $u(@u){
       print $u,"\t";
            }
    sub uniq {
            my %seen;
            return grep { !$seen{$_}++ } @_;
        }

#Method 5
print "\n\nMethod5\n";
    my %unique=map {$_=>1}@array; 
    my @unique2= keys %unique,"\n";
    @unique2=sort{$a cmp $b}@unique2;
    print @unique2,"\n";

#Method 6
print "\n\nMethod6\n";
    my %seen6;
    @seen6{@array}=1;
    my @joint= keys%seen6;
    @joint=sort @joint;
    print "uniques=", @joint,"\n";
    
#Method 7
print "\n\nMethod7\n";

    my %seen7;
    my @unis;
    my @dupes;
    ++$seen7{$_} for @array;
    print "uniques=",sort keys%seen7;
    print "\n";

    for(@array){

        my $seen7 = $seen7{$_};
        push @unis, $_ if $seen7==1;
        push @dupes, $_ if $seen7>=2;

            }

    print "single=", join(',', sort @unis),"\n";
    print "dups=", join(',', sort @dupes),"\n";


        

exit;
