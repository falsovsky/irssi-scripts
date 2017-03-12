use Irssi;
use Irssi::Irc;

sub floodit {
    my ( $data, $server, $witem ) = @_;

    $file = $data;       # Name the file
    open( INFO, $file ); # Open the file
    @lines = <INFO>;     # Read it into an array
    close(INFO);         # Close the file

    foreach $linha (@lines) {
        chomp($linha);
        chomp($linha);
        $witem->command( "/MSG " . $witem->{name} . " $linha" );
    }
}

Irssi::command_bind( 'flood', 'floodit' );
Irssi::print("ascii flooding script\nuse with /flood file");
