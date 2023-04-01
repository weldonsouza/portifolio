import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/values.dart';
import '../../../../../core/utils/responsive.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../widgets/circular_container_widget.dart';
import '../../../../widgets/content_area_widget.dart';
import '../../../../widgets/spaces_widget.dart';

class NavSectionMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const NavSectionMobile({
    super.key,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenWidth = widthOfScreen(context);
    double contentAreaWidth = screenWidth * 0.5;

    return SafeArea(
      bottom: false,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            Shadows.elevationShadow,
          ],
        ),
        child: Row(
          children: [
            ContentAreaWidget(
              width: contentAreaWidth,
              height: Sizes.HEIGHT_56,
              backgroundColor: AppColors.white,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.menu,
                      size: Sizes.ICON_SIZE_30,
                      color: AppColors.blueGrey500,
                    ),
                    onPressed: () {
                      if (scaffoldKey.currentState!.isEndDrawerOpen) {
                        scaffoldKey.currentState?.openEndDrawer();
                      } else {
                        scaffoldKey.currentState?.openDrawer();
                      }
                    },
                  ),
                  const SpaceW16(),
                  SelectableText(
                    StringConst.NAME_ABBREV,
                    style: textTheme.displaySmall?.copyWith(
                      fontSize: Sizes.TEXT_SIZE_34,
                    ),
                  ),
                ],
              ),
            ),
            ContentAreaWidget(
              width: contentAreaWidth,
              height: Sizes.HEIGHT_56,
              backgroundColor: AppColors.blueGrey500,
              padding: const EdgeInsets.only(right: Sizes.PADDING_16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircularContainerWidget(
                    color: AppColors.blueGrey100,
                    child: IconButton(
                      onPressed: () => Utils.launchInBrowser(StringConst.EMAIL_URL),
                      icon: const Icon(Icons.mail_outline),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
