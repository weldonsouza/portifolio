import 'package:i18n_extension/i18n_extension.dart';

const labelViewProject = "labelViewProject";
const labelUntilMoment = "labelUntilMoment";

extension Localization on String {
  static const _t = Translations.from("en_us", {
    labelViewProject: {
      "en_us": "View project",
      "pt_br": "Exibir projeto",
      "es_ES": "Ver Proyecto",
      "fr_FR": "Voir le projet",
    },
    labelUntilMoment: {
      "en_us": "until the moment",
      "pt_br": "até o momento",
      "es_ES": "hasta el momento",
      "fr_FR": "jusqu'à l'instant",
    },
  });

  String get i18n => localize(this, _t);

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(value) => localizePlural(value, this, _t);
}
