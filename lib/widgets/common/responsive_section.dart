import 'package:flutter/material.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_spacing.dart';

class ResponsiveSection extends StatelessWidget {
  const ResponsiveSection({
    super.key,
    required this.child,
    this.maxWidth = 1320,
    this.padding,
  });

  final Widget child;
  final double maxWidth;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, info) {
        final horizontal = info.isDesktop
            ? AppSpacing.xxxl
            : info.isSmallDesktop
            ? AppSpacing.xxl
            : info.isTablet
            ? AppSpacing.xl
            : AppSpacing.md;

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Padding(
              padding: padding ?? EdgeInsets.symmetric(horizontal: horizontal),
              child: child,
            ),
          ),
        );
      },
    );
  }
}