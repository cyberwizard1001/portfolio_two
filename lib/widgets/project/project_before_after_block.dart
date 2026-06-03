import 'package:flutter/material.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_spacing.dart';
import 'project_block_section.dart';
import 'project_section_theme.dart';
import 'themed_card.dart';

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
      return ThemedCard(
        themeConfig: themeConfig,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: themeConfig.accentLabel(textTheme)),
            const SizedBox(height: AppSpacing.sm),
            Text(
              title,
              style: textTheme.titleLarge?.copyWith(
                color: themeConfig.foregroundColor,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(body, style: themeConfig.mutedBody(textTheme)),
          ],
        ),
      );
    }

    return ProjectBlockSection(
      themeConfig: themeConfig,
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
