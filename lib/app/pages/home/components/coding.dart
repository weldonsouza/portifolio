import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../../../../data/datasources/local/i18n/home.i18n.dart';
import '../../../../domain/models/skill_model.dart';
import '../../../widgets/animated_linear_progress_indicator.dart';

class Coding extends StatelessWidget {
  final List<SkillModel> coding;

  const Coding({
    Key? key,
    required this.coding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Constants.defaultPadding),
          child: Text(
            labelCoding.i18n,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        Wrap(
          children: [
            for (var element in coding) ...[
              AnimatedLinearProgressIndicator(
                percentage: element.percentage!,
                label: element.name!,
              ),
            ],
          ],
        ),
      ],
    );
  }
}
