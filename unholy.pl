#!/usr/bin/perl
#// Based on CoolNerds' Random Profound Insight Generator
#// @ http://www.coolnerds.com/webauth/jscript/profound.htm
#// Unholy lexicon and all invoked titles (c) Rob Waldie, June 98
#// --

use Irssi;
use Irssi::Irc;

@first = (
    "And",         "Of",              "Under",          "In",
    "Through",     "Between",         "Beneath",        "Beyond",
    "Towards",     "Into",            "From",           "Conquering",
    "Praise",      "Praising",        "Storming",       "Hailing",
    "Beholding",   "Worshipping",     "Bleeding For",   "Dwelling In",
    "Rising From", "Descending Into", "War For",        "Battling For",
    "Gazing Over", "Hearing",         "Blaspheming",    "Crossing",
    "Invoking",    "Traversing",      "Forever Reigns", "Conquer",
    "Storm",       "Hail",            "Behold",         "Invoke",
    "Over"
);

@article = ( "a", "The" );

@adjective = (
    "Black",    "Hateful",    "Evil",          "Melancholic",
    "Satanic",  "Eternal",    "Frostbitten",   "Freezing",
    "Funeral",  "Blood Red",  "Nocturnal",     "Winter",
    "Satanic",  "Unholy",     "Grim",          "Frozen",
    "Spectral", "Dead",       "Grey",          "Bleakest",
    "Burning",  "Silent",     "Still",         "Dark",
    "Pagan",    "Vast",       "Mighty",        "Infernal",
    "Majestic", "Blasphemic", "Heathen",       "Everlasting",
    "Ancient",  "Northern",   "Antichristian", "Blazing",
    "Crucified"
);

@noun1 = (
    "Wood",           "Forest",          "Mountain",   "Night",
    "Realm",          "Kingdom",         "Dominion",   "Northland",
    "North",          "Hell",            "Underworld", "Infinity",
    "Eternity",       "Chasm",           "Sky",        "Blood",
    "Wrath",          "Power",           "Might",      "Glory",
    "Forevermore",    "Despair",         "Shadows",    "Throne",
    "Fullmoon",       "Cosmos",          "Death",      "Darkness",
    "Frost",          "Horizon",         "Fog",        "Mist",
    "Hordes",         "Legion",          "Passage",    "Blasphemy",
    "Fall Of Heaven", "Death Of Christ", "Twilight",   "Furnace",
    "Chalice",        "Sword",           "Dagger",     "Coffin",
    "Pentagram",      "Cloak",           "Chant",      "Scream",
    "Cry",            "Wolf",            "Raven",      "Winter",
    "Demon",          "Storm",           "Whore",      "Goat",
    "Dawn",           "Crucifixion",     "Oath",       "Pact"
);

@preposition = (
    "Beyond",        "Towards",      "Into",             "From",
    "And",           "Of",           "Under",            "In",
    "Through",       "Between",      "Beneath",          "With",
    "Surrounded By", "Bewitched By", "For The Glory Of", "Over",
    "In The Name Of"
);

@noun2 = (
    "Woods",       "Forests",      "Mountains",   "Night",
    "Realms",      "Kingdoms",     "Dominions",   "Northlands",
    "North",       "Hell",         "Underworlds", "Infinity",
    "Eternity",    "Chasms",       "Skies",       "Wolves",
    "Wrath",       "Power",        "Might",       "Glory",
    "Forevermore", "Despair",      "Shadows",     "Thrones",
    "Necromancy",  "Cosmos",       "Death",       "Darkness",
    "Frosts",      "Horizons",     "Fog",         "Mist",
    "Hordes",      "Legions",      "Passages",    "Blasphemy",
    "Lust",        "Sin",          "Twilight",    "Sodomy",
    "Chalices",    "Swords",       "Daggers",     "Coffins",
    "Pentagrams",  "Flagellation", "Chants",      "Screams",
    "Cries",       "Winter",       "Demons",      "Witchery",
    "Spellcraft",  "Hellfire",     "Supremecy",   "Desolation",
    "Light",       "Storms",       "Winds",       "Horns",
    "Damnation",   "Evil",         "Immortality", "Inferno",
    "Spears"
);

use vars qw (@first, @article, @adjective, @noun1, @preposition, @noun2);

#//function to generate the random profundity.
sub unholybmizer {

    $msg = $first[ int( rand(@first) ) ] . " ";
    $msg .= $article[ int( rand(@article) ) ] . " ";
    $msg .= $adjective[ int( rand(@adjective) ) ] . " ";
    $msg .= $noun1[ int( rand(@noun1) ) ] . " ";
    $msg .= $preposition[ int( rand(@preposition) ) ] . " ";
    $msg .= $adjective[ int( rand(@adjective) ) ] . " ";
    $msg .= $noun2[ int( rand(@noun2) ) ];

    Irssi::active_win()->command( '/say ' . $msg );
}

Irssi::command_bind( 'unholybmizer', 'unholybmizer' );
