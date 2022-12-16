import 'package:flutter/material.dart';

import '../../core/utils/constants.dart';

class AnimatedCounter extends StatelessWidget {
  final int value;
  final String? text;

  const AnimatedCounter({
    Key? key,
    required this.value,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: IntTween(begin: 0, end: value),
      duration: Constants.defaultDuration,
      builder: (context, value, child) => Text(
        "$value$text",
        style: Theme.of(context).textTheme.headline6!.copyWith(color: Constants.primaryColor),
      ),
    );
  }
}
