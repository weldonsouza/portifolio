import 'package:flutter/material.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../data/datasources/local/i18n/home.i18n.dart';
import '../../../../domain/models/project_model.dart';
import 'projects_gridview.dart';

class MyProjects extends StatelessWidget {
  final List<ProjectModel> listProfile;

  const MyProjects({
    Key? key,
    required this.listProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelMyProjects.i18n,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: Constants.defaultPadding),
        Responsive(
          mobile: ProjectsGridView(
            crossAxisCount: 1,
            childAspectRatio: 1.7,
            listProfile: listProfile,
          ),
          mobileLarge: ProjectsGridView(
            crossAxisCount: 2,
            listProfile: listProfile,
          ),
          tablet: ProjectsGridView(
            childAspectRatio: 1.1,
            listProfile: listProfile,
          ),
          desktop: ProjectsGridView(
            listProfile: listProfile,
          ),
        )
      ],
    );
  }
}
