#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"



MODULE = Win32::ExitWindowsEx  PACKAGE = Win32::ExitWindowsEx

int _shut_down()
  CODE:
    RETVAL = ExitWindowsEx (EWX_SHUTDOWN, 0) ;
  OUTPUT:
    RETVAL

int _force_shut_down()
  CODE:
    RETVAL = ExitWindowsEx (EWX_SHUTDOWN | EWX_FORCE, 0) ;
  OUTPUT:
    RETVAL


int _restart()
  CODE:
    RETVAL = ExitWindowsEx (EWX_REBOOT, 0) ;
  OUTPUT:
    RETVAL

int _force_restart()
  CODE:
    RETVAL = ExitWindowsEx (EWX_REBOOT | EWX_FORCE, 0) ;
  OUTPUT:
    RETVAL


int _log_off()
  CODE:
    RETVAL = ExitWindowsEx (EWX_LOGOFF, 0) ;
  OUTPUT:
    RETVAL

int _force_log_off()
  CODE:
    RETVAL = ExitWindowsEx (EWX_LOGOFF | EWX_FORCE, 0) ;
  OUTPUT:
    RETVAL
