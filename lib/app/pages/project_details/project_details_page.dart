import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/utils.dart';
import '../../../data/datasources/local/i18n/project_details.i18n.dart';
import '../../../domain/models/project_model.dart';
import '../../widgets/custom_elevated_button.dart';

class ProjectDetailsPage extends StatelessWidget {
  static String get routeName => '/project_details';

  const ProjectDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProjectModel project = ModalRoute.of(context)!.settings.arguments as ProjectModel;

    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              backgroundColor: Constants.bgColor,
            ),
      body: Container(
        padding: const EdgeInsets.all(Constants.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.title!,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  Utils.formatDate(project.duration![0]),
                  style: const TextStyle(height: 1.5),
                ),
                Text(
                  ' - ${Utils.formatDate(project.duration!.length > 1
                      ? project.duration![1]
                      : '')}',
                  style: const TextStyle(height: 1.5),
                ),
              ],
            ),
            const SizedBox(height: Constants.defaultPadding),
            Text(
              project.description!,
              style: const TextStyle(height: 1.5),
            ),
            const SizedBox(height: Constants.defaultPadding),
            CustomElevatedButton(
              width: 120,
              height: 32,
              labelText: labelViewProject.i18n,
              borderRadius: 4,
              textSize: 12,
              fontWeight: FontWeight.w600,
              color: Constants.transparent,
              colorButton: Constants.primaryColor,
              colorText: Constants.primaryColor,
              paddingButtonLeft: 0,
              paddingButtonRight: 0,
              iconData: Icons.open_in_new_outlined,
              onTap: () {
                Utils.launchInBrowser(project.link!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
