use warnings;
use strict;

package Module::Install::nanotap;
use Module::Install::Base;
our @ISA     = qw(Module::Install::Base);
use Config;
use File::Spec;

sub use_nanotap {
    my ($self) = @_;

    $self->clib_setup();

    my ($header) = grep { -f $_ } map {
        File::Spec->catfile( $_, 'auto', 'Clib', 'include', 'nanotap',
            'nanotap.h' )
    } grep /$Config{archname}/, @INC;
    if ($header) {
        $self->admin->copy($header, File::Spec->catfile(qw/inc auto Clib include nanotap nanotap.h/));
        my $incs = $self->makemaker_args->{INC} || '';
        $self->makemaker_args->{INC} = "-Iinc/auto/Clib/include/ $incs";
    } else {
        die "cannot find nanotap.h";
    }
}

1;
__END__

=head1 NAME

Module::Install::nanotap - installer for nanotap

=head1 SYNOPSIS

    use inc::Module::Install;
    use_nanotap;

=head1 DESCRIPTION

This module adds the C<use_nanotap> directive to Module::Install.

Now you can get full nanotap support for you module with no external
dependency on nanotap.

=head1 AUTHOR

Tokuhiro Matsuno

=head1 COPYRIGHT

Copyright (c) 2006, 2008. Ingy döt Net.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=cut
