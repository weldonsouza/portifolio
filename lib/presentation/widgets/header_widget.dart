import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:portifolio/core/constants/app_sizes.dart';
import 'package:portifolio/core/theme/app_colors.dart';
import 'package:portifolio/core/theme/app_typography.dart';
import 'package:portifolio/data/datasources/portfolio_local_data.dart';
import 'package:portifolio/presentation/providers/menu_provider.dart';
import 'package:portifolio/presentation/providers/scroll_provider.dart';

/// Header fixo com logo, navegação e menu mobile.
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.sectionKeys,
    required this.scrollController,
  });

  final Map<String, GlobalKey> sectionKeys;
  final ScrollController scrollController;

  void _scrollToSection(BuildContext context, String id) {
    final key = sectionKeys[id];
    context.read<MenuProvider>().close();
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ScrollProvider, MenuProvider>(
      builder: (context, scroll, menu, _) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: scroll.isScrolled
                    ? AppColors.background.withValues(alpha: 0.85)
                    : Colors.transparent,
                border: scroll.isScrolled
                    ? Border(
                        bottom: BorderSide(
                          color: AppColors.border50,
                          width: 1,
                        ),
                      )
                    : null,
              ),
              child: scroll.isScrolled
                  ? ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                        child: _buildContent(context, scroll, menu),
                      ),
                    )
                  : _buildContent(context, scroll, menu),
            ),
            if (menu.isOpen && MediaQuery.sizeOf(context).width < AppSizes.breakpointMd)
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.background.withOpacity(0.95),
                      border: const Border(bottom: BorderSide(color: AppColors.border)),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Column(
                      children: PortfolioLocalData.navItems.asMap().entries.map((e) {
                        final i = e.key;
                        final item = e.value;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: GestureDetector(
                            onTap: () => _scrollToSection(context, item.sectionId),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('0${i + 1}.', style: AppTypography.navPrefix),
                                const SizedBox(width: 4),
                                Text(
                                  item.label,
                                  style: AppTypography.navLink.copyWith(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    ScrollProvider scroll,
    MenuProvider menu,
  ) {
    return Container(
      constraints: const BoxConstraints(maxWidth: AppSizes.maxContentWidth),
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.paddingHorizontal),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => _scrollToSection(context, 'hero'),
            child: Text('WS', style: AppTypography.logo),
          ),
          if (MediaQuery.sizeOf(context).width >= AppSizes.breakpointMd)
            Row(
              children: PortfolioLocalData.navItems.asMap().entries.map((e) {
                final i = e.key;
                final item = e.value;
                final isActive = scroll.activeSection == item.sectionId;
                return Padding(
                  padding: EdgeInsets.only(left: i > 0 ? 32 : 0),
                  child: GestureDetector(
                    onTap: () => _scrollToSection(context, item.sectionId),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '0${i + 1}.',
                          style: AppTypography.navPrefix,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          item.label,
                          style: AppTypography.navLink.copyWith(
                            color: isActive
                                ? AppColors.primary
                                : AppColors.mutedForeground,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            )
          else
            _HamburgerButton(
              isOpen: menu.isOpen,
              onTap: () => menu.toggle(),
            ),
        ],
      ),
    );
  }
}

class _HamburgerButton extends StatelessWidget {
  const _HamburgerButton({
    required this.isOpen,
    required this.onTap,
  });

  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 32,
        height: 32,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 24,
              height: 2,
              color: AppColors.foreground,
              transform: Matrix4.identity()
                ..translate(0.0, isOpen ? 4.0 : 0.0)
                ..rotateZ(isOpen ? 0.785398 : 0),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: isOpen ? 0 : 1,
              child: Container(
                width: 24,
                height: 2,
                color: AppColors.foreground,
                margin: const EdgeInsets.symmetric(vertical: 6),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 24,
              height: 2,
              color: AppColors.foreground,
              transform: Matrix4.identity()
                ..translate(0.0, isOpen ? -4.0 : 0.0)
                ..rotateZ(isOpen ? -0.785398 : 0),
            ),
          ],
        ),
      ),
    );
  }
}
