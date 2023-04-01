import 'package:flutter/material.dart';
import 'package:portifolio/core/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:layout/layout.dart';

import '../../../../core/utils/constants/values.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../domain/models/experience_model.dart';
import '../../../widgets/circle_widget.dart';
import '../../../widgets/experience_column_widget.dart';
import '../../../widgets/experience_tree_widget.dart';
import '../../../widgets/section_title_widget.dart';
import '../../../widgets/spaces_widget.dart';
import '../../../widgets/sub_section_title_widget.dart';
import '../home_controller.dart';

const double smCircleRadiusDx = 80;
const double lgCircleRadiusDx = 160;
const double smCircleRadiusDy = 160;
const double lgCircleRadiusDy = 280;

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    var homeController = Provider.of<HomeController>(context);

    double smCircleRadius = context.layout.value(
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
    double lgOffsetDy = screenHeight * 0.2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitleWidget(title: StringConst.RESUME),
        SpaceH16(),
        const SubSectionTitleWidget(
          title: StringConst.MY,
          subtitle: StringConst.EDUCATION,
          subtitleTextColor: AppColors.primaryText,
        ),
        SpaceH40(),
        Stack(
          children: [
            SizedBox(
              height: circleWidth,
              width: circleWidth,
              child: CustomPaint(
                painter: CircleWidget(
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
                painter: CircleWidget(
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
                  return ExperienceTreeWidget(
                    headTitle: StringConst.EDUCATION_CURRENT_MONTH_YEAR,
                    tailTitle: StringConst.EDUCATION_STARTED_MONTH_YEAR,
                    experienceData: homeController.educationData,
                    widthOfTree: Utils.mediaQuery(context, 0.8),
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildEducationSectionForMobile(List<ExperienceModel> experienceData) {
    List<Widget> content = [];
    for (var index = 0; index < experienceData.length; index++) {
      content.add(
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.PADDING_12,
            vertical: Sizes.PADDING_16,
          ),
          child: ExperienceColumnWidget(
            title: experienceData[index].title,
            subtitle: experienceData[index].subtitle,
            duration: experienceData[index].duration,
            location: experienceData[index].location,
            roles: experienceData[index].body,
            subtitleUrl: experienceData[index].titleUrl,
          ),
        ),
      );
    }
    return content;
  }
}
