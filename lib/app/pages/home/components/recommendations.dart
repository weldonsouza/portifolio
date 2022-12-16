import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../../../../data/datasources/local/i18n/home.i18n.dart';
import '../../../../domain/models/profile_model.dart';
import 'recommendation_card.dart';

class Recommendations extends StatelessWidget {
  final ProfileModel profile;

  const Recommendations({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Constants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelRecommendations.i18n,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: Constants.defaultPadding),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                profile.recommendation!.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: Constants.defaultPadding),
                  child: RecommendationCard(
                    recommendation: profile.recommendation![index],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

