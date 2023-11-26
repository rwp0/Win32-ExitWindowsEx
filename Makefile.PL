use v5.38;
use ExtUtils::MakeMaker;

# Manually add "-lpowrprof" to Makefile's LDLOADLIBS for now

WriteMakefile(
  VERBINST      => 1 ,
  NAME          => 'Win32::ExitWindowsEx' ,
  VERSION_FROM  => 'lib/Win32/ExitWindowsEx/OO.pm' ,
  ABSTRACT_FROM => 'lib/Win32/ExitWindowsEx/OO.pm' ,
  AUTHOR        => 'Elvin Aslanov  <rwp.primary@gmail.com>' ,
  # LIBS          => [ '-LC:\Windows\System32 -lpowrprof' ] ,
  # DEFINE        => ' ' ,             # e.g., ' - DHAVE_SOMETHING '
  # INC           => ' - I . ' ,          # e.g., ' - I . - I / usr / include / other ',
);

# Makefile (with no LIBS):
# LDLOADLIBS =  -lmoldname -lkernel32 -luser32 -lgdi32 -lwinspool -lcomdlg32 -ladvapi32 -lshell32 -lole32 -loleaut32 -lnetapi32 -luuid -lws2_32 -lmpr -lwinmm -lversion -lodbc32 -lodbccp32 -lcomctl32

# qw(
# -lmoldname
# -lkernel32
# -luser32
#  -lgdi32
# -lwinspool
# -lcomdlg32
#  -ladvapi32
#  -lshell32
#  -lole32
#  -loleaut32
#  -lnetapi32
#  -luuid
#  -lws2_32
#  -lmpr
#  -lwinmm
#  -lversion
#  -lodbc32
#  -lodbccp32
#  -lcomctl32
# );

# LDLOADLIBS