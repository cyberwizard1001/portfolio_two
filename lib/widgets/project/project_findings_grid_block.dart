import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_spacing.dart';
import 'project_block_section.dart';
import 'project_section_theme.dart';
import 'themed_card.dart';

class ProjectFindingsGridBlock extends StatelessWidget {
  const ProjectFindingsGridBlock({
    super.key,
    required this.themeConfig,
    required this.title,
    required this.items,
  });

  final ProjectSectionTheme themeConfig;
  final String title;
  final List<ProjectFindingItem> items;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ProjectBlockSection(
      themeConfig: themeConfig,
      child: ResponsiveBuilder(
        builder: (context, info) {
          final crossAxisCount = info.isMobile ? 1 : info.isTablet ? 2 : 3;
          final rowCount = (items.length / crossAxisCount).ceil();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: themeConfig.sectionHeading(textTheme, isMobile: info.isMobile),
              ),
              const SizedBox(height: AppSpacing.xl),
              LayoutGrid(
                columnSizes: List.generate(crossAxisCount, (_) => 1.fr),
                rowSizes: List.generate(rowCount, (_) => auto),
                columnGap: AppSpacing.md,
                rowGap: AppSpacing.md,
                children: [
                  for (final item in items)
                    ThemedCard(
                      themeConfig: themeConfig,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item.title,
                            style: textTheme.titleLarge?.copyWith(
                              color: themeConfig.accentColor,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Text(item.body, style: themeConfig.mutedBody(textTheme)),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class ProjectFindingItem {
  const ProjectFindingItem({
    required this.title,
    required this.body,
  });

  final String title;
  final String body;
}
