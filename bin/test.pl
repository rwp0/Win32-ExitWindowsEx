use v5.38;
use experimental qw( builtin );
use builtin qw( true );

use Win32::ExitWindowsEx::OO;

my $ewe = Win32::ExitWindowsEx::OO -> new( force => true );

$ewe -> log_off();
