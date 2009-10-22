use strict;
use warnings;
use IPC::Open3;
use Test::More;
use t::Utils;

my($wtr, $rdr, $err);
use Symbol 'gensym';
$err = gensym;
my $pid = open3($wtr, $rdr, $err, './t/01_c');

is_ex join('', <$rdr>), <<'...';
ok 1 - ok
not ok 2 - ng
# NOTE
not ok 3 - not contains
ok 4 - contains
1..4
...

is_ex join('', <$err>), <<'...';
# DIAG
...

waitpid($pid, 0);

done_testing;
