use strict;
use warnings;
use IPC::Open3;
use Test::More;
use t::Utils;

my($wtr, $rdr, $err);
use Symbol 'gensym';
$err = gensym;
my $pid = open3($wtr, $rdr, $err, './t/04_is_binary');

is_ex join('', <$rdr>), <<'...';
not ok 1 - length
not ok 2 - 2 byte
ok 3 - success
1..3
...

is_ex join('', <$err>), <<'...';
# Expected 2 bytes chars, but got 1 bytes chars
# Expected 4b but got 50, at 1
...

waitpid($pid, 0);

done_testing;
