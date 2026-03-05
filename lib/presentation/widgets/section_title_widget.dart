import 'package:flutter/material.dart';
import 'package:portifolio/core/theme/app_colors.dart';
import 'package:portifolio/core/theme/app_typography.dart';
import 'package:portifolio/core/utils/responsive.dart';

/// Título de seção no formato "01. Sobre mim ———"
class SectionTitleWidget extends StatelessWidget {
  const SectionTitleWidget({
    super.key,
    required this.number,
    required this.title,
  });

  final String number;
  final String title;

  @override
  Widget build(BuildContext context) {
    final width = screenWidth(context);
    return Row(
      children: [
        Text(number, style: AppTypography.sectionNumber),
        const SizedBox(width: 16),
        Text(title, style: AppTypography.sectionTitleDesktop(width)),
        if (isDesktop(context)) ...[
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              height: 1,
              color: AppColors.border,
            ),
          ),
        ],
      ],
    );
  }
}
