import 'package:flutter/material.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import '../common/responsive_section.dart';

class TerminalAboutSection extends StatelessWidget {
  const TerminalAboutSection({super.key});

  static const aboutText =
      'CS grad and former Flutter developer now designing accessible UX. '
      'Linux desktop customisation sparked my love for thoughtful, '
      'human-centered design. Moonlighting as a systems enthusiast taught me '
      'how tech should serve real people.';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ResponsiveSection(
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.section),
        child: ResponsiveBuilder(
          builder: (context, info) {
            final bodyStyle = info.isMobile
                ? textTheme.bodyMedium?.copyWith(fontSize: 17)
                : textTheme.bodyLarge?.copyWith(fontSize: info.isDesktop ? 24 : 20);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About me',
                  style: textTheme.headlineMedium,
                ),
                const SizedBox(height: AppSpacing.lg),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.ink,
                    borderRadius: BorderRadius.circular(AppRadii.xl),
                    border: Border.all(color: AppColors.border),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x12000000),
                        blurRadius: 42,
                        offset: Offset(0, 18),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF101010),
                        borderRadius: BorderRadius.circular(AppRadii.lg),
                        border: Border.all(color: const Color(0xFF2A2A2A)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                              vertical: AppSpacing.sm,
                            ),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Color(0xFF2A2A2A)),
                              ),
                            ),
                            child: Row(
                              children: [
                                _TerminalDot(color: Color(0xFFFF5F57)),
                                const SizedBox(width: AppSpacing.xs),
                                _TerminalDot(color: Color(0xFFFFBD2E)),
                                const SizedBox(width: AppSpacing.xs),
                                _TerminalDot(color: Color(0xFF28C840)),
                                const SizedBox(width: AppSpacing.md),
                                Text(
                                  '~/about_me',
                                  style: textTheme.bodySmall?.copyWith(color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(AppSpacing.lg),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'about --nirmal',
                                  style: textTheme.titleLarge?.copyWith(color: AppColors.accent),
                                ),
                                const SizedBox(height: AppSpacing.lg),
                                Text(
                                  aboutText,
                                  style: bodyStyle?.copyWith(color: Colors.white),
                                ),
                                const SizedBox(height: AppSpacing.xl),
                                Wrap(
                                  spacing: AppSpacing.sm,
                                  runSpacing: AppSpacing.sm,
                                  children: const [
                                    _AboutChip(label: 'Accessibility-first'),
                                    _AboutChip(label: 'Systems thinker'),
                                    _AboutChip(label: 'Flutter background'),
                                    _AboutChip(label: 'Linux enthusiast'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _TerminalDot extends StatelessWidget {
  const _TerminalDot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _AboutChip extends StatelessWidget {
  const _AboutChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppRadii.pill),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.2)),
      ),
      child: Text(
        label,
        style: textTheme.bodySmall?.copyWith(color: Colors.white),
      ),
    );
  }
}