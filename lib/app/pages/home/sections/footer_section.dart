import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:layout/layout.dart';

import '../../../../core/utils/constants/values.dart';
import '../../../../core/utils/responsive.dart';
import '../../../widgets/circle_widget.dart';
import '../../../widgets/creators_widget.dart';
import '../../../widgets/social_icons_widget.dart';
import '../../../widgets/spaces_widget.dart';

const kSpacing20 = Sizes.SIZE_20;
const double lgCircleRadius = Sizes.RADIUS_24;

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double sidePadding = getSidePadding(context);
    double footerHeight = screenHeight * 0.2;
    double bottomPadding = context.layout.value(
      xs: Sizes.PADDING_0,
      sm: Sizes.PADDING_24,
      md: Sizes.PADDING_24,
      lg: Sizes.PADDING_24,
      xl: Sizes.PADDING_24,
    );

    return Container(
      width: screenWidth,
      height: footerHeight,
      padding: EdgeInsets.only(
        left: sidePadding,
        right: sidePadding,
        bottom: bottomPadding,
      ),
      color: AppColors.blueGrey500,
      child: Stack(
        children: [
          CustomPaint(
            painter: CircleWidget(
              offset: Offset(screenWidth * 0.05, footerHeight * 0.2),
              radius: Sizes.RADIUS_12,
              color: AppColors.blueGrey100,
            ),
          ),
          CustomPaint(
            painter: CircleWidget(
              offset: Offset(screenWidth * 0.08, footerHeight * 0.7),
              radius: Sizes.RADIUS_16,
              color: AppColors.lightBlueGrey400,
            ),
          ),
          CustomPaint(
            painter: CircleWidget(
              offset: Offset(screenWidth * 0.80, footerHeight * 0.65),
              radius: Sizes.RADIUS_24,
              color: AppColors.blueGrey100,
            ),
          ),
          ResponsiveBuilder(
            builder: (context, sizingInformation) {
              if (sizingInformation.isMobile) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const CreatorsWidget(),
                    const SpaceH20(),
                    SocialIconsWidget(
                      iconColor: AppColors.offWhite,
                      icons: const [
                        ImagePath.linkedin,
                        ImagePath.github,
                      ],
                      socialLinks: const [
                        StringConst.LINKED_IN_URL,
                        StringConst.GITHUB_URL,
                      ],
                      spacing: kSpacing20,
                    ),
                    const Spacer(),
                  ],
                );
              } else {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const CreatorsWidget(),
                    const Spacer(),
                    SocialIconsWidget(
                      iconColor: AppColors.offWhite,
                      icons: const [
                        ImagePath.linkedin,
                        ImagePath.github,
                      ],
                      socialLinks: const [
                        StringConst.LINKED_IN_URL,
                        StringConst.GITHUB_URL,
                      ],
                      spacing: kSpacing20,
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
