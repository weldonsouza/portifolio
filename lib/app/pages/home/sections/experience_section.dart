import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:layout/layout.dart';

import '../../../../core/utils/constants/values.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../domain/models/experience_model.dart';
import '../../../widgets/circle_widget.dart';
import '../../../widgets/experience_column_widget.dart';
import '../../../widgets/experience_tree_widget.dart';
import '../../../widgets/spaces_widget.dart';
import '../../../widgets/sub_section_title_widget.dart';
import '../home_controller.dart';

const double smCircleRadiusDx = 80;
const double lgCircleRadiusDx = 160;
const double smCircleRadiusDy = 160;
const double lgCircleRadiusDy = 240;

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
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
    double sidePadding = getSidePadding(context);
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double circleWidth = screenWidth * 0.1;
    double smOffsetDx = circleWidth + (smCircleRadius / 2);
    double smOffsetDy = screenHeight * 0.2;
    double lgOffsetDx = -lgCircleRadius / 6;
    double lgOffsetDy = screenHeight * 0.7;

    return Container(
      color: AppColors.darkBlue,
      padding: EdgeInsets.symmetric(
        horizontal: sidePadding,
        vertical: Sizes.PADDING_60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubSectionTitleWidget(
            title: StringConst.MY,
            titleTextColor: AppColors.darkGrey50,
            subtitle: StringConst.EXPERIENCE,
            subtitleTextColor: AppColors.white,
          ),
          const SpaceH40(),
          Stack(
            children: [
              SizedBox(
                height: circleWidth,
                width: circleWidth,
                child: CustomPaint(
                  painter: CircleWidget(
                    offset: Offset(lgOffsetDx, lgOffsetDy),
                    radius: lgCircleRadius,
                    color: AppColors.blueGrey500,
                  ),
                ),
              ),
              SizedBox(
                height: circleWidth,
                width: circleWidth,
                child: CustomPaint(
                  painter: CircleWidget(
                    offset: Offset((screenWidth * 0.8) + smOffsetDx, smOffsetDy),
                    radius: smCircleRadius,
                    color: AppColors.blueGrey500,
                  ),
                ),
              ),
              ResponsiveBuilder(
                builder: (context, sizingInformation) {
                  if (sizingInformation.screenSize.width < const RefinedBreakpoints().desktopSmall) {
                    return Column(
                      children: _buildExperienceSectionForMobile(homeController.experienceData),
                    );
                  } else {
                    return _buildExperienceSection();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildExperienceSectionForMobile(List<ExperienceModel> experienceData) {
    List<Widget> content = [];
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? commonStyle = textTheme.bodyLarge?.copyWith(
      fontSize: Sizes.TEXT_SIZE_16,
      color: AppColors.darkWhite,
    );
    for (var index = 0; index < experienceData.length; index++) {
      content.add(
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.PADDING_12,
            vertical: Sizes.PADDING_16,
          ),
          child: ExperienceColumnWidget(
            title: experienceData[index].title,
            positionTextStyle: textTheme.titleLarge?.copyWith(
              color: AppColors.white,
            ),
            subtitle: experienceData[index].subtitle,
            companyTextStyle: textTheme.titleLarge?.copyWith(
              color: AppColors.accentColor,
              fontSize: Sizes.TEXT_SIZE_16,
            ),
            iconData: Icons.arrow_right,
            duration: experienceData[index].duration,
            durationTextStyle: commonStyle,
            location: experienceData[index].location,
            locationTextStyle: commonStyle,
            roles: experienceData[index].body,
            bodyTextStyle: commonStyle,
            bodyBulletIconColor: AppColors.accentColor,
            subtitleUrl: experienceData[index].titleUrl,
          ),
        ),
      );
    }
    return content;
  }

  Widget _buildExperienceSection() {
    var homeController = Provider.of<HomeController>(context);

    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? experienceTreeHeadStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.accentColor50,
      fontSize: Sizes.TEXT_SIZE_16,
    );
    return ExperienceTreeWidget(
      headTitle: StringConst.WORK_CURRENT_MONTH_YEAR,
      tailTitle: StringConst.WORK_STARTED_MONTH_YEAR,
      headTitleStyle: experienceTreeHeadStyle,
      tailTitleStyle: experienceTreeHeadStyle,
      leftLeafTitleStyle: textTheme.bodyMedium?.copyWith(
        fontSize: Sizes.TEXT_SIZE_14,
        color: AppColors.darkGrey400,
        fontWeight: FontWeight.bold,
      ),
      leftLeafSubtitleStyle: textTheme.bodyMedium?.copyWith(
        color: AppColors.darkGrey400,
        fontSize: Sizes.TEXT_SIZE_15,
        fontWeight: FontWeight.bold,
      ),
      leftLeafIconColor: AppColors.darkGrey400,
      rightLeafTitleStyle: Styles.customTextStyle(
        color: AppColors.accentColor300,
        fontSize: Sizes.TEXT_SIZE_18,
        fontStyle: FontStyle.normal,
      ),
      rightLeafSubtitleStyle: Styles.customTextStyle(
        fontStyle: FontStyle.italic,
        fontSize: Sizes.TEXT_SIZE_15,
        color: AppColors.accentColor300,
      ),
      rightLeafIconData: Icons.arrow_right,
      rightLeafBodyStyle: textTheme.bodyMedium?.copyWith(
        color: AppColors.darkGrey150,
        fontSize: Sizes.TEXT_SIZE_15,
        fontWeight: FontWeight.bold,
      ),
      headBackgroundColor: AppColors.darkBlue100,
      tailBackgroundColor: AppColors.darkBlue100,
      veinsColor: AppColors.darkBlue400,
      outerJointColor: AppColors.darkBlue400,
      innerJointColor: AppColors.accentColor50,
      experienceData: homeController.experienceData,
      widthOfTree: assignWidth(context, 0.8),
    );
  }
}
