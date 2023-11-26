#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#include <stdbool.h>

// winuser.h user32.dll

MODULE = Win32::ExitWindowsEx  PACKAGE = Win32::ExitWindowsEx

int shut_down()
  CODE:
    RETVAL = ExitWindowsEx (EWX_SHUTDOWN, 0) ;
  OUTPUT:
    RETVAL

int force_shut_down()
  CODE:
    RETVAL = ExitWindowsEx (EWX_SHUTDOWN | EWX_FORCE, 0) ;
  OUTPUT:
    RETVAL


int restart()
  CODE:
    RETVAL = ExitWindowsEx (EWX_REBOOT, 0) ;
  OUTPUT:
    RETVAL

int force_restart()
  CODE:
    RETVAL = ExitWindowsEx (EWX_REBOOT | EWX_FORCE, 0) ;
  OUTPUT:
    RETVAL


int log_off()
  CODE:
    RETVAL = ExitWindowsEx (EWX_LOGOFF, 0) ;
  OUTPUT:
    RETVAL

int force_log_off()
  CODE:
    RETVAL = ExitWindowsEx (EWX_LOGOFF | EWX_FORCE, 0) ;
  OUTPUT:
    RETVAL

bool lock_screen()
  CODE:
    RETVAL = LockWorkStation() ;
  OUTPUT:
    RETVAL
