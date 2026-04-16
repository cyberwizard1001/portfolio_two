import 'package:flutter/material.dart';

import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import '../common/responsive_section.dart';
import 'project_section_theme.dart';

class ProjectMetaItem {
  final String label;
  final String value;

  const ProjectMetaItem({
    required this.label,
    required this.value,
  });
}

class ProjectMetaStripBlock extends StatelessWidget {
  const ProjectMetaStripBlock({
    super.key,
    required this.themeConfig,
    required this.items,
  });

  final ProjectSectionTheme themeConfig;
  final List<ProjectMetaItem> items;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: themeConfig.backgroundColor,
      child: ResponsiveSection(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 720;
              final itemWidth = isMobile
                  ? constraints.maxWidth
                  : (constraints.maxWidth - (AppSpacing.md * (items.length - 1))) / items.length;

              return Wrap(
                spacing: AppSpacing.md,
                runSpacing: AppSpacing.md,
                children: items.map((item) {
                  return SizedBox(
                    width: itemWidth,
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 116),
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadii.xl),
                        border: Border.all(color: themeConfig.borderColor),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            item.label,
                            style: textTheme.labelMedium?.copyWith(
                              color: themeConfig.accentColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Text(
                            item.value,
                            style: textTheme.titleMedium?.copyWith(
                              color: themeConfig.foregroundColor,
                              height: 1.45,
                              fontWeight: FontWeight.w400,
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