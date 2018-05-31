#!/bin/sh

SLACK_WEBHOOK="${1}"
if [ -z "${SLACK_WEBHOOK}" ]; then
    echo "Parameter webhook required. Example: ${0} \"https://hooks.slack.com/services/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\""
    exit 1
fi


check_dependency() {
    for req in ${1}; do
        if ! command -v $req > /dev/null 2>&1; then
            echo "Command ´$req´ not found, it is required."
            exit 1
        fi
    done;
}

# Quote string
quote () {
     printf %s\\n "$1" | sed "s/'/'\\\\''/g;1s/^/'/;\$s/\$/'/" ;
}

# Frase aleatoria de chuck programando. (Ingles)
random_chuck_dev() {
    shuf -e -n 1 \
        'When Chuck Norris throws exceptions, it’s across the room.' \
        'All arrays Chuck Norris declares are of infinite size, because Chuck Norris knows no bounds.' \
        'Chuck Norris doesn’t have disk latency because the hard drive knows to hurry the hell up.' \
        'All browsers support the hex definitions #chuck and #norris for the colors black and blue.' \
        'Chuck Norris can’t test for equality because he has no equal.' \
        'Chuck Norris doesn’t need garbage collection because he doesn’t call .Dispose(), he calls .DropKick().' \
        'Chuck Norris’s first program was kill -9.' \
        'Chuck Norris burst the dot com bubble.' \
        'Chuck Norris writes code that optimizes itself.' \
        'Chuck Norris can write infinite recursion functions... and have them return.' \
        'Chuck Norris can solve the Towers of Hanoi in one move.' \
        'The only pattern Chuck Norris knows is God Object.' \
        'Chuck Norris finished World of Warcraft.' \
        'Project managers never ask Chuck Norris for estimations... ever.' \
        'Chuck Norris doesn’t use web standards as the web will conform to him.' \
        '“It works on my machine” always holds true for Chuck Norris.' \
        'Whiteboards are white because Chuck Norris scared them that way.' \
        'Chuck Norris’s beard can type 140 wpm.' \
        'Chuck Norris can unit test an entire application with a single assert.' \
        'Chuck Norris doesn’t bug hunt, as that signifies a probability of failure. He goes bug killing.' \
        'Chuck Norris’s keyboard doesn’t have a Ctrl key because nothing controls Chuck Norris.' \
        'Chuck Norris doesn’t need a debugger, he just stares down the bug until the code confesses.' \
        'Chuck Norris can access private methods.' \
        'Chuck Norris can instantiate an abstract class.' \
        'Chuck Norris doesn’t need to know about class factory pattern. He can instantiate interfaces.' \
        'The class object inherits from Chuck Norris.' \
        'For Chuck Norris, NP-Hard = O(1).' \
        'Chuck Norris knows the last digit of PI.' \
        'Chuck Norris can divide by zero.' \
        'Chuck Norris doesn’t get compiler errors, the language changes itself to accommodate Chuck Norris.' \
        'The programs that Chuck Norris writes don’t have version numbers because he only writes them once. If a user reports a bug or has a feature request they don’t live to see the sun set.' \
        'Chuck Norris doesn’t believe in floating point numbers because they can’t be typed on his binary keyboard.' \
        'Chuck Norris solved the Travelling Salesman problem in O(1) time.' \
        'Chuck Norris never gets a syntax error. Instead, the language gets a DoesNotConformToChuck error.' \
        'No statement can catch the ChuckNorrisException.' \
        'Chuck Norris doesn’t program with a keyboard. He stares the computer down until it does what he wants.' \
        'Chuck Norris doesn’t pair program.' \
        'Chuck Norris can write multi-threaded applications with a single thread.' \
        'There is no Esc key on Chuck Norris’ keyboard, because no one escapes Chuck Norris.' \
        'Chuck Norris doesn’t delete files, he blows them away.' \
        'Chuck Norris can binary search unsorted data.' \
        'Chuck Norris breaks RSA 128-bit encrypted codes in milliseconds.' \
        'Chuck Norris went out of an infinite loop.' \
        'Chuck Norris can read all encrypted data, because nothing can hide from Chuck Norris.' \
        'Chuck Norris hosting is 101% uptime guaranteed.' \
        'When a bug sees Chuck Norris, it flees screaming in terror, and then immediately self-destructs to avoid being roundhouse-kicked.' \
        'Chuck Norris rewrote the Google search engine from scratch.' \
        'Chuck Norris doesn’t need the cloud to scale his applications, he uses his laptop.' \
        'Chuck Norris can access the DB from the UI.' \
        'Chuck Norris’ protocol design method has no status, requests or responses, only commands.' \
        'Chuck Norris’ programs occupy 150% of CPU, even when they are not executing.' \
        'Chuck Norris can spawn threads that complete before they are started.' \
        'Chuck Norris programs do not accept input.' \
        'Chuck Norris doesn’t need an OS.' \
        'Chuck Norris can compile syntax errors.' \
        'Chuck Norris compresses his files by doing a flying round house kick to the hard drive.' \
        'Chuck Norris doesn’t use a computer because a computer does everything slower than Chuck Norris.' \
        'You don’t disable the Chuck Norris plug-in, it disables you.' \
        'Chuck Norris doesn’t need a java compiler, he goes straight to .war' \
        'Chuck Norris can use GOTO as much as he wants to. Telling him otherwise is considered harmful.' \
        'There is nothing regular about Chuck Norris’ expressions.' \
        'Quantum cryptography does not work on Chuck Norris. When something is being observed by Chuck it stays in the same state until he’s finished.' \
        'There is no need to try catching Chuck Norris’ exceptions for recovery; every single throw he does is fatal.' \
        'Chuck Norris’ beard is immutable.' \
        'Chuck Norris’ preferred IDE is hexedit.' \
        'Chuck Norris is immutable. If something’s going to change, it’s going to have to be the rest of the universe.' \
        'Chuck Norris’ addition operator doesn’t commute; it teleports to where he needs it to be.' \
        'Anonymous methods and anonymous types are really all called Chuck Norris. They just don’t like to boast.' \
        'Chuck Norris doesn’t have performance bottlenecks. He just makes the universe wait its turn.' \
        'Chuck Norris does not use exceptions when programming. He has not been able to identify any of his code that is not exceptional.' \
        'When Chuck Norris’ code fails to compile the compiler apologises.' \
        'Chuck Norris does not use revision control software. None of his code has ever needed revision.' \
        'Chuck Norris can recite π. Backwards.' \
        'When Chuck Norris points to null, null quakes in fear.' \
        'Chuck Norris has root access to your system.' \
        'When Chuck Norris gives a method an argument, the method loses.' \
        'Chuck Norris’ keyboard doesn’t have F1 key, the computer asks for help from him.' \
        'When Chuck Norris presses Ctrl+Alt+Delete, worldwide computers restart is initiated.' \
        'MySpace actually isn’t your space, it’s Chuck’s (he just lets you use it).' \
        'Chuck Norris can delete the Recycling Bin.' \
        'When Chuck Norris is web surfing websites get the message “Warning: Internet Explorer has deemed this user to be malicious or dangerous. Proceed?”.'
}

