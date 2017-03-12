use Irssi;
use Irssi::Irc;

sub passagem {
    my $c = ("\003");
    my @passagens = (
        "${c}2\"Deitei e dormi; acordei porque o Senhor me sustentou.\" ${c}6Slm.3:5",
        "${c}5\"Oferecei sacrifícios de justiça, e confia no Senhor.\" ${c}6Slm.4:5",
        "${c}10\"O Senhor é a minha luz e a minha salvação: a quem temerei?\" ${c}6Slm.27-1",
        "${c}3\"Bem aventurada é a nação cujo Deus é o Senhor.\" ${c}6Slm.33:12",
        "${c}7\"Apressa-te em meu auxílio, Senhor, minha salvação.\" ${c}6Slm.38:22",
        "${c}4\"Aquietai-vos e sabei que Eu sou seu Deus; serei exaltado sobre a terra.\" ${c}6Slm.46:10",
        "${c}5\"Invoca-me no dia da angústia; Eu te livrarei...\" ${c}6Slm.50:15",
        "${c}15\"A minha alma espera somente em Deus; dEle vem a minha salvação.\" ${c}6Slm.62:1",
        "${c}7\"O justo se alegra no Senhor, e nele confia.\" ${c}6Slm.64:10",
        "${c}10\"Confundidos sejam todos os que servem imagem e escultura.\" ${c}6Slm.97:7",
        "${c}9\"Faz cessar a tormenta, e acalmam-se as ondas ondas.\" ${c}6Slm.107:29",
        "${c}10\"O Senhor está comigo, não temerei o que me pode fazer o homem.\" ${c}6Slm.118...",
        "${c}14\"Justo és, ó Senhor e retos sãos os teus juízos.\" ${c}6Slm.118:137",
        "${c}10\"Abomino e detesto a mentira; porém amo a tua lei.\" ${c}6Slm.119:163",
        "${c}11\"O meu socorro vem do Senhor, que fez o céu e a terra.\" ${c}6Slm.121:2",
        "${c}2\"Os que semeiam em lágrimas segarão com alegria.\" ${c}6Slm.126:5",
        "${c}3\"O pai ama o filho e todas as coisas entregou nas suas mãos.\" ${c}6João 3:35",
        "${c}12\"Se o pois o filho vos libertar, verdadeiramente sereis livres.\" ${c}6João 8:36",
        "${c}13Disse Jesus  \"Eu vim para que tenham vida e tenham em abundância.\" ${c}6João 10:10",
        "${c}14\"Não te ei dito que, se creres verás a glória de Deus?\" ${c}6João 11:40",
        "${c}2\"Se me amares guardeis os meus mandamentos.\" ${c}6João 14:15",
        "${c}3\"Eu sou a videira verdadeira e meu pai é o agricultor.\" ${c}6João 15:1",
        "${c}7\"Como o pai me amou, também Eu vos amei a vós; permanecei no meu amor.\" ${c}6João 15:9",
        "${c}4\"No mundo tereis aflição, mas tende bom ânimo, eu venci o mundo.\" ${c}6João 16:33 ${c}3(Oh GLÓRIA!!!!)",
        "${c}5\"Bem aventurados os mansos, porque herdarão a terra.\" ${c}6Mat.5:5",
        "${c}7\"Bem aventurados os limpos de coração, porque verão a Deus.\" ${c}6Mat.5:8",
        "${c}2\"E Jesus disse: Eu irei e lhe darei saúde.\" ${c}6Mat.8:7",
        "${c}4\"E qualquer que entre vós quizer ser o primeiro, seja o vosso servo.\" ${c}6Mat.20:27",
        "${c}9\"Porque muitos serão chamados, mas poucos escolhidos.\" ${c}6Mat.22:14",
        "${c}10\"Mas aquele que perseverar até o fim será salvo.\" ${c}6Mat.24:13",
        "${c}13\"Mas o SENHOR dos exércitos será exaltado em juízo, e Deus, o Santo, será santificado em justiça.\" ${c}2Isaías 5:1",
        "${c}7\"O caminho do justo é todo plano: tu retamente pesas o andar do justo.\" ${c}6Isaías 26:7",
        "${c}2\"Quem guiou o espírito do Senhor? e que conselheiro o ensinou?\" ${c}6Isaías 40:13",
        "${c}3\"Perto está o que me justifica; quem contenderá comigo?\" ${c}6Isaías 50:8",
        "${c}5\"O Senhor Jeová me ajuda, quem há que me condene?\" ${c}6Isaías 50:9",
        "${c}10\"Verdadeiramente, Ele tomou sobre si as nossas enfermidades e as nossas dores levou sobre si...\" ${c}2Isaías 53:4",
        "${c}10\"Na fome te livrará da morte, e na guerra da violência da espada.\" ${c}6Jó 5:20",
        "${c}7\"Ensina-me, e eu me calarei, e dai-me a entender em que errei.\" ${c}6Jó 6:24",
        "${c}3\"Maldito aquele que ferir ao seu próximo seus dias em bem...\" ${c}6Jó 36:11",
        "${c}4\"Ele tem cuidado de vós.\" ${c}6I Pedro 5:7",
        "${c}2\"Portanto, meus amados, fugi da idolatria.\" ${c}6I Cor. 10:14",
        "${c}14\"Vigiai, estais firme na fé; portai-vos varonilmente, e fortalecei-vos.\" ${c}6I Cor.16:13",
        "${c}5\"E o Senhor te porá por cabeça e não por calda...\" ${c}6Deut.28:13",
        "${c}4\"Não dirás falso testemunho contra o teu próximo.\" ${c}6Êxodo 20:16",
        "${c}7\"Eu não vim chamar os justos, mas sim, os pecadores ao arrependimento.\" ${c}6Luc.5:32",
        "${c}9\"Eu os remirei da violência do inferno e os resgatarei da morte.\" ${c}6Oséias 13:14",
        "${c}10\"Vigiai e orai para que não entreis em tentação.\" ${c}6Marcos 14:38",
        "${c}11\"Humilhai-vos perante o Senhor, e Ele vos exaltará.\" ${c}6Tiago 4:10",
        "${c}12\"O destruidor está já junto de ti, guarda tu a fortaleza.\" ${c}6Naum 2:1",
        "${c}14\"E esta é a promessa que Ele nos fez, a vida eterna.\" ${c}6I João 2:25",
        "${c}2\"Então me invocareis, e ireis, e orareis a mim, e eu vos ouvirei.\" ${c}6Jer.29:12"
    );

    my ( $data, $server, $witem ) = @_;

    $witem->command(
        "/MSG " . $witem->{name} . " " . $passagens[ rand @passagens ] );
}

