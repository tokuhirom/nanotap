package t::MITest;
use strict;
use warnings;
use Config;
use Exporter 'import';
use File::Basename qw/dirname/;
use File::Path qw/rmtree/;
use FindBin; # this is required because M::I is tricky.

our @EXPORT = ('$make', qw/setup cleanup run_makefile_pl run_make/);

our $make =  $Config{make};

sub setup {
    chdir(dirname([caller(0)]->[1]));
    cleanup(<*.so>, <*.dll>, <*.o>, 'inc', 'Makefile', 'main', 'a.out', <*.gz>, 'MANIFEST', 'blib');
}

sub cleanup {
    my @files = @_;
    for my $file (@files) {
        rmtree($file) if -d $file;
        unlink $file if -f $file;
    }
}

sub run_makefile_pl {
    system $^X,  '-I../../lib/', 'Makefile.PL';
}

sub run_make {
    system $make, @_;
}

1;
