import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio/core/theme/app_colors.dart';
import 'package:portifolio/data/datasources/portfolio_local_data.dart';
import 'package:url_launcher/url_launcher.dart';

/// Widget de ícones sociais reutilizável.
class SocialIconsWidget extends StatefulWidget {
  const SocialIconsWidget({
    super.key,
    this.size = 22,
    this.gap = 24,
  });

  final double size;
  final double gap;

  @override
  State<SocialIconsWidget> createState() => _SocialIconsWidgetState();
}

class _SocialIconsWidgetState extends State<SocialIconsWidget> {
  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _SocialIcon(
          size: widget.size,
          icon: FontAwesomeIcons.github,
          onTap: () => _launch(PortfolioLocalData.githubUrl),
        ),
        SizedBox(width: widget.gap),
        _SocialIcon(
          size: widget.size,
          icon: FontAwesomeIcons.linkedin,
          onTap: () => _launch(PortfolioLocalData.linkedinUrl),
        ),
        SizedBox(width: widget.gap),
        _SocialIcon(
          size: widget.size,
          icon: FontAwesomeIcons.envelope,
          onTap: () => _launch(PortfolioLocalData.email),
        ),
      ],
    );
  }
}

class _SocialIcon extends StatefulWidget {
  const _SocialIcon({
    required this.size,
    required this.icon,
    required this.onTap,
  });

  final double size;
  final IconData icon;
  final VoidCallback onTap;

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final color = _hover ? AppColors.primary : AppColors.mutedForeground;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, _hover ? -2 : 0, 0),
          child: Icon(
            widget.icon,
            size: widget.size,
            color: color,
          ),
        ),
      ),
    );
  }
}
