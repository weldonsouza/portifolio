import 'package:flutter/material.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/datasources/local/i18n/home.i18n.dart';
import '../../../../domain/models/profile_model.dart';
import '../../../widgets/animated_counter.dart';
import '../../../../core/utils/responsive.dart';

class HighLightsInfo extends StatelessWidget {
  final ProfileModel profile;

  const HighLightsInfo({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Constants.defaultPadding),
      child: Responsive.isMobileLarge(context)
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _containerHeightLight(
                      context,
                      'followers',
                      profile.subscribers!,
                      '',
                    ),
                  ],
                ),
                const SizedBox(height: Constants.defaultPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _containerHeightLight(
                      context,
                      labelGitHubProjects.i18n,
                      profile.projects!.length,
                      '',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: _containerHeightLight(
                        context,
                        labelStars.i18n,
                        profile.stars!,
                        '',
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _containerHeightLight(
                  context,
                  'followers',
                  profile.subscribers!,
                  '',
                ),
                _containerHeightLight(
                  context,
                  labelGitHubProjects.i18n,
                  profile.projects!.length,
                  '',
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: _containerHeightLight(
                    context,
                    labelStars.i18n,
                    profile.stars!,
                    '',
                  ),
                ),
              ],
            ),
    );
  }

  _containerHeightLight(context, label, value, textValue) {
    return Row(
      children: [
        AnimatedCounter(
          value: value,
          text: textValue,
        ),
        const SizedBox(width: Constants.defaultPadding / 2),
        Text(label, style: Theme.of(context).textTheme.subtitle2),
      ],
    );
  }
}
