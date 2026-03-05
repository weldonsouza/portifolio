import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:portifolio/core/constants/app_sizes.dart';
import 'package:portifolio/core/theme/app_colors.dart';
import 'package:portifolio/core/theme/app_typography.dart';
import 'package:portifolio/data/datasources/portfolio_local_data.dart';
import 'package:portifolio/domain/models/experience_model.dart';
import 'package:portifolio/presentation/widgets/section_title_widget.dart';
import 'package:url_launcher/url_launcher.dart';

/// Seção de Experiência profissional.
class ExperienceSection extends StatefulWidget {
  const ExperienceSection({
    super.key,
    this.sectionKey,
  });

  final GlobalKey? sectionKey;

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('exp_vis'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.05 && !_visible) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) setState(() => _visible = true);
          });
        }
      },
      child: RepaintBoundary(
        child: Container(
        key: widget.sectionKey,
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.sectionPaddingVertical,
          horizontal: AppSizes.paddingHorizontal,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: AppSizes.maxContentWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedOpacity(
                  opacity: _visible ? 1 : 0,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeOut,
                  child: AnimatedSlide(
                    offset: _visible ? Offset.zero : const Offset(0, 0.15),
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeOut,
                    child: const SectionTitleWidget(
                      number: '03.',
                      title: 'Experiência',
                    ),
                  ),
                ),
                const SizedBox(height: 56),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isDesktop =
                        constraints.maxWidth >= AppSizes.breakpointMd;
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Vertical line
                        Positioned(
                          left: isDesktop ? 180 : 0,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: 1,
                            color: AppColors.border,
                          ),
                        ),
                        Column(
                          children: PortfolioLocalData.experiences
                              .asMap()
                              .entries
                              .map((e) {
                            final i = e.key;
                            final exp = e.value;
                            return AnimatedOpacity(
                              opacity: _visible ? 1 : 0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeOut,
                              child: AnimatedSlide(
                                offset: _visible
                                    ? Offset.zero
                                    : const Offset(0, 0.15),
                                duration: Duration(
                                  milliseconds: 500 +
                                      (i * 80).clamp(0, 600).toInt(),
                                ),
                                curve: Curves.easeOut,
                                child: _TimelineItem(
                                  experience: exp,
                                  isDesktop: isDesktop,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 56),
                AnimatedOpacity(
                  opacity: _visible ? 1 : 0,
                  duration: const Duration(milliseconds: 700),
                  child: Center(
                    child: GestureDetector(
                      onTap: () async {
                        final uri = Uri.parse(PortfolioLocalData.linkedinUrl);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri,
                              mode: LaunchMode.externalApplication);
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Ver currículo completo no LinkedIn',
                            style: AppTypography.ctaButton,
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.open_in_new,
                            size: 16,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}

class _TimelineItem extends StatefulWidget {
  const _TimelineItem({
    required this.experience,
    required this.isDesktop,
  });

  final ExperienceModel experience;
  final bool isDesktop;

  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: widget.isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 180,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, right: 24),
                    child: Text(
                      widget.experience.period,
                      style: AppTypography.experiencePeriod,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: widget.isDesktop ? -29 : -14,
                        top: 20,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _hover ? AppColors.primary : AppColors.background,
                            border: Border.all(
                              color: AppColors.primary,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      MouseRegion(
                        onEnter: (_) => setState(() => _hover = true),
                        onExit: (_) => setState(() => _hover = false),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.fromLTRB(24, 16, 16, 32),
                          decoration: BoxDecoration(
                            color: _hover ? AppColors.card.withOpacity(0.5) : Colors.transparent,
                            borderRadius: BorderRadius.circular(AppSizes.radiusDefault),
                          ),
                          child: _buildContent(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: -14,
                    top: 20,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _hover ? AppColors.primary : AppColors.background,
                        border: Border.all(
                          color: AppColors.primary,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  MouseRegion(
                    onEnter: (_) => setState(() => _hover = true),
                    onExit: (_) => setState(() => _hover = false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.only(bottom: 32, top: 16),
                      decoration: BoxDecoration(
                        color: _hover ? AppColors.card.withOpacity(0.5) : Colors.transparent,
                        borderRadius: BorderRadius.circular(AppSizes.radiusDefault),
                      ),
                      child: _buildContent(),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            style: AppTypography.cardTitle.copyWith(
              color: _hover ? AppColors.primary : AppColors.foreground,
            ),
            children: [
              TextSpan(text: '${widget.experience.role} '),
              TextSpan(
                text: '· ${widget.experience.company}',
                style: const TextStyle(color: AppColors.primary),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.experience.description,
          style: AppTypography.bodySm,
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: widget.experience.tags.map((tag) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.primary10,
                borderRadius: BorderRadius.circular(AppSizes.radiusFull),
              ),
              child: Text(
                tag,
                style: AppTypography.tagPill,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
