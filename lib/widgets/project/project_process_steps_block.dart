import 'package:flutter/material.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_spacing.dart';
import 'project_block_section.dart';
import 'project_section_theme.dart';
import 'themed_card.dart';

class ProjectProcessStepsBlock extends StatelessWidget {
  const ProjectProcessStepsBlock({
    super.key,
    required this.themeConfig,
    required this.title,
    required this.steps,
  });

  final ProjectSectionTheme themeConfig;
  final String title;
  final List<ProjectProcessStep> steps;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ProjectBlockSection(
      themeConfig: themeConfig,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveBuilder(
            builder: (context, info) => Text(
              title,
              style: themeConfig.sectionHeading(textTheme, isMobile: info.isMobile),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          ...steps.asMap().entries.map((entry) {
            final index = entry.key;
            final step = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: ThemedCard(
                themeConfig: themeConfig,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: themeConfig.accentColor.withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${index + 1}',
                        style: textTheme.titleLarge?.copyWith(
                          color: themeConfig.accentColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            step.title,
                            style: textTheme.titleLarge?.copyWith(
                              color: themeConfig.foregroundColor,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(step.body, style: themeConfig.mutedBody(textTheme)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class ProjectProcessStep {
  const ProjectProcessStep({
    required this.title,
    required this.body,
  });

  final String title;
  final String body;
}
