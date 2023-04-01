import 'package:flutter/material.dart';

import '../../core/utils/constants/values.dart';
import 'skill_progress_painter_widget.dart';
import 'spaces_widget.dart';

class SkillLevelWidget extends StatelessWidget {
  final double skillLevel;
  final String skillName;
  final TextStyle? skillLevelStyle;
  final TextStyle? skillNameTextStyle;
  final double width;
  final double height;
  final Duration duration;
  final Color progressColor;
  final Color baseColor;

  const SkillLevelWidget({
    super.key,
    required this.skillLevel,
    required this.skillName,
    this.width = 120,
    this.height = 120,
    this.skillLevelStyle,
    this.skillNameTextStyle,
    this.duration = const Duration(milliseconds: 500),
    this.progressColor = AppColors.blueGrey500,
    this.baseColor = AppColors.accentColor50,
  });

  @override
  Widget build(BuildContext context) {
    var actualSkillLevel = skillLevel;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: skillLevel),
          duration: duration,
          child: SizedBox(
            width: width,
            height: height,
            child: Center(
              child: SelectableText(
                "$actualSkillLevel%",
                style: skillLevelStyle ??
                    textTheme.titleMedium?.copyWith(
                      color: AppColors.blueGrey500,
                    ),
              ),
            ),
          ),
          builder: (BuildContext context, double value, Widget? child) {
            return CustomPaint(
              foregroundPainter: SkillProgressPainter(
                currentProgress: value,
                circleColor: baseColor,
                progressArcColor: progressColor,
              ),
              child: AnimatedOpacity(
                opacity: 1,
                duration: duration,
                child: child,
              ),
            );
          },
        ),
        const SpaceH8(),
        SelectableText(
          skillName,
          style: skillNameTextStyle ??
              Styles.customTextStyle(
                fontSize: Sizes.TEXT_SIZE_16,
                color: AppColors.darkGrey600,
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
