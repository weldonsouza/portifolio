import 'package:flutter/material.dart';
import 'package:portifolio/core/constants/app_sizes.dart';
import 'package:portifolio/core/theme/app_colors.dart';
import 'package:portifolio/core/theme/app_typography.dart';
import 'package:portifolio/presentation/widgets/social_icons_widget.dart';

/// Footer com ícones sociais e créditos.
class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: AppSizes.paddingHorizontal,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.border50),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSizes.maxContentWidth),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SocialIconsWidget(size: 18, gap: 24),
              const SizedBox(height: 20),
              Text(
                'Desenvolvido por Weldon Souza',
                style: AppTypography.footerText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
