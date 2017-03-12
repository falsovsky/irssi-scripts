####################################################
# hypnotoad script foALL GLORY TO THE HYPNOTOAD
####################################################

use strict;
use vars qw($VERSION %IRSSI);
use MIME::Base64;

$VERSION = "1.1";
%IRSSI   = (
    authors     => "Pedro de Oliveira",
    contact     => "falso\@rdk.homeip.net",
    name        => "hypnotoad",
    description => "With this script you caALL GLORY TO THE HYPNOTOAD",
    license     => "BSD"
);

my $allglory = decode_base64(
"AzkgICAgICAgICAgICAgICAgLCdgYC4uXyAgICwnYGAuCgM5ICAgICAgICAgICAgICA6LC0tLl86KVwsOiwuXywuOiAgICAgICBBbGwgR2xvcnkgdG8KAzkgICAgICAgICAgICAgIDpgLS0sJycgICA6YC4uLic7XCAgICAgIHRoZSBIWVBOTyBUT0FEIQoDOSAgICAgICAgICAgICAgIGAsJyAgICAgICBgLS0tJyAgYC4KAzkgICAgICAgICAgICAgICAvICAgICAgICAgICAgICAgICA6CgM5ICAgICAgICAgICAgICAvICAgICAgICAgICAgICAgICAgIFwKAzkgICAgICAgICAgICAsJyAgICAgICAgICAgICAgICAgICAgIDpcLl9fXywtLgoDOSAgICAgICAgICAgYC4uLiwtLS0nYGBgYGBgLS4uLl8gICAgfDogICAgICAgXAoDOSAgICAgICAgICAgICAoICAgICAgICAgICAgICAgICApICAgOzogICAgKSAgIFwgIF8sLS4KAzkgICAgICAgICAgICAgIGAuICAgICAgICAgICAgICAoICAgLy8gICAgICAgICAgYCcgICAgXAoDOSAgICAgICAgICAgICAgIDogICAgICAgICAgICAgICBgLi8vICApICAgICAgKSAgICAgLCA7CgM5ICAgICAgICAgICAgICwtfGAuICAgICAgICAgICAgXywnLyAgICAgICApICAgICkgLCcgLCcKAzkgICAgICAgICAgICAoICA6YC5gLS4uX19fXy4uPTouLSc6ICAgICAuICAgICBfLCcgLCcKAzkgICAgICAgICAgICAgYCwnXCBgYC0tLi4uLi0pPScgICAgYC5fLCAgXCAgLCcpIF8gJ2BgLl8KAzkgICAgICAgICAgXy4tLyBfIGAuICAgICAgIChfKSAgICAgIC8gICAgICknIDsgLyBcIFxgLS4nCgM5ICAgICAgICAgYC0tKCAgIGAtOmAuICAgICBgJyBfX18uLicgIF8sLScgICB8LyAgIGAuKQoDOSAgICAgICAgICAgICBgLS4gYC5gLmBgLS0tLS1gYC0tLCAgLicKAzkgICAgICAgICAgICAgICB8L2AuXGAnICAgICAgICAsJywnKTsgU1N0CgM5ICAgICAgICAgICAgICAgICAgIGAgICAgICAgICAoLyAgKC8K"
);

use Irssi;
use Irssi::Irc;

sub hypnotoadize {
    my $s = @_[0];
    my $out;

    if ( length($s) > 10 ) {
        return
          substr( $s, 0, ( length($s) - 6 ) ) . "ALL GLORY TO THE HYPNOTOAD";
    }

    return $s;
}

sub send {
    my ( $s, $server, $witem ) = @_;
    $witem->command( "msg " . $witem->{name} . " " . hypnotoadize($s) );
}

sub randomizer {
    my ($string) = $_[0];
    my $rand = int( rand( Irssi::settings_get_int('hypnotoad_random') ) );
    if ( $rand eq 1 ) {
        $_[0] = hypnotoadize($string);
        Irssi::signal_continue(@_);
    }

}

Irssi::settings_add_int( 'misc', 'hypnotoad_random', 100 );

Irssi::command_bind( 'ht', 'send' );
Irssi::signal_add( "send text", "randomizer" );
Irssi::print($allglory);
