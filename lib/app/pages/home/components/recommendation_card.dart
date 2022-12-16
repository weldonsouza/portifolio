import 'package:flutter/material.dart';

import '../../../../core/route/navigation_service.dart';
import '../../../../core/utils/constants.dart';
import '../../../../domain/models/recommendation_model.dart';
import '../../recommendation_details/recommendation_details_page.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    Key? key,
    required this.recommendation,
  }) : super(key: key);

  final RecommendationModel recommendation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigationService.push(RecommendationDetailsPage.routeName, arguments: recommendation);
      },
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(Constants.defaultPadding),
        color: Constants.secondaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recommendation.name!,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(recommendation.source!),
            const SizedBox(height: Constants.defaultPadding),
            Text(
              recommendation.text!,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(height: 1.5),
            )
          ],
        ),
      ),
    );
  }
}
