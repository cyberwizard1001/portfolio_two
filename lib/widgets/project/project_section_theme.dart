import 'package:flutter/material.dart';

class ProjectSectionTheme {
  const ProjectSectionTheme({
    required this.backgroundColor,
    required this.foregroundColor,
    this.accentColor = const Color(0xFFFB6000),
    this.borderColor = const Color(0x1A000000),
    this.mutedColor,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final Color accentColor;
  final Color borderColor;
  final Color? mutedColor;

  Color get effectiveMutedColor =>
      mutedColor ?? foregroundColor.withValues(alpha: 0.72);

  TextStyle? accentLabel(TextTheme t) =>
      t.bodySmall?.copyWith(color: accentColor);

  TextStyle? mutedBody(TextTheme t, {double? height}) =>
      t.bodyLarge?.copyWith(color: effectiveMutedColor, height: height);

  TextStyle? sectionHeading(TextTheme t, {bool isMobile = false}) =>
      (isMobile ? t.headlineMedium : t.headlineLarge)
          ?.copyWith(color: foregroundColor);
}