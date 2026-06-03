import 'package:flutter/material.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_spacing.dart';
import 'project_block_section.dart';
import 'project_section_theme.dart';

class ProjectIntroBlock extends StatelessWidget {
  const ProjectIntroBlock({
    super.key,
    required this.themeConfig,
    required this.eyebrow,
    required this.title,
    required this.summary,
    this.trailingLabel,
  });

  final ProjectSectionTheme themeConfig;
  final String eyebrow;
  final String title;
  final String summary;
  final String? trailingLabel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ProjectBlockSection(
      themeConfig: themeConfig,
      child: ResponsiveBuilder(
        builder: (context, info) {
          return ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1180),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(eyebrow, style: themeConfig.accentLabel(textTheme)),
                    const Spacer(),
                    if (trailingLabel != null)
                      Text(
                        trailingLabel!,
                        style: textTheme.bodySmall?.copyWith(
                          color: themeConfig.effectiveMutedColor,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  title,
                  style: (info.isMobile
                          ? textTheme.headlineMedium
                          : textTheme.displayLarge)
                      ?.copyWith(color: themeConfig.foregroundColor),
                ),
                const SizedBox(height: AppSpacing.lg),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 760),
                  child: Text(summary, style: themeConfig.mutedBody(textTheme)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
