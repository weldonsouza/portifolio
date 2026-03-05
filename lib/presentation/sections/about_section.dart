import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:portifolio/core/constants/app_sizes.dart';
import 'package:portifolio/core/theme/app_colors.dart';
import 'package:portifolio/core/theme/app_typography.dart';
import 'package:portifolio/data/datasources/portfolio_local_data.dart';
import 'package:portifolio/domain/models/highlight_model.dart';
import 'package:portifolio/presentation/widgets/section_title_widget.dart';

/// Seção Sobre mim.
class AboutSection extends StatefulWidget {
  const AboutSection({
    super.key,
    this.sectionKey,
  });

  final GlobalKey? sectionKey;

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('about_vis'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.15 && !_visible) {
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
                      number: '01.',
                      title: 'Sobre mim',
                    ),
                  ),
                ),
                const SizedBox(height: 56),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;
                    final isDesktop = width >= AppSizes.breakpointMd;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isDesktop ? 4 : 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: isDesktop ? 2.4 : 1.4,
                      ),
                      itemCount: PortfolioLocalData.highlights.length,
                      itemBuilder: (context, i) {
                        final h = PortfolioLocalData.highlights[i];
                        return AnimatedOpacity(
                          opacity: _visible ? 1 : 0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOut,
                          child: AnimatedSlide(
                            offset: _visible ? Offset.zero : const Offset(0, 0.1),
                            duration: Duration(milliseconds: 500 + (i * 100)),
                            curve: Curves.easeOut,
                            child: _HighlightCard(model: h, width: width),
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 56),
                AnimatedOpacity(
                  opacity: _visible ? 1 : 0,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeOut,
                  child: AnimatedSlide(
                    offset: _visible ? Offset.zero : const Offset(0, 0.15),
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeOut,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final isDesktop = constraints.maxWidth >= AppSizes.breakpointMd;
                        return isDesktop
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: _buildParagraphs(),
                                  ),
                                  const SizedBox(width: 48),
                                  Expanded(
                                    flex: 2,
                                    child: _buildTechAndCerts(),
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildParagraphs(),
                                  const SizedBox(height: 32),
                                  _buildTechAndCerts(),
                                ],
                              );
                      },
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

  Widget _buildParagraphs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: AppTypography.body,
            children: [
              const TextSpan(text: 'Sou um Engenheiro de Software Mobile com '),
              TextSpan(
                text: '10+ anos de experiência',
                style: AppTypography.body.copyWith(
                  color: AppColors.foreground,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const TextSpan(
                text: ', movido pelo desafio de transformar ideias em produtos de alta performance. Minha base sólida vem do desenvolvimento ',
              ),
              TextSpan(
                text: 'Android Nativo',
                style: AppTypography.body.copyWith(
                  color: AppColors.foreground,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const TextSpan(text: ', mas foi no '),
              TextSpan(
                text: 'Flutter',
                style: AppTypography.body.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const TextSpan(
                text: ' que encontrei a oportunidade de escalar resultados.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        RichText(
          text: TextSpan(
            style: AppTypography.body,
            children: [
              const TextSpan(text: 'Sou '),
              TextSpan(
                text: 'Early Adopter do Flutter',
                style: AppTypography.body.copyWith(
                  color: AppColors.foreground,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const TextSpan(
                text: ', tendo iniciado meus estudos desde antes da versão 1.0, em 2018. Essa migração foi uma decisão estratégica para entregar soluções robustas tanto para Android quanto para iOS com uma única base de código.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        RichText(
          text: TextSpan(
            style: AppTypography.body,
            children: [
              const TextSpan(
                text: 'Ao longo da última década, tenho auxiliado empresas a crescerem de forma consistente e rápida, aplicando arquiteturas sustentáveis e foco total no usuário. Sou pós-graduado em ',
              ),
              TextSpan(
                text: 'Desenvolvimento Mobile',
                style: AppTypography.body.copyWith(
                  color: AppColors.foreground,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const TextSpan(text: ' pela Estácio e Bacharel em '),
              TextSpan(
                text: 'Ciência da Computação',
                style: AppTypography.body.copyWith(
                  color: AppColors.foreground,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const TextSpan(text: ' pela Facima.'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTechAndCerts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tecnologias:',
          style: AppTypography.bodySm.copyWith(
            color: AppColors.foreground,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final colWidth = constraints.maxWidth.isFinite && constraints.maxWidth > 48
                ? (constraints.maxWidth - 24) / 2
                : 200.0;
            return Wrap(
              spacing: 24,
              runSpacing: 8,
              children: PortfolioLocalData.techs.map((tech) {
                return SizedBox(
                  width: colWidth,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\u{25B6}',
                        style: AppTypography.tagMono.copyWith(
                          fontSize: 12,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          tech,
                          style: AppTypography.bodySm,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.bordCardIn,
            borderRadius: BorderRadius.circular(AppSizes.radiusDefault),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Certificações',
                style: AppTypography.tagMono.copyWith(
                  color: AppColors.mutedForeground,
                ),
              ),
              const SizedBox(height: 8),
              ...PortfolioLocalData.certifications.map((cert) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          width: 4,
                          height: 4,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            cert,
                            style: AppTypography.bodyXs,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class _HighlightCard extends StatefulWidget {
  const _HighlightCard({
    required this.model,
    required this.width,
  });

  final HighlightModel model;
  final double width;

  @override
  State<_HighlightCard> createState() => _HighlightCardState();
}

class _HighlightCardState extends State<_HighlightCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final width = widget.width;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.bordCardIn,
          borderRadius: BorderRadius.circular(AppSizes.radiusDefault),
          border: Border.all(
            color: _hover ? AppColors.primary30 : AppColors.border,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.model.number,
              style: AppTypography.highlightNumberDesktop(width),
            ),
            const SizedBox(height: 4),
            Text(
              widget.model.label,
              style: AppTypography.bodyXs,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
