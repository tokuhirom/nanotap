sub readme_markdown_from { }

use inc::Module::Install;
name 'Clib-nanotap';

my $e = env_for_c();
$e->enable_warnings;
$e->program('t/01_c', 't/01_c.c');
$e->program('t/02_cpp', 't/02_cpp.cc');

tests 't/*.t';

readme_markdown_from 'README.pod';

WriteMakefileForC;
