import 'package:flutter/material.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import 'project_block_section.dart';
import 'project_section_theme.dart';
import 'themed_card.dart';

class ProjectHowMightWeBlock extends StatelessWidget {
  const ProjectHowMightWeBlock({
    super.key,
    required this.themeConfig,
    required this.items,
    this.title = 'How might we…',
    this.intro,
  });

  final ProjectSectionTheme themeConfig;
  final List<ProjectHmwItem> items;
  final String title;
  final String? intro;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ProjectBlockSection(
      themeConfig: themeConfig,
      child: ResponsiveBuilder(
        builder: (context, info) {
          final columns = info.isMobile ? 1 : info.isTablet ? 2 : 3;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: themeConfig.sectionHeading(textTheme, isMobile: info.isMobile),
                        ),
                        if (intro != null) ...[
                          const SizedBox(height: AppSpacing.sm),
                          Text(intro!, style: themeConfig.mutedBody(textTheme, height: 1.6)),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSpacing.lg),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: themeConfig.accentColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(AppRadii.pill),
                      border: Border.all(
                        color: themeConfig.accentColor.withValues(alpha: 0.22),
                      ),
                    ),
                    child: Text(
                      '${items.length} questions',
                      style: themeConfig.accentLabel(textTheme),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xl),
              _HmwGrid(items: items, columns: columns, themeConfig: themeConfig),
            ],
          );
        },
      ),
    );
  }
}

class _HmwGrid extends StatelessWidget {
  const _HmwGrid({
    required this.items,
    required this.columns,
    required this.themeConfig,
  });

  final List<ProjectHmwItem> items;
  final int columns;
  final ProjectSectionTheme themeConfig;

  @override
  Widget build(BuildContext context) {
    final rows = <List<ProjectHmwItem>>[];
    for (var i = 0; i < items.length; i += columns) {
      rows.add(items.sublist(i, (i + columns).clamp(0, items.length)));
    }

    return Column(
      children: rows.map((row) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: row.asMap().entries.map((e) {
              final item = e.value;
              final isLast = e.key == row.length - 1;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: isLast ? 0 : AppSpacing.md),
                  child: _HmwCard(item: item, themeConfig: themeConfig),
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}

class _HmwCard extends StatelessWidget {
  const _HmwCard({required this.item, required this.themeConfig});

  final ProjectHmwItem item;
  final ProjectSectionTheme themeConfig;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ThemedCard(
      themeConfig: themeConfig,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '"',
            style: textTheme.displayMedium?.copyWith(
              color: themeConfig.accentColor,
              height: 0.8,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            item.question,
            style: textTheme.bodyLarge?.copyWith(
              color: themeConfig.foregroundColor,
              height: 1.5,
            ),
          ),
          if (item.theme != null) ...[
            const SizedBox(height: AppSpacing.md),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xxs,
              ),
              decoration: BoxDecoration(
                color: themeConfig.accentColor.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(AppRadii.pill),
              ),
              child: Text(item.theme!, style: themeConfig.accentLabel(textTheme)),
            ),
          ],
        ],
      ),
    );
  }
}

class ProjectHmwItem {
  const ProjectHmwItem({
    required this.question,
    this.theme,
  });

  final String question;
  final String? theme;
}
