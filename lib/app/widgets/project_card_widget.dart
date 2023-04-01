import 'package:flutter/material.dart';
import 'package:portifolio/app/widgets/elevated_button_widget.dart';
import 'package:portifolio/core/utils/constants/values.dart';
import 'package:portifolio/core/utils/utils.dart';

import '../../core/utils/responsive.dart';

class ProjectCardWidget extends StatelessWidget {
  final String? banner;
  final String? typeProject;
  final String? title;
  final String? linkGooglePlay;
  final String? linkAppPlay;
  final String? linkGithub;
  final String? linkPackage;

  const ProjectCardWidget({
    Key? key,
    this.banner,
    this.typeProject,
    this.title,
    this.linkGooglePlay,
    this.linkAppPlay,
    this.linkGithub,
    this.linkPackage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double contentAreaWidth = assignWidth(context, 0.18);
    double contentAreaHeight = assignHeight(context, 0.34);

    return Card(
      color: AppColors.primaryColor,
      child: SizedBox(
        width: contentAreaWidth,
        height: contentAreaHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: Utils.mediaQuery(context, 1),
                  height: contentAreaHeight / 1.65,
                  decoration: BoxDecoration(
                    color: AppColors.darkBlue,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage(banner!),
                      fit: BoxFit.fill,
                      onError: (Object exception, StackTrace? stackTrace) {},
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.darkBlue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Sizes.RADIUS_4),
                    ),
                  ),
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      typeProject!,
                      style: textTheme.bodyLarge?.copyWith(
                        fontSize: Sizes.TEXT_SIZE_12,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleMedium?.copyWith(
                        fontSize: Sizes.TEXT_SIZE_18,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  linkGooglePlay!.isNotEmpty ? ElevatedButtonWidget(label: 'Play', icon: ImagePath.google, link: linkGooglePlay) : const SizedBox(),
                  linkAppPlay!.isNotEmpty ? ElevatedButtonWidget(label: 'App', icon: ImagePath.apple, link: linkAppPlay) : const SizedBox(),
                  linkGithub!.isNotEmpty ? ElevatedButtonWidget(label: 'GitHub', icon: ImagePath.github, link: linkGithub) : const SizedBox(),
                  linkPackage!.isNotEmpty ? ElevatedButtonWidget(label: 'Package', icon: ImagePath.package, link: linkPackage) : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
