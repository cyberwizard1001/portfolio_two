import 'package:flutter/material.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import 'project_block_section.dart';
import 'project_section_theme.dart';

class ProjectTextImageBlock extends StatelessWidget {
  const ProjectTextImageBlock({
    super.key,
    required this.themeConfig,
    required this.eyebrow,
    required this.title,
    required this.body,
    required this.image,
    this.reverse = false,
  });

  final ProjectSectionTheme themeConfig;
  final String eyebrow;
  final String title;
  final String body;
  final Widget image;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final imageBlock = ClipRRect(
      borderRadius: BorderRadius.circular(AppRadii.xl),
      child: image,
    );

    return ProjectBlockSection(
      themeConfig: themeConfig,
      child: ResponsiveBuilder(
        builder: (context, info) {
          final textBlock = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(eyebrow, style: themeConfig.accentLabel(textTheme)),
              const SizedBox(height: AppSpacing.md),
              Text(
                title,
                style: (info.isMobile
                        ? textTheme.headlineMedium
                        : textTheme.displayMedium)
                    ?.copyWith(color: themeConfig.foregroundColor),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(body, style: themeConfig.mutedBody(textTheme)),
            ],
          );

          if (info.isMobile) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textBlock,
                const SizedBox(height: AppSpacing.xl),
                imageBlock,
              ],
            );
          }

          final children = reverse
              ? [
                  Expanded(child: imageBlock),
                  const SizedBox(width: AppSpacing.xl),
                  Expanded(child: textBlock),
                ]
              : [
                  Expanded(child: textBlock),
                  const SizedBox(width: AppSpacing.xl),
                  Expanded(child: imageBlock),
                ];

          return Row(crossAxisAlignment: CrossAxisAlignment.start, children: children);
        },
      ),
    );
  }
}
