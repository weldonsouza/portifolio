import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/datasources/local/i18n/home.i18n.dart';
import '../pages/home/home_controller.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeController = Provider.of<HomeController>(context);

    return AnimatedTextKit(
      animatedTexts: [
        for (var element in homeController.profile.projects!) ...[
          TyperAnimatedText(
            '${labelIBuild.i18n} ${element.title!}',
            speed: const Duration(milliseconds: 60),
          ),
        ],
      ],
    );
  }
}
