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

    The MIT License (MIT)
    Copyright © 2015 Tokuhiro Matsuno, http://64p.org/ <tokuhirom@gmail.com>
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the “Software”), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.

=cut

