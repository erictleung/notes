# Perl Notes

use strict;
use warnings;

# opening a file from argument
open ( FILE1, $ARGV[0] ) || die "Input error.\n";
close FILE1;

# append to file
open ( FILE2, "> out.txt" );
my $name = "Fred";
print FILE2 $name;
close FILE2;

# functions/subroutines
sub fun1 {
    print 1, "\n";
}
&fun1(); # invoke subroutine

# sample array
my @array1;
$a[0] = 1;
$a[1] = 2;
$a[2] = 4;

# return last index of the array
print $#array1, "\n";

# two-dimensional array
my @two = (
    ["a", "b", "c"],
    ["d", "e", "f"],
    ["g", "h", "i"]
);
print $two[1][2], "\n"; # "f"

# conditional statement
if ($a[2] == 0) {
    print "Matched!\n";
}

# create sequence of numbers
print 0..3, "\n"; 0123

# loop through two dimensional array
foreach my $first (@two) { # loop through first dimension of array
    print "Each row has: ";
    foreach (@$ref) { # goes through row itself
        print "$_ ";
    }
}
