import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';

class AreaInfoText extends StatelessWidget {
  final String? title;
  final String? text;

  const AreaInfoText({
    Key? key,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Constants.defaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: const TextStyle(color: Colors.white),
          ),
          Text(text!),
        ],
      ),
    );
  }
}
