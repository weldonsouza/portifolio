import 'package:flutter/material.dart';
import '../../core/utils/constants/values.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: Sizes.WIDTH_0,
      height: Sizes.HEIGHT_0,
    );
  }
}
