#line 1
package Module::Install::Clib;
use strict;
use warnings;
our $VERSION = '0.01';
use 5.008_001;
use base qw(Module::Install::Base);
use Config;
use File::Spec;

my $installer = q{$(NOECHO) $(ABSPERL) -e 'use File::Copy; use File::Path qw/make_path/; use File::Basename; make_path(dirname($$ARGV[1])); File::Copy::copy($$ARGV[0], $$ARGV[1]) or die qq[Copy failed: $$!]'};

sub clib_header {
    my ($self, $filename) = @_;
    (my $distname = $self->name) =~ s/Clib-//;

    my $dst = File::Spec->catfile('$(INSTALLARCHLIB)', 'auto', 'Clib', 'include', $distname, $filename);
    $self->postamble(<<"END_MAKEFILE");
config ::
\t\t\$(ECHO) Installing $dst
\t\t$installer "$filename" $dst

END_MAKEFILE
}

sub clib_library {
    my ($self, $filename) = @_;
    (my $distname = $self->name) =~ s/Clib-//;

    my $dst = File::Spec->catfile('$(INSTALLARCHLIB)', 'auto', 'Clib', 'lib', $filename);
    $self->postamble(<<"END_MAKEFILE");
config ::
\t\t\$(ECHO) Installing $dst
\t\t$installer "$filename" $dst

END_MAKEFILE
}

sub clib_setup {
    my ($self) = @_;
    my @dirs = map { File::Spec->catfile($_, qw/auto Clib/) } grep /$Config{archname}/, @INC;
    my @libs = map { File::Spec->catfile($_, 'lib') }     @dirs;
    my @incs = map { File::Spec->catfile($_, 'include') } @dirs;
    $self->cc_append_to_inc(@incs);
    $self->cc_append_to_libs(@libs);
}

1;
__END__

#line 106
