import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:portifolio/core/utils/utils.dart';
import '../../core/utils/constants/values.dart';

import 'empty_widget.dart';
import 'spaces_widget.dart';

class ExperienceColumnWidget extends StatelessWidget {
  const ExperienceColumnWidget({
    super.key,
    required this.duration,
    required this.title,
    this.subtitle,
    required this.location,
    required this.roles,
    this.subtitleUrl = "",
    this.iconData,
    this.roleTextStyle,
    this.companyTextStyle,
    this.locationTextStyle,
    this.durationTextStyle,
    this.positionTextStyle,
    this.onTap,
    this.bodyTextStyle,
    this.bodyBulletIconColor = AppColors.blueGrey500,
  });

  final String duration;
  final String title;
  final IconData? iconData;
  final String? subtitle;
  final String subtitleUrl;
  final String location;
  final List<String> roles;
  final GestureTapCallback? onTap;
  final TextStyle? roleTextStyle;
  final TextStyle? locationTextStyle;
  final TextStyle? companyTextStyle;
  final TextStyle? positionTextStyle;
  final TextStyle? bodyTextStyle;
  final TextStyle? durationTextStyle;
  final Color bodyBulletIconColor;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double titleFontSize = context.layout.value(
      xs: Sizes.TEXT_SIZE_18,
      sm: Sizes.TEXT_SIZE_20,
      md: Sizes.TEXT_SIZE_20,
      lg: Sizes.TEXT_SIZE_20,
      xl: Sizes.TEXT_SIZE_20,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              flex: 1,
              child: SelectableText(
                title,
                style: positionTextStyle ??
                    textTheme.titleLarge?.copyWith(
                      color: AppColors.primaryText,
                      fontSize: titleFontSize,
                    ),
              ),
            ),
            const SpaceW4(),
            subtitle == null
                ? Container()
                : InkWell(
                    onTap: onTap ?? () => Utils.launchInBrowser(subtitleUrl),
                    child: SelectableText(
                      '@${subtitle!}',
                      style: companyTextStyle ??
                          textTheme.titleLarge?.copyWith(
                            color: AppColors.blueGrey500,
                            fontSize: Sizes.TEXT_SIZE_16,
                          ),
                    ),
                  )
          ],
        ),
        SelectableText(
          location,
          style: locationTextStyle ??
              textTheme.bodyLarge?.copyWith(
                fontSize: Sizes.TEXT_SIZE_16,
                color: AppColors.primaryText,
              ),
        ),
        const SpaceH4(),
        SelectableText(
          duration,
          style: durationTextStyle ??
              textTheme.bodyLarge?.copyWith(
                fontSize: Sizes.TEXT_SIZE_16,
                color: AppColors.primaryText,
              ),
        ),
        const SpaceH16(),
        ..._buildBody(roles),
      ],
    );
  }

  List<Widget> _buildBody(List<String> roles) {
    List<Widget> bodyWidgets = [];
    for (var index = 0; index < roles.length; index++) {
      bodyWidgets.add(
        Body(
          body: roles[index],
          bodyTextStyle: bodyTextStyle,
          color: bodyBulletIconColor,
        ),
      );
      bodyWidgets.add(const SpaceH8());
    }

    return bodyWidgets;
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.body,
    this.bodyTextStyle,
    this.icon,
    this.iconSize = Sizes.ICON_SIZE_18,
    this.color = AppColors.blueGrey500,
  });

  final String body;
  final TextStyle? bodyTextStyle;
  final IconData? icon;
  final Color color;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        icon == null
            ? const EmptyWidget()
            : Icon(
                icon!,
                size: iconSize,
                color: color,
              ),
        icon == null ? const EmptyWidget() : const SpaceW8(),
        Expanded(
          child: SelectableText(
            body,
            style: bodyTextStyle ??
                textTheme.bodyLarge?.copyWith(
                  color: AppColors.primaryText,
                ),
          ),
        ),
      ],
    );
  }
}
