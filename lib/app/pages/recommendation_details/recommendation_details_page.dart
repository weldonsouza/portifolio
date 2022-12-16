import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/responsive.dart';
import '../../../domain/models/recommendation_model.dart';

class RecommendationDetailsPage extends StatelessWidget {
  const RecommendationDetailsPage({Key? key}) : super(key: key);

  static String get routeName => '/recommendation_details';

  @override
  Widget build(BuildContext context) {
    final RecommendationModel recommendation = ModalRoute.of(context)!.settings.arguments as RecommendationModel;

    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
        backgroundColor: Constants.bgColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(Constants.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recommendation.name!,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: Constants.defaultPadding),
            Text(
              recommendation.text!,
              style: const TextStyle(height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
