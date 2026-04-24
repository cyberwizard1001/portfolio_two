import 'package:flutter/material.dart';

import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import 'project_section_theme.dart';

/// A full-width callout for surfacing a key insight, design principle,
/// or pivotal moment in the case study narrative. Think of it as a
/// highlighted annotation — heavier than a quote, lighter than a section.
///
/// [style] controls the visual weight:
/// - [CalloutStyle.insight]  — accent-bordered left strip with icon
/// - [CalloutStyle.principle] — full accent-tinted background
/// - [CalloutStyle.warning]   — amber-tinted caution callout
class ProjectCalloutBlock extends StatelessWidget {
  const ProjectCalloutBlock({
    super.key,
    required this.themeConfig,
    required this.body,
    this.label,
    this.icon,
    this.style = CalloutStyle.insight,
  });

  final ProjectSectionTheme themeConfig;
  final String body;
  final String? label;
  final IconData? icon;
  final CalloutStyle style;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    Color bg;
    Color stripColor;
    Color labelColor;
    Color bodyColor;

    switch (style) {
      case CalloutStyle.insight:
        bg = themeConfig.accentColor.withValues(alpha: 0.07);
        stripColor = themeConfig.accentColor;
        labelColor = themeConfig.accentColor;
        bodyColor = themeConfig.foregroundColor;
        break;
      case CalloutStyle.principle:
        bg = themeConfig.accentColor.withValues(alpha: 0.14);
        stripColor = themeConfig.accentColor;
        labelColor = themeConfig.accentColor;
        bodyColor = themeConfig.foregroundColor;
        break;
      case CalloutStyle.warning:
        const warningColor = Color(0xFFD97706);
        bg = warningColor.withValues(alpha: 0.08);
        stripColor = warningColor;
        labelColor = warningColor;
        bodyColor = themeConfig.foregroundColor;
        break;
    }

    return Container(
      width: double.infinity,
      color: themeConfig.backgroundColor,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.section,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(AppRadii.xl),
          border: Border.all(color: stripColor.withValues(alpha: 0.20)),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Left accent strip
              Container(
                width: 4,
                decoration: BoxDecoration(
                  color: stripColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppRadii.xl),
                    bottomLeft: Radius.circular(AppRadii.xl),
                  ),
                ),
              ),
              // Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon
                      if (icon != null) ...[
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: stripColor.withValues(alpha: 0.12),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(icon, size: 20, color: stripColor),
                        ),
                        const SizedBox(width: AppSpacing.lg),
                      ],
                      // Text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (label != null) ...[
                              Text(
                                label!.toUpperCase(),
                                style: textTheme.labelLarge?.copyWith(
                                  color: labelColor,
                                  letterSpacing: 0.8,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.sm),
                            ],
                            Text(
                              body,
                              style: textTheme.bodyLarge?.copyWith(
                                color: bodyColor,
                                height: 1.65,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum CalloutStyle {
  insight,
  principle,
  warning,
}
