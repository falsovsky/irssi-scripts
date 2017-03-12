use Irssi;
use Irssi::Irc;

sub fmodeall {
    my ( $data, $server, $channel, $witem ) = @_;

    if ( !$channel || $channel->{type} ne 'CHANNEL' ) {
        Irssi::print('No active channel in window');
        return;
    }

    $modes = "";
    $lulz  = "";
    foreach my $nick ( $channel->nicks() ) {
        $modes .= '+v-v+v-v';
        $lulz .=
            $nick->{nick} . ' '
          . $nick->{nick} . ' '
          . $nick->{nick} . ' '
          . $nick->{nick} . ' ';
    }

    $channel->command("/mode $channel->{name} $modes $lulz");
}

sub fmode {

    my ( $data, $server, $channel, $witem ) = @_;
    $data =~ s{\s+$}{};
    $nick = $data;

    $modes = "";
    $lulz  = "";
    for ( $i = 0 ; $i <= 15 ; $i++ ) {
        $modes .= '+v-v';
        $lulz  .= $nick . ' ';
    }

    Irssi::print("/mode $channel->{name} $modes $lulz");
    $channel->command("/mode $channel->{name} $modes $lulz");
}

Irssi::command_bind( 'fmode',    'fmode' );
Irssi::command_bind( 'fmodeall', 'fmodeall' );
