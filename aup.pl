use strict;
use vars qw($VERSION %IRSSI);

$VERSION = "1.0";
%IRSSI   = (
    authors     => "Pedro de Oliveira",
    contact     => "falsovsky\@gmail.com",
    name        => "aup",
    description => "AUP",
    license     => "BSD"
);

use Irssi;
use Irssi::Irc;

sub my_aup {
    my ( $message, $server, $window ) = @_;

    my $c = ("\003"); # control c
    my $b = ("\002"); # control b

    my $who = ""; # to check if its directed to someone

    if ( $message =~ m/-who (\S+)/ ) {
        $who = $b . $1 . $b . " - ";
        $message =~ s/-who \S+//g;
    }

    if ($message eq "") {
        $message = "Nao saber usar o script";
    }

    $message =~ s/^\s+|\s+$//g;

    my $encoded_message = $message;
    $encoded_message =~ s/([^A-Za-z0-9 ]+)//g;
    $encoded_message =~ s/ /%20/g;

    my $aup = "/!\\ Aviso: $who${c}13$message$c é uma violação da AUP da DeadBSD (consulte em: http://aup.deadbsd.org/$encoded_message ) e pode incorrer em sansões graves. Lembre-se de utilizar este serviço como um privilégio e nunca como um direito!";

    $window->command( "say " . $aup );
}

Irssi::command_bind( 'aup', 'my_aup' );
Irssi::command_set_options( 'aup', '-who' );
