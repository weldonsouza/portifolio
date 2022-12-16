import 'package:flutter/material.dart';

import '../../../../core/route/navigation_service.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/datasources/local/i18n/home.i18n.dart';
import '../../../../domain/models/project_model.dart';
import '../../../../core/utils/responsive.dart';
import '../../project_details/project_details_page.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;

  const ProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Constants.defaultPadding),
      color: Constants.secondaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const Spacer(),
          Text(
            project.description!,
            maxLines: Responsive.isMobileLarge(context) ? 3 : 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(height: 1.5),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              navigationService.push(ProjectDetailsPage.routeName, arguments: project);
            },
            style: TextButton.styleFrom(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            child: Text(
              "${labelReadMore.i18n} >>",
              style: const TextStyle(
                color: Constants.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
