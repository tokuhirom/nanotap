#line 1
package Module::Install::ForC;
use strict;
use warnings;
our $VERSION = '0.09';
use 5.008000;
use Module::Install::ForC::Env;
use Config;              # first released with perl 5.00307
use File::Basename ();   # first released with perl 5
use FindBin;             # first released with perl 5.00307

use Module::Install::Base;
our @ISA     = qw(Module::Install::Base);

our @TARGETS;
our %OBJECTS;
our $POSTAMBLE;
our @TESTS;
our %INSTALL;

sub env_for_c {
    my $self = shift;
    $self->admin->copy_package('Module::Install::ForC::Env');
    Module::Install::ForC::Env->new($self, @_)
}
sub is_linux () { $^O eq 'linux'  }
sub is_mac   () { $^O eq 'darwin' }
sub is_win32 () { $^O eq 'MSWin32' }
sub WriteMakefileForC {
    my $self = shift;

    my $src = $self->_gen_makefile();

    open my $fh, '>', 'Makefile' or die "cannot open file: $!";
    print $fh $src;
    close $fh;
}

sub _gen_makefile {
    my $self = shift;
    $self->name(File::Basename::basename($FindBin::Bin)) unless $self->name;
    $self->version('') unless defined $self->version;

    my $mm = ExtUtils::MM->new(
        {
            NAME         => $self->name,
            VERSION      => $self->version,
        }
    );
    my $mm_params = join("\n", map { $_.'='.($mm->{$_} || '') } qw/FIRST_MAKEFILE MOD_INSTALL ABSPERL ABSPERLRUN VERBINST UNINST PERM_DIR PERL PREOP TRUE TAR RM_F RM_RF NOECHO NOOP INSTALLARCHLIB INSTALL_BASE DIST_CP DIST_DEFAULT POSTOP COMPRESS TARFLAGS TO_UNIX PERLRUN DISTVNAME VERSION NAME ECHO MAKE MV SUFFIX ZIP SHAR/);
    (my $make = <<"...") =~ s/^[ ]{4}/\t/gmsx;
$mm_params
TEST_VERBOSE=0
TEST_FILES=@{[ $self->tests || '' ]}

.PHONY: all config static dynamic test linkext manifest blibdirs clean realclean disttest distdir

all: @Module::Install::ForC::TARGETS

config :: \$(FIRST_MAKEFILE)
    \$(NOECHO) \$(NOOP)

test: @TESTS
    PERL_DL_NONLAZY=1 \$(PERLRUN) "-MExtUtils::Command::MM" "-e" "test_harness(\$(TEST_VERBOSE), 'inc')" \$(TEST_FILES)

dist: \$(DIST_DEFAULT) \$(FIRST_MAKEFILE)

clean:
	\$(RM_F) @Module::Install::ForC::TARGETS @{[ keys %Module::Install::ForC::OBJECTS ]}

realclean :: clean
	\$(RM_F) Makefile
    \$(RM_RF) \$(DISTVNAME)
	@{[ $Config{rm_try} || '' ]}

install: all config
	@{[ join("\n\t", map { @{ $_ } } values %Module::Install::ForC::INSTALL) ]}
    \$(NOECHO) \$(NOOP)

@{[ $mm->metafile_target ]}

@{[ $mm->distmeta_target ]}

@{[ $mm->distdir ]}

@{[ $mm->dist_test ]}

# dist_basics
@{[ $mm->dist_basics ]}

# dist_core
@{[ $mm->dist_core ]}

@{[ $Module::Install::ForC::POSTAMBLE || '' ]}

@{[ $self->postamble || '' ]}
...
    $make;
}

1;
__END__

#line 192
