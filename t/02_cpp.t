use strict;
use warnings;
use IPC::Open3;
use Test::More;
use Symbol 'gensym';

my($wtr, $rdr, $err);
$err = gensym;
my $pid = open3($wtr, $rdr, $err, './t/02_cpp');

is join('', <$rdr>), <<'...';
ok 1 - ok
not ok 2 - ng
not ok 3 - not contains
ok 4 - contains
ok 5 - good
not ok 6 - bad
  # got      : 1
  # expected : 0
ok 7 - good
not ok 8 - bad
  # got      : NG
  # expected : OK
not ok 9 - bad
  # got      : NG
  # expected : OK
ok 10 - good
ok 11 - good
ok 12 - 
ok 13 - 
ok 14 - ok
1..14
...

is join('', <$err>), <<'...';
# hehe
...

waitpid($pid, 0);

done_testing;