# Fraces Aleatoria de chuck.
random_chuck() {
    shuf -e -n 1 \
        'Leer esta nota  entera de ser otaku es mi vida  es la única forma de escapar de la ira de Chuck Norris.' \
        'Chuck Norris lucho la guerra del golfo el solo, en ambos bandos y gano' \
        'Las armas no matan a la gente, Chuck Norris mata a la gente.' \
        'Chuck Norris tiene dos velocidades: Andar y Matar.' \
        'Para la mayoría de la gente, el testículo izquierdo es mas grande que el otro. Para Chuck Norris, cada testículo es más grande que el otro.' \
        'Cuando Chuck Norris dibuja viñetas de Mahoma en su blog, toda la comunidad musulmana le felicita al unísono.' \
        'Chuck Norris derribó una vez un avión alemán apuntándole con el dedo y diciendo: “¡Bang!”.' \
        'El Cañón del Colorado es producto de un arranque de tos de Chuck Norris.' \
        'Las lágrimas de Chuck Norris curan el cáncer. Por desgracia, Chuck Norris nunca llora.' \
        'Chuck Norris no se afeita, se da patadas en la cara. Lo único que corta a Chuck Norris es Chuck Norris.' \
        'Chuck Norris no nació, se sacó a sí mismo a patadas del vientre de su madre. Poco después, le creció barba.' \
        'La Biblia originalmente se llamaba “Chuck y sus amigos”' \
        'Chuck Norris comió una vez cincuenta kilos de filetes de ternera en una hora. Los primeros 59 minutos los empleó en follarse a la camarera que los traía.' \
        'Chuck Norris vende su orina en lata. Se la conoce como Red Bull.' \
        'El camino más corto al corazón de un hombre es el que sigue el puño de Chuck Norris.' \
        'La idea inicial de Supervivientes era poner a un grupo de gente en una isla con Chuck Norris. Como no hubo supervivientes, el episodio piloto nunca se ha emitido.' \
        'Chuck Norris no practica el sexo, simplemente es Chuck Norris' \
        'El Triángulo de las Bermudas era un cuadrado hasta que Chuck Norris le destrozó una esquina de una patada.' \
        'Una señal de aparcamiento para minusválidos no significa que ese sitio esté reservado para minusválidos. En realidad, es una advertencia de que el sitio pertenece a Chuck Norris, y que te quedarás minusválido si aparcas ahí.' \
        'Cuando Chuck Norris manda su declaración de la renta, envía los formularios en blanco e incluye una foto suya, en guardia y listo para atacar. Chuck Norris nunca ha tenido que pagar sus impuestos.' \
        'Chuck Norris ha demandado a la NBC, alegando que Ley y Orden son marcas registradas para sus piernas derecha e izquierda.' \
        'Para demostrar que vencer el cáncer no es tan difícil, Chuck Norris se fumó 15 cartones de tabaco al día durante dos años, y desarrolló 7 tipos diferentes de cáncer, sólo para librarse de ellos haciendo flexiones durante 30 minutos.' \
        'Hay 1242 objetos en una habitación promedio con los que Chuck Norris podría matarte, incluyendo a la habitación en si.' \
        'Chuck Norris no se moja, el agua se impregna de Chuck al tocarlo.' \
        'Cuando Chuck Norris va a donar sangre no usa jeringuillas: Pide un cubo y un cuchillo.' \
        'Chuck Norris puede quemar una hormiga con una lupa... de noche.' \
        'Chuck Norris es la razón por la que Wally se esconde.' \
        'Chuck Norris es la única persona que le gana a una pared jugando al frontón.' \
        'Chuck Norris ha sido la unica persona que ha contado hasta el infinito... comenzando por el final!.....con todos los decimales!!......DOS VECES!!!!' \
        'El Hombre del Saco mira siempre debajo de la cama y se va a dormir temprano porque teme a Chuck Norris.' \
        'Chuck Norris ha estado en Marte, lo que explica por qué no hay signos de vida.' \
        'Chuck Norris nunca llega tarde. Es el tiempo el que se adelanta.' \
        'McGyver puede construir un avión con un clip y un rollo de cinta adesiva. Chuck Norris puede construir un clip 33- con un avión' \
        'Chuck Norris no salta, es la Tierra la que se cae con la fuerza de sus piernas' \
        'Chuck Norris no caza, porque cazar infiere la posibilidad de fallo. Chuck Norris sale a matar.' \
        'Si ves a Chuck Norris, él te ve a ti. Si no lo ves, en dos segundos puedes estar muerto.' \
        'No hay teoría de la evolución, sólo las criaturas que Chuck Norris decidió dejar vivas.' \
        'Chuck Norris no cree en Dios. Es Dios quien cree en Chuck Norris.' \
        'Los créditos de “Walker de Texas” son en realidad una lista de la gente que Chuck Norris pateó (y por lo tanto, mató) ese día.' \
        'Si miras a un espejo y dices “Chuck Norris” 3 veces, aparecerá y matará a toda tu familia... pero al menos habrás conseguido ver a Chuck Norris.' \
        'Chuck Norris pidió un Big Mac en un Burger King y se lo hicieron.' \
        'Chuck Norris instaló el Windows XP en un ZX Spectrum cuando Bill Gates aún no había nacido.' \
        'La innombrable paga un canon a Chuck Norris cada vez que éste compra un CD virgen.' \
        'La gran muralla china se ideó para que Chuck Norris no pudiera pasar. Fracasó estrepitosamente.' \
        'La escena inicial de Salvar al Soldado Ryan está basada en un partido de balón prisionero que jugó en 2º de primaria.' \
        'El tiempo no espera para el hombre. A menos que ese hombre sea Chuck Norris.' \
        'Chuck Norris se comió una tarta entera antes de que sus amigos pudieran decirle que había una stripper dentro.' \
        'James Cameron pensó en Chuck Norris para el papel de Terminator, pero se dió cuenta que parecería un documental y eligió a Arnold Schwarzenegger.' \
        'En un acto de humanidad, Chuck Norris hizo una donación al instituto de medicina americano de 6000 cadáveres.' \
        'Godzilla es un homenaje de su primera visita a Tokio' \
        'Cuando Bruce Banner se enoja, se transforma en Hulk. Cuando Hulk se enoja, se transforma en Chuck Norris.' \
        'Chuck Norris pateó a un caballo en la barbilla. Sus descendientes se conocen hoy en día como jirafas.' \
        '“La matanza de Texas” originalmente fue protagonizada por Chuck. Todo el reparto murió, incluida la cinta. Tuvieron que volver a grabarla.' \
        'Chuck Norris no juega a ser Dios. Jugar es de niños.' \
        'Chuck Norris jugó a la ruleta rusa con un revolver completamente cargado y ganó.' \
        'Hay un orden en el universo: Espacio, tiempo y Chuck Norris.... estaba bromeando... Chuck Norris es el primero.' \
        'Cuando la Tierra fue creada, sólo había 2 hombres: Dios y Chuck Norris. Ya no ves a Dios por aqui, ¿verdad?' \
        'La serpiente del jardín del Eden le sugirió a Chuck Norris que se comiera una manzana de las que habían dejado 59- Adán y Eva. Chuck Norris se comió a la serpiente, el arbol entero y a Eva. Dios no tuvo cojones de decirle nada.' \
        'Un día que Chuck Norris estaba aburrido decidió irse a los paises del Este para matar a sus habitantes a base de pellizcos en los ojos... los supervivientes son ahora conocidos como Japoneses, Chinos y Coreanos.' \
        'Chuck Norris no envejece. No le ve utilidad.' \
        'La NASA investiga la posibilidad de vivir en otros planetas. Es la única esperanza de huir de Chuck Norris.' \
        'Cuando sube al ascensor, Chuck Norris no pulsa ningún botón. Más le vale al ascensor saber a qué piso necesita ir Chuck Norris.' \
        'Un oso trató de devorar a Chuck Norris. Chuck le mostró su mejor golpe y el oso decidió devorarse a sí mismo, ya que era la forma menos dolorosa de morir.' \
        'El universo no está en continua expansión. Sólo quiere huir de Chuck Norris.' \
        'La kriptonita a la que tanto teme Superman es tan solo un moco de Chuck Norris solidificado.' \
        'Jesús puede andar sobre el agua, pero Chuck Norris puede andar sobre Jesús.' \
        'Cuando alguien dice “nadie es perfecto”, Chuck Norris se lo toma como un insulto personal.' \
        'Chuck Norris duerme con una almohada bajo su arma.' \
        'El camino más corto entre dos puntos no es la línea recta, es el que sigue Chuck Norris.' \
        'Cuando Dios dijo: ”Que se haga la luz”, Chuck respondió: ”Pídelo por favor”.' \
        'El pulso de Chuck Norris se mide en la escala Richter.' \
        'Chuck Norris nunca usa condón, porque no existe tal cosa como protección contra Chuck Norris.' \
        'Chuck Norris no hace strikes en los bolos, tira uno y los 9 restantes se desmayan.' \
        'La pluma es más fuerte que la espada... cuando es Chuck Norris el que usa la pluma.' \
        'Chuck Norris es vegetariano, lo que significa que no come nada hasta haberlo dejado en estado vegetativo con sus propias manos.' \
        'La marea no baja: es Chuck Norris que está bebiendo agua.' \
        'Chuck Norris tiene un profundo respeto por la vida humana... a menos que se interponga en su camino.' \
        'La Tierra gira alrededor del Sol porque Chuck Norris le dio un empujón.' \
        'Chuck Norris no miente nunca; Es la realidad la que se tiene que adaptar a él.' \
        'Los agujeros negros son lugares donde Chuck Norris dio un puñetazo.' \
        'Bruce Lee mato a Chuck Norris en el film El Furor del Dragón...desde entonces, ¿alguien a visto a Bruce?' \
        'Las patadas giratorias de Chuck Norris giran hacia los dos lados...a la vez.' \
        'Chuck Norris es capaz de convertir ficheros PDF a Word con el buscaminas.' \
        'Chuck Norris se basta el solo para hacer un trío...incluso si es de mujeres.' \
        'El bajada de la marea se produce cuando Chuck Norris bebe agua. Consecuentemente, la subida del mar se produce cuando la orina. Por tanto, sin la sed de Chuck Norris no existiría el flujo de las mareas, de la misma forma que sin su respiración no existiría el viento.' \
        'El rumor de que Chuck Norris es vegetariano es completamente cierto. No come nada hasta haberlo dejado en estado vegetativo con sus propias manos.' \
        'Se dice que la pluma de escribir es capaz de derrotar a la espada. Para demostrar la veracidad de esta pacifista aseveración, Chuck Norris se enfrentó a un batallón de “marines” armados con fusiles de asalto y granadas nucleares empuñando una pluma de pato. Tras vencer, Chuck Norris llegó a la conclusión de que la pluma sólo le impedía repartir puñetazos más rápidamente por tener una mano ocupada.' \
        'Todos los fabricantes de preservativos incluyen una cláusula especial en la etiqueta de sus productos alcarando que no existe una protección contra Chuck Norris.' \
        'Chuck Norris es la ínica persona en el mundo capaz de propinar una paliza mortal vía correo electrónico.' \
        'Chuck Norris bebe napalm para calmar el ardor de estómago.' \
        'Cuando Chuck Norris juega al Monopoly, la economía mundial se ve alterada.' \
        'En las últimas elecciones, el actual presidente de Estados Unidos recibió un único voto: el de Chuck Norris. Evidentemente salió elegido.' \
        'Chuck Norris no usa grandas. Le basta con toser.' \
        'En el momento de ser ejecutados, a los condenados a muerte se les ofrece la alternativa de actuar como contrincantes de Chuck Norris en algún capítulo de “Walker, ranger de Texas”. Hasta ahora todos han escogido la silla eléctrica.' \
        'Para Chuck Norris, la ciencia médica no tiene ninguna utilidad: o estás muerto o eres Chuck Norris.' \
        'Chuck Norris ganó una carrera de fórmula uno... empujando el coche.' \
        'Si no conoces a tu padre biológico, probablemente sea Chuck Norris.' \
        'La única mano que gana a una escalera de color es la de Chuck Norris.' \
        'Para Chuck Norris, expresiones como “disco duro”, “día duro” o “cara dura” carecen de sentido. Todo es blando como el talco después de unos puñetazos. Nada es lo suficientemente duro para Chuck Norris, excepto Chuck Norris.' \
        'Chuck Norris es capaz de ganar al ajedrez jugando con negras... sólo con el rey.' \
        'En realidad el Coyote no perseguía al Correcaminos. Chuck Norris les perseguía a ambos.' \
        'Los antiguos romanos gustaban del espectáculo circense de ver a Chuck Norris pateando cristianos, gladiadores y leones a la vez. Lamentablemente, a consecuencia de un estornudo el Coliseo Romano quedó parcialmente derribado y el imperio entró en decadencia.' \
        'Puedes intentar huir de Chuck Norris, pero sólo conseguirás morir cansado.' \
        'En una ocasión, Chuck Norris envió un correo electrónico y se dio cuenta de que había olvidado firmarlo. Agarró el cable de conexión y sacó el mensaje a golpes, tras lo cual le añadió la firma y lo envió a su destino propinándole una patada giratoria. Jamás ningún otro mensaje ha viajado más rápido, dentro o fuera de la red.' \
        'La eterna juventud de Chuck Norris se debe a que la vejez nunca ha reunido el valor suficiente para alcanzarle. Nada alcanza a Chuck Norris sin permiso de Chuck Norris.' \
        'Si ves a Chuck Norris disparándose a la cabeza con un Magnum 44 no te alarmes, simplemente está sacándose la cera de los oídos. Nunca lo dudes, Chuck Norris sólo suicida a los demás.' \
        'Chuck Norris fue escogido para el papel estelar de cura en la película “El exorcista”, pero fue sustituido porque tras el rodaje la película duraba apenas treinta segundos. Costó un mes y medio convencer al Diablo de que saliera del armario de su camerino.' \
        'Cuando se enteró de que David Copperfield planeaba embarazar a una mujer sin tocarla, Chuck Norris se rió de lo lindo. Embarazó a David Copperfield, aceleró la gestación ocho meses y medio y le hizo la cesárea con un tenedor oxidado.' \
        'Chuck Norris no utiliza un teclado en su ordenador. En lugar de eso, mira fijamente la pantalla hasta que sus pensamientos aparecen en ella.' \
        'La Convención de Ginebra prohíbe el uso de Chuck Norris como arma de destrucción masiva.' \
        'Chuck Norris va al baño una vez al mes, tanto si lo necesita como si no.' \
        'Chuck Norris no necesita un mando a distancia para su televisor. Simplemente clava su mirada en él y el televisor cambia los canales solo.' \
        'Tras ver la película “Delta Force”, Dios tuvo la idea de la Santísima Trinidad: Padre, Chuck Norris y Espíritu Santo. Poco más tarde, Chuck Norris dijo que era ridículo creer en espíritus y abandonó el puesto, siendo sustituido por Jesús el aprendiz.' \
        'Chuck Norris es un maestro del debate, porque nadie puede rebatir el impacto de una patada giratoria en la cara.' \
        'Chuck Norris no toma prisioneros... pero sí a sus mujeres.' \
        'Chuck Norris es la única persona que ha ganado una medalla olímpica de natación sin ni siquiera mojarse.' \
        'Dicen que un rayo nunca golpea dos veces el mismo lugar. Tampoco Chuck Norris. Ni falta que le hace.' \
        'En contra de la creencia bíblica, Dios no descansó el séptimo día. El séptimo día, Dios creó a Chuck Norris, tras lo cual Chuck Norris le dio una patada en la cara y le dijo “Déjame el resto a mí”. Acojonado, Dios decidió tomarse unas largas vacaciones de las cuales aún no ha vuelto.' \
        'Al entrar en una discoteca, Chuck Norris se convierte en el centro de la pista de baile al instante. Un instante es el tiempo que tarda Chuck Norris en incrustar en las paredes a toda la gente que llena el local a base de patadas giratorias.' \
        'Hace tiempo Chuck Norris sufrió un ataque de corazón. El corazón perdió, por supuesto.' \
        'Chuck Norris siempre fue el chico más vivo de su escuela. Simplemente mató a los demás.' \
        'Chuck Norris no deja mensajes. Chuck Norris deja advertencias.' \
        'Si no escapas de Chuck Norris, puede darse una de estas dos circunstancias: 1.- No escapas porque no tienes piernas. 2.- En breves instantes no las tendrás.' \
        'A Chuck Norris le encanta mimar a los bebés, siempre que se entienda que mimar es patear un cuerpo hasta convertirlo en pulpa.' \
        'Chuck Norris no levanta la tapa al orinar. La tapa se levanta sola al entrar él en el cuarto de baño. De hecho generalmente la tapa sale corriendo.' \
        'Una tarde, Chuck Norris se sentó pensativo en el muelle de New Jersey y se puso a arrojar piedrecitas al mar. A consecuencia de ello, trece personas murieron accidentalmente en Irlanda, dos en Inglaterra y siete en Francia. En Portugal se declaró el estado de emergencia y el ejército salió a las playas a recoger los cadáveres.' \
        'Para Chuck Norris un bar es un local lleno de cadáveres. “Donde hay bebida, hay pelea”, se limita a decir.' \
        'Como buen vaquero, Chuck Norris es capaz de ordeñar una vaca sólo mirándola a los ojos. Del mismo modo es capaz de extraer del animal whisky, galletas saladas en forma de niño y televisores de 27 pulgadas.' \
        'Chuck Norris considera que sólo Chuck Norris queda elegante con una capa sobre los hombros. Es por ello que tantos actores han encarnado a Batman y Supermán antes de desaparecer en circunstancias misteriosas.' \
        'Jesús convirtió el agua en vino con una palabra en presencia de una multitud, pero a Chuck Norris le basta con que sus piernas hablen por él para convertir en sangre cualquier signo de vida prescindible en cien quilómetros a la redonda, incluyendo la vida vegetal y ciertos tipos de líquenes.' \
        'Chuck Norris siempre te concederá un deseo... si tu deseo es morir.' \
        'Si casi todo sabe a pollo es porque se trata de una de las comidas favoritas de Chuck Norris. Los científicos se plantean que si una noche despierta hambriento devorará el planeta entero, y lo prevén como la causa más posible de una futura extinción de la Humanidad, por delante del calentamiento global y la caída de un meteoro.' \
        'Chuck Norris no tiene un sexto sentido. Hace tiempo que pasó directamente al séptimo (y probablemente al octavo).' \
        'Chuck Norris lleva una tarjeta en su cartera emitida por el Consejo de Seguridad de la ONU, absolviéndole de cualquier cargo de asesinato o intento de asesinato debido a sus técnicas sexuales.' \
        'Cualquiera puede afirmar que Chuck Norris es el hombre de sus sueños. Pero es Chuck Norris quien decide en los sueños de quién aparece.' \
        'Chuck Norris creó la atmósfera con el único propósito de poder propulsar fuera de ella a la gente con sus patadas giratorias.' \
        'El whisky gana en contenido alcohólico tras pasar por el cuerpo de Chuck Norris.' \
        'Chuck Norris es capaz de darle una patada voladora a la lámpara de su dormitorio y acostarse antes de que la luz desaparezca.' \
        'Un estudio de cine tuvo la idea de utilizar a Chuck Norris como doblador de reactores de avión al oírle aliviar sus necesidades en un retrete. Lamentablemente, la sede de dichos estudios se vio reducida (literalmente) a un montón de mierda y la idea cayó en el olvido.' \
        'Para Chuck Norris, el quitamanchas para eliminar la sangre es deducible de impuestos.' \
        'La única manera de sobrevivir a un ataque nuclear es ser Chuck Norris.' \
        'Si alguna vez has vencido a Chuck Norris en un juego, evidentemente no comprendiste las reglas.' \
        'Chuck Norris puede hablar en Braille.' \
        'Freddy Krueger tiene pesadillas con Chuck Norris.' \
        'Chuck Norris no mata el tiempo. Le da patadas giratorias.' \
        'Tras repetidas torturas y numerosos intentos de matarle sin éxito, los romanos decidieron bajar a Chuck Norris de la cruz y clavar en ella a un tal Jesús que pasaba por allí. El pobre carpintero murió crucificado sólo porque Chuck Norris se apiadó de él y no le mató personalmente. Años después, Chuck Norris fue visto fumando un puro en las afueras de la ciudad en pleno incendio de Roma. Los imperios nacen y mueren, pero los recuerdos de Chuck Norris permanecen más allá del tiempo.' \
        'Chuck Norris existe porque un día corriendo por el parque alcanzó tal velocidad que el efecto de relatividad espacio-temporal le hizo retroceder en el tiempo y tuvo ocasión de conocer a su madre e intimar con ella. Dicho encuentro puede considerarse casual, ya que de hecho en los escasos tres minutos que duró el fenómeno intimó con toda la población femenina del estado de Ohio, humana, animal y vegetal.' \
        'A Chuck Norris le encantan los cachorros. Especialmente en fricandó, con salsa de napalm y una cobertura de pepinillos, ajo y chile picante. Su menú incluye cachorros (preferentemente humanos) al menos una vez por semana. Suele acompañarlos con unas tapitas de martillos salados y un vermut a base de de gasolina.' \
        'Chuck Norris es a menudo comparado con un tsunami: si lo ves venir, ya es demasiado tarde.' \
        'El Mar Rojo era una cuenca yerma y seca antes de que Chuck Norris escupiera allí un generoso trago de vino francés por considerar que era una bebida afeminada. Poco después vomitó el resto. El resultado fue recogido en grandes silos y hoy se vende con la marca Jack Daniels.' \
        'Chuck Norris no mata dos pájaros de un tiro. Chuck Norris aniquila especies enteras.' \
        'Chuck Norris no ha utilizado un signo de interrogación en su vida. Siempre afirma que preguntar es síntoma de debilidad y que sus métodos de interrogación son mucho mejores.' \
        'La industria médica tiene secretamente a Chuck Norris como patrón protector, por estimular el negocio en los hospitales del mundo entero.' \
        'Los extraterrestres existen, pero esperan a que Chuck Norris muera antes de atacar.' \
        'Chuck Norris no sabe dónde vives, pero sabe dónde morirás.' \
        'Un día, tras tropezar con el borde de una acera, Chuck Norris mató a toda la población de Cincinatti. Al ser preguntado acerca del motivo dijo “Chuck Norris no tropieza con Cincinatti, es Cincinatti lo que tropieza con Chuck Norris”. Luego desmembró a quien le había preguntado con un rápido movimiento de uña.' \
        'En una ocasión Chuck Norris visitó las Islas Vírgenes, hoy conocidas simplemente como las Islas.' \
        'Los niños se divierten incendiando hormigas con una lupa. Chuck Norris se divierte incendiando niños con su mirada.' \
        'Sólo para dejar claro que no es un gran amante de la naturaleza, en una ocasión Chuck Norris mató una nube.' \
        'La comunidad de parapsicólogos ha documentado que Chuck Norris es el único humano que ha apalizado a un fantasma.' \
        'Chuck Norris sólo utiliza las salidas de emergencia, porque cuando eres Chuck Norris TODO es una emergencia.' \
        'Cuando Chuck Norris aplaude no usa sus manos. En lugar de eso coge a las dos personas más cercanas y las estrella una contra otra repetidamente.' \
        'Una clínica de adopción propuso a Chuck Norris adoptar un hijo. Le ofrecieron elegir entre Steven Seagal, Jean Claude Van Damme, Mr.T y Bud Spencer. Chuck Norris se comió a los cuatro candidatos y derribó la clínica con una estruendosa ventosidad anal, al tiempo que decía “Sólo Chuck Norris puede suceder a Chuck Norris”. Luego se fumó a un tipo que pasaba por allí encendiéndole el pelo a base de chocar su cabeza contra las ruinas de la clínica.' \
        'Chuck Norris es la única persona que en lugar de ser detenida por masturbarse en público recibe premios por ello.' \
        'Chuck Norris jamás mojó su cama cuando era niño. Su cama se mojaba sola de miedo.' \
        'Chuck Norris es capaz de dibujar un mapa completo del metro de Londres meando en la nieve.' \
        'Chuck Norris mató al Mar Muerto.' \
        'Chuck Norris creó todos los efectos de sonido de la película “La Guerra de las Galaxias” usando sólo las manos y los sobacos.' \
        'La primera vez que Chuck Norris te insulta en un chat, hace daño moral. La segunda vez, daño físico.' \
        'Chuck Norris no lo considera violación si sobrevives.' \
        'Chuck Norris paseó un día por la calle con una erección masiva. No hubo supervivientes.' \
        'Cuando Chuck Norris nació, la enfermera dijo “¡Hostia! ¡Es Chuck Norris!”. Después hizo el amor con él. En ese punto ya le había crecido la barba y era la tercera mujer con la que se acostaba.' \
        'Chuck Norris usa el ala de maternidad del hospital como buffet de desayuno.' \
        'Una vez, Chuck Norris se pasó el Super Mario Bros 3 sin tocar el mando. Sólo le gritó al televisor mientras se comía un bocata de niños, y el juego se pasó a sí mismo por puro miedo.' \
        'El frigorífico de Chuck Norris está puesto al cero absoluto.' \
        'Chuck Norris puede cerrar de un golpe una puerta giratoria.' \
        'Chuck Norris no cree en los condones de látex. En vez de eso se calza a una mujer y la utiliza como condón mientras se folla a otra.' \
        'Chuck Norris fue el cazador que mató a la madre de Bambi. Luego vistió su cadaver como si fuera un abrigo mientras daba un paseo por el hospital infantil local.' \
        'Cada estrella fugaz que veis en el cielo es un pobre desgraciado que intentó meterse con Chuck Norris y está reentrando en la atmósfera tras recibir una patada giratoria.' \
        'Las brújulas no apuntan hacia el norte, apuntan hacia Chuck Norris. Es sólo que le gusta sentarse en bañador en una silla de playa en el Ártico y gritar “¡Las chaquetas son para nenazas!” a los científicos de por allí.' \
        'Chuck Norris puede usar Windows sin que se cuelgue.' \
        'La gente va a misa los domingos y reza a Dios durante una hora. Dios reza a Chuck Norris las veinticuatro horas de los siete días de la semana.' \
        'Chuck Norris no lleva reloj. Él decide qué hora es.' \
        'Chuck Norris es como un perro, no sólo porque puede oler el miedo, sino porque puede mear donde le dé la gana.' \
        'Los cientificos han estimado que la energía desprendida durante el Big Bang es casi 1PDCN (1 patada de Chuck Norris).' \
        'Chuck Norris fue el cuarto Rey Mago y entregó al niño Jesús el don de la barba, la cual llevó hasta el día de su muerte. Los otros tres Reyes Magos, celosos por la preferencia que Jesús mostró hacia el obsequio de Chuck, acordaron borrarlo de la Biblia. Los tres murireron poco después debido a unas misteriosas heridas, al parecer provocadas por patadas giratorias.' \
        'Las tres mayores causas de muerte en Estados Unidos son: 1.- Chuck Norris, 2.- Infarto 3.- Cáncer' \
        'Chuck Norris lleva sandalias con calcetines porque nadie, NUNCA, se ha atrevido a decirle nada.' \
        'Aunque la tercera ley de Newton dice que hay una reacción por cada acción, no hay reacción a una patada de Chuck Norris.' \
        'En un combate entre Batman y Darth Vader, el vencedor es Chuck Norris.' \
        'Una patada voladora de Chuck Norris es el metodo preferido de ejecución en 56 países.' \
        'Chuck Norris puede partir una guía telefónica sólo con sus testículos.' \
        'Chuck Norris no escribe libros, las palabras se agrupan solas por miedo.' \
        'Hay dos tipos de personas en este mundo. Chuck Norris y la gente que va a morir.' \
        'Antes de grabar un nuevo capítulo de “Walker, ranger de Texas”, Chuck Norris se toma una dosis cinco veces superior a lo normal de tranquilizante para elefantes. Esto lo hace, por supuesto, para limitar su fuerza y movilidad, en un intento de reducir el número de bajas de los actores contra los que lucha, con escasos resultados.' \
        'Las patadas de Chuck Norris no matan, sólo eliminan al objetivo del continuo espacio-tiempo.' \
        'En el comienzo fue la nada. Entonces Chuck Norris le dió una patada en la cara y le dijo “búscate un trabajo”. Así empezó el universo.' \
        'Chuck Norris puede ganar al cuatro en raya en dos movimientos.' \
        'Todo el mundo puede mear en el suelo del cuarto de baño, pero sólo Chuck Norris puede cagar en el techo.' \
        'El primer eclipse solar se produjo cuando Chuck Norris retó al sol a ver quién pestañeaba primero.' \
        'Chuck Norris no tiene sombra. La mató con una patada giratoria por perseguirle.' \
        'El oxígeno requiere de Chuck Norris para existir.' \
        'Chuck Norris no corta el césped de su casa, simplemente lo mira y le dice que se atreva a crecer.' \
        'Los ataques al corazón pueden ser la principal nueva causa de muerte en las mujeres de 45 a 65 años. Pero Chuck Norris sigue siendo la principal causa de muerte entre los hombres de 0 a 999 años.' \
        'Los coches fueron inventados para huir más rápido de Chuck Norris.' \
        'Chuck Norris inventó la cuchara por la simple razón de que matar a gente con los cuchillos era muy fácil.' \
        'Chuck Norris puede escuchar el silencio.' \
        'El número pi no es infinito, se acaba cuando Chuck Norris lo dice.' \
        'La tierra no gira, simplemente intenta huir de Chuck Norris.' \
        'Cada calavera de dinosaurio encontrada tiene la marca de una bota de vaquero de la talla 42 en su boca. Los científicos están sorprendidos, pero todos sabemos la razón.' \
        'Hace veinticinco años Chuck Norris retó a una estatua a mirarse mutuamente sin pestañear. A día de hoy sigue imbatido.' \
        'Jesús no nació un 25 de diciembre, pero una vez Chuck Norris le mandó una postal ese día felicitándole el cumpleaños y Jesús tuvo miedo de decirle la verdad. Desde ese día la Navidad se celebra en dicha fecha.' \
        'Papá Noel existía antes de que olvidase darle un regalo a Chuck Norris.' \
        'Chuck Norris puede hacer llegar al orgasmo a una mujer con solo señalarla y decir “¡Eh!”.' \
        'Chuck Norris ganó la Primera y la Segunda Guerra Mundial él solo.' \
        'Chuck Norris puede comer sopa con un tenedor.' \
        'Los muñecos de acción de Chuck Norris han dormido con más mujeres que cualquier otro hombre, excepto el propio Chuck Norris.' \
        'Chuck Norris no esquiva las balas, las balas esquivan a Chuck Norris.' \
        'Un hombre se quedó una vez tirado en medio de la carretera sin gota de gasolina. Chuck Norris pasó por allí, miró al hombre a los ojos y éste supo que todo iría bien. Chuck Norris rellenó el depósito del coche con su orina y el hombre nunca más ha tenido que repostar. De eso hace 14 años.' \
        'De noche, Chuck Norris duerme con una luz encendida. No porque tenga miedo a la oscuridad, sino porque la oscuridad teme a Chuck Norris.' \
        'Chuck Norris tiene la mejor cara de de póquer del mundo. Le ayudó a ganar las series mundiales de póquer de 1983 con un comodín, una carta de “líbrate de la cárcel” del Monopoly, un dos de tréboles, un siete de picas y una carta verde con el número 4 del juego UNO.' \
        'No existen minusválidos, sino gente que ha peleado con Chuck Norris.' \
        'Cuando se grabó un episodio de “Walker, ranger de Texas” en Francia, los franceses se rindieron inmediatamente sólo para estar a salvo.' \
        'La eyaculación típica de Chuck Norris es capaz de perforar el vientre de la mujer, un neumático de tractor y una armadura de kevlar... juntos.' \
        'Chuck Norris no tiene que hacer nada para que le den un paquete de Chocapic.' \
        'Chuck Norris jamás sufre estreñimiento, las heces huyen del cuerpo de Chuck.' \
        'Si no lo consigues a la primera, evidentemente no eres Chuck Norris.' \
        'Una vez hicieron papel de váter de Chuck Norris. Pero no limpiaba la mierda de cualquiera, sólo la de Chuck Norris.' \
        'Una vez un hombre le preguntó si su nombre era Charles. Chuck Norris no respondió, simplemente se le quedó mirando hasta que el hombre explotó en mil pedazos.' \
        'Chuck Norris no nació, se sacó a sí mismo a patadas del vientre de su madre. Por supuesto salió con los pies por delante para poder darle una patada giratoria al doctor. Nadie hace nacer a Chuck Norris salvo Chuck Norris.' \
        'Chuck Norris es la única persona que le gana a una pared jugando al frontón.' \
        'Chuck Norris perdió la virginidad antes que su padre.' \
        'Chuck Norris usa la palabra “afortunado” para referirse a aquellos a quienes ha dejado en coma.' \
        'Cuando Chuck Norris estaba en la escuela, su profesor de lengua le encargó un trabajo acerca de qué era el coraje. Chuck Norris sacó matrícula de honor sólo por escribir “Chuck Norris” y entregar el papel.' \
        'No existen los esteroides en el deporte, sólo gente sobre la que Chuck Norris ha echado el aliento.' \
        'Chuck Norris puede dividir entre cero.' \
        'Chuck Norris violó al Diablo sólo para oírle gritar.' \
        'Chuck Norris no se moja con la lluvia, es el agua la que se impregna de Chuck.' \
        'Cuando Chuck Norris corre con unas tijeras abiertas en la mano apuntando hacia su cara y tropieza, no es él sino el resto de la gente la que se hace daño.' \
        'Existe una nueva teoría de la relatividad acerca de múltiples universos en los que Chuck Norris es mucho más duro que en éste. Cuando fue descubierta y hecha pública por Albert Einstein, Chuck Norris le dio una patada giratoria en la cara. Desde entonces Albert Einstein decidió vivir de incógnito bajo el nombre Stephen Hawking para intentar reponerse de las secuelas.' \
        'Chuck Norris es el único ser humano capaz de demostrar el principio de incertidumbre de Heisenberg: nunca puedes saber con exactitud dónde y a qué velocidad te dará una patada giratoria en la cara.' \
        'Nagasaki nunca recibió una bomba atómica. Sucedió que Chuck Norris sobrevolaba la zona y tuvo flatulencias.' \
        'Chuck Norris aparecía originalmente en el juego “Street Fighter II”, pero fue eliminado por los “beta testers” porque cualquier botón hacía que diera una patada giratoria. Cuando se le preguntó por este fallo en el sistema, Chuck Norris respondió “Eso no es un fallo en el sistema”.' \
        'Mientras rodaba “Walker, ranger de Texas”, Chuck Norris resucitó a un corderito, que había nacido muerto, frotando prolongadamente su barba contra la criatura. Poco después de que el animal volviera a la vida, Chuck Norris le dio una patada giratoria delante de todo el mundo, rompiéndole el cuello, para recordar a la multitud que lo que Chuck nos da, Chuck nos lo quita.' \
        'Las Tortugas Ninja están basadas en una historia real. Chuck Norris se comió una vez una tortuga entera, y cuando la cagó, ésta medía dos metros y había aprendido karate.' \
        'Chuck Norris es 1/8 Cherokee. No tiene nada que ver con sus antepasados, es que se comió un indio entero por los pies.' \
        'Chuck Norris no hace mantequilla, propina patadas giratorias a las vacas y la mantequilla sale de ellas.' \
        'En la última página del Libro Guinness de los Récords se avisa que todos los récords mundiales pertenecen a Chuck Norris, y aquellos listados en el libro son sólo los más cercanos que nadie ha podido conseguir jamás.' \
        'No hay mentón tras la barba de Chick Norris, tan sólo otro puño.' \
        'Chuck Norris vendió su alma al Diablo a cambio de su rudo buen aspecto y su inigualable destreza en las artes marciales. Poco después de finalizar la transacción, Chuck Norris dio una patada giratoria al Diablo en la cara y recuperó su alma. El Diablo, que aprecia la ironía, no pudo enfadarse con él, y admitió que debería haberla visto venir. Ahora juegan al póquer el segundo miércoles de cada mes.' \
        'Chuck Norris apostó una vez contra la NASA a que podía sobrevivir a una entrada en la atmósfera desde el espacio sin traje protector. El 19 de julio de 1999, un Chuck Norris desnudo reentró en la atmósfera terrestre recorriendo 14 estados y alcanzando una temperatura de 3.000 grados. La NASA, avergonzada, publicó que había sido un meteorito, y le sigue debiendo una cerveza.' \
        'Alguien intentó decirle una vez a Chuck Norris que las patadas giratorias no son la mejor manera de dar una patada a alguien. Este hecho ha sido registrado por los historiadores como el peor error que nadie ha cometido jamás.' \
        'Chuck Norris dona sangre a la Cruz Roja frecuentemente, pero nunca es la suya.' \
        'El tiempo no espera a nadie... excepto si Chuck Norris llega tarde, en cuyo caso más le vale al tiempo ir despacio.' \
        'Chuck Norris conduce un cochecito de los helados cubierto de calaveras humanas.' \
        'Chuck Norris construyó una máquina del tiempo y viajó al pasado para evitar el asesinato de JFK. Cuando Oswald disparó, Chuck detuvo las tres balas con su barba, desviándolas. La cabeza de JFK estalló de la impresión.' \
        'Una vez, un ciego pisó el zapato de Chuck Norris. Chuck le dijo “¿No sabes quién soy? ¡Soy Chuck Norris!” La mera mención de su nombre curó la ceguera del hombre. Desgraciadamente, la primera, última y única cosa que este hombre llegó a ver fue una mortal patada giratoria lanzada por Chuck Norris.' \
        'Chuck Norris murió hace 10 años, pero La Muerte aún no ha tenido el valor de decírselo.' \
        'Chuck Norris no lee libros. Los mira fijamente hasta que consigue la información que desea.' \
        'Los dinosaurios miraron mal a Chuck Norris una vez. UNA vez.' \
        'La principal exportación de Chuck Norris es el dolor.' \
        'Chuck Norris siempre habla de sí mismo en tercera persona (a veces incluso en cuarta). Los expertos coinciden en creer que también ve en tercera persona.' \
        'Sólo Chuck Norris escribe en el blog de Chuck Norris. Cualquier otra persona que haya deseado hacerlo ha perecido antes de tocar al teclado siquiera.' \
        'Casi todo el mundo utiliza pijamas de Supermán, pero Supermán usa pijamas de Chuck Norris.' \
        'Chuck Norris puede tocar la novena sinfonía de Beethoven en el triángulo... de memoria.' \
        'Chuck Norris puede cantar en un instrumental.' \
        'Chuck Norris puede tocar la guitarra, el bajo, la bateria y varias guitarras a la vez, en directo y sin perder el tiempo.' \
        'Chuck Norris toca la guitarra sin tocar ninguna cuerda, tan solo le advierte a la guitarra de que debe sonar.' \
        'Un dia Chuck Norris estaba comiendo carne de ternera y cansado de comer lo mismo dijo hágase un animal del cual yo podria alimentar sin volar de mis patadas giratorias... y al instante se le cayo un testiculo, y se hizo un huevo...¡Enigma del huevo y la gallina resuelto!' \
        'Chuck norris puede matar dos tiros de un pájaro.' \
        'Chuck Norris no duerme. Espera.' \
        'Chuck Norris no lee el periódico, lo estudia.' \
        'Chuck Norris no juega a nada, lo gana.' \
        'Chuck Norris cuando defeca, deja el aire con olor a Axe.' \
        'Chuck Norris invento a su padre.' \
        'Chuck Norris no te pisa un pie, sino el cuello.' \
        'Los chavales dibujan su nombre en la nieve meando. Chuck Norris hace lo mismo en cemento.' \
        'En los exámenes de matemáticas de Chuck Norris, la respuesta a todas las preguntas fue “Violencia”. Por supusto obtuvo un 10: Para Chuck Norris la violencia es la solución a todos los problemas.' \
        'Chuck Norris borró la papelera de reciclaje.' \
        'Una vez una cobra mordió a Chuck Norris en una pierna. Después de cinco días de agónico dolor, la cobra murió.' \
        'Chuck le echó un pulso una vez a Dios. Desde entonces los Papas bendicen con la mano izquierda...' \
        'Chuck Norris va a 1.000.000 km/s cuando esta quieto.' \
        'Chuck Norris ganó a un muro de ladrillos a una partida de tenis.' \
        'Chuck Norris no cree que haya 50 estados. Sólo hay uno: Estado de emergencia. Allá por donde pasa es una emergencia.' \
        'Chuck Norris no es un jinete del apocalipsis. El prefiere ir en todoterreno.' \
        'Chuck Norris tiene el corazón de un niño. En un bote de cristal en su escritorio.' \
        'El grupo sanguíneo de Chuck Norris es 5W40.' \
        'Chuck Norris hizo su propio carrusel de feria empalando 20 caballos de verdad.' \
        'Chuck Norris hace el desayuno de los campeones. Literalmente. Se comió a Fernando Alonso, Tiger Woods y a Roger Federer en una sóla comida.' \
        'Chuck Norris plancha su ropa llevándola puesta.' \
        'Chuck Norris metió una vez un zapato en una jaula y cantó.' \
        'Chuck Norris le vendió su Dodge Charger del 67 a un amish.' \
        'El Chuck es la medida del sistema internacional del dolor.' \
        'Si Chuck Norris no te enseña una peineta, te dice cuántos segundos de vida te quedan.' \
        'Si pones “Starway to Heaven” al revés, puedes oir a Chuck Norris tirándose a tu hermana, aunque no tengas.' \
        'Una vez Chuck Norris partició en la Ruleta de la Fortuna (Ruleta de la Suerte). Como tiró primero, los 30 minutos del programa consistieron en la ruleta dando vueltas. Ésta es la razón del cambio de plató del programa.' \
        'Una vez acusaron a Chuck Norris de intento de asesinato. Por supuesto quedó libre, ya que Chuck Norris no lo intenta, te asesina.' \
        'Chuck Noris puede ahogarte con el cable de un teléfono inalámbrico.' \
        'Cuando Chuck Norris entra en una habitación no enciende la luz, apaga la oscuridad.' \
        'Chuck Norris ganó un concurso sobre permanecer debajo del agua y ganó. Cabe destacar que su contrincante era pez.' \
        'Una hazaña famosa consiste en bajar las cataratas del niágara en un barril. Chuck Norris lo hizo en una caja de cartón.' \
        'Chuck Norris puede tocar el violín con un piano.' \
        'Una vez, Chuck Norris se tragó un cubo de Rubik y lo cagó resuelto.' \
        'Chuck Norris se ata los cordones de los zapatos con los pies.' \
        'Chuck Norris inventó el negro. De hecho inventó todos los colores menos el rosa, que fue inventado por Tom Cruise.' \
        'Vin Diesel puede ser muy duro, pero Chuck Norris le hizo protagonizar “Un Canguro Superduro”.' \
        'En su cumpleaños, Chuck Norris elige a dos afortunados niños y los envía al sol.' \
        'Una vez Chuck Norris se apostó algo con Superman. El perdedor debía de llevar los calzoncillos por fuera el resto de su vida.' \
        'Chuck Norris es el unico capaz de hablar por 5 horas seguidas sobre el valor del silencio.' \
        'El látigo de Indiana Jones esta trenzado con pelo de la barba de Chuck' \
        'El gato de Chuck Norris es capaz de orinar y cagar en el váter.' \
        'Chuck Norris es capaz viajar en el tiempo a través de su váter.' \
        'Se especuló que Chuck Norris tuvo contactos con Frank Miller para interpretar a Leónidas en la adaptación a la gran pantalla del cómic ´300´. El título de la película habría sido ´UNO´.' \
        'Chuck Norris fue al lavabo y cagó un zurullo, ahora conocido como Júpiter. Marte le salió un día que tenía almorranas.' \
        'Chuck Norris inventó los tejanos el día que se cansó de ir con mallas.' \
        'El dia dura las horas que Chuck Norris necesite. La noche también.' \
        'Chuck Norris no necesita cortinas. Nadie se atreve a mirar por las ventanas de su casa.' \
        'Chuck Norris puede ganarte al Pro, jugando con NBA live.' \
        'Chuck Norris usa el papel de lija como servilletas.' \
        'Chuck Norris me está mirando por la ventana de mi habitación, aunque no tengo ventanas.' \
        'Chuck Norris puso la Luna en el firmamento en la 2ªEdición del Campeonato del Mundo de tirar piedras de una super-patada voladora.' \
        'Chuck Norris vivia con Eva y probó la manzana, pero Dios miró a otro lado, y creó a Adán para echarle las culpas.' \
        'Chuck Norris puede tocar villancicos con una botella de ron. Porque la botella de anís es demasiado fácil.' \
        'Chuck no conoce el miedo; no ha tenido ese placer.' \
        'Chuck Norris no se le retrasan los vuelos.' \
        'Dos meses antes del Tour de France 2006 a Chuck se le insertó cáncer en ambos cojones, luego hizo todo el Tour mientras 4 cocodrilos le mordían los cojones y ganó, cabe destacar que lo hizo en un monociclo.' \
        'Chuck Norris se puede rascar el codo derecho con la mano derecha.' \
        'Chuck Norris se corta las uñas de la mano izquierda con la mano izquierda.' \
        'Chuck Norris es la única persona que puede ganar al ajedrez en el primer turno, sólo con un peón.' \
        'Chuck Norris pudo inflar las ruedas de su coche tan sólo con la fuerza de sus pulmones. Los neumáticos estaban pinchados, por cierto.' \
        'Chuck Norris adereza su merienda cada día con un litro del veneno radiactivo (polonio 220) que mató al espía ruso.' \
        'La Viagra es semen de Chuck Norris solidificado.' \
        'Lovecraft creó sus historias inspirado en Chuck Norris.' \
        'Una vez Chuck Norris hizo una piedra tan grande que ni él podía moverla. Y la movió.' \
        'El ultimo consumidor de todas las cadenas tróficas terrestres y extraterrestres es Chuck Norris.' \
        'Se sabe que la última vez que Chuck Norris pegó una patada, ocurrió una pequeña cosita llamada Big-Bang.' \
        'Chuck Norris puede respirar bajo el agua... y bajo el fuego.' \
        'Chuck Norris cabalgó el caballo de Troya.' \
        'Bruce Lee fue el único que esquivó una patada giratoria de Chuck Norris. Poco despúes murió de arrepentimiento.' \
        'Los científicos no erradicaron la Viruela... fue Chuck Norris que miró feo al Virus.' \
        'La cuenta de hotmail de Chuck Norris tiene 5000000000000TB de memoria de almacenamiento.' \
        'Como las matronas rusas, si abres a Chuck Norris dentro encontraras uno más pequeño y mas cabreado.' \
        'Chuck Norris en latín significa “muerte por patada giratoria”.' \
        'Había un 2º Disneylandia en EEUU, después de la visita de Chuck Norris se le conoce como Silent Hill.' \
        'En Texas es ilegal que Chuck Norris use botas, por culpa de una ley sobre ocultar armas...' \
        'Una vez Chuck Norris peleó con un oso, un cocodrilo y un león al mismo tiempo. Les ganó atándolos con una anaconda.' \
        'Chuck Norris es famoso por su gran colección de duendes de jardín. Como una extraña coincidencia a veces los niños que pasan cerca de su casa desaparecen.' \
        'Una vez Chuck Norris le pegó a un hombre con un mono tan fuerte que el hombre cagó bananas.' \
        'Chuck Norris pesca cortándose y tirándose a una piscina con tiburones y pirañas.' \
        'Cuando Chuck Norris medita, la gente muere.' \
        'Chuck Norris partio un cuchillo con una sandía.' \
        'Chuck Norris no vuela pero pude hacerte volar.' \
        'Chuck Norris ha visto la parte superior de los padres de Vaca y Pollo.' \
        'Chuck Norris se comió una caja de pelotas de Golf. Después se fue a cagar y salió Tiger Woods.' \
        'El Programa de Protección de Testigos fue creado para proteger a la gente que había visto a Chuck Norris.' \
        'La raíz de Chuck Norris es dolor. No intentes elevarlo al cuadrado porque el resultado es la muerte.' \
        'La mayoría de la gente tiene 23 pares de cromosomas. Chuck Norris tiene 72... y todos venenosos.' \
        'Chuck Norris come filetes todos los días pero normalmente olvida matar a la vaca.' \
        'Si buscas en Google “Chuck Norris siendo apaleado” te da 0 resultados, simplemente no puede suceder.' \
        'Una encuesta reciente ha revelado que el 93% de las mujeres piensan en Chuck Norris mientras hacen el amor, una encuesta similar descubrió que Chuck Norris piensa en Chuck Norris el 100% de las veces que hace el amor.' \
        'Chuck Norris le hizo ESO a la cara de Michael Jackson.' \
        'Chuck Norris siempre consigue sexo en la primera cita, SIEMPRE.' \
        'Chuck Norris andando gana a Fernando Alonso en formula uno.' \
        'Chuck Norris puede mezclar el agua y el aceite revolviendolos con un dedo.' \
        'Si te cruzas con un gato negro tendrás 7 años de mala suerte. Pero si un gato negro se cruza con Chuck Norris, perderá sus 7 vidas de una patada giratoria propinada por Chuck Norris.' \
        'Chuck Norris financiaba Youtube, pero se aburrió y cedió a los ruegos de Google.' \
        'Chuck Norris puede cambiar, si quiere, tu ADN de una patada giratoria.' \
        'Chuck Norris dejó sin cuello a Fernando Alonso.' \
        'Chuck Norris estudió para ser comadrona y fue el encargado de darle el cachete a Forest Gump nada más nacer. El resto lo hemos visto todos.' \
        'Chuck Norris escapó de Prison Break por la puerta principal de dicha penitenciaría.' \
        'Bush no encontró armas de destrucción masiva en Irak porque Chuck Norris se marchó antes de empezar la guerra.' \
        'El AXE es en realidad sudor de Chuck Norris.' \
        'En realidad cuando Einstein predijo que no se puede superar la velocidad de la luz, no se acordaba de Chuck Norris. Por eso Chuck viajó al año en el que nació Dios: 69 d.C.N. (después de Chuck Norris) y le obligó a cambiar las leyes del universo.' \
        'Chuck Norris vive en la isla de Perdidos.' \
        'Chuck Norris se hace los 1000 metros en 4 segundos y haciendo el pino del revés.' \
        'Chuck Norris es lo que va antes de Alfa y despues de Omega.' \
        'La Primera Ley de la Termodinámica afirma que la energía ni se crea ni se destruye, excepto si se encuentra con Chuck Norris.' \
        'Una vez Chuck Norris tuvo una erección echado boca abajo. Encontró petróleo.' \
        'Chuck Norris puede empezar una casa por el tejado.' \
        'Cuando Chuck le da cuerda a un mecanismo, este no se detiene nunca.' \
        'Julio Verne se inspiró en Chuck Norris para escribir Viaje al centro de la Tierra.' \
        'El presidente de los Estados Unidos Harry S. Truman decidió no lanzar a Chuck Norris en Hiroshima, ya que era demasiado cruel. En su lugar, decidió lanzar las flatulencias de Chuck Norris, ya que era más humano.' \
        'Chuck Norris hizo llorar a Jean Claude Van-Damme con sólo mirarlo.' \
        'Chuck Norris es el único que puede traspasar flota y recursos entre varios universos de Ogame ¡Incluidas las tuyas!.' \
        'El poema épico nórdico Beowulf está basado en Chuck Norris.' \
        'Contrariamente a lo que dice la ciencia, la Tierra gira alrededor de Chuck Norris.' \
        'Chuck Norris resolvió un cubo de Rubik tan rápido que una persona que le estaba mirando explotó.' \
        'Chuck Norris hizo de doble de Arnold Schwarzenegger en Terminator 2, cuando este último, tenía que introducirse de pies a cabeza en el pozo de lava. Se repitió la toma 3 veces.' \
        'Chuck Norris convirtió un disco duro en blando.' \
        'Chuck Norris escaló el Everest para ver si podía tocar el cielo, y lo consiguió. Después lo bajó esquiando con un sólo esquí. Se trajo un trozo como trofeo.' \
        'Chuck Norris rescató al capitán Nemo de las profundidades del océano, a pulmón.' \
        'Chuck Norris creó el efecto mariposa. Un día dio una patada giratoria y al siguiente Thailandia era absorbida por un Tsunami.' \
        'Cuando Neil Armstrong estuvo en la Luna, encontró una nota escrita que ponía: “Chuck estuvo aquí”.'
}

