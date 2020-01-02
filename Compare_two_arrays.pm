package compare;

use strict;
use warnings;


# Class data and methods are referred to the collection of all objects
# in the class, there is not just one specific object
{
    my $_count = 0;
    sub get_count {
        $_count;
    }
    sub _incr_count {
        ++$_count;
    }
    sub _decr_count {
        --$_count;
    }
}

# The constructor for the class
sub new {
    my ($class, %arg) = @_;
    my $self = bless {
        _array1       => $arg{array1}      || croak("Error: no array1"),
        _array2       => $arg{array2}     || croak("Error: no array2"),

    }, $class;
    $class->_incr_count();
    return $self;
}


sub same {
 
    my($self) = @_;
    my $array1=$self->{_array1};
    my $array2=$self->{_array2};

    my @array_one=@$array1;
    my @array_two=@$array2;

    my %array_one= map {$_, 1} @array_one;
    my @same = grep {$array_one {$_}} @array_two;

    return \@same;

            }


sub difference {
 
    my($self) = @_;
    my $array1=$self->{_array1};
    my $array2=$self->{_array2};

    my @array_one=@$array1;
    my @array_two=@$array2;

    my %array_one= map {$_, 1} @array_one;
    my @difference = grep {!$array_one {$_}} @array_two;

    return \@difference;

            }

sub DESTROY {
    my($self) = @_;
    $self->_decr_count();
}



1;
