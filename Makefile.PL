sub readme_markdown_from { }

use inc::Module::Install;
name 'Clib-nanotap';
all_from 'lib/Clib/nanotap.pm';
readme_markdown_from 'lib/Clib/nanotap.pm';

my $e = env_for_c();
$e->enable_warnings;
$e->program('t/01_c', 't/01_c.c');
$e->program('t/02_cpp', 't/02_cpp.cc');
$e->program('t/04_is_binary', 't/04_is_binary.cc');

clib_header('nanotap.h');

tests 't/*.t t/*/*.t';

test_requires 'Test::More' => 0.94;
WriteMakefileForC;
