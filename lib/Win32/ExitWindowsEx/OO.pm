use v5.38;
use experimental qw( class builtin );
use builtin qw( true false );
use XSLoader;

XSLoader::load( "Win32::ExitWindowsEx" );

class Win32::ExitWindowsEx::OO;

field $force :param = false;
# field $reason;

method log_off ( ) {
  if ( $force ) {
    Win32::ExitWindowsEx::force_log_off();
  }
  else {
    Win32::ExitWindowsEx::log_off();
  }
}

method restart ( ) {
  if ( $force ) {
    Win32::ExitWindowsEx::force_restart();
  }
  else {
    Win32::ExitWindowsEx::restart();
  }
}

method shut_down ( ) {
  if ( $force ) {
    Win32::ExitWindowsEx::force_shut_down();
  }
  else {
    Win32::ExitWindowsEx::shut_down();
  }
}

method lock_screen ( ) {
  Win32::ExitWindowsEx::lock_screen();
}

=head1 NAME

Win32::ExitWindowsEx - a perl extension to let you shutdown and/or restart and/or logoff a Windows PC

=head1 SYNOPSIS

  use Win32::ExitWindowsEx;
  Win32::ExitWindowsEx->shut_down();

=head1 DESCRIPTION

=head2 EXPORT

None by default.

=head1 AUTHOR

Elvin Aslanov E<lt>rwp.primary@gmail.comE<gt>

C. N. Drake, E<lt>christopher@pobox.comE<gt>

=cut


# https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-exitwindowsex
# https://learn.microsoft.com/en-us/windows/win32/shutdown/system-shutdown-reason-codes
# https://learn.microsoft.com/en-us/windows/win32/shutdown/shutting-down

# https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-lockworkstation
# https://learn.microsoft.com/en-us/windows/win32/shutdown/how-to-lock-the-workstation


# Header: winuser.h
# Library: user32.dll
