use Irssi;
use Irssi::Irc;

sub taveira {
    my $c = ("\003");
    my @taveira = (
        "${c}2\"Ui ca bom!\" ${c}6Taveira.1:69",
        "${c}5\"TAVEIRA DISSE : Ui que enrabadela pa', que eu vou dar nesta querida.\" ${c}6Taveira.2:69",
        "${c}10\"TAVEIRA DISSE : Ai, ele todo lah dentro!\" ${c}6Taveira.3:69",
        "${c}3\"TAVEIRA DISSE : Todo la' dentro do cu da querida!\" ${c}6Taveira.4:69",
        "${c}7\"TAVEIRA DISSE : Pronto querida! Estah todo, linda! Pronto! Pronto!\" ${c}6Taveira.5:69",
        "${c}4\"TAVEIRA DISSE : Com kygel nao doi!\" ${c}6Taveira.6:69",
        "${c}3\"TAVEIRA DISSE : Todo la' dentro do cu da querida!\" ${c}6Taveira.4:69",
        "${c}5\"TAVEIRA DISSE : Esta's a ver querida como eh bom?\" ${c}6Taveira.7:69",
        "${c}15\"TAVEIRA DISSE : Agora nao doi pois nao?Isso, poe esse cuzinho bem para cima.Va', aguenta-te bem. So' este bocadinho e' que doi.\" ${c}6Taveira.8:69",
        "${c}7\"TAVEIRA DISSE : Isso mesmo, respira fundo! Pronto, ja' esta'. Pronto! Pronto! Na~o te va's embora.Aguenta, aguenta!\" ${c}6Taveira.9:69",
        "${c}10\"TAVEIRA DISSE : Pronto, ja' esta'! Ja' esta' todo. Ui e' ta~o bom, esse cu!\" ${c}6Taveira.10:69",
        "${c}9\"TAVEIRA DISSE : Enquanto me deixares meter o caralho no cu, fico sempre a gostar de ti.\" ${c}6Taveira.11:69",
        "${c}10\"TAVEIRA DISSE : Vou ali buscar oleo.\" ${c}6Taveira.12:69",
        "${c}14\"TAVEIRA DISSE : Aguenta, aguenta!\" ${c}6Taveira.13:69",
        "${c}10\"TAVEIRA DISSE : Vai aguentando que depois venho-me na tua boca. Depois deitas tudo na minha barriguinha e lambes, ta' bem?\" ${c}6Taveira.14:69",
        "${c}11\"TAVEIRA DISSE : Vamos comer a Fatinha, na~o e'?\" ${c}6Taveira.15:69",
        "${c}2\"TAVEIRA DISSE : Olha o que vai entrar nesse CU!Vah, que esta cabecinha nao tem ombros!\" ${c}6Taveira.16:69",
        "${c}3\"TAVEIRA DISSE : Queres oleo?E' grande demais?Ah, que vou faze-la sofrer um bocadinho.\" ${c}6Taveira.17:69",
        "${c}12\"TAVEIRA DISSE : Ah diz assim, Eh bruto!, diz alto diz.Aguenta! Nao chora!\" ${c}6Taveira.18:69",
        "${c}2\"TAVEIRA DISSE : Eh grande nao eh?\" ${c}6Taveira.19:69"
    );

    my ( $data, $server, $witem ) = @_;

    $witem->command(
        "/MSG " . $witem->{name} . " " . $taveira[ rand @taveira ] );
}

Irssi::command_bind( 'taveira', 'taveira' );
