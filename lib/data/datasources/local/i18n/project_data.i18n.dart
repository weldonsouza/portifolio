import 'package:i18n_extension/i18n_extension.dart';

const labelDescription = "labelDescription";
const labelTitleProject1 = "labelTitleProject1";
const labelTitleProject2 = "labelTitleProject2";
const labelTitleProject3 = "labelTitleProject3";
const labelTitleProject4 = "labelTitleProject4";
const labelTitleProject5 = "labelTitleProject5";
const labelDescriptionProject1 = "labelDescriptionProject1";
const labelDescriptionProject2 = "labelDescriptionProject2";
const labelDescriptionProject3 = "labelDescriptionProject3";
const labelDescriptionProject4 = "labelDescriptionProject4";
const labelDescriptionProject5 = "labelDescriptionProject5";

// Recommendation
const labelRecommendation1 = "labelRecommendation1";
const labelRecommendation2 = "labelRecommendation2";
const labelRecommendation3 = "labelRecommendation3";
const labelRecommendation4 = "labelRecommendation4";


extension Localization on String {
  static const _t = Translations.from("en_us", {
    labelDescription: {
      "en_us": "Flutter Dev | Open-Source Enthusiast",
      "pt_br": "Flutter Dev | Entusiasta de código aberto",
      "es_ES": "Desarrollo de aleteo | Entusiasta del código abierto",
      "fr_FR": "Flutter Dev | Passionné d'Open Source",
    },
    labelTitleProject1: {
      "en_us": "Responsive Admin Panel or Dashboard - Flutter UI",
      "pt_br": "Painel ou painel de administração responsivo - Flutter UI",
      "es_ES": "Panel de administración receptivo o panel de control: interfaz de usuario de Flutter",
      "fr_FR": "Panneau d'administration ou tableau de bord réactif - Interface utilisateur Flutter",
    },
    labelTitleProject2: {
      "en_us": "E-Commerce Complete App - Flutter UI",
      "pt_br": "Aplicativo completo de comércio eletrônico - Flutter UI",
      "es_ES": "Application complète de commerce électronique - Flutter UI",
      "fr_FR": "Aplicación completa de comercio electrónico: interfaz de usuario de Flutter",
    },
    labelTitleProject3: {
      "en_us": "Chat/Messaging App Light and Dark Theme - Flutter UI",
      "pt_br": "Tema claro e escuro do aplicativo de bate-papo/mensagens - Flutter UI",
      "es_ES": "Thème clair et sombre de l'application de chat/messagerie - Flutter UI",
      "fr_FR": "Thème clair et sombre de l'application de chat/messagerie - Flutter UI",
    },
    labelTitleProject4: {
      "en_us": "Login Page and Sign up page - Flutter UI",
      "pt_br": "Página de login e página de inscrição - Flutter UI",
      "es_ES": "Página de inicio de sesión y página de registro: interfaz de usuario de Flutter",
      "fr_FR": "Page de connexion et page d'inscription - Flutter UI",
    },
    labelTitleProject5: {
      "en_us": "Covid-19 App - Flutter UI",
      "pt_br": "Aplicativo Covid-19 - Flutter UI",
      "es_ES": "Aplicación Covid-19: interfaz de usuario de Flutter",
      "fr_FR": "Application Covid-19 - Interface utilisateur Flutter",
    },
    labelDescriptionProject1: {
      "en_us": "On Flutter V2.* web officially supported on a stable branch. Today I share an Admin panel or you can call it dashboard UI build with flutter. Now you can build your app dashboard using flutter. This dashboard contains almost everything that you need like a chart, table, nice small card for showing info.",
      "pt_br": "No Flutter V2.* web oficialmente suportado em um branch estável. Hoje, compartilho um painel de administração ou você pode chamá-lo de painel de criação de interface do usuário com vibração. Agora você pode criar o painel do seu aplicativo usando o flutter. Este painel contém quase tudo o que você precisa, como um gráfico, uma tabela e um pequeno cartão para mostrar informações.",
      "es_ES": "En Flutter V2.* web soportado oficialmente en una rama estable. Hoy comparto un panel de administración o puede llamarlo compilación de interfaz de usuario del tablero con flutter. Ahora puede crear el tablero de su aplicación usando flutter. Este tablero contiene casi todo lo que necesita, como un gráfico, una tabla, una tarjeta pequeña y agradable para mostrar información.",
      "fr_FR": "Sur Flutter V2.* Web officiellement pris en charge sur une branche stable. Aujourd'hui, je partage un panneau d'administration ou vous pouvez l'appeler création d'interface utilisateur de tableau de bord avec flutter. Vous pouvez maintenant créer le tableau de bord de votre application à l'aide de Flutter. Ce tableau de bord contient presque tout ce dont vous avez besoin, comme un graphique, un tableau, une jolie petite carte pour afficher des informations.",
    },
    labelDescriptionProject2: {
      "en_us": "In the first part of our complete e-commerce app, we show you how you can create a nice clean onboarding screen for your e-commerce app that can run both Andriod and iOS devices because it builds with flutter. Then on the second episode, we build a Sign in, Forgot Password screen with a custom error indicator.",
      "pt_br": "Na primeira parte de nosso aplicativo de comércio eletrônico completo, mostramos como você pode criar uma tela de integração limpa e agradável para seu aplicativo de comércio eletrônico que pode executar dispositivos Android e iOS porque é construído com vibração. Em seguida, no segundo episódio, criamos uma tela Entrar, esqueci a senha com um indicador de erro personalizado.",
      "es_ES": "En la primera parte de nuestra aplicación de comercio electrónico completa, le mostramos cómo puede crear una pantalla de incorporación agradable y limpia para su aplicación de comercio electrónico que puede ejecutar dispositivos Android e iOS porque se construye con flutter. Luego, en el segundo episodio, construimos una pantalla Iniciar sesión, Olvidé mi contraseña con un indicador de error personalizado.",
      "fr_FR": "Dans la première partie de notre application e-commerce complète, nous vous montrons comment vous pouvez créer un bel écran d'intégration propre pour votre application e-commerce qui peut exécuter à la fois des appareils Andriod et iOS car il se construit avec flutter. Ensuite, dans le deuxième épisode, nous construisons un écran de connexion, mot de passe oublié avec un indicateur d'erreur personnalisé.",
    },
    labelDescriptionProject3: {
      "en_us": "Today we gonna build messing/chat app #ui using #flutter that runs both Android and iOS devices also has a dark and light theme. We create in total 4 screens all of that support both Dark Theme and Light Theme. At first, we design a welcome screen that contains an image with a tag line also has a skip button.",
      "pt_br": "Hoje vamos construir o aplicativo de bate-papo/conversação #ui usando #flutter que executa dispositivos Android e iOS e também tem um tema claro e escuro. Criamos no total 4 telas, todas compatíveis com Dark Theme e Light Theme. Inicialmente, projetamos uma tela de boas-vindas que contém uma imagem com um slogan e também possui um botão de pular.",
      "es_ES": "Hoy vamos a crear una aplicación de mensajería/chat #ui usando #flutter que se ejecuta en dispositivos Android e iOS y también tiene un tema oscuro y claro. Creamos un total de 4 pantallas, todas compatibles con Dark Theme y Light Theme. Al principio, diseñamos una pantalla de bienvenida que contiene una imagen con un eslogan y también tiene un botón de salto.",
      "fr_FR": "Aujourd'hui, nous allons créer une application de messagerie/chat #ui en utilisant #flutter qui exécute à la fois les appareils Android et iOS a également un thème sombre et clair. Nous créons au total 4 écrans qui prennent tous en charge à la fois le thème sombre et le thème clair. Dans un premier temps, nous concevons un écran d'accueil contenant une image avec un slogan et un bouton de saut.",
    },
    labelDescriptionProject4: {
      "en_us": "In the first part of our complete e-commerce app, we show you how you can create a nice clean onboarding screen for your e-commerce app that can run both Andriod and iOS devices because it builds with flutter. Then on the second episode, we build a Sign in, Forgot Password screen with a custom error indicator.",
      "pt_br": "Na primeira parte de nosso aplicativo de comércio eletrônico completo, mostramos como você pode criar uma tela de integração limpa e agradável para seu aplicativo de comércio eletrônico que pode executar dispositivos Android e iOS porque é construído com vibração. Em seguida, no segundo episódio, criamos uma tela Entrar, esqueci a senha com um indicador de erro personalizado.",
      "es_ES": "En la primera parte de nuestra aplicación de comercio electrónico completa, le mostramos cómo puede crear una pantalla de incorporación agradable y limpia para su aplicación de comercio electrónico que puede ejecutar dispositivos Android e iOS porque se construye con flutter. Luego, en el segundo episodio, construimos una pantalla Iniciar sesión, Olvidé mi contraseña con un indicador de error personalizado.",
      "fr_FR": "Dans la première partie de notre application e-commerce complète, nous vous montrons comment vous pouvez créer un bel écran d'intégration propre pour votre application e-commerce qui peut exécuter à la fois des appareils Andriod et iOS car il se construit avec flutter. Ensuite, dans le deuxième épisode, nous construisons un écran de connexion, mot de passe oublié avec un indicateur d'erreur personnalisé.",
    },
    labelDescriptionProject5: {
      "en_us": "We redesign the outlook app also make it responsive so that you can run it everywhere on your phone, tab, or web. In this flutter responsive video, we will show you the real power of flutter. Make mobile, web, and desktop app from a single codebase.",
      "pt_br": "Redesenhamos o aplicativo do Outlook e também o tornamos responsivo para que você possa executá-lo em qualquer lugar em seu telefone, guia ou web. Neste vídeo responsivo de vibração, mostraremos o verdadeiro poder da vibração. Crie aplicativos móveis, da Web e de desktop a partir de uma única base de código.",
      "es_ES": "Rediseñamos la aplicación de Outlook y también la hacemos receptiva para que pueda ejecutarla en cualquier lugar de su teléfono, pestaña o web. En este video responsivo de flutter, te mostraremos el poder real de flutter. Cree aplicaciones móviles, web y de escritorio desde una única base de código.",
      "fr_FR": "Nous reconcevons l'application Outlook et la rendons réactive afin que vous puissiez l'exécuter partout sur votre téléphone, votre onglet ou votre site Web. Dans cette vidéo réactive au flottement, nous allons vous montrer le véritable pouvoir du flottement. Créez des applications mobiles, Web et de bureau à partir d'une seule base de code.",
    },
    // Recommendation
    labelRecommendation1: {
      "en_us": "I have had the pleasure of working with Anwar on two flutter projects and what strikes me the most about his work is his ability to write clean and reusable codes with best practices. He is hardworking and makes it so easy to transcribe ideas into beautiful and testable flutter apps. He is a Flutter/Dart gem and has my highest recommendation",
      "pt_br": "Tive o prazer de trabalhar com Anwar em dois projetos flutter e o que mais me impressiona em seu trabalho é sua capacidade de escrever códigos limpos e reutilizáveis com as melhores práticas. Ele é trabalhador e torna muito fácil transcrever ideias em aplicativos de vibração bonitos e testáveis. Ele é uma joia do Flutter/Dart e tem minha recomendação mais alta",
      "es_ES": "He tenido el placer de trabajar con Anwar en dos proyectos de flutter y lo que más me sorprende de su trabajo es su capacidad para escribir códigos limpios y reutilizables con las mejores prácticas. Es muy trabajador y hace que sea muy fácil transcribir ideas en aplicaciones de aleteo hermosas y comprobables. Es una joya de Flutter/Dart y tiene mi más alta recomendación.",
      "fr_FR": "J'ai eu le plaisir de travailler avec Anwar sur deux projets flutter et ce qui me frappe le plus dans son travail est sa capacité à écrire des codes propres et réutilisables avec les meilleures pratiques. Il travaille dur et rend si facile la transcription d'idées dans de belles applications de flutter testables. Il est un joyau Flutter / Dart et a ma plus haute recommandation",
    },
    labelRecommendation2: {
      "en_us": "Abu is great asset for any organization. It's a true pleasure working with him at TakeIn. His flutter skill is amazing as well as his professionalism and being a good team player. Abu's problem solving skill is also one of his great skills.",
      "pt_br": "Abu é um grande trunfo para qualquer organização. É um verdadeiro prazer trabalhar com ele na TakeIn. Sua habilidade de vibração é incrível, assim como seu profissionalismo e ser um bom jogador de equipe. A habilidade de resolução de problemas de Abu também é uma de suas grandes habilidades.",
      "es_ES": "Abu es un gran activo para cualquier organización. Es un verdadero placer trabajar con él en TakeIn. Su habilidad con el aleteo es increíble, así como su profesionalismo y ser un buen jugador de equipo. La habilidad de resolución de problemas de Abu es también una de sus grandes habilidades.",
      "fr_FR": "Abu est un atout majeur pour toute organisation. C'est un vrai plaisir de travailler avec lui chez TakeIn. Son flutter est incroyable, tout comme son professionnalisme et son bon esprit d'équipe. La compétence d'Abu en résolution de problèmes est également l'une de ses grandes compétences.",
    },
    labelRecommendation3: {
      "en_us": "I like your way you doing your project and you taught us. After I watch this I like and hit the subscribe button and then watch your video playlist one by one!! Within three hours, I learned a lot! I share your channel in my college WhatsApp group!",
      "pt_br": "Eu gosto do seu jeito de fazer seu projeto e você nos ensinou. Depois de assistir, eu gosto e pressiono o botão de inscrição e assisto à sua lista de reprodução de vídeos, um por um! Em três horas, aprendi muito! Compartilho seu canal no meu grupo de WhatsApp da faculdade!",
      "es_ES": "Me gusta tu forma de hacer tu proyecto y nos enseñaste. ¡Después de ver esto, me gusta y presiono el botón de suscripción y luego miro tu lista de reproducción de videos uno por uno! ¡En tres horas, aprendí mucho! Comparto tu canal en mi grupo de WhatsApp de la universidad!",
      "fr_FR": "J'aime ta façon de faire ton projet et tu nous a appris. Après avoir regardé cela, j'aime et j'appuie sur le bouton d'abonnement, puis je regarde votre playlist vidéo une par une !! En trois heures, j'ai beaucoup appris ! Je partage votre chaîne dans le groupe WhatsApp de mon collège !",
    },
    labelRecommendation4: {
      "en_us": "Very straightforward, professional and also the best flutter videos in the youtube! It will be great if you add some comments to your steps with 0.5 seconds pause before implementing this step. By meaning of steps, I mean not the basic, but structural steps, like 10-20 steps per video. However, thank you very much!",
      "pt_br": "Muito direto, profissional e também os melhores vídeos de flutter do youtube! Será ótimo se você adicionar alguns comentários às suas etapas com uma pausa de 0,5 segundos antes de implementar esta etapa. Por etapas, não quero dizer as etapas básicas, mas estruturais, como 10 a 20 etapas por vídeo. No entanto, muito obrigado!",
      "es_ES": "¡Muy sencillo, profesional y también los mejores videos de aleteo en YouTube! Será genial si agrega algunos comentarios a sus pasos con una pausa de 0,5 segundos antes de implementar este paso. Por pasos, no me refiero a los pasos básicos, sino a los estructurales, como 10-20 pasos por video. Sin embargo, ¡muchas gracias!",
      "fr_FR": "Très simple, professionnel et aussi les meilleures vidéos de flottement sur YouTube ! Ce sera formidable si vous ajoutez des commentaires à vos étapes avec une pause de 0,5 seconde avant de mettre en œuvre cette étape. Par étapes, je n'entends pas les étapes de base, mais structurelles, comme 10 à 20 étapes par vidéo. Cependant, merci beaucoup !",
    },
  });

  String get i18n => localize(this, _t);

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(value) => localizePlural(value, this, _t);
}
