import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

import '../../../../core/utils/constants/values.dart';
import '../../../widgets/section_title_widget.dart';
import '../../../widgets/spaces_widget.dart';
import '../../../widgets/sub_section_title_widget.dart';

class OfferSection extends StatelessWidget {
  const OfferSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*double smCircleRadius = context.layout.value(
      xs: smCircleRadiusDx,
      sm: smCircleRadiusDx,
      md: lgCircleRadiusDx,
      lg: lgCircleRadiusDx,
      xl: lgCircleRadiusDx,
    );
    double lgCircleRadius = context.layout.value(
      xs: smCircleRadiusDy,
      sm: smCircleRadiusDy,
      md: lgCircleRadiusDy,
      lg: lgCircleRadiusDy,
      xl: lgCircleRadiusDy,
    );
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double circleWidth = screenWidth * 0.1;
    double smOffsetDx = -smCircleRadius;
    double smOffsetDy = screenHeight * 0.6;
    double lgOffsetDx = circleWidth + (lgCircleRadius / 3);
    double lgOffsetDy = screenHeight * 0.2;*/

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubSectionTitleWidget(
          title: StringConst.WHAT_I,
          subtitle: StringConst.OFFER,
          subtitleTextColor: AppColors.primaryText,
        ),
        SpaceH40(),
        /*Stack(
          children: [
            SizedBox(
              height: circleWidth,
              width: circleWidth,
              child: CustomPaint(
                painter: Circle(
                  offset: Offset(smOffsetDx, smOffsetDy),
                  radius: smCircleRadius,
                  color: AppColors.accentColor100,
                ),
              ),
            ),
            SizedBox(
              height: circleWidth,
              width: circleWidth,
              child: CustomPaint(
                painter: Circle(
                  offset: Offset((screenWidth * 0.8) + lgOffsetDx, lgOffsetDy),
                  radius: lgCircleRadius,
                  color: AppColors.accentColor100,
                ),
              ),
            ),
            ResponsiveBuilder(
              builder: (context, sizingInformation) {
                if (sizingInformation.screenSize.width <= const RefinedBreakpoints().tabletExtraLarge) {
                  return Column(
                    children: _buildEducationSectionForMobile(homeController.educationData),
                  );
                } else {
                  return ExperienceTree(
                    headTitle: StringConst.EDUCATION_CURRENT_MONTH_YEAR,
                    tailTitle: StringConst.EDUCATION_STARTED_MONTH_YEAR,
                    experienceData: homeController.educationData,
                    widthOfTree: Utils.mediaQuery(context, 0.8),
                  );
                }
              },
            ),
          ],
        ),*/
      ],
    );
  }
}
