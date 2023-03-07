import 'package:flutter/material.dart';

import '../../../data/datasources/local/i18n/project_data.i18n.dart';
import '../../../domain/models/links_model.dart';
import '../../../domain/models/profile_model.dart';
import '../../../domain/models/project_model.dart';
import '../../../domain/models/skill_model.dart';

class HomeController with ChangeNotifier {
  ProfileModel profile = ProfileModel();

  bool isLoading = false;

  bool get getIsLoading => isLoading;

  setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  setProfileModel(ProfileModel value) {
    profile = value;
    notifyListeners();
  }

  void init() async {
    findProfile();
  }

  Future<String> findProfile() async {
    setIsLoading(true);
    ProfileModel profileModel = ProfileModel(
      photo: 'https://avatars.githubusercontent.com/u/51387498?v=4',
      name: 'Weldon Souza',
      description: labelDescription.i18n,
      city: 'Maceió/AL',
      country: 'Brasil',
      skills: [
        SkillModel(
          name: 'Flutter',
          percentage: 0.9,
        ),
        SkillModel(
          name: 'Dart',
          percentage: 0.9,
        ),
        SkillModel(
          name: 'Android',
          percentage: 0.5,
        ),
      ],
      coding: [
        SkillModel(
          name: 'Dart',
          percentage: 0.9,
        ),
        SkillModel(
          name: 'Android (Kotlin)',
          percentage: 0.5,
        ),
        SkillModel(
          name: 'SWIFT (iOS)',
          percentage: 0.2,
        ),
        SkillModel(
          name: 'Lookback',
          percentage: 0.2,
        ),
        SkillModel(
          name: 'NestJS',
          percentage: 0.2,
        ),
      ],
      knowledge: [
        'Flutter, Dart',
        'Hybrid Mobile Development',
        'GIT',
        'UX Design',
        'RESTful Api',
        'Clean Architecture',
      ],
      links: [
        LinksModel(
          name: 'linkedin',
          link: 'https://www.linkedin.com/in/weldonsouza',
        ),
        LinksModel(
          name: 'github',
          link: 'https://github.com/weldonsouza',
        ),
      ],
      subscribers: 11,
      stars: 10,
      projects: [
        ProjectModel(
          title: labelTitleProject1.i18n,
          description: labelDescriptionProject1.i18n,
          duration: ['01/02/2017'],
          link: 'https://play.google.com/store/apps/details?id=com.neduki.e_nigma',
        ),
        ProjectModel(
          title: labelTitleProject2.i18n,
          description: labelDescriptionProject2.i18n,
          duration: ['03/04/2020'],
          link: 'https://pub.dev/packages/cielo_ecommerce',
        ),
        ProjectModel(
          title: labelTitleProject3.i18n,
          description: labelDescriptionProject3.i18n,
          duration: ['12/04/2020'],
          link: 'https://github.com/weldonsouza/flutter_credit_card_detector',
        ),
        ProjectModel(
          title: labelTitleProject4.i18n,
          description: labelDescriptionProject4.i18n,
          duration: ['01/04/2019', '30/06/2021'],
          link: 'https://play.google.com/store/apps/details?id=carajas.carajas',
        ),
        ProjectModel(
          title: labelTitleProject5.i18n,
          description: labelDescriptionProject5.i18n,
          duration: ['01/06/2020', '30/06/2021'],
          link: 'https://play.google.com/store/apps/details?id=carajas.pricing2',
        ),
        ProjectModel(
          title: labelTitleProject6.i18n,
          description: labelDescriptionProject6.i18n,
          duration: ['05/12/2019', '30/06/2021'],
          link: 'https://play.google.com/store/apps/details?id=carajas.orcamento_carajas',
        ),
        ProjectModel(
          title: labelTitleProject7.i18n,
          description: labelDescriptionProject7.i18n,
          duration: ['01/07/2019', '30/06/2021'],
          link: 'https://play.google.com/store/apps/details?id=com.carajas.libcom',
        ),
        ProjectModel(
          title: labelTitleProject8.i18n,
          description: labelDescriptionProject8.i18n,
          duration: ['18/11/2020', '23/02/2021'],
          link: 'https://github.com/weldonsouza/shoes_app',
        ),
        ProjectModel(
          title: labelTitleProject9.i18n,
          description: labelDescriptionProject9.i18n,
          duration: ['04/05/2020', '14/05/2020'],
          link: 'https://github.com/weldonsouza/job_search_app',
        ),
        ProjectModel(
          title: labelTitleProject10.i18n,
          description: labelDescriptionProject10.i18n,
          duration: ['01/06/2017', '01/04/2020'],
          link: 'https://play.google.com/store/apps/details?id=com.partiu.me',
        ),
        ProjectModel(
          title: labelTitleProject11.i18n,
          description: labelDescriptionProject11.i18n,
          duration: ['17/04/2020'],
          link: 'https://play.google.com/store/apps/details?id=com.neduki.creditcarddetector',
        ),
        ProjectModel(
          title: labelTitleProject12.i18n,
          description: labelDescriptionProject12.i18n,
          duration: ['01/05/2019', '30/06/2019'],
          link: 'https://play.google.com/store/apps/details?id=com.carajasonline.consultaestoque',
        ),
        ProjectModel(
          title: labelTitleProject13.i18n,
          description: labelDescriptionProject13.i18n,
          duration: ['01/09/2016', '20/12/2016'],
          link: 'https://play.google.com/store/apps/details?id=com.rotamedi&hl=pt_BR',
        ),
        ProjectModel(
          title: labelTitleProject14.i18n,
          description: labelDescriptionProject14.i18n,
          duration: ['01/10/2015', '01/11/2016'],
          link: 'https://play.google.com/store/apps/details?id=com.wr.tmath',
        ),
      ],
      recommendation: [],
    );

    setProfileModel(profileModel);

    setIsLoading(false);
    return 'success';
  }
}
