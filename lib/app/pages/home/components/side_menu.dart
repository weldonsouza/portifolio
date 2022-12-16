import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../../data/datasources/local/i18n/home.i18n.dart';
import '../../../../domain/models/profile_model.dart';
import 'area_info_text.dart';
import 'coding.dart';
import 'knowledge.dart';
import 'my_info.dart';
import 'skills.dart';

class SideMenu extends StatelessWidget {
  final ProfileModel profile;

  const SideMenu({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            MyInfo(profile: profile),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(Constants.defaultPadding),
                child: Column(
                  children: [
                    AreaInfoText(
                      title: labelCity.i18n,
                      text: profile.city!,
                    ),
                    AreaInfoText(
                      title: labelCountry.i18n,
                      text: profile.country!,
                    ),
                    Skills(skills: profile.skills!),
                    const SizedBox(height: Constants.defaultPadding),
                    Coding(coding: profile.coding!),
                    Knowledge(knowledge: profile.knowledge!),
                    const Divider(),
                    const SizedBox(height: Constants.defaultPadding / 2),
                    TextButton(
                      onPressed: () {},
                      child: FittedBox(
                        child: Row(
                          children: [
                            Text(
                              "DOWNLOAD CV",
                              style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
                            ),
                            const SizedBox(width: Constants.defaultPadding / 2),
                            SvgPicture.asset("assets/icons/download.svg")
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: Constants.defaultPadding),
                      color: const Color(0xFF24242E),
                      child: Row(
                        children: [
                          const Spacer(),
                          for (var element in profile.links!) ...[
                            IconButton(
                              onPressed: () {
                                Utils.launchInBrowser(element.link!);
                              },
                              icon: SvgPicture.asset("assets/icons/${element.name}.svg"),
                            ),
                          ],
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
