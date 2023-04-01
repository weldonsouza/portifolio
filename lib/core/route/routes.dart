import 'package:flutter/material.dart';

import '../../app/pages/home/home_page.dart';
import '../../app/pages/project_details/project_details_page.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    HomePage.routeName: (BuildContext context) => const HomePage(),
    ProjectDetailsPage.routeName: (BuildContext context) => const ProjectDetailsPage(),
  };
}