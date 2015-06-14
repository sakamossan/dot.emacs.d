#!/usr/bin/perl

use feature qw/say/;
use strict;
use warnings;

my $path = qq{/tmp/notuseel};
open my $nouses, '<', $path;
my @files = split /\n/, `ls -1 /Users/sakamoto/.emacs.d/inits`;

while (my $ln = $nouses->getline) {
	chomp $ln;

	for (@files) {
		/$ln/x and unlink q(/Users/sakamoto/.emacs.d/inits/).$_;
	}
} 
