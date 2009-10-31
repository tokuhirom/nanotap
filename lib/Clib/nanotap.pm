package Clib::nanotap;
our $VERSION = '0.04';
use 5.006;
1;
__END__

=head1 NAME

Clib::nanotap - yet another TAP library for C/C++

=head1 SYSNOPSIS

    #include <nanotap/nanotap.h>
    int main() {
        ok(true, "ok");
        done_testing();
    }

=head1 DESCRIPTION

nanotap is yet another TAP library for C/C++.

=head1 METHODS

see L<nanotap.h> itself :P
(XXX I need better documentation tool)

=head1 SEE ALSO

L<Test::More>

=head1 AUTHOR

Tokuhiro Matsuno E<lt>tokuhirom ah! gmail.comE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

