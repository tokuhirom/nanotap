use strict;
use warnings;
use Test::More tests => 2;
use t::MITest;

setup;
run_makefile_pl;
run_make;

ok -f 'Makefile';
ok -e 'inc/auto/Clib/include/nanotap/nanotap.h';

