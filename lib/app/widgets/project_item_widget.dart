import '../../core/utils/constants/values.dart';
import 'package:flutter/material.dart';

import 'spaces_widget.dart';

class ProjectItemWidget extends StatelessWidget {
  final String projectTitle;
  final String imageUrl;
  final double borderRadius;
  final double? width;
  final double? height;
  final TextStyle? projectTitleStyle;

  const ProjectItemWidget({
    super.key,
    required this.imageUrl,
    required this.projectTitle,
    this.width,
    this.height,
    this.borderRadius = Sizes.RADIUS_12,
    this.projectTitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SpaceH8(),
        Text(
          projectTitle,
          style: projectTitleStyle ?? textTheme.titleMedium,
        ),
      ],
    );
  }
}
