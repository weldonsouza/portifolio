import 'package:flutter/material.dart';
import 'package:portifolio/app/widgets/project_card_widget.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/constants/values.dart';
import '../../../widgets/section_title_widget.dart';
import '../../../widgets/spaces_widget.dart';
import '../home_controller.dart';

class ProjectSection extends StatefulWidget {
  const ProjectSection({super.key});

  @override
  State<ProjectSection> createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {
  @override
  Widget build(BuildContext context) {
    var homeController = Provider.of<HomeController>(context);

    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitleWidget(title: StringConst.PROJECT),
          const SpaceH40(),
          Wrap(
            children: [
              for (var element in homeController.projectData) ...[
                ProjectCardWidget(
                  banner: element.banner,
                  title: element.title,
                  typeProject: element.typeProject,
                  linkGooglePlay: element.linkGooglePlay,
                  linkAppPlay: element.linkAppPlay,
                  linkGithub: element.linkGithub,
                  linkPackage: element.linkPackage,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}