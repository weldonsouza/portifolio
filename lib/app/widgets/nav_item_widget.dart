import '../../core/utils/constants/values.dart';
import 'package:flutter/material.dart';

class NavItemWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Color textColor;
  final Color selectedColor;
  final TextStyle? titleStyle;
  final GestureTapCallback? onTap;

  const NavItemWidget({
    super.key,
    required this.title,
    this.isSelected = false,
    this.titleStyle,
    this.textColor = AppColors.white,
    this.selectedColor = AppColors.accentColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: titleStyle ??
            textTheme.bodyLarge?.copyWith(
              color: isSelected ? selectedColor : textColor,
              fontSize: Sizes.TEXT_SIZE_14,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
      ),
    );
  }
}
