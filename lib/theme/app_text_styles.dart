import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.inter(
      fontSize: 86,
      height: 0.95,
      fontWeight: FontWeight.w500,
      color: AppColors.ink,
    ),
    displayMedium: GoogleFonts.inter(
      fontSize: 64,
      height: 0.98,
      fontWeight: FontWeight.w500,
      color: AppColors.ink,
    ),
    headlineLarge: GoogleFonts.inter(
      fontSize: 40,
      height: 1.05,
      fontWeight: FontWeight.w500,
      color: AppColors.ink,
    ),
    headlineMedium: GoogleFonts.inter(
      fontSize: 28,
      height: 1.1,
      fontWeight: FontWeight.w500,
      color: AppColors.ink,
    ),
    titleLarge: GoogleFonts.ibmPlexMono(
      fontSize: 18,
      height: 1.35,
      fontWeight: FontWeight.w500,
      color: AppColors.ink,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 18,
      height: 1.6,
      fontWeight: FontWeight.w400,
      color: AppColors.ink,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 16,
      height: 1.6,
      fontWeight: FontWeight.w400,
      color: AppColors.ink,
    ),
    bodySmall: GoogleFonts.ibmPlexMono(
      fontSize: 13,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: AppColors.inkMuted,
    ),
    labelLarge: GoogleFonts.ibmPlexMono(
      fontSize: 14,
      height: 1.2,
      fontWeight: FontWeight.w500,
      color: AppColors.ink,
      letterSpacing: 0.4,
    ),
  );
}