####################################################
# pseudo-intelectual script for irssi
####################################################
# changelog
# 0.1 first working version /pi <message goes here>
# 0.2 added pseudo_intelectual option
# 0.3 cleared a lot the script with a nice regex from dr_pro <d.oliveira@prozone.ws>
# 0.4 doesnt put the dot if the last word is a smiley, again with a nice regex from dr_pro

use strict;
use vars qw($VERSION %IRSSI);

$VERSION = "0.4";
%IRSSI   = (
    authors     => "Pedro de Oliveira",
    contact     => "falso\@rdk.homeip.net",
    name        => "Pseudo-Intelectual Script",
    description => "With this script you can talk ",
    "like a real pseudo-intelectual ",
    "with the first letter in uppercase ",
    "and with the dot at the end.",
    license => "GPL",
    url     => "http://rdk.homeip.net/irssi/",
);

use Irssi;
use Irssi::Irc;

sub convert {
    my ($msg) = @_;
    $_ = $msg;

    s/([^\?\.\!])\s*$/$1./
      unless /\w{3,}:\/\/[^\s]*$|:\-?[\>\<\(\)D\/\\]$|^\s+$/;
    s/([\?\.\!]\s\w)|^(\w)/uc($1.$2)/eg;
    $1 =~ s/( i )/ I /;
    $1 =~ s/( i')/ I'/;
    return $_;
}

sub pi {
    my ( $string, $server, $witem ) = @_;
    $witem->command( "msg " . $witem->{name} . " " . convert($string) );
}

sub always_on {
    my ($string) = $_[0];
    my $opcao = Irssi::settings_get_int('pseudo_intelectual');

    if ( $opcao eq "1" ) {
        $_[0] = convert($string);
        Irssi::signal_continue(@_);
    }

}

Irssi::settings_add_int( 'misc', 'pseudo_intelectual', "0" );
Irssi::command_bind( 'pi', 'pi' );
Irssi::signal_add( "send text", "always_on" );
Irssi::print(
"pseudo-intelectual script loaded\nuse with /pi <text>\nor /set pseudo_intelectual 1"
);
