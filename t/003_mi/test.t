use strict;
use warnings;
use Test::More tests => 4;
use t::MITest;
use Config;
use File::Temp ();
use File::Path ();
use File::Spec;
use File::Copy;

my $tmpdir = File::Temp::tempdir(CLEANUP => 1);
my $dir = File::Spec->catdir($tmpdir, $Config{archname});
my $container = File::Spec->catdir( $dir, , 'auto', 'Clib', 'include', 'nanotap' );
ok File::Path::mkpath($container);
ok copy('nanotap.h', File::Spec->catfile($container, 'nanotap.h'));

setup;
run_makefile_pl('-I', $dir);
run_make;

ok -f 'Makefile';
ok -e 'inc/auto/Clib/include/nanotap/nanotap.h';

