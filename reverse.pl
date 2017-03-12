use Irssi;
use Irssi::Irc;

sub reverse {
    my ( $data, $server, $witem ) = @_;

    $witem->command( "/MSG " . $witem->{name} . " " . scalar reverse($data) );
}

Irssi::command_bind( 'r', 'reverse' );
