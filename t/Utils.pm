package t::Utils;
use strict;
use warnings;
use base 'Exporter';
our @EXPORT = 'is_ex';
use Test::More;

sub is_ex {
	my ($x, $y) = @_;
	$x =~ s/\015\012/\012/g;
	$y =~ s/\015\012/\012/g;
	is($x, $y);
}

1;
