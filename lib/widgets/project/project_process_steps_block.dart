import 'package:flutter/material.dart';

import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import 'project_section_theme.dart';

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
            title,
            style: textTheme.headlineLarge?.copyWith(
              color: themeConfig.foregroundColor,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          ...steps.asMap().entries.map((entry) {
            final index = entry.key;
            final step = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadii.xl),
                  border: Border.all(color: themeConfig.borderColor),
                ),
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
                          Text(
                            step.body,
                            style: textTheme.bodyMedium?.copyWith(
                              color: themeConfig.effectiveMutedColor,
                            ),
                          ),
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