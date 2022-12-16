import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/constants.dart';
import '../../../../data/datasources/local/i18n/home.i18n.dart';

class Knowledge extends StatelessWidget {
  final List<String> knowledge;

  const Knowledge({
    Key? key,
    required this.knowledge,
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
            labelKnowledge.i18n,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: knowledge.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: Constants.defaultPadding / 2),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/check.svg"),
                  const SizedBox(width: Constants.defaultPadding / 2),
                  Text(knowledge[index]),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