# Fraces de programadores.
random_frases_programs() {
    shuf -e -n 1 \
        'Actualmente programar es una carrera entre los ingenieros en software por hacer granes y mejores programas a prueba de idiotas, contra el universo que se empeña en hacer mas grandes y mejores idiotas. Por ahora, el universo gana por lejos. -- Rick Cook.' \
        'Lisp no es un lenguaje, en un material de construcción (no conozco lisp, no entendí esta). -- Alan Kay.'  \
        'Caminar sobre agua y desarrollar software en base a una especificación es sencillo, si ambos están congelados. -- Edward V Berard.'  \
        'Ya no hacen más los bugs como bunny. -- Olav Mjelde.'  \
        'Un lenguaje de programación es de bajo nivel cuando requiere que prestes atencion a lo irrelevante. -- Alan J. Perlis.'  \
        'Un programa en C es como un baile rápido en una pista de baile recién encerado por personas que llevan navajas de afeitar. -- Waldi Ravens.'  \
        'Siempre he deseado que mi equipo sea tan fácil de usar como mi teléfono, mi deseo se ha hecho realidad porque ya no puedo encontrar la manera de usar mi teléfono. -- Bjarne Stroustrup.'  \
        'La educación en computación no puede hacer a nadie un experto programador más que el estudio de pinceles y pigmentos puede hacer a alguien un pintor experto. -- Eric S. Raymond.'  \
        'No te preocupes si no funciona bien. Si todo lo que hizo lo hiciera, estarías sin trabajo. -- Mosher’s Law of Software Engineering.'  \
        'Creo que Microsoft nombró. Net para que no se muestran en una lista de directorios Unix. -- Oktal.'  \
        'Bien, Java podría ser un buen ejemplo de lo que un lenguaje de programación debería ser. Pero las aplicaciones Java son buenos ejemplos de lo que las aplicaciones no deberían ser. -- pixadel.'  \
        'Teniendo en cuenta el estado actual triste de nuestros programas de computadora, el desarrollo de software es todavía un arte negro, y aún no pueden ser llamado una disciplina de ingeniería. -- Bill Clinton.'  \
        'El uso de COBOL paraliza la mente, su enseñanza, por tanto, debe ser considerada como un delito penal. -- E.W. Dijkstra.'  \
        'En el único y verdadero camino. La versión orientada a objetos de ´código spaghetti´ es, por supuesto, «código Lasagna. (demasiadas capas). -- Roberto Waltman.'  \
        'FORTRAN no es una flor, sino una mala hierba - que es resistente, a veces florece y crece en todos los ordenadores. -- Alan J. Perlis.'  \
        'Por mucho tiempo me intrigó cómo algo tan caro, tan de punta, puede ser tan inútil. Y entonces se me ocurrió que una computadora es una máquina estúpida con la habilidad de hacer cosas increíblemente inteligentes, mientras que los informáticos son gente inteligente con la capacidad de hacer cosas increíblemente estúpidas. Son, en definitiva, una combinación perfecta. -- Bill Bryson.'  \
        'En Mi Opinión Egoísta, los programas de mayoría de la gente de C debe tener una sangría de seis pies hacia abajo y cubierto de suciedad. -- Blair P. Houghton.'  \
        'Cuando alguien dice: ´quiero un lenguaje de programación en el que sólo tengo que decir lo que quiero hacer ”, le dan un chupetin. -- Alan J. Perlis.'  \
        'La evolución de los lenguajes: FORTRAN es un lenguaje no tipado. C es un lenguaje de tipos débiles. Ada es un lenguaje fuertemente tipado. C++ es un lenguaje fuertemente promocionado. -- Ron Sercely.'  \
        'Un buen diseño aporta un valor añadido más rápido de lo que agrega costo. -- Thomas C. Gale.'  \
        'Python es una gota en el reemplazo de BASIC en el sentido de que Optimus Prime es una gota en el reemplazo de un camión. -- Cory Dodt.'  \
        'Hablar es barato. Enséñame el código. -- Linus Torvalds.'  \
        'Perfección [en el diseño] se alcanza, no cuando no hay nada más que añadir, sino cuando no queda nada para sacar. -- Antoine de Saint-Exupéry.'  \
        'C es peculiar, defectuoso, y un enorme éxito. -- Dennis M. Ritchie.'  \
        'En teoría, la teoría y la práctica son los mismos. En la práctica, no es. -- Yoggi Berra.'  \
        'No se puede tener un gran software sin un gran equipo, y la mayoría de los equipos de desarrollo se comportan como familias disfuncionales. -- Jim McCarthy.'  \
        'PHP es un mal menor perpetrado y creado por aficionados incompetentes, mientras que Perl es un gran e insidioso mal perpetrado por hábiles pero pervertidos profesionales. -- Jon Ribbens.'  \
        'La programación es como patear a ti mismo en la cara, tarde o temprano, su nariz sangra. -- Kyle Woodbury.'  \
        'Perl - El único idioma que tiene el mismo aspecto antes y después de cifrado RSA. -- Keith Bostic.'  \
        'Es más fácil portar una concha de un script de shell. -- Larry Wall.'  \
        'Yo inventé el término “orientado a objetos“, y puedo decirte que no tenía C++ en mente. -- Alan Kay.'  \
        'Aprender a programar no tiene más que ver con el diseño de software interactivo de aprender a tocar el tipo tiene que ver con la escritura de la poesía. -- Ted Nelson.'  \
        'Los mejores programadores no son marginalmente mejores que los simplemente buenos. Ellos son un orden de magnitud mayor, medida por cualquier estándar: creatividad conceptual, velocidad, ingenio de diseño, o la capacidad de resolución de problemas. -- Randall E. Stross.'  \
        'If McDonalds were run like a software company, one out of every hundred Big Macs would give you food poisoning, and the response would be, ‘We’re sorry, here’s a coupon for two more.’. -- Mark Minasi.'  \
        'Si McDonalds funcionara como una empresa de software, uno de cada cien Big Macs le daría la intoxicación alimentaria, y la respuesta sería, ´Lo sentimos, aquí tiene un cupón para dos más. -- Donald E. Knuth.'  \
        'Análisis del sistema informático es como criar a los hijos, se puede hacer un daño grave, pero no se puede garantizar el éxito. -- Tom DeMarco.'  \
        'No me importa si funciona en su máquina! No me envían su máquina!. -- Vidiu Platon.'  \
        'A veces vale la pena quedarse en la cama el lunes, en lugar de pasar el resto de la semana depurando el código del lunes. -- Christopher Thompson.'  \
        'Medir los avances de programación por líneas de código es como medir el progreso de la construcción de aviones por peso. -- Bill Gates.'  \
        'La depuración es dos veces más duro que escribir el código en el primer lugar. Por lo tanto, si usted escribe el código de la forma más inteligente posible, por definición, no es lo suficientemente inteligente para depurarlo. -- Brian W. Kernighan.'  \
        'La gente piensa que la informática es el arte de genios, pero la verdadera realidad es lo contrario, sólo son mucha gente haciendo cosas que se acumulan unos sobre otros, como un muro de piedras mini. -- Donald Knuth.'  \
        'Primero aprenda informática y toda la teoría. Acto seguido desarrolle un estilo de programación. Luego olvidesé todo eso y solo hackee. -- George Carrette.'  \
        'La mayoría de ustedes están familiarizados con las virtudes de un programador. Hay tres, por supuesto: pereza, impaciencia y orgullo desmedido. -- Larry Wall.'  \
        'La mayoría de software de hoy en día es muy parecido a una pirámide egipcia, con millones de ladrillos puestos unos encima de otros, sin una estructura integral, hecha por la fuerza bruta y miles de esclavos. -- Alan Kay.'  \
        'El problema de los programadores es que nunca se sabe lo que un programador está haciendo hasta que ya es demasiado tarde. -- Seymour Cray.'  \
        'Iterar es humano, recursivo divino. -- L. Peter Deutsch.'  \
        'En dos ocasiones me han preguntado [los miembros del Parlamento Europeo]: “Oren, el Sr. Babbage, si usted pone en la máquina cifras incorrectas, podran salir las respuestas correctas? ´Yo no soy capaz de comprender correctamente el tipo de confusión de ideas que podrían provocar ese tipo de pregunta. -- Charles Babbage.'  \
        'La mayoría de los buenos programadores programan, no porque esperan que se les pague o por adulación por parte del público, sino porque es divertido programar. -- Linus Torvalds.'  \
        'Siempre codifica como si la persona que finalmente mantendrá tu código fuera un psicópata violento que sabe dónde vives. -- Martin Golding.'  \
        'Hay dos formas de construir un diseño de software. Una forma es hacerlo tan simple que es obvio que no hay deficiencias. Y la otra es hacerlo tan complicado que no hay deficiencias obvias. -- C.A.R. Hoare.' \
        'Un programador es una persona que es experto en obtener, después de innumerables tecleos, una serie infinita de respuestas incomprensibles calculadas con precisión micrométrica en base a suposiciones vagas basadas en discutibles cifras tomadas de documentos inconclusos y llevadas a cabo sobre instrumentos de precisión problemática, por parte de personas de fiabilidad dudosa y cuestionable mentalidad con el propósito declarado de molestar y confundir a un departamento irremediablemente indefenso que tuvo la mala suerte de pedir la información en primer lugar. -- Revista Grid de la IEEE.' \
        'Durante mucho tiempo me extrañó el hecho de que algo tan caro y tan vanguardista fuera tan inútil. Y luego pensé que la computadora es una máquina estúpida con la capacidad de hacer cosas increíblemente inteligentes, mientras que los programadores de computadoras son gente inteligente con la capacidad de hacer cosas increíblemente estúpidas. En pocas palabras, son la pareja perfecta. -- Bill Bryson.' \
        'Medir el progreso en un proyecto de programación por líneas de código es como medir la construcción de un aeroplano por su peso. -- Bill Gates.' \
        'En teoría, la teoría y la práctica son lo mismo. En la práctica, no. -- Yoggi Berra.' \
        'Cualquiera puede hablar. Enséñame el código. -- Linus Torvalds.' \
        'Programar hoy es una carrera entre los ingenieros de software tratando de construir más grandes y mejores programas a prueba de tontos y el universo tratando de crear idiotas más grandes y mejores. Hasta ahora el universo está ganando. -- Rick Cook.' \
        'El primer 90% del código esta reservado para el primer 90% del tiempo de desarrollo. El 10% de código restante es para el otro 90% del tiempo de desarrollo. -- Tom Cargill.' \
        'Para entender que significa la recursión, primero debe conocer el significado de recursión. -- Author Unknown.' \
        'Siempre quise que mi computadora sea tan fácil de usar como mi teléfono; mi deseo se hizo realidad porque ya no sé como usar mi teléfono. -- Bjarne Stroustrup.' \
        'Una computadora te deja cometer errores más rápido que cualquier invención en la historia, con las excpeciones de las pistolas y la tequila. -- Mitch Ratcliffe.' \
        'Existen 2 formas de desarrollar un diseño de software: Una es hacerla tan simple que obviamente no hay deficiencias, y la otra es que sea tan complicada que no existan deficiencias obvias. El primer método es mucho más dificil. -- C.A.R. Hoare.' \
        'La brecha entre la teoría y la práctica no es tan larga en teoría como lo es en práctica. -- Anónimo.' \
        'Si los constructores construyesen cosas de la manera en que los programadores escriben programas, entonces el primer pajaro carpintero que viniese destruiría la civilización. --Gerald Weinberg.' \
        'Si debuggear es el proceso de eliminar bugs, entonces programar debe ser el proceso de colocarlos. -- Edsger Dijkstra.' \
        'Nueve personas no pueden hacer un bebe en un mes. -- Fred Brooks.' \
        'Existen 2 productos muy importantes que salieron de Berkeley: LSD y UNIX. No creemos que esto sea una coincidencia. -- Jeremy S. Anderson.' \
        'Antes de que el software pueda ser reutilizable primero debe ser utilizable. -- Ralph Johnson.'
}

