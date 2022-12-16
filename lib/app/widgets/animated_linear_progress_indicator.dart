import 'package:flutter/material.dart';

import '../../core/utils/constants.dart';

class AnimatedLinearProgressIndicator extends StatelessWidget {
  const AnimatedLinearProgressIndicator({
    Key? key,
    required this.percentage,
    required this.label,
  }) : super(key: key);

  final double percentage;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Constants.defaultPadding),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: percentage),
        duration: Constants.defaultDuration,
        builder: (context, double value, child) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                ),
                Text("${(value * 100).toInt()}%"),
              ],
            ),
            const SizedBox(height: Constants.defaultPadding / 2),
            LinearProgressIndicator(
              value: value,
              color: Constants.primaryColor,
              backgroundColor: Constants.darkColor,
            ),
          ],
        ),
      ),
    );
  }
}
