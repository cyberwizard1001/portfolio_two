import 'package:flutter/material.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_spacing.dart';
import 'project_block_section.dart';
import 'project_section_theme.dart';

class ProjectLearningsBlock extends StatelessWidget {
  const ProjectLearningsBlock({
    super.key,
    required this.themeConfig,
    required this.title,
    required this.points,
  });

  final ProjectSectionTheme themeConfig;
  final String title;
  final List<String> points;

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
          ...points.map(
            (point) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: themeConfig.accentColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Text(point, style: themeConfig.mutedBody(textTheme)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
