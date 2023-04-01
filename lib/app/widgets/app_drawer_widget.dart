import 'package:portifolio/core/route/navigation_service.dart';

import '../../core/utils/constants/values.dart';
import 'package:flutter/material.dart';

import '../../core/utils/responsive.dart';
import '../../core/utils/utils.dart';
import '../../domain/models/nav_item_model.dart';
import 'circular_container_widget.dart';
import 'creators_widget.dart';
import 'nav_item_widget.dart';
import 'social_icons_widget.dart';
import 'spaces_widget.dart';

class AppDrawerWidget extends StatefulWidget {
  final Color color;
  final double? width;
  final List<NavItemModel> menuList;
  final GestureTapCallback? onClose;

  const AppDrawerWidget({
    super.key,
    this.color = AppColors.blueGrey500,
    this.width,
    required this.menuList,
    this.onClose,
  });

  @override
  State<AppDrawerWidget> createState() => _AppDrawerWidgetState();
}

class _AppDrawerWidgetState extends State<AppDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? assignWidth(context, 0.85),
      child: Drawer(
        child: Container(
          color: widget.color,
          child: Column(
            children: [
              SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: widget.onClose ?? () => _closeDrawer(),
                      child: const CircularContainerWidget(
                        color: AppColors.blueGrey50,
                        width: Sizes.WIDTH_30,
                        height: Sizes.HEIGHT_30,
                        child: Icon(
                          Icons.close,
                          size: Sizes.ICON_SIZE_20,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              ..._buildMenuList(
                context: context,
                menuList: widget.menuList,
              ),
              const Spacer(),
              SocialIconsWidget(
                icons: const [
                  ImagePath.linkedin,
                  ImagePath.github,
                ],
                iconColor: AppColors.offWhite,
                socialLinks: const [
                  StringConst.LINKED_IN_URL,
                  StringConst.GITHUB_URL,
                ],
                spacing: Sizes.SIZE_20,
              ),
              const SpaceH24(),
              const CreatorsWidget(
                hasRightsText: false,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                builtInfoMainAxisAlignment: MainAxisAlignment.center,
                locationMainAxisAlignment: MainAxisAlignment.center,
                doesBuiltInfoComesFirst: false,
              ),
              const SpaceH24(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMenuList({required BuildContext context, required List<NavItemModel> menuList}) {
    TextTheme textTheme = Theme.of(context).textTheme;
    List<Widget> menuItems = [];

    for (var i = 0; i < menuList.length; i++) {
      menuItems.add(
        NavItemWidget(
          onTap: () => _onTapNavItem(
            context: menuList[i].key,
            navItemName: menuList[i].name,
          ),
          title: menuList[i].name,
          isSelected: menuList[i].isSelected,
          titleStyle: textTheme.bodyLarge?.copyWith(
            color: menuList[i].isSelected
                ? AppColors.accentColor
                : AppColors.white,
            fontSize: Sizes.TEXT_SIZE_18,
            fontWeight: menuList[i].isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      );
      menuItems.add(const Spacer());
    }
    return menuItems;
  }

  _onTapNavItem({required GlobalKey context, required String navItemName}) {
    for (int index = 0; index < widget.menuList.length; index++) {
      if (navItemName == widget.menuList[index].name) {
        Utils.scrollToSection(context.currentContext!);
        setState(() {
          widget.menuList[index].isSelected = true;
        });
        _closeDrawer();
      } else {
        widget.menuList[index].isSelected = false;
      }
    }
  }

  _closeDrawer() {
    navigationService.pop();
  }
}
