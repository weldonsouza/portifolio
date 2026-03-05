import 'package:flutter/material.dart';
import 'package:portifolio/core/theme/app_colors.dart';

/// Mockup de smartphone com conteúdo simulado.
/// Design: corpo preto, bordas finas, brilho esverdeado nas bordas.
/// Tela interna: cinza muito escuro distinto do background.
/// Números e labels em branco, mini cards com fundo escuro e borda sutil verde.
class PhoneMockupWidget extends StatelessWidget {
  const PhoneMockupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Glow sutil ao redor do celular
        Container(
          width: 320,
          height: 560,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                AppColors.primary.withValues(alpha: 0.08),
                AppColors.primary.withValues(alpha: 0.02),
                Colors.transparent,
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
        ),
        // Phone frame - preto com bordas finas e brilho esverdeado
        Container(
          width: 224,
          height: 460,
          decoration: BoxDecoration(
            color: AppColors.bordCardIn,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: AppColors.mockupBord.withValues(alpha: 0.9),
              width: 4,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.15),
                blurRadius: 24,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                blurRadius: 25,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          padding: const EdgeInsets.all(12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Screen content - cinza muito escuro
                    Expanded(
                      child: Container(
                        color: AppColors.mockupBg,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Status bar - texto branco
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '9:40',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'JetBrains Mono',
                                      color: AppColors.foreground30,
                                      letterSpacing: 1
                                    ),
                                  ),
                                  Container(
                                    width: 14,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.foreground.withValues(alpha: 0.5)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        width: 8,
                                        height: 6,
                                        margin: const EdgeInsets.all(1),
                                        decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // App content
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // WS - círculo verde-azulado com texto BRANCO
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary10,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'WS',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'JetBrains Mono',
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  // Placeholder bars - cinza escuro
                                  Container(
                                    width: 96,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: AppColors.foreground.withValues(alpha: 0.2),
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    width: 128,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: AppColors.foreground.withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _MiniCard(
                                          number: '10+',
                                          label: 'Anos exp.',
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: _MiniCard(
                                          number: '30+',
                                          label: 'Apps',
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  ...['Flutter', 'Dart', 'Clean Arch'].map(
                                    (t) => Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 6,
                                            height: 6,
                                            decoration: const BoxDecoration(
                                              color: AppColors.primary,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            t,
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontFamily: 'JetBrains Mono',
                                              color: AppColors.foreground30,
                                              letterSpacing: 1
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: LayoutBuilder(
                                              builder: (context, constraints) {
                                                return Stack(
                                                  children: [
                                                    Container(
                                                      height: 4,
                                                      decoration: BoxDecoration(
                                                        color: AppColors.primary20,
                                                        borderRadius: BorderRadius.circular(999),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: constraints.maxWidth * 0.85,
                                                      child: Container(
                                                        height: 4,
                                                        decoration: BoxDecoration(
                                                          color: AppColors.primary,
                                                          borderRadius: BorderRadius.circular(999),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            // Bottom bar
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 12),
                              child: Center(
                                child: Container(
                                  width: 32,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: AppColors.foreground.withValues(alpha: 0.25),
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MiniCard extends StatelessWidget {
  const _MiniCard({
    required this.number,
    required this.label,
  });

  final String number;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.mockupCardBg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.25),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              fontFamily: 'JetBrains Mono',
              color: AppColors.primary,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 8,
              fontFamily: 'JetBrains Mono',
              color: AppColors.mutedForeground,
            ),
          ),
        ],
      ),
    );
  }
}
