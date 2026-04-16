import 'package:flutter/material.dart';

import '../../theme/app_spacing.dart';
import 'project_section_theme.dart';

class ProjectQuoteBlock extends StatelessWidget {
  const ProjectQuoteBlock({
    super.key,
    required this.themeConfig,
    required this.quote,
    this.attribution,
  });

  final ProjectSectionTheme themeConfig;
  final String quote;
  final String? attribution;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      color: themeConfig.backgroundColor,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.section,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '“$quote”',
            style: textTheme.displayMedium?.copyWith(
              color: themeConfig.foregroundColor,
              height: 1.15,
            ),
          ),
          if (attribution != null) ...[
            const SizedBox(height: AppSpacing.md),
            Text(
              attribution!,
              style: textTheme.bodySmall?.copyWith(
                color: themeConfig.accentColor,
              ),
            ),
          ],
        ],
      ),
    );
  }
}