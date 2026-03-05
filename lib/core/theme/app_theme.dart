import 'package:flutter/material.dart';
import 'package:portifolio/core/theme/app_colors.dart';

/// Tema global da aplicação.
class AppTheme {
  AppTheme._();

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          onPrimary: AppColors.background,
          surface: AppColors.background,
          onSurface: AppColors.foreground,
          outline: AppColors.border,
        ),
      );
}
