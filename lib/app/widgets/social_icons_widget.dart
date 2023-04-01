import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/constants/values.dart';
import 'package:flutter/material.dart';

import '../../core/utils/utils.dart';

class SocialIconsWidget extends StatelessWidget {
  final Color? iconColor;
  final double? size;
  final double spacing;
  final List<String> icons;
  final List<String> socialLinks;

  const SocialIconsWidget({
    super.key,
    this.iconColor = AppColors.darkGrey400,
    this.size = Sizes.ICON_SIZE_20,
    required this.spacing,
    required this.icons,
    required this.socialLinks,
  }) : assert(icons.length == socialLinks.length);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      children: _buildSocialIcons(),
    );
  }

  List<Widget> _buildSocialIcons() {
    List<Widget> iconWidgets = [];

    for (var index = 0; index < icons.length; index++) {
      iconWidgets.add(
        InkWell(
          onTap: () => Utils.launchInBrowser(socialLinks[index]),
          child: SvgPicture.asset(
            icons[index],
            width: size,
            height: size,
            colorFilter: ColorFilter.mode(iconColor!, BlendMode.srcIn),
          ),
        ),
      );
    }

    return iconWidgets;
  }
}