# Verifica si fortune esta instalado y lo usanmos
fortune_text() {
    if command -v fortune > /dev/null 2>&1; then
        fortune -s
    fi
}

color_from_author() {
    if command -v md5sum > /dev/null 2>&1; then
        printf "#%s" "$1" | md5sum | cut -c1-6
    else 
        printf "%s" "#000000"
    fi
}

# Verificamos dependencias.
check_dependency "shuf curl sed awk"

# Frases de desarroladores.
DEVELOPER_FRASES="`random_frases_programs`"
DEVELOPER_FRASES_TEXT="`printf '%s' "${DEVELOPER_FRASES}" | awk '{split($0,a,"--"); print a[1]}'`"
DEVELOPER_AUTHOR_NAME="`printf '%s' "${DEVELOPER_FRASES}" | awk '{split($0,a,"--"); print a[2]}'`"
DEVELOPER_AUTHOR_LINK="https://www.google.co.ve/search?q=${DEVELOPER_AUTHOR_NAME}"
DEVELOPER_AUTHOR_ICON="https://robohash.org/${DEVELOPER_AUTHOR_NAME}?set=set4"

# Verificamos Fortune
FORTUNE_TEXT="`fortune_text`"
if [ -n "${FORTUNE_TEXT}" ]; then
    FORTUNE_FRASES="`printf '%s' "${FORTUNE_TEXT}" | awk '{split($0,a,"--"); print a[1]}'`"
    FORTUNE_AUTHOR_NAME="`printf '%s' "${FORTUNE_TEXT}" | awk '{split($0,a,"--"); print a[2]}'`"
    if [ -z "${FORTUNE_AUTHOR_NAME}" ]; then 
        FORTUNE_AUTHOR_NAME="Anónimo."
    fi
    FORTUNE_AUTHOR_LINK="https://www.google.co.ve/search?q=${FORTUNE_AUTHOR_NAME}"
    FORTUNE_AUTHOR_ICON="https://robohash.org/${FORTUNE_AUTHOR_NAME}?set=set4"

    FORTUNE_ATTACH="{
        \"text\": \"`printf '%s' "${FORTUNE_FRASES}" | awk '{split($0,a,"-"); print a[1]}'` \",
        \"color\": \"`color_from_author "${FORTUNE_AUTHOR_NAME}"`\",
        \"author_name\": \"${FORTUNE_AUTHOR_NAME}\",
        \"author_link\": \"${FORTUNE_AUTHOR_LINK}\",
        \"author_icon\": \"${FORTUNE_AUTHOR_ICON}\"
    }"
