import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import '../../widgets/common/responsive_section.dart';

class ProjectDemoBlockLabel extends StatelessWidget {
  const ProjectDemoBlockLabel({
    super.key,
    required this.fileName,
    required this.className,
    required this.usageNote,
    required this.child,
  });

  final String fileName;
  final String className;
  final String usageNote;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveSection(
          child: Padding(
            padding: const EdgeInsets.only(
              top: AppSpacing.xxl,
              bottom: AppSpacing.md,
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F1EA),
                borderRadius: BorderRadius.circular(AppRadii.xl),
                border: Border.all(
                  color: Colors.black.withValues(alpha: 0.08),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x12000000),
                    blurRadius: 24,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fileName,
                    style: textTheme.labelSmall?.copyWith(
                      color: AppColors.accent,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.3,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    className,
                    style: textTheme.titleMedium?.copyWith(
                      color: const Color(0xFF151515),
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 760),
                    child: Text(
                      usageNote,
                      style: textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF4E4A45),
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}