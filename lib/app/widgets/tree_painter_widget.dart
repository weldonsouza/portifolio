import 'package:flutter/material.dart';

import '../../core/utils/constants/values.dart';

class TreePainter extends CustomPainter {
  TreePainter({
    this.veinsStrokeWidth = Sizes.SIZE_5,
    this.jointsStrokeWidth = Sizes.SIZE_5,
    this.innerJointColor = AppColors.blueGrey100,
    this.veinsColor = AppColors.accentColor,
    this.outerJointColor = AppColors.accentColor,
    this.innerJointRadius = Sizes.RADIUS_8,
    this.outerJointRadius = Sizes.RADIUS_10,
    this.stalk = 0.1,
  }) : assert(stalk <= 1 || stalk >= 0);

  final double stalk;
  final double veinsStrokeWidth;
  final double jointsStrokeWidth;
  final double innerJointRadius;
  final double outerJointRadius;
  final Color veinsColor;
  final Color innerJointColor;
  final Color outerJointColor;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = veinsStrokeWidth
      ..color = veinsColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    var verticalLineStartingPoint = Offset(size.width * 0.5, size.height * 0.0);
    var verticalLineEndPoint = Offset(size.width * 0.5, size.height);

    var horizontalLineStartingPoint =
        Offset(size.width * (0.5 - (stalk / 2)), size.height * 0.5);
    var horizontalLineEndPoint =
        Offset(size.width * (0.5 + ((stalk / 2))), size.height * 0.5);

    //draws vertical line
    canvas.drawLine(verticalLineStartingPoint, verticalLineEndPoint, paint);
    //draws horizontal line
    canvas.drawLine(
      horizontalLineStartingPoint,
      horizontalLineEndPoint,
      paint,
    );

    Paint circlePaint = Paint()
      ..strokeWidth = jointsStrokeWidth
      ..color = outerJointColor
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, outerJointRadius, circlePaint);

    circlePaint.color = innerJointColor;
    canvas.drawCircle(center, innerJointRadius, circlePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
