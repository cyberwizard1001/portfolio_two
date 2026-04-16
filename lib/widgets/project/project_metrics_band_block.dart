import 'package:flutter/material.dart';

import '../../theme/app_spacing.dart';
import '../common/responsive_section.dart';
import 'project_section_theme.dart';

class ProjectMetricItem {
  final String value;
  final String label;

  const ProjectMetricItem({
    required this.value,
    required this.label,
  });
}

class ProjectMetricsBandBlock extends StatelessWidget {
  const ProjectMetricsBandBlock({
    super.key,
    required this.themeConfig,
    required this.items,
  });

  final ProjectSectionTheme themeConfig;
  final List<ProjectMetricItem> items;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: themeConfig.backgroundColor,
      child: ResponsiveSection(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.section),
          child: LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 4;
              if (constraints.maxWidth < 1100) crossAxisCount = 2;
              if (constraints.maxWidth < 640) crossAxisCount = 1;

              final totalSpacing = AppSpacing.lg * (crossAxisCount - 1);
              final itemWidth = (constraints.maxWidth - totalSpacing) / crossAxisCount;

              return Wrap(
                spacing: AppSpacing.lg,
                runSpacing: AppSpacing.xl,
                children: items.map((item) {
                  return SizedBox(
                    width: itemWidth,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(minHeight: 132),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.value,
                            maxLines: 2,
                            overflow: TextOverflow.visible,
                            style: textTheme.headlineMedium?.copyWith(
                              color: themeConfig.foregroundColor,
                              height: 1.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 220),
                            child: Text(
                              item.label,
                              style: textTheme.bodyLarge?.copyWith(
                                color: themeConfig.mutedColor,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}