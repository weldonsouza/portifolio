import 'package:flutter/material.dart';

class ProjectDetailsPage extends StatelessWidget {
  static String get routeName => '/project_details';

  const ProjectDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final ProjectModel project = ModalRoute.of(context)!.settings.arguments as ProjectModel;

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          ],
        ),
      ),
    );
  }
}
