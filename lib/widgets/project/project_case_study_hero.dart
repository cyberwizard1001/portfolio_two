import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import '../common/responsive_section.dart';
import '../../theme/app_colors.dart';

class ProjectCaseStudyHero extends StatelessWidget {
  const ProjectCaseStudyHero({
    super.key,
    required this.eyebrowText,
    required this.eyebrowColor,
    required this.title,
    required this.hookText,
    required this.summaryText,
  });

  final String eyebrowText;
  final Color eyebrowColor;
  final String title;
  final String hookText;
  final String summaryText;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isNarrow = screenWidth < 720;

    return Container(
      width: double.infinity,
      color: AppColors.ink,
      child: ResponsiveSection(
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSpacing.xl,
            bottom: AppSpacing.xxl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                onPressed: () => context.goNamed('home'),
                icon: const Icon(Icons.arrow_back_rounded, size: 16),
                label: const Text('Back home'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white54,
                  textStyle: textTheme.bodySmall,
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              SizedBox(height: isNarrow ? AppSpacing.xl : AppSpacing.xxl),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xxs,
                ),
                decoration: BoxDecoration(
                  color: eyebrowColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(AppRadii.sm),
                  border: Border.all(
                    color: eyebrowColor.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  eyebrowText,
                  style: textTheme.labelSmall?.copyWith(
                    color: eyebrowColor,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 820),
                child: Text(
                  title,
                  style: (isNarrow
                          ? textTheme.headlineLarge
                          : textTheme.displayMedium)
                      ?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: 1.08,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              SizedBox(height: isNarrow ? AppSpacing.lg : AppSpacing.xl),
              Container(width: 40, height: 2, color: eyebrowColor),
              const SizedBox(height: AppSpacing.xl),
              if (isNarrow)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _HookText(textTheme: textTheme, text: hookText),
                    const SizedBox(height: AppSpacing.xl),
                    _SummaryText(textTheme: textTheme, text: summaryText),
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: _HookText(textTheme: textTheme, text: hookText),
                    ),
                    const SizedBox(width: AppSpacing.xxl),
                    Expanded(
                      flex: 4,
                      child: _SummaryText(textTheme: textTheme, text: summaryText),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HookText extends StatelessWidget {
  const _HookText({required this.textTheme, required this.text});
  final TextTheme textTheme;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textTheme.titleLarge?.copyWith(
        color: Colors.white,
        height: 1.45,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _SummaryText extends StatelessWidget {
  const _SummaryText({required this.textTheme, required this.text});
  final TextTheme textTheme;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textTheme.bodyMedium?.copyWith(
        color: Colors.white54,
        height: 1.7,
      ),
    );
  }
}
