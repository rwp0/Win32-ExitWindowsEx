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
    Win32::ExitWindowsEx::_force_log_off();
  }
  else {
    Win32::ExitWindowsEx::_log_off();
  }
}

method restart ( ) {
  if ( $force ) {
    Win32::ExitWindowsEx::_force_restart();
  }
  else {
    Win32::ExitWindowsEx::_restart();
  }
}

method shut_down ( ) {
  if ( $force ) {
    Win32::ExitWindowsEx::_force_shut_down();
  }
  else {
    Win32::ExitWindowsEx::_shut_down();
  }
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
