import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio/core/theme/app_colors.dart';

/// Estilos tipográficos do Design System.
class AppTypography {
  AppTypography._();

  static TextStyle get heroTitle => GoogleFonts.inter(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        height: 1.1,
        letterSpacing: -0.5,
        color: AppColors.foreground,
      );

  static TextStyle heroTitleDesktop(double width) => width >= 768
      ? heroTitle.copyWith(fontSize: 72)
      : heroTitle;

  static TextStyle get heroSubtitle => GoogleFonts.inter(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        height: 1.1,
        letterSpacing: -0.5,
        color: AppColors.mutedForeground,
      );

  static TextStyle heroSubtitleDesktop(double width) => width >= 768
      ? heroSubtitle.copyWith(fontSize: 48)
      : heroSubtitle;

  static TextStyle get sectionTitle => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 1.2,
        color: AppColors.foreground,
      );

  static TextStyle sectionTitleDesktop(double width) => width >= 768
      ? sectionTitle.copyWith(fontSize: 30)
      : sectionTitle;

  static TextStyle get sectionNumber => GoogleFonts.jetBrainsMono(
        fontSize: 14,
        color: AppColors.primary,
      );

  static TextStyle get labelMono => GoogleFonts.jetBrainsMono(
        fontSize: 14,
        letterSpacing: 0.8,
        color: AppColors.primary,
      );

  static TextStyle get bodyLg => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: AppColors.mutedForeground,
      );

  static TextStyle get body => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: AppColors.mutedForeground,
      );

  static TextStyle get bodySm => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: AppColors.mutedForeground,
      );

  static TextStyle get bodyXs => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: AppColors.mutedForeground,
      );

  static TextStyle get projectTitle => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 1.3,
        color: AppColors.foreground,
      );

  static TextStyle projectTitleDesktop(double width) => width >= 768
      ? projectTitle.copyWith(fontSize: 24)
      : projectTitle;

  static TextStyle get cardTitle => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.4,
        color: AppColors.foreground,
      );

  static TextStyle get highlightNumber => GoogleFonts.jetBrainsMono(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 1.2,
        color: AppColors.primary,
      );

  static TextStyle highlightNumberDesktop(double width) => width >= 768
      ? highlightNumber.copyWith(fontSize: 30)
      : highlightNumber;

  static TextStyle get tagMono => GoogleFonts.jetBrainsMono(
        fontSize: 12,
        height: 1.2,
        color: AppColors.mutedForeground,
      );

  static TextStyle get tagPill => GoogleFonts.jetBrainsMono(
        fontSize: 12,
        height: 1.2,
        color: AppColors.primary,
      );

  static TextStyle get logo => GoogleFonts.jetBrainsMono(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
        color: AppColors.primary,
      );

  static TextStyle get navLink => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.mutedForeground,
      );

  static TextStyle get navPrefix => GoogleFonts.jetBrainsMono(
        fontSize: 12,
        color: AppColors.primary,
      );

  static TextStyle get contactTitle => GoogleFonts.inter(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        height: 1.1,
        color: AppColors.foreground,
      );

  static TextStyle contactTitleDesktop(double width) => width >= 768
      ? contactTitle.copyWith(fontSize: 48)
      : contactTitle;

  static TextStyle get footerText => GoogleFonts.jetBrainsMono(
        fontSize: 12,
        height: 1.4,
        color: AppColors.mutedForeground,
      );

  static TextStyle get experiencePeriod => GoogleFonts.jetBrainsMono(
        fontSize: 12,
        color: AppColors.mutedForeground,
      );

  static TextStyle get ctaButton => GoogleFonts.jetBrainsMono(
        fontSize: 14,
        color: AppColors.primary,
      );
}
