use strict;
use utf8;
use vars qw($VERSION %IRSSI);

use Irssi;
use Irssi::Irc;

$VERSION = "0.2";
%IRSSI   = (
    authors => "Pedro de Oliveira",
    contact => "falso\@rdk.homeip.net",
    name    => "Zalgo - HE COMES",
    description =>
"Zalgo-ing script based on tchouky\'s javascript Zalgo text generator - http://www.eeemo.net/",
    license => "BSD"
);

my @zalgo_up = (
    "\x{030d}", "\x{030e}", "\x{0304}", "\x{0305}", "\x{033f}", "\x{0311}",
    "\x{0306}", "\x{0310}", "\x{0352}", "\x{0357}", "\x{0351}", "\x{0307}",
    "\x{0308}", "\x{030a}", "\x{0342}", "\x{0343}", "\x{0344}", "\x{034a}",
    "\x{034b}", "\x{034c}", "\x{0303}", "\x{0302}", "\x{030c}", "\x{0350}",
    "\x{0300}", "\x{0301}", "\x{030b}", "\x{030f}", "\x{0312}", "\x{0313}",
    "\x{0314}", "\x{033d}", "\x{0309}", "\x{0363}", "\x{0364}", "\x{0365}",
    "\x{0366}", "\x{0367}", "\x{0368}", "\x{0369}", "\x{036a}", "\x{036b}",
    "\x{036c}", "\x{036d}", "\x{036e}", "\x{036f}", "\x{033e}", "\x{035b}",
    "\x{0346}", "\x{031a}"
);

my @zalgo_down = (
    "\x{0316}", "\x{0317}", "\x{0318}", "\x{0319}", "\x{031c}", "\x{031d}",
    "\x{031e}", "\x{031f}", "\x{0320}", "\x{0324}", "\x{0325}", "\x{0326}",
    "\x{0329}", "\x{032a}", "\x{032b}", "\x{032c}", "\x{032d}", "\x{032e}",
    "\x{032f}", "\x{0330}", "\x{0331}", "\x{0332}", "\x{0333}", "\x{0339}",
    "\x{033a}", "\x{033b}", "\x{033c}", "\x{0345}", "\x{0347}", "\x{0348}",
    "\x{0349}", "\x{034d}", "\x{034e}", "\x{0353}", "\x{0354}", "\x{0355}",
    "\x{0356}", "\x{0359}", "\x{035a}", "\x{0323}"
);

my @zalgo_mid = (
    "\x{0315}", "\x{031b}", "\x{0340}", "\x{0341}", "\x{0358}", "\x{0321}",
    "\x{0322}", "\x{0327}", "\x{0328}", "\x{0334}", "\x{0335}", "\x{0336}",
    "\x{034f}", "\x{035c}", "\x{035d}", "\x{035e}", "\x{035f}", "\x{0360}",
    "\x{0362}", "\x{0338}", "\x{0337}", "\x{0361}", "\x{0489}"
);

sub irand {
    return int( rand( $_[0] ) );
}

sub rand_zalgo {
    return $_[ irand( scalar(@_) ) ];
}

sub is_zalgo_char {
    my $i;
    for ( $i = 0 ; $i <= scalar(@zalgo_up) ; $i++ ) {
        if ( $_[0] eq $zalgo_up[$i] ) {
            return 1;
        }
    }
    for ( $i = 0 ; $i <= scalar(@zalgo_down) ; $i++ ) {
        if ( $_[0] eq $zalgo_down[$i] ) {
            return 1;
        }
    }
    for ( $i = 0 ; $i <= scalar(@zalgo_mid) ; $i++ ) {
        if ( $_[0] eq $zalgo_mid[$i] ) {
            return 1;
        }
    }

    return 0;
}

sub he_comes {
    my $txt    = $_[0];
    my $newtxt = '';

    for ( my $i = 0 ; $i <= length($txt) ; $i++ ) {
        if ( is_zalgo_char( substr( $txt, $i, 1 ) ) == 1 ) {
            next;
        }

        my $num_up;
        my $num_mid;
        my $num_down;

        $newtxt .= substr( $txt, $i, 1 );

        # mini
        if ( $_[1] == 1 ) {
            $num_up   = irand(8);
            $num_mid  = irand(2);
            $num_down = irand(8);
        }

        # normal
        if ( $_[1] == 2 ) {
            $num_up   = irand(16) / 2 + 1;
            $num_mid  = irand(6) / 2;
            $num_down = irand(16) / 2 + 1;
        }

        # maxi
        if ( $_[2] == 3 ) {
            $num_up   = irand(64) / 4 + 3;
            $num_mid  = irand(16) / 4 + 1;
            $num_down = irand(64) / 4 + 3;
        }

        my $j;

        # up
        for ( $j = 0 ; $j <= $num_up ; $j++ ) {
            $newtxt .= rand_zalgo(@zalgo_up);
        }

        # mid
        for ( $j = 0 ; $j <= $num_mid ; $j++ ) {
            $newtxt .= rand_zalgo(@zalgo_mid);
        }

        # down
        for ( $j = 0 ; $j <= $num_down ; $j++ ) {
            $newtxt .= rand_zalgo(@zalgo_down);
        }
    }

    return $newtxt;
}

sub irssi_zalgoamento {
    my ( $s, $server, $witem ) = @_;
    my $level = Irssi::settings_get_int('zalgo_level');
    if ( $level < 1 or $level > 3 ) {
        $level = 1;
    }

    $witem->command( "msg " . $witem->{name} . " " . he_comes( $s, $level ) );
}

Irssi::settings_add_int( 'misc', 'zalgo_level', 1 );
Irssi::command_bind( 'zalgo', 'irssi_zalgoamento' );
Irssi::print( "Zalgo!!!! HE COMES!!\n/set zalgo_level [1-3]\n"
      . "1 para pouco zalgamento, 3 para muito" );
