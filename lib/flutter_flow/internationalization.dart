import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['fr', 'en', 'es', 'pt', 'de'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? frText = '',
    String? enText = '',
    String? esText = '',
    String? ptText = '',
    String? deText = '',
  }) =>
      [frText, enText, esText, ptText, deText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'nuj6mhwr': {
      'fr': 'SANTE CORPS & ESPRIT',
      'de': 'GESUNDHEIT VON KÖRPER UND GEIST',
      'en': 'BODY & MIND HEALTH',
      'es': 'SALUD CUERPO Y MENTE',
      'pt': 'SAÚDE CORPO E MENTE',
    },
    'dehut86f': {
      'fr': '<<Toutes les clés de votre bien être, et de votre santé.>>',
      'de': '<<Alle Schlüssel zu Ihrem Wohlbefinden und Ihrer Gesundheit.>>',
      'en': '<<All the keys to your well-being and your health.>>',
      'es': '<<Todas las claves para tu bienestar y tu salud.>>',
      'pt': '<<Todas as chaves para o seu bem-estar e saúde.>>',
    },
    'f8gwxfm0': {
      'fr':
          'Découvrez dans votre Appli catalogue, l’essentiel des livres de bien-être, de santé, du succès et du bonheur.',
      'de':
          'Entdecken Sie in Ihrer Katalog-App die wesentlichen Bücher über Wohlbefinden, Gesundheit, Erfolg und Glück.',
      'en':
          'Discover in your Catalog App, the essential books of well-being, health, success and happiness.',
      'es':
          'Descubre en tu Catálogo App, los libros imprescindibles de bienestar, salud, éxito y felicidad.',
      'pt':
          'Descubra na sua App Catálogo, os livros essenciais do bem-estar, saúde, sucesso e felicidade.',
    },
    '3qpje9sk': {
      'fr': 'Disponible dans',
      'de': 'Verfügbar in',
      'en': 'Available in',
      'es': 'Disponible en',
      'pt': 'Disponível em',
    },
    '1autimd0': {
      'fr': 'Disponible dans',
      'de': 'Verfügbar in',
      'en': 'Available in',
      'es': 'Disponible en',
      'pt': 'Disponível em',
    },
    'c6cty0a7': {
      'fr': 'Livres de l\'auteur',
      'de': 'Bücher des Autors',
      'en': 'Author\'s books',
      'es': 'libros de autor',
      'pt': 'livros do autor',
    },
    '1a9b3u3z': {
      'fr': 'Nos coups de coeur',
      'de': 'unsere Favoriten',
      'en': 'our favorites',
      'es': 'nuestros favoritos',
      'pt': 'nossos favoritos',
    },
    'bbqh2cae': {
      'fr': 'https://www.santecorpsetesprit.com',
      'de': 'https://www.santecorpsetesprit.com',
      'en': 'https://www.santecorpsetesprit.com',
      'es': 'https://www.santecorpsetesprit.com',
      'pt': 'https://www.santecorpsetesprit.com',
    },
    's2ci9icq': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
      'pt': 'Lar',
    },
  },
  // avisAuteur
  {
    'dv9006ep': {
      'fr': 'Avis de l\'auteur',
      'de': 'Meinung des Autors',
      'en': 'Author\'s opinion',
      'es': 'opinión del autor',
      'pt': 'opinião do autor',
    },
    'py7fgy9b': {
      'fr': 'Chère lectrice, Cher lecteur,',
      'de': 'Lieber Leser, lieber Leser,',
      'en': 'Dear Reader, Dear Reader,',
      'es': 'Querido lector, querido lector,',
      'pt': 'Caro Leitor, Caro Leitor,',
    },
    '5tr4d49p': {
      'fr':
          'Le catalogue Santé corps & esprit appartient au web site-blog www.santecorpsetesprit.com, qui s’est fixé pour objectif de vous faire découvrir des livres incontournables de bien-être et de santé globale, ainsi que ses coups de cœur.',
      'de':
          'Der Body & Mind Health-Katalog gehört zum Website-Blog www.santecorpsetesprit.com, der es sich zum Ziel gesetzt hat, Ihnen wichtige Bücher zum Thema Wohlbefinden und allgemeine Gesundheit sowie seine Favoriten vorzustellen.',
      'en':
          'The Body & Mind Health catalog belongs to the web site-blog www.santecorpsetesprit.com, which has set itself the goal of making you discover essential books on well-being and overall health, as well as its favourites.',
      'es':
          'El catálogo Body & Mind Health pertenece al sitio web-blog www.santecorpsetesprit.com, que se ha marcado como objetivo hacerte descubrir libros imprescindibles sobre el bienestar y la salud integral, así como sus favoritos.',
      'pt':
          'O catálogo Body & Mind Health pertence ao site-blog www.santecorpsetesprit.com, que tem como objetivo fazer com que você descubra livros essenciais sobre bem-estar e saúde em geral, assim como seus favoritos.',
    },
    'tyy0xq92': {
      'fr':
          'Comme vous le savez, le bien-être et la santé sont les fondements de l’épanouissement personnel et du bonheur. C’est pourquoi, vous allez dénicher dans chaque livre présenté dans les pages suivantes, des conseils objectifs ; faciles à comprendre et à mettre en pratique. Tout est écrit dans un langage clair, facile à lire.',
      'de':
          'Wie Sie wissen, sind Wohlbefinden und Gesundheit die Grundlagen für persönliche Erfüllung und Glück. Aus diesem Grund finden Sie in jedem Buch, das auf den folgenden Seiten vorgestellt wird, objektive Ratschläge; leicht zu verstehen und in die Praxis umzusetzen. Alles ist in einer klaren, leicht lesbaren Sprache geschrieben.',
      'en':
          'As you know, well-being and health are the foundations of personal fulfillment and happiness. This is why, in each book presented in the following pages, you will find objective advice; easy to understand and put into practice. Everything is written in clear, easy to read language.',
      'es':
          'Como sabes, el bienestar y la salud son los cimientos de la realización personal y la felicidad. Por eso, en cada libro presentado en las siguientes páginas, encontrará consejos objetivos; fácil de entender y poner en práctica. Todo está escrito en un lenguaje claro y fácil de leer.',
      'pt':
          'Como você sabe, o bem-estar e a saúde são os alicerces da realização pessoal e da felicidade. É por isso que, em cada livro apresentado nas páginas seguintes, você encontrará conselhos objetivos; fácil de entender e colocar em prática. Tudo está escrito em linguagem clara e fácil de ler.',
    },
    'dhispxwt': {
      'fr':
          'Par ailleurs, pour découvrir les mises à jour de nos nouveautés, cliquez sur le lien www.santecorpsetesprit.com sur la couverture ou sur la dernière page du catalogue, qui vous dirigera en toute sécurité vers notre site.',
      'de':
          'Um außerdem die Aktualisierungen unserer Neuheiten zu entdecken, klicken Sie auf den Link www.santecorpsetesprit.com auf dem Cover oder auf der letzten Seite des Katalogs, der Sie in völliger Sicherheit zu unserer Website weiterleitet.',
      'en':
          'In addition, to discover the updates of our novelties, click on the link www.santecorpsetesprit.com on the cover or on the last page of the catalog, which will direct you in complete safety to our site.',
      'es':
          'Además, para descubrir las actualizaciones de nuestras novedades, haga clic en el enlace www.santecorpsetesprit.com en la portada o en la última página del catálogo, que lo dirigirá con total seguridad a nuestro sitio.',
      'pt':
          'Além disso, para descobrir as atualizações de nossas novidades, clique no link www.santecorpsetesprit.com na capa ou na última página do catálogo, que o direcionará com total segurança ao nosso site.',
    },
    'yakfba0e': {
      'fr':
          'Nous espérons humblement accomplir notre devoir de vulgarisation, de la connaissance précieuse aux humains, et nous serions très heureux si elle contribue à procurer le bienêtre, la santé, le succès et le bonheur à l’humanité souffrante. Surtout, n’oubliez pas de partager les pages ou le catalogue dans vos réseaux sociaux. Afin de nous aider à diffuser largement ces informations. Par avance, un grand merci !',
      'de':
          'Wir hoffen demütig, dass wir unserer Pflicht zur Popularisierung des für den Menschen wertvollen Wissens gerecht werden und würden uns sehr freuen, wenn es dazu beitragen würde, der leidenden Menschheit Wohlbefinden, Gesundheit, Erfolg und Glück zu bieten. Vergessen Sie vor allem nicht, die Seiten oder den Katalog in Ihren sozialen Netzwerken zu teilen. Um uns dabei zu helfen, diese Informationen weithin zu verbreiten. Im Voraus vielen Dank!',
      'en':
          'We humbly hope to accomplish our duty of popularization, of the knowledge precious to humans, and we would be very happy if it contributes to providing well-being, health, success and happiness to suffering humanity. Above all, do not forget to share the pages or the catalog in your social networks. To help us disseminate this information widely. In advance, many thanks!',
      'es':
          'Esperamos humildemente cumplir con nuestro deber de divulgación, de los conocimientos preciosos para los humanos, y seríamos muy felices si ello contribuye a brindar bienestar, salud, éxito y felicidad a la humanidad doliente. Sobre todo, no olvides compartir las páginas o el catálogo en tus redes sociales. Para ayudarnos a difundir ampliamente esta información. ¡De antemano, muchas gracias!',
      'pt':
          'Esperamos humildemente cumprir nosso dever de divulgação, do conhecimento precioso ao ser humano, e ficaríamos muito felizes se isso contribuísse para proporcionar bem-estar, saúde, sucesso e felicidade à humanidade sofredora. Acima de tudo, não se esqueça de compartilhar as páginas ou o catálogo em suas redes sociais. Para nos ajudar a divulgar esta informação amplamente. Desde já, muito obrigado!',
    },
    '3ckc5d6c': {
      'fr':
          'Nous vous souhaitons de tout cœur, bien-être, santé, succès et bonheur.',
      'de':
          'Wir wünschen Ihnen von ganzem Herzen Wohlbefinden, Gesundheit, Erfolg und Glück.',
      'en':
          'We wholeheartedly wish you well-being, health, success and happiness.',
      'es': 'Le deseamos de todo corazón bienestar, salud, éxito y felicidad.',
      'pt':
          'Desejamos-lhe de todo o coração bem-estar, saúde, sucesso e felicidade.',
    },
    'xiv8cerr': {
      'fr': 'Avec notre cordial dévouement.',
      'de': 'Mit unserer herzlichen Hingabe.',
      'en': 'With our cordial devotion.',
      'es': 'Con nuestra cordial devoción.',
      'pt': 'Com nossa cordial devoção.',
    },
    'sjge2soe': {
      'fr': 'L’équipe',
      'de': 'Das Team',
      'en': 'The team',
      'es': 'El equipo',
      'pt': 'O time',
    },
    '6ey9zs3w': {
      'fr': 'Santecorpsetesprit.com',
      'de': 'Santecorpsandesprit.com',
      'en': 'Santecorpsandesprit.com',
      'es': 'Santecorpsandesprit.com',
      'pt': 'Santecorpsandesprit.com',
    },
    '9csmf8hr': {
      'fr': 'Commencer',
      'de': 'Anfangen',
      'en': 'To start',
      'es': 'Comenzar',
      'pt': 'Para iniciar',
    },
    '0hqk80ej': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
      'pt': 'Lar',
    },
  },
  // livresAuteur
  {
    'bggw2t2q': {
      'fr': 'Edition spéciale riche en découvertes ',
      'de': 'Sonderausgabe voller Entdeckungen',
      'en': 'Special edition rich in discoveries',
      'es': 'Edición especial rica en descubrimientos',
      'pt': 'Edição especial rica em descobertas',
    },
    'ci4uqcpj': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
      'pt': 'Lar',
    },
  },
  // detailsLivre
  {
    'bm8p3w6x': {
      'fr': 'Description',
      'de': 'Beschreibung',
      'en': 'Description',
      'es': 'Descripción',
      'pt': 'Descrição',
    },
    'ctpdhhx7': {
      'fr': 'Disponible sur :',
      'de': 'Verfügbar auf :',
      'en': 'Available on :',
      'es': 'Disponible en :',
      'pt': 'Disponível em :',
    },
    'a5kekzkl': {
      'fr': 'www.amazon.fr',
      'de': 'www.amazon.fr',
      'en': 'www.amazon.fr',
      'es': 'www.amazon.fr',
      'pt': 'www.amazon.fr',
    },
    'lz21ibq6': {
      'fr': ' www.chapitre.com ',
      'de': 'www.chapter.com',
      'en': 'www.chapter.com',
      'es': 'www.capítulo.com',
      'pt': 'www.chapter.com',
    },
    'lfsja9p8': {
      'fr': ' www.leslibrairies.fr',
      'de': 'www.leslibrairies.fr',
      'en': 'www.leslibrairies.fr',
      'es': 'www.leslibrairies.fr',
      'pt': 'www.leslibrairies.fr',
    },
    'k35v8co4': {
      'fr': ' www.placedeslibraires.fr',
      'de': 'www.placedeslibraires.fr',
      'en': 'www.placedeslibraires.fr',
      'es': 'www.placedeslibraires.fr',
      'pt': 'www.placedeslibraires.fr',
    },
    'py34dbyh': {
      'fr': 'www.librairiesdelest.fr',
      'de': 'www.librairiesdelest.fr',
      'en': 'www.librairiesdelest.fr',
      'es': 'www.librairiesdelest.fr',
      'pt': 'www.librairiesdelest.fr',
    },
    'vtyv7v0w': {
      'fr': 'www.parislibrairies.fr ',
      'de': 'www.parislibrairies.fr',
      'en': 'www.parislibrairies.fr',
      'es': 'www.parislibrairies.fr',
      'pt': 'www.parislibrairies.fr',
    },
    'bxmbqa3n': {
      'fr': 'www. librairiesindependantes.com',
      'de': 'www. Independentlibraries.com',
      'en': 'www. independentlibraries.com',
      'es': 'www. bibliotecasindependientes.com',
      'pt': 'www. independentlibraries.com',
    },
    '0gvl4kzk': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
      'pt': 'Lar',
    },
  },
  // HomePageCopy
  {
    'ex5xzc0p': {
      'fr': 'SANTE CORPS & ESPRIT',
      'de': 'GESUNDHEIT VON KÖRPER UND GEIST',
      'en': 'BODY & MIND HEALTH',
      'es': 'SALUD CUERPO Y MENTE',
      'pt': 'SAÚDE DO CORPO E DA MENTE',
    },
    'piyrr46k': {
      'fr': '<<Toutes les clés de votre bien être, et de votre santé.>>',
      'de': '<<Alle Schlüssel zu Ihrem Wohlbefinden und Ihrer Gesundheit.>>',
      'en': '<<All the keys to your well-being and your health.>>',
      'es': '<<Todas las claves para tu bienestar y tu salud.>>',
      'pt': '<<Todas as chaves para o seu bem-estar e saúde.>>',
    },
    't35w9bk0': {
      'fr':
          'Découvrez dans votre Appli catalogue, l’essentiel des livres de bien-être, de santé, du succès et du bonheur.',
      'de':
          'Entdecken Sie in Ihrer Katalog-App die wesentlichen Bücher über Wohlbefinden, Gesundheit, Erfolg und Glück.',
      'en':
          'Discover in your Catalog App, the essential books of well-being, health, success and happiness.',
      'es':
          'Descubre en tu Catálogo App, los libros imprescindibles de bienestar, salud, éxito y felicidad.',
      'pt':
          'Descubra na sua App Catálogo, os livros essenciais do bem-estar, saúde, sucesso e felicidade.',
    },
    '2kojw2lt': {
      'fr': 'Disponible dans',
      'de': 'Verfügbar in',
      'en': 'Available in',
      'es': 'Disponible en',
      'pt': 'Disponível em',
    },
    'nqf8u7g5': {
      'fr': 'Disponible dans',
      'de': 'Verfügbar in',
      'en': 'Available in',
      'es': 'Disponible en',
      'pt': 'Disponível em',
    },
    'q9dgx4x8': {
      'fr': 'Français',
      'de': 'Französisch',
      'en': 'French',
      'es': 'Francés',
      'pt': 'Francês',
    },
    'z2nda35t': {
      'fr': 'Anglais',
      'de': 'Englisch',
      'en': 'English',
      'es': 'Inglés',
      'pt': 'Inglês',
    },
    'b8hit90a': {
      'fr': 'Espagnol',
      'de': 'Spanisch',
      'en': 'Spanish',
      'es': 'Español',
      'pt': 'Espanhol',
    },
    'g92nmyz9': {
      'fr': 'Portugais',
      'de': 'Portugiesisch',
      'en': 'Portuguese',
      'es': 'portugués',
      'pt': 'Português',
    },
    'ec3f5x1h': {
      'fr': 'Allemand ',
      'de': 'Deutsch',
      'en': 'German',
      'es': 'Alemán',
      'pt': 'Alemão',
    },
    '3qp423dg': {
      'fr': 'Italien',
      'de': 'Italienisch',
      'en': 'Italian',
      'es': 'italiano',
      'pt': 'italiano',
    },
    'nxxrjb27': {
      'fr': 'Choisir la langue',
      'de': 'Sprache wählen',
      'en': 'Choose language',
      'es': 'Elige lengua',
      'pt': 'Escolha o seu idioma',
    },
    's4jbjryw': {
      'fr': 'Search for an item...',
      'de': 'Nach einem Artikel suchen...',
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'pt': 'Procurar um item...',
    },
    '9s6g8w7y': {
      'fr': 'Livres de l\'auteur',
      'de': 'Bücher des Autors',
      'en': 'Author\'s books',
      'es': 'libros de autor',
      'pt': 'livros do autor',
    },
    'zj2wga1i': {
      'fr': 'Nos coups de coeur',
      'de': 'unsere Favoriten',
      'en': 'our favorites',
      'es': 'nuestros favoritos',
      'pt': 'nossos favoritos',
    },
    'y8ax3bjx': {
      'fr': 'http://www.santecorpsetesprit.com',
      'de': 'http://www.santecorpsetesprit.com',
      'en': 'http://www.santecorpsetesprit.com',
      'es': 'http://www.santecorpsetesprit.com',
      'pt': 'http://www.santecorpsetesprit.com',
    },
    '45i9kzzk': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
      'pt': 'Lar',
    },
  },
  // avisPourDocteur
  {
    'xptt41kk': {
      'fr': 'Nos coups de coeur',
      'de': 'unsere Favoriten',
      'en': 'our favorites',
      'es': 'nuestros favoritos',
      'pt': 'nossos favoritos',
    },
    't2w076rs': {
      'fr': 'A propos du docteur Christian Tal Schaller',
      'de': 'Über Doktor Christian Tal Schaller',
      'en': 'About Doctor Christian Tal Schaller',
      'es': 'Sobre el doctor Christian Tal Schaller',
      'pt': 'Sobre o Doutor Christian Tal Schaller',
    },
    '6ijn9qlh': {
      'fr':
          'Médecin Suisse, naturopathe, homéopathe, acuponcteur, ostéopathe, chamane et psychothérapeute. C’est un véritable expert de la médecine alternative, pionnier de la santé, penseur avant-gardiste, conférencier et écrivain, il a publié de nombreux ouvrages de référence sur les thèmes de la spiritualité et la santé holistique. Il nous invite à sortir de l’hypnose collective pour vivre dans la joie et la conscience.',
      'de':
          'Schweizer Arzt, Heilpraktiker, Homöopath, Akupunkteur, Osteopath, Schamane und Psychotherapeut. Er ist ein echter Experte für Alternativmedizin, Gesundheitspionier, Avantgarde-Denker, Redner und Autor und hat zahlreiche Nachschlagewerke zu den Themen Spiritualität und ganzheitliche Gesundheit veröffentlicht. Er lädt uns ein, aus der kollektiven Hypnose herauszukommen und in Freude und Bewusstsein zu leben.',
      'en':
          'Swiss doctor, naturopath, homeopath, acupuncturist, osteopath, shaman and psychotherapist. He is a true expert in alternative medicine, health pioneer, avant-garde thinker, speaker and writer, he has published numerous reference works on the themes of spirituality and holistic health. He invites us to come out of collective hypnosis to live in joy and consciousness.',
      'es':
          'Médico suizo, naturópata, homeópata, acupunturista, osteópata, chamán y psicoterapeuta. Es un verdadero experto en medicina alternativa, pionero de la salud, pensador de vanguardia, orador y escritor, ha publicado numerosas obras de referencia sobre los temas de espiritualidad y salud holística. Nos invita a salir de la hipnosis colectiva para vivir en alegría y conciencia.',
      'pt':
          'Médico suíço, naturopata, homeopata, acupunturista, osteopata, xamã e psicoterapeuta. Ele é um verdadeiro especialista em medicina alternativa, pioneiro da saúde, pensador de vanguarda, palestrante e escritor, publicou inúmeras obras de referência sobre os temas de espiritualidade e saúde holística. Ele nos convida a sair da hipnose coletiva para viver com alegria e consciência.',
    },
    'blwajwse': {
      'fr': 'Commencer',
      'de': 'Anfangen',
      'en': 'To start',
      'es': 'Comenzar',
      'pt': 'Para iniciar',
    },
    'doc304dj': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
      'pt': 'Lar',
    },
  },
  // livresDocteur
  {
    '4bhz7cu7': {
      'fr': 'Livres du docteur',
      'de': 'Bücher des Arztes',
      'en': 'Doctor\'s books',
      'es': 'libros de medico',
      'pt': 'livros de doutor',
    },
    'nbkjng7u': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
      'pt': 'Lar',
    },
  },
  // detailsLivreDocteur
  {
    'ig9a7lqi': {
      'fr': 'Description',
      'de': 'Beschreibung',
      'en': 'Description',
      'es': 'Descripción',
      'pt': 'Descrição',
    },
    '2r4qt0lj': {
      'fr': 'Disponible sur : www.santeglobale.world',
      'de': 'Verfügbar unter: www.santeglobale.world',
      'en': 'Available at: www.santeglobale.world',
      'es': 'Disponible en: www.santeglobale.world',
      'pt': 'Disponível em: www.santeglobale.world',
    },
    'fpacdxyy': {
      'fr': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'es': 'Hogar',
      'pt': 'Lar',
    },
  },
  // Miscellaneous
  {
    'cjk38p7b': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '57gmfzvi': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'b3aix1ri': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '5ttt92r0': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'rm2fhwh2': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'iam3zkaf': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'tsi3rgy6': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '8l3h8b93': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'nzw1poib': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'qsbswbkh': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'to9heo79': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '8nl7ugm1': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '1ao3eauj': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'my88oyxv': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'nk5uv6qi': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'jkrjbrrc': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'rlcburep': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'zwxxez71': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '5728y63q': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'znjbubas': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'jb5bqg0a': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'bsjowtxs': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '0v1ui89m': {
      'fr': '',
      'de': '',
      'en': '',
      'es': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));