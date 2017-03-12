use Irssi;
use Irssi::Irc;

sub trolha {
    my $c = ("\003");
    my @trolha = (
        "${c}2trolha DIXIT \"A tua mãe só pode ser uma ostra para cuspir uma pérola como tu!\" ${c}6trolha.1:69",
        "${c}5\"trolha DIXIT : Só queria que fosses uma pastilha elástica para te comer o dia todo.\" ${c}6trolha.2:69",
        "${c}10\"trolha DIXIT : Tens um cú que parece uma cebola! É de comer e chorar por mais!\" ${c}6trolha.3:69",
        "${c}3\"trolha DIXIT : Oh boa, com um cú desses deves cagar bombons!!\" ${c}6trolha.4:69",
        "${c}7\"trolha DIXIT : És como um helicóptero: gira e boa!\" ${c}6trolha.5:69",
        "${c}4\"trolha DIXIT : Um dia pensei Levar-te no meu coração Mas depois topei Que era muita areia para o meu camião...\" ${c}6trolha.6:69",
        "${c}5\"trolha DIXIT : Usas cuecas TMN? É que tens um rabinho que é um mimo! \" ${c}6trolha.7:69",
        "${c}15\"trolha DIXIT : Belas pernas! A que horas abrem?\" ${c}6trolha.8:69",
        "${c}7\"trolha DIXIT : Ó Fevera! Junta-te aqui à brasa!\" ${c}6trolha.9:69",
        "${c}10\"trolha DIXIT : Ó joia! Anda aqui ao ourives.\" ${c}6trolha.10:69",
        "${c}9\"trolha DIXIT : Ó morcôna, comia-te o sufixo!\" ${c}6trolha.11:69",
        "${c}10\"trolha DIXIT : Ó linda, sobe-me à palmeira e lambe-me os cocos...\" ${c}6trolha.12:69",
        "${c}14\"trolha DIXIT : Sabes onde ficava bem essa tua roupa? Toda amarrotada no chão do meu quarto!\" ${c}6trolha.13:69",
        "${c}10\"trolha DIXIT : Contigo filha, era até ao osso!\" ${c}6trolha.14:69",
        "${c}11\"trolha DIXIT : Ó estrela, Queres cometa?\" ${c}6trolha.15:69",
        "${c}7\"trolha DIXIT : Ó pessega..tirava-te o pelo todo...nem caroço deixava!\" ${c}6trolha.16:69",
        "${c}12\"trolha DIXIT : fazes anos ? vou-te partir o bolo todo!\" ${c}8trolha.17:69",
    );

    my ( $data, $server, $witem ) = @_;

    $witem->command( "/MSG " . $witem->{name} . " " . $trolha[ rand @trolha ] );
}

Irssi::command_bind( 'trolha', 'trolha' );
