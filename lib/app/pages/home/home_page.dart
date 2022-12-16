import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/responsive.dart';
import 'components/heigh_lights_info.dart';
import 'components/home_banner.dart';
import 'components/my_projects.dart';
import 'components/recommendations.dart';
import 'components/side_menu.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static String get routeName => '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeController>(context, listen: false).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    var homeController = Provider.of<HomeController>(context);

    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              backgroundColor: Constants.bgColor,
              leading: Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                ),
              ),
            ),
      drawer: SideMenu(profile: homeController.profile),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: Constants.maxWidth),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 2,
                  child: SideMenu(profile: homeController.profile),
                ),
              const SizedBox(width: Constants.defaultPadding),
              Expanded(
                flex: 7,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const HomeBanner(),
                      HighLightsInfo(profile: homeController.profile),
                      homeController.profile.projects!.isEmpty
                          ? const SizedBox(height: 20)
                          : MyProjects(listProfile: homeController.profile.projects!),
                      homeController.profile.recommendation!.isEmpty
                          ? const SizedBox(height: 20)
                          : Recommendations(profile: homeController.profile),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
