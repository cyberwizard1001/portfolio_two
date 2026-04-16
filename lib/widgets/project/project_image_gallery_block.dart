import 'package:flutter/material.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import 'project_section_theme.dart';

class ProjectImageGalleryBlock extends StatelessWidget {
  const ProjectImageGalleryBlock({
    super.key,
    required this.themeConfig,
    required this.title,
    required this.images,
  });

  final ProjectSectionTheme themeConfig;
  final String title;
  final List<Widget> images;

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
          final crossAxisCount = info.isMobile ? 1 : 2;

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
                itemCount: images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: AppSpacing.md,
                  mainAxisSpacing: AppSpacing.md,
                  childAspectRatio: 1.4,
                ),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadii.xl),
                    child: images[index],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}