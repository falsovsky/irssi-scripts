##################################################
# tROUT speaking for irssi
##################################################

use Irssi;
use Irssi::Irc;

sub tROUT {
    my ( $data, $server, $witem ) = @_;

    $data =~ s/( ?)(\w)(\w*)/$1\l$2\U$3/g;

    $witem->command( "/MSG " . $witem->{name} . " $data" );
}

Irssi::command_bind( 'trout', 'tROUT' );

Irssi::print("tROUTNESS sCRIPT lOADED\n uSE wITH /tROUT text");
