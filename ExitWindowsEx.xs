#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#include <stdbool.h>

#define EXITWINDOWS_FAILED 0x13
#define EXITWINDOWS_SUCESS 0x14

#define ADJUST_TOCKEN_SUCESS 0x15
#define ADJUST_TOCKEN_FAILED 0x15
#define ADJUST_PRIVILEGE_FAILED 0x16

#define OPENING_PROCESS_TOKEN_FAILED 0x100


int AdjustProcessTokenPrivilege()
{
	HANDLE hToken; 
	TOKEN_PRIVILEGES tkp; 
 
	if (!OpenProcessToken(GetCurrentProcess(),TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, &hToken)) 
	{
		return OPENING_PROCESS_TOKEN_FAILED;
	}
 
	if(!LookupPrivilegeValue(NULL, SE_SHUTDOWN_NAME,&tkp.Privileges[0].Luid))
	{
		return ADJUST_PRIVILEGE_FAILED;
	}
 
	tkp.PrivilegeCount = 1;

	tkp.Privileges[0].Attributes = SE_PRIVILEGE_ENABLED; 
 
	AdjustTokenPrivileges(hToken, FALSE, &tkp, 0,(PTOKEN_PRIVILEGES)NULL, 0); 
 
	if (GetLastError() != ERROR_SUCCESS) 
	{
			return ADJUST_TOCKEN_FAILED;
	}
	

	return ADJUST_TOCKEN_SUCESS;
}

int ExitWindowsExt(UINT nFlag, DWORD dwType) {
  int iRetval=0;
  if( (iRetval=AdjustProcessTokenPrivilege()) == ADJUST_TOCKEN_SUCESS )
  {
    return ExitWindowsEx(nFlag,dwType);
  }
  else
  {
    return iRetval;
  }
  return FALSE;
}

MODULE = Win32::ExitWindowsEx  PACKAGE = Win32::ExitWindowsEx

int shut_down(bool force)
  CODE:
    RETVAL = force ?
      ExitWindowsExt (EWX_SHUTDOWN | EWX_FORCE, 0) :
      ExitWindowsExt (EWX_SHUTDOWN, 0) ;
  OUTPUT:
    RETVAL

int restart(bool force)
  CODE:
    RETVAL = force ?
      ExitWindowsExt (EWX_REBOOT | EWX_FORCE, 0) :
      ExitWindowsExt (EWX_REBOOT, 0) ;
  OUTPUT:
    RETVAL

int log_off(bool force)
  CODE:
      RETVAL = force ?
        ExitWindowsExt (EWX_LOGOFF | EWX_FORCE, 0) :
        ExitWindowsExt (EWX_LOGOFF, 0) ;
  OUTPUT:
    RETVAL
