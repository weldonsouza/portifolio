import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/constants/values.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../domain/models/skill_model.dart';
import '../../../widgets/skill_level_widget.dart';
import '../../../widgets/spaces_widget.dart';
import '../../../widgets/sub_section_title_widget.dart';
import '../home_controller.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  @override
  Widget build(BuildContext context) {
    var homeController = Provider.of<HomeController>(context);

    double screenWidth = widthOfScreen(context);
    double spacing = (screenWidth / 4) / 2;

    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubSectionTitleWidget(
            title: StringConst.MY_CODING,
            subtitle: StringConst.SKILLS,
            subtitleTextColor: AppColors.darkGrey400,
          ),
          const SpaceH40(),
          Wrap(
            spacing: spacing,
            runSpacing: Sizes.SIZE_20,
            children: _buildSkills(homeController.skillData),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSkills(List<SkillModel> data) {
    List<Widget> skills = [];
    double skillWidth = context.layout.value(
      xs: Sizes.WIDTH_100,
      sm: Sizes.WIDTH_120,
      md: Sizes.WIDTH_120,
      lg: Sizes.WIDTH_120,
      xl: Sizes.WIDTH_120,
    );

    for (int index = 0; index < data.length; index++) {
      skills.add(
        SkillLevelWidget(
          skillLevel: data[index].skillLevel,
          skillName: data[index].skillName,
          width: skillWidth,
          height: skillWidth,
        ),
      );
    }
    return skills;
  }
}
