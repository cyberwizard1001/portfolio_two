import 'package:flutter/material.dart';
import 'package:portfolio_2/widgets/project/project_meta_strip_block.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import 'project_section_theme.dart';

class ProjectProblemKeyInfoBlock extends StatelessWidget {
  const ProjectProblemKeyInfoBlock({
    super.key,
    required this.themeConfig,
    required this.problemTitle,
    required this.problemBody,
    required this.contextBody,
    required this.infoItems,
  });

  final ProjectSectionTheme themeConfig;
  final String problemTitle;
  final String problemBody;
  final String contextBody;
  final List<ProjectMetaItem> infoItems;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final infoPanel = Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadii.xl),
        border: Border.all(color: themeConfig.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: infoItems.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.label,
                  style: textTheme.bodySmall?.copyWith(
                    color: themeConfig.accentColor,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  item.value,
                  style: textTheme.bodyMedium?.copyWith(
                    color: themeConfig.foregroundColor,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );

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
            final narrative = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Problem',
                  style: textTheme.titleLarge?.copyWith(
                    color: themeConfig.accentColor,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 760),
                  child: Text(
                    problemBody,
                    style: textTheme.bodyLarge?.copyWith(
                      color: themeConfig.effectiveMutedColor,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.xxl),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 820),
                  child: Text(
                    contextBody,
                    style: textTheme.headlineMedium?.copyWith(
                      color: themeConfig.foregroundColor,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            );

            if (info.isMobile) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  narrative,
                  const SizedBox(height: AppSpacing.xl),
                  infoPanel,
                ],
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 7, child: narrative),
                const SizedBox(width: AppSpacing.xxl),
                Expanded(flex: 3, child: infoPanel),
              ],
            );
          },
        ),
      ),
    );
  }
}