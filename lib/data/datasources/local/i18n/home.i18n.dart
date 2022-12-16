import 'package:i18n_extension/i18n_extension.dart';

// SideMenu
const labelCity = "labelCity";
const labelCountry = "labelCountry";
const labelSkills = "labelSkills";
const labelCoding = "labelCoding";
const labelKnowledge = "labelKnowledge";

// HomeBanner
const labelTitleBanner = "titleBanner";
const labelButton = "labelButton";
const labelIBuild  = "labelIBuild";

// HighLightsInfo
const labelSubscribers  = "labelSubscribers";
const labelGitHubProjects  = "labelGitHubProjects";
const labelStars  = "labelStars";

// My Projects
const labelMyProjects  = "labelMyProjects";
const labelReadMore  = "labelReadMore";

// Recommendations
const labelRecommendations  = "labelRecommendations";

extension Localization on String {
  static const _t = Translations.from("en_us", {
    // SideMenu
    labelCity: {
      "en_us": "City",
      "pt_br": "Cidade",
      "es_ES": "Ciudad",
      "fr_FR": "Ville",
    },
    labelCountry: {
      "en_us": "Country",
      "pt_br": "País",
      "es_ES": "País",
      "fr_FR": "Pays",
    },
    labelSkills: {
      "en_us": "Skills",
      "pt_br": "Habilidades",
      "es_ES": "Habilidades",
      "fr_FR": "Compétences",
    },
    labelCoding: {
      "en_us": "Coding",
      "pt_br": "Codificação",
      "es_ES": "Codificación",
      "fr_FR": "Codage",
    },
    labelKnowledge: {
      "en_us": "Knowledge",
      "pt_br": "Conhecimento",
      "es_ES": "Conocimiento",
      "fr_FR": "Connaissances",
    },
    // HomeBanner
    labelTitleBanner: {
      "en_us": "Discover my amazing \nworkspace!",
      "pt_br": "Descubra meu incrível \nespaço de trabalho!",
      "es_ES": "¡Descubre mi increíble \nespacio de trabajo!",
      "fr_FR": "Découvrez mon incroyable \nespace de travail !",
    },
    labelButton: {
      "en_us": "EXPLORE NOW",
      "pt_br": "EXPLORE AGORA",
      "es_ES": "EXPLORE AGORA",
      "fr_FR": "EXPLOREZ MAINTENANT",
    },
    labelIBuild: {
      "en_us": "I build",
      "pt_br": "Eu construo",
      "es_ES": "Construyo",
      "fr_FR": "Je construis",
    },
    // HighLightsInfo
    labelSubscribers: {
      "en_us": "Subscribers",
      "pt_br": "Subscribers",
      "es_ES": "Suscriptores",
      "fr_FR": "Les abonnés",
    },
    labelGitHubProjects: {
      "en_us": "GitHub Projects",
      "pt_br": "Projetos GitHub",
      "es_ES": "Proyectos GitHub",
      "fr_FR": "Projets GitHub",
    },
    labelStars: {
      "en_us": "Stars",
      "pt_br": "Stars",
      "es_ES": "Estrellas",
      "fr_FR": "Étoiles",
    },
    // My Projects
    labelMyProjects: {
      "en_us": "My Projects",
      "pt_br": "Meus projetos",
      "es_ES": "Mis proyectos",
      "fr_FR": "Mes projets",
    },
    labelReadMore: {
      "en_us": "Read More",
      "pt_br": "Ler mais",
      "es_ES": "Lee mas",
      "fr_FR": "Lire la suite",
    },
    // Recommendations
    labelRecommendations: {
      "en_us": "Recommendations",
      "pt_br": "Recomendações",
      "es_ES": "Recomendaciones",
      "fr_FR": "Recommandations",
    },
  });

  String get i18n => localize(this, _t);

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(value) => localizePlural(value, this, _t);
}
