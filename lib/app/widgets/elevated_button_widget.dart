import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/constants/values.dart';
import '../../core/utils/utils.dart';
import 'spaces_widget.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String label;
  final String icon;
  final String? link;
  
  const ElevatedButtonWidget({
    Key? key,
    required this.label,
    required this.icon,
    this.link
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ElevatedButton(
        onPressed: () => Utils.launchInBrowser(link!),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.darkBlue,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 16,
              colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            ),
            const SpaceW8(),
            Text(
              label,
              style: textTheme.bodyLarge?.copyWith(
                fontSize: Sizes.TEXT_SIZE_12,
                color: AppColors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
