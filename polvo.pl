use Irssi;
use Irssi::Irc;
use Irssi qw(command_bind signal_add);

use strict;
use warnings;

use vars qw($VERSION %IRSSI);
$VERSION = "0.9";
%IRSSI   = (
    authors     => 'falso',
    name        => 'polvo',
    description => '',
    license     => 'BSD',
);

sub public_polvo {
    my ( $server, $msg, $nick, $address, $target ) = @_;
    cmd_polvo( $server, $target, $msg );
}

sub own_polvo {
    my ( $server, $msg, $target ) = @_;
    cmd_polvo( $server, $target, $msg );
}

sub cmd_polvo {
    my ( $server, $target, $input_msg ) = @_;
    my $output_msg = "";

    #print $input_msg;
    if ( $input_msg =~ /^\<? ?!polvo/ ) {

        #print $input_msg;
        $input_msg =~ s/^\<? ?\!polvo ?//;
        if ( length($input_msg) == 0 ) {
            $output_msg =
"Paul o Polvo espalha a tinta preta e afasta-se rapidamente de cena ...";
        }
        else {
            my @args = split( " ", $input_msg );

            if ( scalar(@args) == 1 ) {
                $output_msg = sprintf(
                    "Paul o Polvo Encarna o Cap Obvious e aponta para %s",
                    $args[0] );
            }
            else {
                $output_msg = sprintf( "Paul o Polvo escolhe --> %s <--",
                    $args[ rand @args ] );
            }
        }
        $server->command( 'msg ' . $target . ' ' . $output_msg );
    }
}

signal_add( "message public",     "public_polvo" );
signal_add( "message own_public", "own_polvo" );
