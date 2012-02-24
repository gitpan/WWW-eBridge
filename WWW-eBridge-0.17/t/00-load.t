#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'WWW::eBridge' ) || print "Bail out!\n";
}

diag( "Testing WWW::eBridge $WWW::eBridge::VERSION, Perl $], $^X" );
