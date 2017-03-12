use Irssi;

@verb = (
    "spanking", "dancing with", "feeding",    "mounting",
    "fucking",  "shaving",      "starving",   "doing",
    "slapping", "pimping",      "chewing on", "scrubbing",
    "eating",   "stuffing"
);

@mid = ( "that", "my", "your", "the", "this" );

@adj = (
    "funky", "fucking", "lethal", "hungry", "steaming", "fluffy",
    "ripe",  "swollen", "abused", "oozing", "dead",     "rubber"
);

@noun = (
    "chicken", "donkey",     "bitch", "lumberjack", "mound", "headache",
    "twat",    "hemorrhoid", "goat",  "dog",        "cat",   "god",
    "wife",    "bald head",  "dude",  "foot",       "beaver"
);

sub randommsg {

    my ( $data, $server, $witem ) = @_;

    $data =
        $verb[ int( rand( $#verb + 1 ) ) ] . " "
      . $mid[ int( rand( $#mid + 1 ) ) ] . " "
      . $adj[ int( rand( $#adj + 1 ) ) ] . " "
      . $noun[ int( rand( $#noun + 1 ) ) ];

    $witem->command("/me is $data");
}

Irssi::command_bind( 'rand', 'randommsg' );
