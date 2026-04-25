import 'package:flutter/material.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import 'project_section_theme.dart';

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
            final crossAxisCount = info.isMobile
                ? 1
                : info.isTablet
                ? 2
                : 3;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.headlineLarge?.copyWith(
                    color: themeConfig.foregroundColor,
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: AppSpacing.md,
                    mainAxisSpacing: AppSpacing.md,
                    childAspectRatio: info.isMobile ? 0.9 : 1.1,
                  ),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Container(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadii.xl),
                        border: Border.all(color: themeConfig.borderColor),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: textTheme.titleLarge?.copyWith(
                              color: themeConfig.accentColor,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Text(
                            item.body,
                            style: textTheme.bodyMedium?.copyWith(
                              color: themeConfig.effectiveMutedColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
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