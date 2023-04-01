import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

import '../../../../core/utils/constants/values.dart';
import '../../../../core/utils/responsive.dart';
import '../../../widgets/section_title_widget.dart';
import '../../../widgets/spaces_widget.dart';
import '../../../widgets/sub_section_title_widget.dart';

const double kSpacing16 = Sizes.HEIGHT_16;

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenWidth = widthOfScreen(context);
    double aboutMeFontSIze = context.layout.value(
      xs: Sizes.TEXT_SIZE_16,
      sm: Sizes.TEXT_SIZE_18,
      md: Sizes.TEXT_SIZE_18,
      lg: Sizes.TEXT_SIZE_18,
      xl: Sizes.TEXT_SIZE_18,
    );
    TextStyle? aboutMeTextStyle = textTheme.bodyLarge?.copyWith(
      fontSize: aboutMeFontSIze,
      color: AppColors.accentColor,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.1,
    );
    double containerPadding = context.layout.value(
      xs: Sizes.PADDING_30,
      sm: Sizes.PADDING_40,
      md: Sizes.PADDING_40,
      lg: Sizes.PADDING_40,
      xl: Sizes.PADDING_40,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitleWidget(
          title: StringConst.ABOUT_ME,
        ),
        const SizedBox(height: kSpacing16),
        Container(
          width: screenWidth * 0.85,
          padding: EdgeInsets.all(containerPadding),
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(Sizes.RADIUS_8),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SubSectionTitleWidget(
                title: StringConst.PROFESSIONAL,
                subtitle: StringConst.SUMMARY_TITLE,
              ),
              const SpaceH30(),
              SizedBox(
                width: screenWidth * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      StringConst.ABOUT_ME_SUMMARY_1,
                      style: aboutMeTextStyle,
                    ),
                    const SpaceH8(),
                    SelectableText(
                      StringConst.ABOUT_ME_SUMMARY_2,
                      style: aboutMeTextStyle,
                    ),
                    const SpaceH8(),
                    SelectableText(
                      StringConst.ABOUT_ME_SUMMARY_3,
                      style: aboutMeTextStyle,
                    ),
                    const SpaceH8(),
                    SelectableText(
                      StringConst.ABOUT_ME_SUMMARY_4,
                      style: aboutMeTextStyle,
                    ),
                    const SpaceH8(),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
