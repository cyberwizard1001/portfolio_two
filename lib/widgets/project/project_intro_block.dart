import 'package:flutter/material.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_spacing.dart';
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

    return Container(
      width: double.infinity,
      color: themeConfig.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xxl,
          vertical: AppSpacing.section,
        ),
        child: ResponsiveBuilder(
          builder: (context, info) {
            return ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1180),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        eyebrow,
                        style: textTheme.bodySmall?.copyWith(
                          color: themeConfig.accentColor,
                        ),
                      ),
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
                        ? textTheme.headlineLarge
                        : textTheme.displayLarge)
                        ?.copyWith(
                      color: themeConfig.foregroundColor,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 760),
                    child: Text(
                      summary,
                      style: textTheme.bodyLarge?.copyWith(
                        color: themeConfig.effectiveMutedColor,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}