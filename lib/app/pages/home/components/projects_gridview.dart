import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../../../../domain/models/project_model.dart';
import 'project_card.dart';

class ProjectsGridView extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;
  final List<ProjectModel> listProfile;

  const ProjectsGridView({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.25,
    required this.listProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listProfile.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: Constants.defaultPadding,
        mainAxisSpacing: Constants.defaultPadding,
      ),
      itemBuilder: (context, index) => ProjectCard(
        project: listProfile[index],
      ),
    );
  }
}
