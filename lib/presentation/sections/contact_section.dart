import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:portifolio/core/constants/app_sizes.dart';
import 'package:portifolio/core/theme/app_colors.dart';
import 'package:portifolio/core/theme/app_typography.dart';
import 'package:portifolio/core/utils/responsive.dart';
import 'package:portifolio/data/datasources/portfolio_local_data.dart';
import 'package:url_launcher/url_launcher.dart';

/// Seção de Contato.
class ContactSection extends StatefulWidget {
  const ContactSection({
    super.key,
    this.sectionKey,
  });

  final GlobalKey? sectionKey;

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('contact_vis'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_visible) {
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
            constraints: const BoxConstraints(maxWidth: AppSizes.maxContentWidthNarrow),
            child: AnimatedOpacity(
              opacity: _visible ? 1 : 0,
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOut,
              child: AnimatedSlide(
                offset: _visible ? Offset.zero : const Offset(0, 0.15),
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeOut,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '04. E agora?',
                      style: AppTypography.labelMono,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Vamos conversar?',
                      style: AppTypography.contactTitleDesktop(
                        screenWidth(context),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Estou sempre aberto a novas oportunidades e projetos interessantes. Se você tem uma ideia de app ou quer conversar sobre como posso ajudar seu projeto a escalar, entre em contato.',
                      style: AppTypography.bodyLg,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    _CtaButton(
                      label: 'Enviar mensagem',
                      onTap: () async {
                        final uri = Uri.parse(PortfolioLocalData.email);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
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
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary),
            borderRadius: BorderRadius.circular(AppSizes.radiusButton),
            color: _hover ? AppColors.primary10 : Colors.transparent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: AppTypography.ctaButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
