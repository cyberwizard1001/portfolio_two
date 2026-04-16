import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import '../common/responsive_section.dart';
import 'dynamic_headline.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final viewportHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.section),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: math.max(viewportHeight * 1.0, 650),
        ),
        decoration: BoxDecoration(
          color: AppColors.ink,
        ),
        child: ResponsiveBuilder(
          builder: (context, info) {
            final introStyle = info.isMobile
                ? textTheme.headlineLarge?.copyWith(
              fontSize: 52,
              height: 1.0,
              color: AppColors.surface,
            )
                : info.isTablet
                ? textTheme.displayMedium?.copyWith(
              fontSize: 68,
              color: AppColors.surface,
            )
                : textTheme.displayLarge?.copyWith(
              fontSize: info.isDesktop ? 86 : 74,
              color: AppColors.surface,
            );

            final topPadding = info.isMobile ? 124.0 : 150.0;
            final bottomPadding = info.isMobile ? 60.0 : 80.0;
            final sidePadding = info.isMobile ? AppSpacing.md : AppSpacing.xxl;
            final linkSpacing = info.isMobile ? AppSpacing.sm : AppSpacing.md;

            return ResponsiveSection(
              child: Padding(
                padding: EdgeInsets.only(
                  top: topPadding,
                  bottom: bottomPadding,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: sidePadding),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top row: intro + collaboration badge
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hey, I\'m Nirmal',
                            style: textTheme.bodySmall?.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                          const Spacer(),
                          const CollaborationStatusBadge(),
                        ],
                      ),

                      const SizedBox(height: AppSpacing.xxxl),

                      // Main text block
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1120),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Observing people,\nCrafting experiences',
                              style: introStyle,
                            ),
                            const SizedBox(height: AppSpacing.lg),
                            const DynamicHeadline(),
                            const SizedBox(height: AppSpacing.xxl),

                            // CV + LinkedIn actions
                            Wrap(
                              spacing: linkSpacing,
                              runSpacing: linkSpacing,
                              children: const [
                                _HeroActionButton(
                                  label: 'View CV',
                                  icon: Icons.description_outlined,
                                  isPrimary: true,
                                ),
                                _HeroActionButton(
                                  label: 'LinkedIn',
                                  icon: Icons.open_in_new_rounded,
                                ),
                              ],
                            ),
                            const SizedBox(height: AppSpacing.md),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 680),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'CV and LinkedIn are there if you need them, but really, you should look at my ',
                                    ),
                                    TextSpan(
                                      text: 'projects first',
                                      style: TextStyle(
                                        color: AppColors.accent,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const TextSpan(text: '.'),
                                  ],
                                ),
                                style: textTheme.bodyMedium?.copyWith(
                                  color: Colors.white70,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: AppSpacing.xxxl),

                      // Bottom descriptors
                      Wrap(
                        spacing: AppSpacing.lg,
                        runSpacing: AppSpacing.sm,
                        children: [
                          Text(
                            'Accessible UX designer',
                            style: textTheme.bodySmall?.copyWith(
                              color: Colors.white54,
                            ),
                          ),
                          Text(
                            'Former Flutter developer',
                            style: textTheme.bodySmall?.copyWith(
                              color: Colors.white54,
                            ),
                          ),
                          Text(
                            'Systems thinker',
                            style: textTheme.bodySmall?.copyWith(
                              color: Colors.white54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CollaborationStatusBadge extends StatefulWidget {
  const CollaborationStatusBadge({super.key});

  @override
  State<CollaborationStatusBadge> createState() =>
      _CollaborationStatusBadgeState();
}

class _CollaborationStatusBadgeState extends State<CollaborationStatusBadge>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat(reverse: true);

    _pulse = Tween<double>(begin: 0.85, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(AppRadii.pill),
        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: _pulse,
            builder: (context, child) {
              return Container(
                width: 10 * _pulse.value,
                height: 10 * _pulse.value,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accent.withValues(alpha: 0.45),
                      blurRadius: 12,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            'Open for collaboration',
            style: textTheme.bodySmall?.copyWith(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroActionButton extends StatefulWidget {
  const _HeroActionButton({
    required this.label,
    required this.icon,
    this.isPrimary = false,
  });

  final String label;
  final IconData icon;
  final bool isPrimary;

  @override
  State<_HeroActionButton> createState() => _HeroActionButtonState();
}

class _HeroActionButtonState extends State<_HeroActionButton> {
  bool _hovered = false;

  void _handleTap() {
    debugPrint(
      widget.label == 'View CV'
          ? 'Open CV link'
          : 'Open LinkedIn link',
    );
    // Later: replace with url_launcher to open real links.
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadii.pill),
        onTap: _handleTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.md,
          ),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? (_hovered ? const Color(0xFFFF7A29) : AppColors.accent)
                : (_hovered
                ? Colors.white.withValues(alpha: 0.10)
                : Colors.white.withValues(alpha: 0.04)),
            borderRadius: BorderRadius.circular(AppRadii.pill),
            border: Border.all(
              color: widget.isPrimary
                  ? Colors.transparent
                  : Colors.white.withValues(alpha: 0.12),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 18,
                color: Colors.white,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                widget.label,
                style: textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}