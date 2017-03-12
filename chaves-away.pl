#!/usr/bin/perl -w 

###################################################################
# leet away script for irssi 
# Pedro de Oliveira <bud@serrado.net> 
#
# based on randaway.pl written by scn/EFNET, march 2002
# ripped Bruno Almeida <bma@BuBix.net> /ame script 
#
# many thanks to buckl3y , lucipher , Domusonline and fatzu @ ptnet
###################################################################
# Just create the files 'awayreasons' and 'backreasons' in your 
# .irssi dir with the reasons that you want, and its ready to work 
###################################################################

use vars qw($VERSION %IRSSI);

use Irssi;

$VERSION = "0.4";
%IRSSI = (
    authors	=> "Florindo Admim",
    contact	=> "bud\@serrado.net",
    name 	=> "leet away script for irssi",
    description => "Show random public away-messages, and shows how many time you were away",
    license	=> "Public Domain",
    changed => 'Sat Sep 28 23:31 WET 2002',
);

# file to read random reasons from. It should contain one
# reason at each line, empty lines and lines starting with # is 
# skipped.
$reasonfile = "$ENV{HOME}/.irssi/awayreasons";
$backfile = "$ENV{HOME}/.irssi/backreasons";

my @awayreasons;
my @backreasons;

sub readreasons {
        undef @awayreasons;
        if (-f $reasonfile) { 
                Irssi::print("=> Trying to read awayreasons from $reasonfile");
		open F, $reasonfile;

		# this actually makes the while() work like a while and not
		# like a read() .. ie, stopping at each \n.
		local $/ = "\n";
                    while (<F>) {
		    $reason = $_;

		    # remove any naughty linefeeds.
		    chomp($reason);
		    
		    # skips reason if it's an empty line or line starts with #
		    if ($reason =~ /^$/ ) { next; }
		    if ($reason =~ /^#/ ) { next; }
		    
		    #Irssi::print("\"$reason\"");
		    
		    # adds to array.
		    push(@awayreasons, $reason); 
                }
                close F; 
                Irssi::print("=> Read " . scalar(@awayreasons) . " reasons.");
        } else {
	    # some default away-reasons.
	    Irssi::print("Unable to find $reasonfile, no reasons loaded.");
	    push(@awayreasons, "i\'m pretty lame!");
	    push(@awayreasons, "i think i forgot something!"); 
	};  
}


sub readbackreasons {
        undef @backreasons;
        if (-f $backfile) {
                Irssi::print("=> Trying to read backreasons from $backfile");
                open F, $backfile;

                # this actually makes the while() work like a while and not
                # like a read() .. ie, stopping at each \n.
                local $/ = "\n";
                    while (<F>) {
                    $backreason = $_;

                    # remove any naughty linefeeds.
                    chomp($backreason);

                    # skips reason if it's an empty line or line starts with #
                    if ($backreason =~ /^$/ ) { next; }
                    if ($backreason =~ /^#/ ) { next; }

                    #Irssi::print("\"$backreason\"");

                    # adds to array.
                    push(@backreasons, $backreason);
                }
                close F;
                Irssi::print("=> Read " . scalar(@backreasons) . " backreasons.");
        } else {
            # some default away-reasons.
            Irssi::print("Unable to find $backfile, no reasons loaded.");
            push(@backreasons, "hey. i am happy to be back. really.");
            push(@backreasons, "did i miss anything?");
        };
}




sub away {
    # only do our magic if we're not away already. 
    my ($reason, $server) = @_;
    if (!$server || !$server->{connected}) {
		Irssi::print("Not connected to server!");
		Irssi::signal_stop();
		return;
	}
    if ($server->{usermode_away} == 0) {
		if (!$reason) { 
		$reason = $awayreasons[rand @awayreasons];
		$server->command("/AWAY $reason");
		Irssi::signal_stop();
		return;
		}
	
		$inicio = time();
	
		Irssi::print("awayreason used: $reason");
		$server->command("/ame is gone, $reason");
    } else {
		Irssi::print("you're already away");
		Irssi::signal_stop();
	}
}

sub back {
    my ($reason, $server) = @_;
    $backr = $backreasons[rand @backreasons];
    if (Irssi::active_server()->{usermode_away} != 0) {

$back=time();
$total = $back - $inicio;

$dias = int($total/(3600*24));
$total = $total - $dias * (3600*24);
$horas = int($total/(3600));
$total = $total - $horas * 3600;
$minutos = int($total/(60));
$total = $total - $minutos * 60;
$segundos = int($total/(60));
$total = $total - $segundos * 60;

	Irssi::print("Back from: " . Irssi::active_server()->{away_reason});
if ($dias ge 1) { 
	$server->command("/ame is back, $backr - away for \002\037[\002\037 " . uc(sprintf("%x", $dias)) . "\002d\002," . uc(sprintf("%x", $horas)) . "\002h\002," . uc(sprintf("%x", $minutos)) . "\002m\002," . uc(sprintf("%x", $total)) . "\002s\002 \002\037]\037\002");
 } else { if ($horas ge 1) {
	$server->command("/ame is back, $backr - away for \002\037[\002\037 " . uc(sprintf("%x", $horas)) . "\002h\002," . uc(sprintf("%x", $minutos)) . "\002m\002," . uc(sprintf("%x", $total)) . "\002s\002 \002\037]\002\037");
} else {
if ($minutos ge 1) { 
	$server->command("/ame is back, $backr - away for \002\037[\002\037 " . uc(sprintf("%x", $minutos)) . "\002m\002," . uc(sprintf("%x", $total)) . "\002s\002 \002\037]\002\037");
} else {
if ($total ge 1) {
	$server->command("/ame is back, $backr - away for \002\037[\002\037 " . uc(sprintf("%x", $total)) . "\002s\002 \002\037]\002\037");
}
}
}}
$server->command("/quote AWAY");
    }
    else {
	Irssi::print("You are not away!");
    }
}

sub cmd_ame {

        my ($text, $server, $channel) = @_;

        if (!$server || !$server->{connected}) {
                Irssi::print("Not connected to server!");
                return;
        }

        if ($text) {
                foreach $channel (Irssi::active_server()->channels()) {
                        $server->command("/ACTION $channel->{name} $text");
                }
        } 
        else {
                Irssi::print("Please Input Some Text!");
        }
}



# -- main program --

readreasons();
readbackreasons();
Irssi::print("commands :\n/away -> go away \n/back -> come back");
Irssi::print("/awayreread -> refresh away reasons from awayreasons");
Irssi::print("/backreread -> refresh back reasons from backreasons");
Irssi::print("/ame action in all channels"); 
Irssi::print("random away script by falso <bud\@serrado.net> loaded!");
Irssi::command_bind('away', 'away');
Irssi::command_bind('awayreread', 'readreasons');
Irssi::command_bind('backreread', 'readbackreasons');
Irssi::command_bind('back', 'back');
Irssi::command_bind('ame', 'cmd_ame');
# -- end of script --
