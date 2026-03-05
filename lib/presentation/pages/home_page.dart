import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:portifolio/core/theme/app_colors.dart';
import 'package:portifolio/presentation/providers/scroll_provider.dart';
import 'package:portifolio/presentation/sections/about_section.dart';
import 'package:portifolio/presentation/sections/contact_section.dart';
import 'package:portifolio/presentation/sections/experience_section.dart';
import 'package:portifolio/presentation/sections/footer_section.dart';
import 'package:portifolio/presentation/sections/hero_section.dart';
import 'package:portifolio/presentation/sections/projects_section.dart';
import 'package:portifolio/presentation/widgets/header_widget.dart';

/// Página principal do portfolio.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  DateTime _lastScrollUpdate = DateTime.now();

  final Map<String, GlobalKey> _sectionKeys = {
    'hero': GlobalKey(),
    'sobre': GlobalKey(),
    'projetos': GlobalKey(),
    'experiencia': GlobalKey(),
    'contato': GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final now = DateTime.now();
    if (now.difference(_lastScrollUpdate).inMilliseconds < 50) return;
    _lastScrollUpdate = now;

    context.read<ScrollProvider>().update(
          scrollOffset: _scrollController.offset,
          sectionIds: ['sobre', 'projetos', 'experiencia', 'contato'],
          sectionKeys: _sectionKeys,
        );
  }

  void _scrollToContact() {
    final key = _sectionKeys['contato'];
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
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: ColoredBox(
              color: AppColors.background,
              child: Column(
              children: [
                HeroSection(
                  sectionKey: _sectionKeys['hero'],
                  onCtaTap: _scrollToContact,
                ),
                AboutSection(sectionKey: _sectionKeys['sobre']),
                ProjectsSection(sectionKey: _sectionKeys['projetos']),
                ExperienceSection(sectionKey: _sectionKeys['experiencia']),
                ContactSection(sectionKey: _sectionKeys['contato']),
                const FooterSection(),
              ],
            ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: HeaderWidget(
              sectionKeys: _sectionKeys,
              scrollController: _scrollController,
            ),
          ),
        ],
      ),
    );
  }
}
