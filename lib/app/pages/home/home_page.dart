import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../core/utils/constants/values.dart';
import '../../../core/utils/responsive.dart';
import '../../../domain/models/nav_item_model.dart';
import '../../widgets/app_drawer_widget.dart';
import '../../widgets/spaces_widget.dart';
import 'home_controller.dart';
import 'sections/about_section.dart';
import 'sections/education_section.dart';
import 'sections/experience_section.dart';
import 'sections/footer_section.dart';
import 'sections/header_section.dart';
import 'sections/nav_section/nav_section_mobile.dart';
import 'sections/nav_section/nav_section_web.dart';
import 'sections/project_section.dart';
import 'sections/skills_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static String get routeName => '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  final List<NavItemModel> navItems = [
    NavItemModel(name: StringConst.HOME, key: GlobalKey(), isSelected: true),
    NavItemModel(name: StringConst.ABOUT, key: GlobalKey()),
    NavItemModel(name: StringConst.RESUME, key: GlobalKey()),
    NavItemModel(name: StringConst.SKILLS, key: GlobalKey()),
    NavItemModel(name: StringConst.PROJECT, key: GlobalKey()),
    NavItemModel(name: StringConst.CONTACT, key: GlobalKey()),
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeController>(context, listen: false).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    double sidePadding = getSidePadding(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: ResponsiveBuilder(
        refinedBreakpoints: const RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          if (sizingInformation.isMobile) {
            return AppDrawerWidget(
              menuList: navItems,
            );
          } else {
            return Container();
          }
        },
      ),
      body: Column(
        children: [
          ResponsiveBuilder(
            refinedBreakpoints: const RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              if (sizingInformation.isMobile) {
                return NavSectionMobile(scaffoldKey: _scaffoldKey);
              } else {
                return NavSectionWeb(navItems: navItems);
              }
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    key: navItems[0].key,
                    child: const HeaderSection(),
                  ),
                  const SpaceH60(),
                  Container(
                    key: navItems[1].key,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: sidePadding),
                      child: const AboutSection(),
                    ),
                  ),
                  /*SpaceH60(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: sidePadding),
                    child: const OfferSection(),
                  ),*/
                  const SpaceH60(),
                  Container(
                    key: navItems[2].key,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: sidePadding),
                      child: const EducationSection(),
                    ),
                  ),
                  const SpaceH60(),
                  const ExperienceSection(),
                  const SpaceH60(),
                  Container(
                    key: navItems[3].key,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: sidePadding),
                      child: const SkillsSection(),
                    ),
                  ),
                  const SpaceH60(),
                  Container(
                    key: navItems[4].key,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: sidePadding),
                      child: const ProjectSection(),
                    ),
                  ),
                  const SpaceH60(),
                  const FooterSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
