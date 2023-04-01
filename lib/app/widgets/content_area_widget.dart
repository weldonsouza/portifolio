import 'package:flutter/material.dart';

class ContentAreaWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  const ContentAreaWidget({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    this.padding,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height,
      color: backgroundColor,
      child: child,
    );
  }
}
