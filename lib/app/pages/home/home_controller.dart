import 'package:flutter/material.dart';

import '../../../data/datasources/local/i18n/project_data.i18n.dart';
import '../../../domain/models/links_model.dart';
import '../../../domain/models/profile_model.dart';
import '../../../domain/models/project_model.dart';
import '../../../domain/models/recommendation_model.dart';
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

  void dispose() {}

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
          duration: ['01/08/2020', '01/08/2020'],
          link: 'https://play.google.com/',
        ),
        ProjectModel(
          title: labelTitleProject2.i18n,
          description: labelDescriptionProject2.i18n,
          duration: ['08/08/2020', '08/08/2020'],
          link: 'https://github.com',
        ),
        ProjectModel(
          title: labelTitleProject3.i18n,
          description: labelDescriptionProject3.i18n,
          duration: ['10/08/2020'],
          link: 'https://github.com',
        ),
        ProjectModel(
          title: labelTitleProject4.i18n,
          description: labelDescriptionProject4.i18n,
          duration: ['01/08/2020', '01/08/2020'],
          link: 'https://github.com',
        ),
        ProjectModel(
          title: labelTitleProject5.i18n,
          description: labelDescriptionProject5.i18n,
          duration: ['20/08/2020', '20/08/2020'],
          link: 'https://github.com',
        ),
      ],
      recommendation: [
        RecommendationModel(
          name: "Kolapo Obanewa",
          source: "Linkedin",
          text: labelRecommendation1.i18n,
        ),
        RecommendationModel(
          name: "Reza Shahbazi",
          source: "Linkedin",
          text: labelRecommendation2.i18n,
        ),
        RecommendationModel(
          name: "Diadem",
          source: "YouTube",
          text: labelRecommendation3.i18n,
        ),
        RecommendationModel(
          name: "Roshan Shetty",
          source: "YouTube",
          text: labelRecommendation4.i18n,
        ),
      ],
    );

    setProfileModel(profileModel);

    setIsLoading(false);
    return 'success';
  }
}
