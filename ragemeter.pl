# vim: ai ts=4 sts=4 et sw=4 ft=perl
# vim: autoindent tabstop=4 shiftwidth=4 expandtab softtabstop=4 filetype=perl

use strict;
use vars qw($VERSION %IRSSI);

$VERSION = "1.0";
%IRSSI   = (
    authors     => "Pedro de Oliveira",
    contact     => "falsovsky\@gmail.com",
    name        => "ragemeter",
    description => "With this script you caALL GLORY TO THE HYPNOTOAD",
    license     => "BSD"
);

use Irssi;
use Irssi::Irc;

my %colors = (
    'white'        => 0,
    'black'        => 1,
    'blue'         => 2,
    'green'        => 3,
    'light red'    => 4,
    'red'          => 5,
    'purple'       => 6,
    'orange'       => 7,
    'yellow'       => 8,
    'light green'  => 9,
    'cyan'         => 10,
    'light cyan'   => 11,
    'light blue'   => 12,
    'light purple' => 13,
    'gray'         => 14,
    'light gray'   => 15
);

my %themes = (
    'default' => [
        $colors{'light green'}, $colors{'yellow'},
        $colors{'orange'},      $colors{'light red'}
    ],
    'new' => [
        $colors{'light green'}, $colors{'yellow'}, $colors{'orange'},
        $colors{'light red'},   $colors{'red'}
    ]
);

sub ragemeter {
    my ( $data, $server, $window ) = @_;

    my $width   = 30;                      # Default var width
    my $level   = int( rand(105) + 1 );    # percentage filled
    my $who     = $server->{nick};
    my $message = "";
    my $theme   = $themes{'default'};

    if ( $data =~ m/-who (\S+)/ )   { $who   = $1; $data =~ s/-who \S+//g; }
    if ( $data =~ m/-width (\d+)/ ) { $width = $1; $data =~ s/-width \d+//g; }
    if ( $data =~ m/-level (\d+)/ ) { $level = $1; $data =~ s/-level \d+//g; }
    if ( $data =~ m/-msg ([\S ]+)/ ) { $message = $1; }

    if ( $message eq "" ) {
        if    ( $level <= 15 )  { $message = "CALM AND PEACEFUL"; }
        elsif ( $level <= 25 )  { $message = "RELAXED"; }
        elsif ( $level <= 50 )  { $message = "NOT SO ANGRY"; }
        elsif ( $level <= 100 ) { $message = "ANGRY AT YOU"; }
        elsif ( $level > 100 )  { $message = "OFF DA SCALE (buffar ovarrun)"; }
    }

    my $ncolors    = scalar(@$theme);
    my $colorwidth = int( $width / $ncolors );

    my $msg = "rage-meter for \002$who\002\037:\037 \00314[";

    for ( my $i = 0 ; $i < $width ; $i++ ) {

        for ( my $x = 0 ; $x < $ncolors ; $x++ ) {
            if ( $i == $colorwidth * $x ) {
                $msg .= "\003" . @$theme[$x];
            }
        }

        if ( int( ( $i / $width ) * 100 ) >= $level ) {
            $msg .= "-";
        }
        else {
            $msg .= "=";
        }

    }

    $msg .= "\00314]";

    if ( $level > 100 ) {
        my $levelwidth = ( $level * $width ) / 100;
        $msg .= "\003" . @$theme[-1];
        for ( my $i = 0 ; $i < ( $levelwidth - $width ) ; $i++ ) {
            $msg .= "=";
        }
    }

    $msg .= " \002\037\0034" . $message;

    if ($window) {
        $window->command( "say " . $msg );
    }
    else {
        Irssi::print($msg);
    }
}

Irssi::command_bind( 'ragemeter', 'ragemeter' );
Irssi::command_set_options( 'ragemeter', '-who -width -level -msg' );