fi

CHUCK_1_FRASE="`random_chuck_dev | sed -E "s/(Chuck Norris)/*\1*/"`"
CHUCK_1_AUTHOR_NAME="Chuck Norris (DEV)"
CHUCK_1_AUTHOR_LINK="https://es.wikipedia.org/wiki/Chuck_Norris"
CHUCK_1_AUTHOR_ICON="https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Chuck_Norris_May_2015.jpg/250px-Chuck_Norris_May_2015.jpg"
CHUCK_1_COLOR="`color_from_author "${CHUCK_1_AUTHOR_NAME}"`"

CHUCK_2_FRASE="`random_chuck | sed -E "s/(Chuck Norris)/*\1*/"`"
CHUCK_2_AUTHOR_NAME="Chuck Norris"
CHUCK_2_AUTHOR_LINK="https://es.wikipedia.org/wiki/Chuck_Norris"
CHUCK_2_AUTHOR_ICON="https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Chuck_Norris_May_2015.jpg/250px-Chuck_Norris_May_2015.jpg"
CHUCK_2_COLOR="`color_from_author "${CHUCK_2_AUTHOR_NAME}"`"

JSON_MSG="{  
    \"username\": \"Frases del momento\",
    \"attachments\": [
        {
            \"text\": \"${CHUCK_1_FRASE}\",
            \"color\": \"${CHUCK_1_COLOR}\",
            \"author_name\": \"${CHUCK_1_AUTHOR_NAME}\",
            \"author_link\": \"${CHUCK_1_AUTHOR_LINK}\",
            \"author_icon\": \"${CHUCK_1_AUTHOR_ICON}\"
        },
        {
            \"text\": \"${CHUCK_2_FRASE}\",
            \"color\": \"${CHUCK_2_COLOR}\",
            \"author_name\": \"${CHUCK_2_AUTHOR_NAME}\",
            \"author_link\": \"${CHUCK_2_AUTHOR_LINK}\",
            \"author_icon\": \"${CHUCK_2_AUTHOR_ICON}\"
        },        
        {
            \"text\": \"${DEVELOPER_FRASES_TEXT}\",
            \"color\": \"`color_from_author "${DEVELOPER_AUTHOR_NAME}"`\",
            \"author_name\": \"${DEVELOPER_AUTHOR_NAME}\",
            \"author_link\": \"${DEVELOPER_AUTHOR_LINK}\",
            \"author_icon\": \"${DEVELOPER_AUTHOR_ICON}\"
        },
        ${FORTUNE_ATTACH}
    ]
}"

# Send POST to webhook
curl -X POST -H 'Content-type: application/json' --data "${JSON_MSG}" "${SLACK_WEBHOOK}"


