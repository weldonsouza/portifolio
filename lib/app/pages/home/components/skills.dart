import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../../../../data/datasources/local/i18n/home.i18n.dart';
import '../../../../domain/models/skill_model.dart';
import '../../../widgets/animated_circular_progress_indicator.dart';

class Skills extends StatelessWidget {
  final List<SkillModel> skills;

  const Skills({
    Key? key,
    required this.skills,
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
            labelSkills.i18n,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var element in skills) ...[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: AnimatedCircularProgressIndicator(
                    percentage: element.percentage!,
                    label: element.name!,
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
