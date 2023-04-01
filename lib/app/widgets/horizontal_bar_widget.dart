import '../../core/utils/constants/values.dart';
import 'package:flutter/material.dart';

class HorizontalBarWidget extends StatelessWidget {
  const HorizontalBarWidget({
    super.key,
    this.width = Sizes.WIDTH_20,
    this.height = Sizes.HEIGHT_2,
    this.color = AppColors.accentColor100,
    this.margin,
  });

  final double width;
  final double height;
  final Color color;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      color: color,
    );
  }
}
