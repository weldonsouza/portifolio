import 'package:flutter/material.dart';
import 'package:portifolio/core/utils/utils.dart';
import '../../core/utils/constants/values.dart';

import '../../core/utils/responsive.dart';
import '../../domain/models/experience_model.dart';
import 'empty_widget.dart';
import 'experience_column_widget.dart';
import 'spaces_widget.dart';
import 'tree_painter_widget.dart';

class ExperienceTreeWidget extends StatelessWidget {
  const ExperienceTreeWidget({
    super.key,
    required this.experienceData,
    required this.headTitle,
    required this.tailTitle,
    this.head,
    this.widthOfTree = 200,
    this.headTitleStyle,
    this.tailTitleStyle,
    this.tail,
    this.headBackgroundColor,
    this.tailBackgroundColor,
    this.leftLeafTitleStyle,
    this.leftLeafSubtitleStyle,
    this.leftLeafSubtitleIcon,
    this.leftLeafTitleIcon,
    this.leftLeafIconColor,
    this.rightLeafTitleStyle,
    this.rightLeafSubtitleStyle,
    this.rightLeafBodyStyle,
    this.rightLeafIconData,
    this.veinsColor,
    this.outerJointColor,
    this.innerJointColor,
  });

  final Widget? head;
  final double widthOfTree;
  final String headTitle;
  final String tailTitle;
  final TextStyle? headTitleStyle;
  final TextStyle? tailTitleStyle;
  final Color? headBackgroundColor;
  final Color? tailBackgroundColor;
  final Widget? tail;
  final List<ExperienceModel> experienceData;
  final TextStyle? leftLeafTitleStyle;
  final TextStyle? leftLeafSubtitleStyle;
  final TextStyle? rightLeafTitleStyle;
  final TextStyle? rightLeafBodyStyle;
  final IconData? rightLeafIconData;
  final TextStyle? rightLeafSubtitleStyle;
  final Icon? leftLeafTitleIcon;
  final Icon? leftLeafSubtitleIcon;
  final Color? leftLeafIconColor;
  final Color? veinsColor;
  final Color? outerJointColor;
  final Color? innerJointColor;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.PADDING_16,
              vertical: Sizes.PADDING_8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.RADIUS_20),
              color: headBackgroundColor ?? AppColors.accentColor100,
            ),
            child: SelectableText(
              headTitle,
              style: headTitleStyle ??
                  textTheme.titleMedium?.copyWith(
                    color: AppColors.blueGrey50,
                    fontSize: Sizes.TEXT_SIZE_16,
                  ),
            ),
          ),
        ),
        Column(
          children: _buildExperienceBranches(
            context: context,
            experienceData: experienceData,
          ),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.PADDING_16,
              vertical: Sizes.PADDING_8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.RADIUS_20),
              color: tailBackgroundColor ?? AppColors.accentColor100,
            ),
            child: SelectableText(
              tailTitle,
              style: tailTitleStyle ??
                  textTheme.titleMedium?.copyWith(
                    color: AppColors.blueGrey50,
                    fontSize: Sizes.TEXT_SIZE_16,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildExperienceBranches(
      {required BuildContext context,
      required List<ExperienceModel> experienceData}) {
    List<Widget> branchWidgets = [];
    for (var index = 0; index < experienceData.length; index++) {
      branchWidgets.add(
        ExperienceBranch(
          leftLeafTitle: experienceData[index].duration,
          leftLeafSubtitle: experienceData[index].location,
          rightLeafTitle: experienceData[index].title,
          rightLeafTitleUrl: experienceData[index].titleUrl,
          rightLeafSubtitle: experienceData[index].subtitle,
          rightLeafBody: experienceData[index].body,
          leftLeafTitleStyle: leftLeafTitleStyle,
          leftLeafSubtitleStyle: leftLeafSubtitleStyle,
          rightLeafTitleStyle: rightLeafTitleStyle,
          rightLeafSubtitleStyle: rightLeafSubtitleStyle,
          rightLeafBodyStyle: rightLeafBodyStyle,
          rightLeafIconData: rightLeafIconData,
          width: widthOfTree,
          height: isDisplaySmallDesktop(context)
              ? assignHeight(context, 0.45)
              : assignHeight(context, 0.35),
          veinsColor: veinsColor,
          innerJointColor: innerJointColor,
          outerJointColor: outerJointColor,
          leftLeafTitleIcon: leftLeafTitleIcon,
          leftLeafSubtitleIcon: leftLeafSubtitleIcon,
          leftLeafIconColor: leftLeafIconColor,
        ),
      );
    }

    return branchWidgets;
  }
}

class ExperienceBranch extends StatefulWidget {
  const ExperienceBranch({
    super.key,
    required this.leftLeafTitle,
    required this.leftLeafSubtitle,
    this.leftLeafTitleIcon,
    this.leftLeafSubtitleIcon,
    this.leftLeafIconColor,
    required this.rightLeafTitle,
    this.rightLeafSubtitle,
    this.rightLeafIconData,
    required this.rightLeafBody,
    required this.rightLeafTitleUrl,
    this.leftLeafTitleStyle,
    this.leftLeafSubtitleStyle,
    this.rightLeafTitleStyle,
    this.rightLeafSubtitleStyle,
    this.rightLeafBodyStyle,
    this.width = 200,
    this.height = 200,
    this.customPainter,
    this.stalk = 0.1,
    this.veinsColor = AppColors.accentColor100,
    this.outerJointColor = AppColors.accentColor100,
    this.innerJointColor = AppColors.blueGrey600,
  });

  final double width;
  final double stalk;
  final double height;
  final String leftLeafTitle;
  final String leftLeafSubtitle;
  final String rightLeafTitle;
  final String rightLeafTitleUrl;
  final String? rightLeafSubtitle;
  final List<String> rightLeafBody;
  final TextStyle? leftLeafTitleStyle;
  final TextStyle? leftLeafSubtitleStyle;
  final TextStyle? rightLeafTitleStyle;
  final TextStyle? rightLeafBodyStyle;
  final IconData? rightLeafIconData;
  final TextStyle? rightLeafSubtitleStyle;
  final Icon? leftLeafTitleIcon;
  final Icon? leftLeafSubtitleIcon;
  final Color? leftLeafIconColor;
  final CustomPainter? customPainter;
  final Color? veinsColor;
  final Color? outerJointColor;
  final Color? innerJointColor;

  @override
  State<ExperienceBranch> createState() => _ExperienceBranchState();
}

class _ExperienceBranchState extends State<ExperienceBranch> {
  GlobalKey bodyLeafKey = GlobalKey();
  GlobalKey locationLeafKey = GlobalKey();
  double offsetRoleLeaf = 0.0;
  double offsetLocationLeaf = 0.0;

  @override
  void initState() {
    offsetRoleLeaf = (widget.height / 5) - 10;
    offsetLocationLeaf = (widget.height / 2) - 16;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getHeightOfRoleLeaf();
    });
    super.initState();
  }

  _getHeightOfRoleLeaf() {
    final RenderBox roleLeafRenderBox = bodyLeafKey.currentContext?.findRenderObject() as RenderBox;
    final RenderBox locationLeafRenderBox = locationLeafKey.currentContext?.findRenderObject() as RenderBox;

    final roleLeafHeight = roleLeafRenderBox.size.height;
    final locationLeafHeight = locationLeafRenderBox.size.height;
    setState(() {
      offsetRoleLeaf = (widget.height / 2) - (roleLeafHeight / 2);
      offsetLocationLeaf = (widget.height / 2) - (locationLeafHeight / 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: widget.customPainter ??
          TreePainter(
            stalk: 0.1,
            veinsColor: widget.veinsColor ?? AppColors.accentColor100,
            innerJointColor: widget.innerJointColor ?? AppColors.blueGrey600,
            outerJointColor: widget.outerJointColor ?? AppColors.accentColor100,
          ),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Stack(
          children: [
            Positioned(
              width: widget.width / 2,
              top: offsetLocationLeaf,
              left: 0,
              child: Container(
                key: locationLeafKey,
                padding: EdgeInsets.only(right: (widget.width * widget.stalk)),
                child: LeftLeaf(
                  title: widget.leftLeafTitle,
                  titleIcon: widget.leftLeafTitleIcon,
                  subtitle: widget.leftLeafSubtitle,
                  subtitleIcon: widget.leftLeafSubtitleIcon,
                  titleTextStyle: widget.leftLeafTitleStyle,
                  subtitleTextStyle: widget.leftLeafSubtitleStyle,
                ),
              ),
            ),
            const SpaceH8(),
            Positioned(
              width: widget.width / 2,
              top: offsetRoleLeaf,
              right: 0,
              child: Container(
                key: bodyLeafKey,
                padding: EdgeInsets.only(
                  left: (widget.width * widget.stalk),
                ),
                child: RightLeaf(
                  title: widget.rightLeafTitle,
                  titleTextStyle: widget.rightLeafTitleStyle,
                  iconData: widget.rightLeafIconData,
                  onTap: () {
                    Utils.launchInBrowser(widget.rightLeafTitleUrl);
                  },
                  subtitle: widget.rightLeafSubtitle,
                  subtitleTextStyle: widget.rightLeafSubtitleStyle,
                  body: widget.rightLeafBody,
                  bodyTextStyle: widget.rightLeafBodyStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LeftLeaf extends StatelessWidget {
  const LeftLeaf({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleIcon,
    this.subtitleIcon,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.defaultIconColor = AppColors.darkGrey100,
  });

  final String title;
  final String subtitle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? titleTextStyle;
  final Icon? subtitleIcon;
  final Icon? titleIcon;
  final Color? defaultIconColor;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SelectableText(
              title,
              style: titleTextStyle ??
                  textTheme.bodyMedium?.copyWith(
                    color: AppColors.darkGrey100,
                    fontSize: Sizes.TEXT_SIZE_14,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SpaceW4(),
            titleIcon ??
                const Icon(
                  Icons.access_time,
                  color: AppColors.darkGrey100,
                  size: Sizes.ICON_SIZE_18,
                ),
          ],
        ),
        const SpaceH8(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              flex: 1,
              child: SelectableText(
                subtitle,
                style: subtitleTextStyle ??
                    textTheme.bodyMedium?.copyWith(
                      color: defaultIconColor,
                      fontSize: Sizes.TEXT_SIZE_15,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SpaceW4(),
            subtitleIcon ??
                Icon(
                  Icons.location_on,
                  color: defaultIconColor,
                  size: Sizes.ICON_SIZE_18,
                ),
          ],
        )
      ],
    );
  }
}

class RightLeaf extends StatelessWidget {
  const RightLeaf({
    super.key,
    required this.title,
    this.subtitle,
    required this.body,
    this.iconData,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.bodyTextStyle,
    this.onTap,
  });

  final String title;
  final String? subtitle;
  final IconData? iconData;
  final List<String> body;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? bodyTextStyle;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Text(
            title,
            style: titleTextStyle ??
                Styles.customTextStyle(
                  fontSize: Sizes.TEXT_SIZE_18,
                  fontStyle: FontStyle.normal,
                ),
          ),
        ),
        subtitle == null
            ? const EmptyWidget()
            : SelectableText(
                subtitle!,
                style: subtitleTextStyle ??
                    Styles.customTextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: Sizes.TEXT_SIZE_15,
                    ),
              ),
        const SpaceH8(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildBody(body: body, context: context),
        ),
      ],
    );
  }

  List<Widget> _buildBody({required List<String> body, required BuildContext context}) {
    TextTheme textTheme = Theme.of(context).textTheme;
    List<Widget> bodyWidgets = [];
    for (var index = 0; index < body.length; index++) {
      bodyWidgets.add(
        Body(
          body: body[index],
          icon: iconData,
          bodyTextStyle: bodyTextStyle ??
              textTheme.bodyMedium?.copyWith(
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
                fontSize: Sizes.TEXT_SIZE_15,
              ),
          color: AppColors.darkGrey300,
        ),
      );
      bodyWidgets.add(const SpaceH8());
    }

    return bodyWidgets;
  }
}
