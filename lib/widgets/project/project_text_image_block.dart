import 'package:flutter/material.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
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

    final textBlock = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow,
          style: textTheme.bodySmall?.copyWith(
            color: themeConfig.accentColor,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          title,
          style: textTheme.displayMedium?.copyWith(
            color: themeConfig.foregroundColor,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          body,
          style: textTheme.bodyLarge?.copyWith(
            color: themeConfig.effectiveMutedColor,
          ),
        ),
      ],
    );

    final imageBlock = ClipRRect(
      borderRadius: BorderRadius.circular(AppRadii.xl),
      child: image,
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

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            );
          },
        ),
      ),
    );
  }
}