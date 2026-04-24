import 'package:flutter/material.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import 'project_section_theme.dart';

/// A grid of "How might we…" questions, used in define / ideate phases.
/// Each card shows the HMW statement and an optional theme tag.
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

    return Container(
      width: double.infinity,
      color: themeConfig.backgroundColor,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.section,
      ),
      child: ResponsiveBuilder(
        builder: (context, info) {
          final columns = info.isMobile ? 1 : info.isTablet ? 2 : 3;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: textTheme.headlineLarge?.copyWith(
                            color: themeConfig.foregroundColor,
                          ),
                        ),
                        if (intro != null) ...[
                          const SizedBox(height: AppSpacing.sm),
                          Text(
                            intro!,
                            style: textTheme.bodyLarge?.copyWith(
                              color: themeConfig.effectiveMutedColor,
                              height: 1.6,
                            ),
                          ),
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
                      style: textTheme.bodySmall?.copyWith(
                        color: themeConfig.accentColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xl),

              // Grid
              _HmwGrid(
                items: items,
                columns: columns,
                themeConfig: themeConfig,
              ),
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
    final textTheme = Theme.of(context).textTheme;
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
                  padding: EdgeInsets.only(
                    right: isLast ? 0 : AppSpacing.md,
                  ),
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

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadii.xl),
        border: Border.all(color: themeConfig.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Accent quote mark
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
              child: Text(
                item.theme!,
                style: textTheme.bodySmall?.copyWith(
                  color: themeConfig.accentColor,
                ),
              ),
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
