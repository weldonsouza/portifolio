import 'package:flutter/material.dart';
import 'package:portifolio/core/constants/app_sizes.dart';
import 'package:portifolio/core/theme/app_colors.dart';
import 'package:portifolio/core/theme/app_typography.dart';
import 'package:portifolio/core/utils/responsive.dart';
import 'package:portifolio/presentation/widgets/phone_mockup_widget.dart';
import 'package:portifolio/presentation/widgets/social_icons_widget.dart';

/// Seção Hero com apresentação e mockup do app.
class HeroSection extends StatefulWidget {
  const HeroSection({
    super.key,
    this.sectionKey,
    this.onCtaTap,
  });

  final GlobalKey? sectionKey;
  final VoidCallback? onCtaTap;

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) setState(() => _visible = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = screenWidth(context);
    final isDesktop = width >= AppSizes.breakpointMd;

    return SizedBox(
        key: widget.sectionKey,
        height: MediaQuery.of(context).size.height,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingHorizontal),
          child: Stack(
          children: [
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: AppSizes.maxContentWidth),
                child: isDesktop
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: _buildText(width)),
                          const SizedBox(width: 48),
                          AnimatedOpacity(
                            opacity: _visible ? 1 : 0,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeOut,
                            child: AnimatedSlide(
                              offset: _visible ? Offset.zero : const Offset(0, 0.3),
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.easeOut,
                              child: const PhoneMockupWidget(),
                            ),
                          ),
                        ],
                      )
                    : _buildText(width),
              ),
            ),
          ],
          ),
        ),
      );
  }

  Widget _buildText(double width) {
    return AnimatedOpacity(
      opacity: _visible ? 1 : 0,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOut,
      child: AnimatedSlide(
        offset: _visible ? Offset.zero : const Offset(0, 0.15),
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOut,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Olá, meu nome é',
              style: AppTypography.labelMono,
            ),
            const SizedBox(height: 20),
            Text(
              'Weldon Souza.',
              style: AppTypography.heroTitleDesktop(width),
            ),
            const SizedBox(height: 8),
            Text(
              'Eu projeto arquiteturas mobile escaláveis.',
              style: AppTypography.heroSubtitleDesktop(width),
            ),
            const SizedBox(height: 24),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: width > 576 ? 576 : double.infinity),
              child: RichText(
                text: TextSpan(
                  style: AppTypography.bodyLg,
                  children: [
                    const TextSpan(text: 'Engenheiro de Software Mobile com '),
                    TextSpan(
                      text: '10+ anos de experiência',
                      style: AppTypography.bodyLg.copyWith(
                        color: AppColors.foreground,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const TextSpan(
                      text: ', base sólida em Android Nativo. ',
                    ),
                    TextSpan(
                      text: 'White Label Architect',
                      style: AppTypography.bodyLg.copyWith(
                        color: AppColors.foreground,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const TextSpan(text: ' e '),
                    TextSpan(
                      text: 'Especialista em Flutter',
                      style: AppTypography.bodyLg.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const TextSpan(
                      text: ' desde antes da versão 1.0. Focado em Clean Architecture, modularização e soluções que escalam.',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            const SocialIconsWidget(size: 22, gap: 24),
            const SizedBox(height: 40),
            _CtaButton(
              label: 'Vamos conversar?',
              onTap: widget.onCtaTap ?? () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _CtaButton extends StatefulWidget {
  const _CtaButton({
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  State<_CtaButton> createState() => _CtaButtonState();
}

class _CtaButtonState extends State<_CtaButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary),
            borderRadius: BorderRadius.circular(AppSizes.radiusButton),
            color: _hover ? AppColors.primary10 : Colors.transparent,
          ),
          child: Text(
            widget.label,
            style: AppTypography.ctaButton,
          ),
        ),
      ),
    );
  }
}
