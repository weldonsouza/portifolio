import 'package:flutter/material.dart';
import 'package:portifolio/core/utils/utils.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../core/utils/constants/values.dart';
import 'spaces_widget.dart';

class CreatorsWidget extends StatelessWidget {
  final bool hasRightsText;
  final bool hasLocationInfo;
  final bool hasBuiltInfo;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisAlignment builtInfoMainAxisAlignment;
  final MainAxisAlignment locationMainAxisAlignment;
  final bool doesBuiltInfoComesFirst;

  const CreatorsWidget({
    super.key,
    this.hasRightsText = true,
    this.hasBuiltInfo = true,
    this.hasLocationInfo = true,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.end,
    this.builtInfoMainAxisAlignment = MainAxisAlignment.start,
    this.locationMainAxisAlignment = MainAxisAlignment.start,
    this.doesBuiltInfoComesFirst = true,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        hasRightsText
            ? SelectableText(
                StringConst.RIGHTS_RESERVED,
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: Sizes.TEXT_SIZE_12,
                  color: AppColors.accentColor500,
                ),
              )
            : Container(),
        hasRightsText ? const SpaceH2() : Container(),
        ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.isMobile) {
              return Column(
                mainAxisAlignment: mainAxisAlignment,
                crossAxisAlignment: crossAxisAlignment,
                children: [
                  hasBuiltInfo
                      ? BuiltBySection(
                          builtInfoMainAxisAlignment: builtInfoMainAxisAlignment,
                        )
                      : Container(),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: mainAxisAlignment,
                crossAxisAlignment: crossAxisAlignment,
                children: [
                  hasBuiltInfo
                      ? BuiltBySection(
                          builtInfoMainAxisAlignment: builtInfoMainAxisAlignment,
                        )
                      : Container(),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}

class BuiltBySection extends StatelessWidget {
  final MainAxisAlignment builtInfoMainAxisAlignment;

  const BuiltBySection({super.key,
    this.builtInfoMainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle footerTextStyle = Styles.customTextStyle2(
      fontSize: Sizes.TEXT_SIZE_12,
      color: AppColors.accentColor500,
    );

    TextStyle linkStyle = Styles.customTextStyle2(
      fontSize: Sizes.TEXT_SIZE_12,
      color: AppColors.white,
      decoration: TextDecoration.underline,
    );

    return Row(
      mainAxisAlignment: builtInfoMainAxisAlignment,
      children: [
        InkWell(
          onTap: () => Utils.launchInBrowser(StringConst.DAVID_LEGEND_URL),
          child: RichText(
            text: TextSpan(
              style: footerTextStyle,
              text: "${StringConst.BUILT_BY} ",
              children: [
                TextSpan(
                  text: "${StringConst.WELDON_SOUZA}, ",
                  style: linkStyle,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => Utils.launchInBrowser(StringConst.DESIGN_URL),
          child: RichText(
            text: TextSpan(
              text: "${StringConst.DESIGNED_BY} ",
              style: footerTextStyle,
              children: [
                TextSpan(
                  text: "${StringConst.ADEEL_RAZA}.",
                  style: linkStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
