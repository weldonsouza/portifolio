import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:portifolio/core/constants/app_sizes.dart';
import 'package:portifolio/core/theme/app_colors.dart';
import 'package:portifolio/core/theme/app_typography.dart';
import 'package:portifolio/data/datasources/portfolio_local_data.dart';
import 'package:portifolio/domain/models/featured_project_model.dart';
import 'package:portifolio/domain/models/project_model.dart';
import 'package:portifolio/presentation/widgets/section_title_widget.dart';
import 'package:url_launcher/url_launcher.dart';

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
  late final PageController _otherProjectsController;
  Timer? _autoCarouselTimer;
  int _otherProjectsPage = 0;

  @override
  void initState() {
    super.initState();
    _otherProjectsController = PageController();
    _startOtherProjectsAutoCarousel();
  }

  @override
  void dispose() {
    _autoCarouselTimer?.cancel();
    _otherProjectsController.dispose();
    super.dispose();
  }

  void _startOtherProjectsAutoCarousel() {
    _autoCarouselTimer?.cancel();
    _autoCarouselTimer = Timer.periodic(const Duration(seconds: 12), (_) {
      if (!mounted || !_otherProjectsController.hasClients) return;

      final totalPages = (PortfolioLocalData.otherProjects.length / 6).ceil();
      if (totalPages <= 1) return;

      _otherProjectsPage = (_otherProjectsPage + 1) % totalPages;
      _otherProjectsController.animateToPage(
        _otherProjectsPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  List<List<ProjectModel>> _chunkedOtherProjects() {
    final projects = PortfolioLocalData.otherProjects;
    final chunks = <List<ProjectModel>>[];
    for (var i = 0; i < projects.length; i += 6) {
      final end = (i + 6) > projects.length ? projects.length : (i + 6);
      chunks.add(projects.sublist(i, end));
    }
    return chunks;
  }

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
                      'Outros projetos',
                      style: AppTypography.projectTitle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                _OtherProjectsCarousel(
                  visible: _visible,
                  pageController: _otherProjectsController,
                  pages: _chunkedOtherProjects(),
                  onPageChanged: (index) => _otherProjectsPage = index,
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

class _OtherProjectsCarousel extends StatelessWidget {
  const _OtherProjectsCarousel({
    required this.visible,
    required this.pageController,
    required this.pages,
    required this.onPageChanged,
  });

  final bool visible;
  final PageController pageController;
  final List<List<ProjectModel>> pages;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    if (pages.isEmpty) return const SizedBox.shrink();

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        int cols = 1;
        if (width >= AppSizes.breakpointLg) {
          cols = 3;
        } else if (width >= AppSizes.breakpointSm) {
          cols = 2;
        }

        const spacing = 16.0;
        const gridTopPadding = 6.0;
        final rows = (6 / cols).ceil();
        final itemWidth = (width - ((cols - 1) * spacing)) / cols;
        final childAspectRatio = cols == 3 ? 1.1 : (cols == 2 ? 0.88 : 0.8);
        final itemHeight = itemWidth / childAspectRatio;
        final viewportHeight = (itemHeight * rows) + (spacing * (rows - 1)) + gridTopPadding;

        return Column(
          children: [
            SizedBox(
              height: viewportHeight,
              child: PageView.builder(
                controller: pageController,
                clipBehavior: Clip.none,
                onPageChanged: onPageChanged,
                itemCount: pages.length,
                itemBuilder: (context, pageIndex) {
                  final pageProjects = pages[pageIndex];
                  return AnimatedOpacity(
                    opacity: visible ? 1 : 0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                    child: AnimatedSlide(
                      offset: visible ? Offset.zero : const Offset(0, 0.15),
                      duration: Duration(milliseconds: 500 + ((pageIndex + 4) * 100)),
                      curve: Curves.easeOut,
                      child: GridView.builder(
                        key: ValueKey('other-projects-grid-$pageIndex'),
                        itemCount: pageProjects.length,
                        primary: false,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(top: gridTopPadding),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: cols,
                          mainAxisSpacing: spacing,
                          crossAxisSpacing: spacing,
                          childAspectRatio: childAspectRatio,
                        ),
                        itemBuilder: (context, i) => _ProjectCard(model: pageProjects[i]),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: List.generate(
                pages.length,
                (i) => AnimatedBuilder(
                  animation: pageController,
                  builder: (context, _) {
                    var currentPage = 0;
                    if (pageController.hasClients && pageController.page != null) {
                      currentPage = pageController.page!.round();
                    }
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          pageController.animateToPage(
                            i,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeOut,
                          );
                        },
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: currentPage == i ? AppColors.primary : AppColors.border50,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
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

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
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
        if (_ProjectLinks.hasAny(
          playStoreUrl: widget.project.playStoreUrl,
          appStoreUrl: widget.project.appStoreUrl,
          githubUrl: widget.project.githubUrl,
          websiteUrl: widget.project.websiteUrl,
        )) ...[
          const SizedBox(height: 12),
          _ProjectLinks(
            alignEnd: widget.isEven,
            playStoreUrl: widget.project.playStoreUrl,
            appStoreUrl: widget.project.appStoreUrl,
            githubUrl: widget.project.githubUrl,
            websiteUrl: widget.project.websiteUrl,
            onOpen: _launch,
          ),
        ],
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

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        transform: Matrix4.translationValues(0, _hover ? -4 : 0, 0),
        padding: const EdgeInsets.all(20),
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
                  size: 32,
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
            const SizedBox(height: 8),
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
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8),
            if (_ProjectLinks.hasAny(
              playStoreUrl: widget.model.playStoreUrl,
              appStoreUrl: widget.model.appStoreUrl,
              githubUrl: widget.model.githubUrl,
              websiteUrl: widget.model.websiteUrl,
            )) ...[
              _ProjectLinks(
                playStoreUrl: widget.model.playStoreUrl,
                appStoreUrl: widget.model.appStoreUrl,
                githubUrl: widget.model.githubUrl,
                websiteUrl: widget.model.websiteUrl,
                onOpen: _launch,
              ),
              const SizedBox(height: 8),
            ],
            Container(
              padding: const EdgeInsets.only(top: 8),
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

class _ProjectLinks extends StatelessWidget {
  const _ProjectLinks({
    required this.onOpen,
    this.alignEnd = false,
    this.playStoreUrl,
    this.appStoreUrl,
    this.githubUrl,
    this.websiteUrl,
  });

  final bool alignEnd;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? githubUrl;
  final String? websiteUrl;
  final Future<void> Function(String url) onOpen;

  static bool _has(String? value) => value != null && value.trim().isNotEmpty;

  static bool hasAny({
    String? playStoreUrl,
    String? appStoreUrl,
    String? githubUrl,
    String? websiteUrl,
  }) {
    return _has(playStoreUrl) ||
        _has(appStoreUrl) ||
        _has(githubUrl) ||
        _has(websiteUrl);
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      if (_has(playStoreUrl))
        _LinkIconButton(
          tooltip: 'Abrir na Play Store',
          icon: FontAwesomeIcons.googlePlay,
          onTap: () => onOpen(playStoreUrl!),
        ),
      if (_has(appStoreUrl))
        _LinkIconButton(
          tooltip: 'Abrir na App Store',
          icon: FontAwesomeIcons.appStoreIos,
          onTap: () => onOpen(appStoreUrl!),
        ),
      if (_has(githubUrl))
        _LinkIconButton(
          tooltip: 'Abrir no GitHub',
          icon: FontAwesomeIcons.github,
          onTap: () => onOpen(githubUrl!),
        ),
      if (_has(websiteUrl))
        _LinkIconButton(
          tooltip: 'Abrir site',
          icon: FontAwesomeIcons.arrowUpRightFromSquare,
          onTap: () => onOpen(websiteUrl!),
        ),
    ];

    return Wrap(
      alignment: alignEnd ? WrapAlignment.end : WrapAlignment.start,
      spacing: 8,
      runSpacing: 8,
      children: items,
    );
  }
}

class _LinkIconButton extends StatefulWidget {
  const _LinkIconButton({
    required this.tooltip,
    required this.icon,
    required this.onTap,
  });

  final String tooltip;
  final IconData icon;
  final VoidCallback onTap;

  @override
  State<_LinkIconButton> createState() => _LinkIconButtonState();
}

class _LinkIconButtonState extends State<_LinkIconButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final bg = _hover ? AppColors.primary20 : AppColors.primary10;
    final iconColor = _hover ? AppColors.primary : AppColors.mutedForeground;

    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.border50),
            ),
            child: FaIcon(
              widget.icon,
              size: 12,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
