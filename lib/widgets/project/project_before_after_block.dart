import 'package:flutter/material.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import 'project_section_theme.dart';

class ProjectBeforeAfterBlock extends StatelessWidget {
  const ProjectBeforeAfterBlock({
    super.key,
    required this.themeConfig,
    required this.beforeTitle,
    required this.beforeBody,
    required this.afterTitle,
    required this.afterBody,
  });

  final ProjectSectionTheme themeConfig;
  final String beforeTitle;
  final String beforeBody;
  final String afterTitle;
  final String afterBody;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    Widget panel(String label, String title, String body) {
      return Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadii.xl),
          border: Border.all(color: themeConfig.borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: textTheme.bodySmall?.copyWith(
                color: themeConfig.accentColor,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              title,
              style: textTheme.titleLarge?.copyWith(
                color: themeConfig.foregroundColor,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              body,
              style: textTheme.bodyMedium?.copyWith(
                color: themeConfig.effectiveMutedColor,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      color: themeConfig.backgroundColor,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.section,
      ),
      child: ResponsiveBuilder(
        builder: (context, info) {
          if (info.isMobile) {
            return Column(
              children: [
                panel('Before', beforeTitle, beforeBody),
                const SizedBox(height: AppSpacing.md),
                panel('After', afterTitle, afterBody),
              ],
            );
          }

          return Row(
            children: [
              Expanded(child: panel('Before', beforeTitle, beforeBody)),
              const SizedBox(width: AppSpacing.md),
              Expanded(child: panel('After', afterTitle, afterBody)),
            ],
          );
        },
      ),
    );
  }
}