import 'package:flutter/material.dart';

import '../../../core/utils/constants/values.dart';
import '../../../domain/models/experience_model.dart';
import '../../../domain/models/project_model.dart';
import '../../../domain/models/skill_model.dart';

class HomeController with ChangeNotifier {
  List<ExperienceModel> educationData = [
    ExperienceModel(
      title: StringConst.EDUCATION_1,
      titleUrl: StringConst.EDUCATION_1_URL,
      body: [
        StringConst.EDUCATION_1_DESC,
      ],
      location: StringConst.LOCATION_1,
      duration: StringConst.DURATION_1,
    ),
    ExperienceModel(
      title: StringConst.EDUCATION_2,
      titleUrl: StringConst.EDUCATION_2_URL,
      body: [
        StringConst.EDUCATION_2_DESC,
      ],
      location: StringConst.LOCATION_2,
      duration: StringConst.DURATION_2,
    ),
  ];
  List<ExperienceModel> experienceData = [
    ExperienceModel(
      title: StringConst.WORK_1,
      subtitle: StringConst.WORK_1_POSITION,
      titleUrl: StringConst.WORK_1_URL,
      body: [
        StringConst.WORK_1_ROLE_1,
      ],
      location: StringConst.WORK_1_LOCATION,
      duration: StringConst.WORK_1_DURATION,
    ),
    ExperienceModel(
      title: StringConst.WORK_2,
      subtitle: StringConst.WORK_2_POSITION,
      titleUrl: StringConst.WORK_2_URL,
      body: [
        StringConst.WORK_2_ROLE_1,
      ],
      location: StringConst.WORK_2_LOCATION,
      duration: StringConst.WORK_2_DURATION,
    ),
    ExperienceModel(
      title: StringConst.WORK_3,
      subtitle: StringConst.WORK_3_POSITION,
      titleUrl: StringConst.WORK_3_URL,
      body: [
        StringConst.WORK_3_ROLE_1,
      ],
      location: StringConst.WORK_3_LOCATION,
      duration: StringConst.WORK_3_DURATION,
    ),
    ExperienceModel(
      title: StringConst.WORK_4,
      subtitle: StringConst.WORK_4_POSITION,
      titleUrl: StringConst.WORK_4_URL,
      body: [
        StringConst.WORK_4_ROLE_1,
      ],
      location: StringConst.WORK_4_LOCATION,
      duration: StringConst.WORK_4_DURATION,
    ),
    ExperienceModel(
      title: StringConst.WORK_5,
      subtitle: StringConst.WORK_5_POSITION,
      titleUrl: StringConst.WORK_5_URL,
      body: [
        StringConst.WORK_5_ROLE_1,
      ],
      location: StringConst.WORK_5_LOCATION,
      duration: StringConst.WORK_5_DURATION,
    ),
    ExperienceModel(
      title: StringConst.WORK_6,
      subtitle: StringConst.WORK_6_POSITION,
      titleUrl: StringConst.WORK_6_URL,
      body: [
        StringConst.WORK_6_ROLE_1,
      ],
      location: StringConst.WORK_6_LOCATION,
      duration: StringConst.WORK_6_DURATION,
    ),
  ];
  List<SkillModel> skillData = [
    SkillModel(skillLevel: 90, skillName: StringConst.FLUTTER),
    SkillModel(skillLevel: 90, skillName: StringConst.DART),
    SkillModel(skillLevel: 30, skillName: StringConst.LOOPBACK),
    SkillModel(skillLevel: 30, skillName: StringConst.KOTLIN),
    SkillModel(skillLevel: 20, skillName: StringConst.SWIFT),
    SkillModel(skillLevel: 20, skillName: StringConst.LOOPBACK),
    SkillModel(skillLevel: 20, skillName: StringConst.NESTJS),
  ];
  List<ProjectModel> projectData = [
    const ProjectModel(
      title: StringConst.PROJECT_1,
      description: StringConst.PROJECT_1_DESC,
      duration: ['01/02/2017'],
      banner: ImagePath.project_1,
      typeProject: 'Produto',
      linkGooglePlay: 'https://play.google.com/store/apps/details?id=com.neduki.e_nigma',
      linkAppPlay: 'https://apps.apple.com/us/app/e-nigma/id1671640919',
      linkGithub: '',
      linkPackage: '',
    ),
    const ProjectModel(
      title: StringConst.PROJECT_2,
      description: StringConst.PROJECT_2_DESC,
      duration: ['03/04/2020'],
      banner: ImagePath.project_2,
      typeProject: 'Open Source',
      linkGooglePlay: '',
      linkAppPlay: '',
      linkGithub: 'https://github.com/weldonsouza/cielo_ecommerce',
      linkPackage: 'https://pub.dev/packages/cielo_ecommerce',
    ),
    const ProjectModel(
      title: StringConst.PROJECT_3,
      description: StringConst.PROJECT_3_DESC,
      duration: ['12/04/2020'],
      banner: ImagePath.project_3,
      typeProject: 'Open Source',
      linkGooglePlay: '',
      linkAppPlay: '',
      linkGithub: 'https://github.com/weldonsouza/flutter_credit_card_detector',
      linkPackage: 'https://pub.dev/packages/flutter_credit_card_detector',
    ),
    const ProjectModel(
      title: StringConst.PROJECT_4,
      description: StringConst.PROJECT_4_DESC,
      duration: ['01/04/2019', '30/06/2021'],
      banner: ImagePath.project_4,
      typeProject: 'Produto',
      linkGooglePlay: 'https://play.google.com/store/apps/details?id=carajas.carajas',
      linkAppPlay: '',
      linkGithub: '',
      linkPackage: '',
    ),
    const ProjectModel(
      title: StringConst.PROJECT_5,
      description: StringConst.PROJECT_5_DESC,
      duration: ['01/06/2020', '30/06/2021'],
      banner: ImagePath.project_5,
      typeProject: 'Produto',
      linkGooglePlay: 'https://play.google.com/store/apps/details?id=carajas.pricing2',
      linkAppPlay: '',
      linkGithub: '',
      linkPackage: '',
    ),
    const ProjectModel(
      title: StringConst.PROJECT_6,
      description: StringConst.PROJECT_6_DESC,
      duration: ['05/12/2019', '30/06/2021'],
      banner: ImagePath.project_6,
      typeProject: 'Produto',
      linkGooglePlay: 'https://play.google.com/store/apps/details?id=carajas.orcamento_carajas',
      linkAppPlay: '',
      linkGithub: '',
      linkPackage: '',
    ),
    const ProjectModel(
      title: StringConst.PROJECT_7,
      description: StringConst.PROJECT_7_DESC,
      duration: ['01/07/2019', '30/06/2021'],
      banner: ImagePath.project_7,
      typeProject: 'Produto',
      linkGooglePlay: 'https://play.google.com/store/apps/details?id=com.carajas.libcom',
      linkAppPlay: '',
      linkGithub: '',
      linkPackage: '',
    ),
    const ProjectModel(
      title: StringConst.PROJECT_8,
      description: StringConst.PROJECT_8_DESC,
      duration: ['18/11/2020', '23/02/2021'],
      banner: ImagePath.project_8,
      typeProject: 'Open Source | UI Kit',
      linkGooglePlay: '',
      linkAppPlay: '',
      linkGithub: 'https://github.com/weldonsouza/shoes_app',
      linkPackage: '',
    ),
    const ProjectModel(
      title: StringConst.PROJECT_9,
      description: StringConst.PROJECT_9_DESC,
      duration: ['04/05/2020', '14/05/2020'],
      banner: ImagePath.project_9,
      typeProject: 'Open Source | UI Kit',
      linkGooglePlay: '',
      linkAppPlay: '',
      linkGithub: 'https://github.com/weldonsouza/job_search_app',
      linkPackage: '',
    ),
    const ProjectModel(
      title: StringConst.PROJECT_10,
      description: StringConst.PROJECT_10_DESC,
      duration: ['01/06/2017', '01/04/2020'],
      banner: ImagePath.project_10,
      typeProject: 'Produto',
      linkGooglePlay: 'https://play.google.com/store/apps/details?id=com.partiu.me',
      linkAppPlay: '',
      linkGithub: '',
      linkPackage: '',
    ),
    const ProjectModel(
      title: StringConst.PROJECT_11,
      description: StringConst.PROJECT_11_DESC,
      duration: ['17/04/2020'],
      banner: ImagePath.project_11,
      typeProject: 'Produto | UI Kit',
      linkGooglePlay: 'https://play.google.com/store/apps/details?id=com.neduki.creditcarddetector',
      linkAppPlay: '',
      linkGithub: '',
      linkPackage: '',
    ),
    const ProjectModel(
      title: StringConst.PROJECT_12,
      description: StringConst.PROJECT_12_DESC,
      duration: ['01/05/2019', '30/06/2019'],
      banner: ImagePath.project_12,
      typeProject: 'Produto',
      linkGooglePlay: 'https://play.google.com/store/apps/details?id=com.carajasonline.consultaestoque',
      linkAppPlay: '',
      linkGithub: '',
      linkPackage: '',
    ),
    const ProjectModel(
      title: StringConst.PROJECT_13,
      description: StringConst.PROJECT_13_DESC,
      duration: ['01/09/2016', '20/12/2016'],
      banner: ImagePath.project_13,
      typeProject: 'Produto',
      linkGooglePlay: 'https://play.google.com/store/apps/details?id=com.rotamedi&hl=pt_BR',
      linkAppPlay: '',
      linkGithub: '',
      linkPackage: '',
    ),
    const ProjectModel(
      title: StringConst.PROJECT_14,
      description: StringConst.PROJECT_14_DESC,
      duration: ['01/10/2015', '01/11/2016'],
      banner: ImagePath.project_14,
      typeProject: 'Produto',
      linkGooglePlay: 'https://play.google.com/store/apps/details?id=com.wr.tmath',
      linkAppPlay: '',
      linkGithub: '',
      linkPackage: '',
    ),
  ];

  bool isLoading = false;

  bool get getIsLoading => isLoading;

  setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void init() async {}
}
