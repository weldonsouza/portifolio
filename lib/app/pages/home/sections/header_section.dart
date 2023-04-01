import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout/layout.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../core/utils/constants/values.dart';
import '../../../../core/utils/responsive.dart';
import '../../../widgets/circle_widget.dart';
import '../../../widgets/content_area_widget.dart';
import '../../../widgets/social_icons_widget.dart';
import '../../../widgets/spaces_widget.dart';

const kPadding24 = Sizes.PADDING_24;
const kSpacing20 = Sizes.SIZE_20;

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double sidePadding = getSidePadding(context);
    double contentAreaWidth = assignWidth(context, 0.5);
    double contentAreaHeight = assignHeight(context, 0.7);
    double introTextSize = context.layout.value(
      xs: Sizes.TEXT_SIZE_30,
      sm: Sizes.TEXT_SIZE_30,
      md: Sizes.TEXT_SIZE_60,
      lg: Sizes.TEXT_SIZE_60,
      xl: Sizes.TEXT_SIZE_60,
    );
    double professionalTextSize = context.layout.value(
      xs: Sizes.TEXT_SIZE_16,
      sm: Sizes.TEXT_SIZE_16,
      md: Sizes.TEXT_SIZE_20,
      lg: Sizes.TEXT_SIZE_20,
      xl: Sizes.TEXT_SIZE_20,
    );

    return Row(
      children: [
        ContentAreaWidget(
          width: contentAreaWidth,
          height: contentAreaHeight,
          backgroundColor: AppColors.offWhite,
          child: Padding(
            padding: EdgeInsets.only(left: sidePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPaint(
                  painter: CircleWidget(
                    offset: Offset(
                      contentAreaWidth * 0.4,
                      contentAreaWidth * 0.0,
                    ),
                    radius: Sizes.RADIUS_20,
                    color: AppColors.accentColor,
                  ),
                ),
                const SpaceH30(),
                SelectableText(
                  StringConst.INTRO,
                  style: GoogleFonts.merriweather(
                    fontSize: introTextSize,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w100,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SelectableText(
                  StringConst.NAME,
                  style: textTheme.displayMedium?.copyWith(
                    fontSize: introTextSize,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SpaceH8(),
                SelectableText(
                  StringConst.PROFESSIONAL_POSITION,
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: professionalTextSize,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SpaceH16(),
                SocialIconsWidget(
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
                CustomPaint(
                  painter: CircleWidget(
                    offset: Offset(Sizes.RADIUS_40, contentAreaHeight * 0.15),
                    radius: Sizes.RADIUS_40,
                    color: AppColors.accentColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        ContentAreaWidget(
          width: contentAreaWidth,
          height: contentAreaHeight,
          backgroundColor: AppColors.primaryColor,
          child: Container(
            padding: const EdgeInsets.only(left: Sizes.PADDING_40),
            child: Stack(
              children: [
                CustomPaint(
                  painter: CircleWidget(
                    offset: Offset(
                      contentAreaWidth * 0.825,
                      contentAreaHeight * 0.35,
                    ),
                    color: AppColors.blueGrey100,
                    radius: Sizes.RADIUS_140,
                  ),
                ),
                CustomPaint(
                  painter: CircleWidget(
                    offset: Offset(
                      contentAreaWidth * 0.1,
                      contentAreaHeight * 0.9,
                    ),
                    color: AppColors.blueGrey100,
                    radius: Sizes.RADIUS_40,
                  ),
                ),
                Center(
                  child: ResponsiveBuilder(
                    builder: (context, sizingInformation) {
                      double screenWidth = sizingInformation.screenSize.width;
                      if (screenWidth < const RefinedBreakpoints().desktopSmall) {
                        return _buildCatchLineAndImage(
                          context,
                          isCatchLineVisible: false,
                          width: (contentAreaWidth * 0.9),
                        );
                      } else {
                        return Stack(
                          children: [
                            Center(
                              child: _buildCatchLineAndImage(
                                context,
                                isCatchLineVisible: true,
                                width: (contentAreaWidth * 0.9),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: -3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/code_thinking1.svg',
                                        //'assets/images/coding.svg',
                                        //'assets/images/freelancer.svg',
                                        //'assets/images/version_control.svg',
                                        //'assets/images/version_control1.svg',
                                        width: (contentAreaWidth * 0.3) - kPadding24,
                                        //width: (contentAreaWidth * 0.45) - kPadding24,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
                /*Positioned(
                  right: 0,
                  bottom: -(contentAreaWidth * 0.047),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            'assets/images/code_thinking1.svg',
                            //'assets/images/coding.svg',
                            //'assets/images/version_control.svg',
                            //'assets/images/version_control1.svg',
                            width: (contentAreaWidth * 0.3) - kPadding24,
                            //width: (contentAreaWidth * 0.45) - kPadding24,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCatchLineAndImage(BuildContext context, {required width, isCatchLineVisible = true}) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        isCatchLineVisible
            ? SizedBox(
                width: width - kPadding24,
                child: SelectableText(
                  StringConst.CATCH_LINE,
                  style: textTheme.displaySmall?.copyWith(
                    fontSize: Sizes.TEXT_SIZE_40,
                    fontWeight: FontWeight.w100,
                    color: AppColors.accentColor,
                  ),
                ),
              )
            : Container(),
        /*SvgPicture.asset(
          'assets/images/code_thinking.svg',
          width: width - kPadding24 - 100,
          height: width - kPadding24 - 100,
          //colorFilter: ColorFilter.mode(iconColor!, BlendMode.srcIn),
        ),*/
        /*Image.asset(
          ImagePath.JADE_MACY,
          width: width - kPadding24,
          fit: BoxFit.cover,
        ),*/
      ],
    );
  }
}
