use v5.38;
use experimental qw( class builtin );

class Win32::ExitWindowsEx;

use builtin qw( true false );

require XSLoader;
XSLoader::load();

method log_off ( $force = false ) {
  log_off( $force );
}

method restart ( $force = false ) {
  restart( $force );
}

method shut_down ( $force = false ) {
  shut_down( $force );
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
