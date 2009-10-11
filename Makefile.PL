use inc::Module::Install;

my $e = env_for_c();
eval { $e->enable_warnings; };
$e->program('t/01_c', 't/01_c.c');
$e->program('t/02_cpp', 't/02_cpp.cc');

tests 't/*.t';

WriteMakefileForC;
