import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:portifolio/core/constants/app_sizes.dart';
import 'package:portifolio/core/theme/app_colors.dart';
import 'package:portifolio/core/theme/app_typography.dart';
import 'package:portifolio/data/datasources/portfolio_local_data.dart';
import 'package:portifolio/domain/models/featured_project_model.dart';
import 'package:portifolio/domain/models/project_model.dart';
import 'package:portifolio/presentation/widgets/section_title_widget.dart';

/// Seção de Projetos.
class ProjectsSection extends StatefulWidget {
  const ProjectsSection({
    super.key,
    this.sectionKey,
  });

  final GlobalKey? sectionKey;

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('projects_vis'),
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
                      number: '02.',
                      title: 'Projetos',
                    ),
                  ),
                ),
                const SizedBox(height: 56),
                ...PortfolioLocalData.featuredProjects.asMap().entries.map((e) {
                  final i = e.key;
                  final project = e.value;
                  return Padding(
                    padding: EdgeInsets.only(bottom: i < 2 ? 80 : 0),
                    child: AnimatedOpacity(
                      opacity: _visible ? 1 : 0,
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeOut,
                      child: AnimatedSlide(
                        offset: _visible ? Offset.zero : const Offset(0, 0.2),
                        duration: Duration(milliseconds: 700 + ((i + 1) * 150)),
                        curve: Curves.easeOut,
                        child: _FeaturedProjectCard(
                          project: project,
                          isEven: i % 2 == 0,
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 80),
                AnimatedOpacity(
                  opacity: _visible ? 1 : 0,
                  duration: const Duration(milliseconds: 700),
                  child: Center(
                    child: Text(
                      'Outros projetos relevantes',
                      style: AppTypography.projectTitle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;
                    int cols = 1;
                    if (width >= AppSizes.breakpointLg) {
                      cols = 3;
                    } else if (width >= AppSizes.breakpointSm) {
                      cols = 2;
                    }

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: cols,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: cols == 3 ? 1.18 : (cols == 2 ? 0.88 : 0.8),
                      ),
                      itemCount: PortfolioLocalData.otherProjects.length,
                      itemBuilder: (context, i) {
                        final p = PortfolioLocalData.otherProjects[i];
                        return AnimatedOpacity(
                          opacity: _visible ? 1 : 0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOut,
                          child: AnimatedSlide(
                            offset: _visible ? Offset.zero : const Offset(0, 0.15),
                            duration: Duration(milliseconds: 500 + ((i + 4) * 100)),
                            curve: Curves.easeOut,
                            child: _ProjectCard(model: p),
                          ),
                        );
                      },
                    );
                  },
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

class _FeaturedProjectCard extends StatefulWidget {
  const _FeaturedProjectCard({
    required this.project,
    required this.isEven,
  });

  final FeaturedProjectModel project;
  final bool isEven;

  @override
  State<_FeaturedProjectCard> createState() => _FeaturedProjectCardState();
}

class _FeaturedProjectCardState extends State<_FeaturedProjectCard> {
  bool _hover = false;
  static const double _imageScale = 1.22;
  static const List<double> _identityMatrix = <double>[
    1, 0, 0, 0, 0,
    0, 1, 0, 0, 0,
    0, 0, 1, 0, 0,
    0, 0, 0, 1, 0,
  ];
  static const List<double> _grayscaleMatrix = <double>[
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0, 0, 0, 1, 0,
  ];

  static List<double> _lerpMatrix(double t) {
    // t=0 => grayscale, t=1 => identidade
    final out = List<double>.filled(20, 0);
    for (var i = 0; i < 20; i++) {
      out[i] = _grayscaleMatrix[i] * (1 - t) + _identityMatrix[i] * t;
    }
    return out;
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.sizeOf(context).width >= AppSizes.breakpointMd;
    final crossAlign = widget.isEven ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final textAlign = widget.isEven ? TextAlign.right : TextAlign.left;

    if (!isDesktop) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(),
          const SizedBox(height: 16),
          _buildContent(crossAlign, textAlign),
        ],
      );
    }

    // Desktop: layout com sobreposição (equivalente ao grid 12 colunas do design)
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxW = constraints.maxWidth;
        // No layout original, imagem ~7 colunas e conteúdo ~7 colunas (com overlap).
        final imageW = (maxW * 7 / 12).clamp(520.0, maxW);
        final contentW = (maxW * 7 / 12).clamp(440.0, maxW);
        final height = imageW * 9 / 16;

        return SizedBox(
          height: height,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: widget.isEven ? 0 : null,
                right: widget.isEven ? null : 0,
                top: 0,
                bottom: 0,
                child: SizedBox(
                  width: imageW,
                  child: _buildImage(),
                ),
              ),
              Align(
                alignment: widget.isEven ? Alignment.centerRight : Alignment.centerLeft,
                child: SizedBox(
                  width: contentW,
                  child: _buildContent(crossAlign, textAlign),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImage() {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.radiusDefault),
          child: Stack(
            fit: StackFit.expand,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: _hover ? 1 : 0),
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
                builder: (context, t, child) {
                  return ColorFiltered(
                    colorFilter: ColorFilter.matrix(_lerpMatrix(t)),
                    child: Transform.scale(scale: _imageScale, child: child),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Image.asset(
                    widget.project.imageAsset,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: _hover ? 0 : 1),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                builder: (context, t, _) {
                  return ColoredBox(
                    color: AppColors.primary.withValues(alpha: 0.2 * t),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(CrossAxisAlignment crossAlign, TextAlign textAlign) {
    return Column(
      crossAxisAlignment: crossAlign,
      children: [
        Text(
          'Destaque',
          style: AppTypography.tagMono.copyWith(color: AppColors.primary),
        ),
        const SizedBox(height: 8),
        Text(
          widget.project.title,
          style: AppTypography.projectTitleDesktop(MediaQuery.of(context).size.width),
        ),
        if (widget.project.title == 'Veriqs') ...[
          const SizedBox(height: 12),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.nfc, size: 22, color: AppColors.primary),
              const SizedBox(width: 12),
              Icon(Icons.location_on, size: 22, color: AppColors.primary),
              const SizedBox(width: 8),
              Text(
                'NFC · Geolocalização',
                style: AppTypography.tagMono.copyWith(
                  color: AppColors.mutedForeground,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
        const SizedBox(height: 16),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.radiusDefault),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.backgroundCard.withOpacity(0.7),
                borderRadius: BorderRadius.circular(AppSizes.radiusDefault),
                border: Border.all(color: AppColors.border),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                widget.project.description,
                style: AppTypography.bodySm,
                textAlign: textAlign,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          alignment: widget.isEven ? WrapAlignment.end : WrapAlignment.start,
          spacing: 8,
          runSpacing: 4,
          children: widget.project.tags.map((t) => Text(
            t,
            style: AppTypography.tagMono,
          )).toList(),
        ),
      ],
    );
  }
}

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({required this.model});

  final ProjectModel model;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        transform: Matrix4.translationValues(0, _hover ? -4 : 0, 0),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.bordCardIn,
          borderRadius: BorderRadius.circular(AppSizes.radiusDefault),
          border: Border.all(
            color: _hover ? AppColors.primary30 : AppColors.border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.folder_outlined,
                  size: 36,
                  color: AppColors.primary,
                ),
                Text(
                  widget.model.type.toUpperCase(),
                  style: AppTypography.tagMono.copyWith(
                    fontSize: 10,
                    color: AppColors.mutedForeground70,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              widget.model.title,
              style: AppTypography.cardTitle.copyWith(
                color: _hover ? AppColors.primary : AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                widget.model.description,
                style: AppTypography.bodySm,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.only(top: 12),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.border50),
                ),
              ),
              child: Wrap(
                spacing: 12,
                runSpacing: 4,
                children: widget.model.tags
                    .map((t) => Text(
                          t,
                          style: AppTypography.tagMono,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
