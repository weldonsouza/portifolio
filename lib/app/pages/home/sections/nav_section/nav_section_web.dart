import 'package:flutter/material.dart';
import 'package:portifolio/core/utils/utils.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:layout/layout.dart';

import '../../../../../core/utils/constants/values.dart';
import '../../../../../core/utils/responsive.dart';
import '../../../../../domain/models/nav_item_model.dart';
import '../../../../widgets/content_area_widget.dart';
import '../../../../widgets/nav_item_widget.dart';
import '../../../../widgets/spaces_widget.dart';

class NavSectionWeb extends StatefulWidget {
  final List<NavItemModel> navItems;

  const NavSectionWeb({
    super.key,
    required this.navItems,
  });

  @override
  State<NavSectionWeb> createState() => _NavSectionWebState();
}

class _NavSectionWebState extends State<NavSectionWeb> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double sidePadding = getSidePadding(context);
    double screenWidth = widthOfScreen(context);
    double contentAreaWidth = screenWidth * 0.5;

    return Container(
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
                SizedBox(width: sidePadding),
                SelectableText(
                  StringConst.NAME_ABBREV,
                  style: textTheme.displaySmall,
                ),
                const Spacer(),
                NavItemWidget(
                  title: widget.navItems[0].name,
                  isSelected: widget.navItems[0].isSelected,
                  textColor: AppColors.darkGrey800,
                  selectedColor: AppColors.deepBlue,
                  onTap: () => _onTapNavItem(
                    context: widget.navItems[0].key,
                    navItemName: widget.navItems[0].name,
                  ),
                ),
                horizontalSpacing(),
                NavItemWidget(
                  title: widget.navItems[1].name,
                  isSelected: widget.navItems[1].isSelected,
                  selectedColor: AppColors.deepBlue,
                  textColor: AppColors.darkGrey800,
                  onTap: () => _onTapNavItem(
                    context: widget.navItems[1].key,
                    navItemName: widget.navItems[1].name,
                  ),
                ),
                SpaceW20(),
              ],
            ),
          ),
          ContentAreaWidget(
            width: contentAreaWidth,
            height: Sizes.HEIGHT_56,
            backgroundColor: AppColors.blueGrey500,
            child: Row(
              children: [
                SpaceW20(),
                NavItemWidget(
                  title: widget.navItems[2].name,
                  isSelected: widget.navItems[2].isSelected,
                  onTap: () => _onTapNavItem(
                    context: widget.navItems[2].key,
                    navItemName: widget.navItems[2].name,
                  ),
                ),
                horizontalSpacing(),
                ResponsiveBuilder(
                  refinedBreakpoints: const RefinedBreakpoints(),
                  builder: (context, sizingInformation) {
                    double screenWidth = sizingInformation.screenSize.width;
                    if (screenWidth < const RefinedBreakpoints().tabletExtraLarge) {
                      return NavItemWidget(
                        title: StringConst.SKILLS,
                        isSelected: widget.navItems[3].isSelected,
                        onTap: () => _onTapNavItem(
                          context: widget.navItems[3].key,
                          navItemName: widget.navItems[3].name,
                        ),
                      );
                    } else {
                      return NavItemWidget(
                        title: widget.navItems[3].name,
                        isSelected: widget.navItems[3].isSelected,
                        onTap: () => _onTapNavItem(
                          context: widget.navItems[3].key,
                          navItemName: widget.navItems[3].name,
                        ),
                      );
                    }
                  },
                ),
                horizontalSpacing(),
                NavItemWidget(
                  title: widget.navItems[4].name,
                  isSelected: widget.navItems[4].isSelected,
                  onTap: () => _onTapNavItem(
                    context: widget.navItems[4].key,
                    navItemName: widget.navItems[4].name,
                  ),
                ),
                horizontalSpacing(),
                NavItemWidget(
                  title: widget.navItems[5].name,
                  isSelected: widget.navItems[5].isSelected,
                  onTap: () => Utils.launchInBrowser(StringConst.EMAIL_URL),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _onTapNavItem({required GlobalKey context, required String navItemName}) {
    for (int index = 0; index < widget.navItems.length; index++) {
      if (navItemName == widget.navItems[index].name) {
        Utils.scrollToSection(context.currentContext!);
        setState(() {
          widget.navItems[index].isSelected = true;
        });
      } else {
        widget.navItems[index].isSelected = false;
      }
    }
  }

  Widget horizontalSpacing() {
    double width = context.layout.value(
      xs: Sizes.WIDTH_24,
      sm: Sizes.WIDTH_24,
      md: Sizes.WIDTH_40,
      lg: Sizes.WIDTH_40,
      xl: Sizes.WIDTH_40,
    );
    return SizedBox(width: width);
  }
}
