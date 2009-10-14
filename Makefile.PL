use inc::Module::Install;

my $e = env_for_c();
$e->enable_warnings;
$e->program('t/01_c', 't/01_c.c');
$e->program('t/02_cpp', 't/02_cpp.cc');

tests 't/*.t';

if ($ENV{USER} eq 'tokuhirom') {
    `pod2markdown < README.pod > README.mkdn`;
}

WriteMakefileForC;
