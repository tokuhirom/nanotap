RM=rm
NAME=nanotap
FIRST_MAKEFILE=Makefile
NOECHO=@
TRUE = true
NOOP = $(TRUE)
PERL = perl
VERSION = 
DISTVNAME = $(NAME)-$(VERSION)
PREOP = $(PERL) -I. "-MModule::Install::Admin" -e "dist_preop(q($(DISTVNAME)))"
TO_UNIX = $(NOECHO) $(NOOP)
TAR = tar
TARFLAGS = cvf
RM_RF = rm -rf
COMPRESS = gzip --best
POSTOP = $(NOECHO) $(NOOP)
DIST_DEFAULT = tardist
DIST_CP = best
PERLRUN = $(PERL)
TEST_VERBOSE=0
TEST_FILES=t/*.t

all: t/01_c t/02_cpp

test: 
	PERL_DL_NONLAZY=1 $(PERLRUN) "-MExtUtils::Command::MM" "-e" "test_harness($(TEST_VERBOSE), 'inc')" $(TEST_FILES)

dist: $(DIST_DEFAULT) $(FIRST_MAKEFILE)

tardist: $(NAME).tar.gz
	$(NOECHO) $(NOOP)

$(NAME).tar.gz: distdir Makefile
	$(PREOP)
	$(TO_UNIX)
	$(TAR) $(TARFLAGS) $(DISTVNAME).tar $(DISTVNAME)
	$(RM_RF) $(DISTVNAME)
	$(COMPRESS) $(DISTVNAME).tar
	$(POSTOP)

distdir:
	$(RM_RF) $(DISTVNAME)
	$(PERLRUN) "-MExtUtils::Manifest=manicopy,maniread" \
	    -e "manicopy(maniread(),'$(DISTVNAME)', '$(DIST_CP)');"

clean:
	$(RM) t/01_c t/02_cpp t/01_c.o t/02_cpp.o
	$(RM) Makefile
	/bin/rm -f try try a.out .out try.[cho] try..o core core.try* try.core*

install: all
	

manifest:
	perl -MExtUtils::Manifest -e 'ExtUtils::Manifest::mkmanifest()'

t/01_c: t/01_c.o
	env MACOSX_DEPLOYMENT_TARGET=10.3 cc  -o t/01_c t/01_c.o  

t/01_c.o: t/01_c.c Makefile
	/usr/bin/gcc-4.2    -c -o t/01_c.o t/01_c.c

t/01_c.o: t/01_c.c t/../nanotap.h

t/02_cpp: t/02_cpp.o
	g++  -o t/02_cpp t/02_cpp.o  

t/02_cpp.o: t/02_cpp.cc Makefile
	g++    -c -o t/02_cpp.o t/02_cpp.cc

t/02_cpp.o: t/02_cpp.cc t/../nanotap.h


