import 'package:flutter/material.dart';

import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import 'project_section_theme.dart';

class ThemedCard extends StatelessWidget {
  const ThemedCard({
    super.key,
    required this.themeConfig,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.lg),
    this.backgroundColor,
    this.constraints,
  });

  final ProjectSectionTheme themeConfig;
  final Widget child;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      constraints: constraints,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        border: Border.all(color: themeConfig.borderColor),
      ),
      child: child,
    );
  }
}
