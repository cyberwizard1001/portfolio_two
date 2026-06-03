import 'package:flutter/material.dart';

import '../../theme/app_spacing.dart';
import 'project_section_theme.dart';

class ProjectBlockSection extends StatelessWidget {
  const ProjectBlockSection({
    super.key,
    required this.themeConfig,
    required this.child,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.xxl,
      vertical: AppSpacing.section,
    ),
  });

  final ProjectSectionTheme themeConfig;
  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: themeConfig.backgroundColor,
      padding: padding,
      child: child,
    );
  }
}