sub jesus {
    my $c = ("\003");
    my @passagens = (
        "${c}7,8JESUS disse:${c}12,9\"Bem-aventurados os pobres de espírito, porque deles é o reino dos céus\"",
        "${c}7,8JESUS disse:${c}12,9\"Bem-aventurados os que choram, porque eles serão consolados\"",
        "${c}7,8JESUS disse:${c}12,9\"Bem-aventurados os mansos, porque eles herdarão a terra\"",
        "${c}7,8JESUS disse:${c}12,9\"Bem-aventurados os que têm fome e sede de justiça, porque eles serão fartos\"",
        "${c}7,8JESUS disse:${c}12,9\"Bem-aventurados os misericordiosos, porque els alcançarão misericórdia\"",
        "${c}7,8JESUS disse:${c}12,9\"Bem-aventurados os que sofrem perseguição por causa da justiça, porque deles é o reino dos céus\"",
        "${c}7,8JESUS disse:${c}12,9\"Eu sou o caminho, a verdade e a vida ninguém vai ao Pai se não por mim\"",
        "${c}7,8JESUS disse:${c}12,9\"Deixa por agora, porque assim nos convém cumprir toda a justiça\"",
        "${c}7,8JESUS disse:${c}12,9\"Está escrito: Nem só de pão viverá o homem, mas de toda a palavra que sai da boca de Deus\"",
        "${c}7,8JESUS disse:${c}12,9\"Vinde após mim e eu vos farei pescadores de homens\""
    );

    my ( $data, $server, $witem ) = @_;
    $witem->command(
        "/MSG " . $witem->{name} . " " . $passagens[ rand @passagens ] );
}

Irssi::command_bind( 'passagem', 'passagem' );
Irssi::command_bind( 'jesus',    'jesus' );
