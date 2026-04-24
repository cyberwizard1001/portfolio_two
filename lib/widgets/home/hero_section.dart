import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import '../common/responsive_section.dart';
import 'dynamic_headline.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    this.onScrollToWork,
    this.onScrollToAbout,
  });

  final VoidCallback? onScrollToWork;
  final VoidCallback? onScrollToAbout;

  @override
  Widget build(BuildContext context) {
    final viewportHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification &&
            notification.scrollDelta != null &&
            notification.scrollDelta! > 0) {
          onScrollToWork?.call();
          return true;
        }
        return false;
      },
      child: Padding(
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
                              _HeroSubtext(
                                onScrollToAbout: onScrollToAbout,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: AppSpacing.xxxl),

                        // Bottom row: descriptors + scroll button
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
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
                            const Spacer(),
                            _ScrollButton(onTap: onScrollToWork),
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
      ),
    );
  }
}

// ─── Hero subtext with clickable 'About me' ─────────────────────────────────

class _HeroSubtext extends StatefulWidget {
  const _HeroSubtext({this.onScrollToAbout});
  final VoidCallback? onScrollToAbout;

  @override
  State<_HeroSubtext> createState() => _HeroSubtextState();
}

class _HeroSubtextState extends State<_HeroSubtext> {
  bool _hovered = false;
  late final TapGestureRecognizer _recognizer;

  @override
  void initState() {
    super.initState();
    _recognizer = TapGestureRecognizer()
      ..onTap = () => widget.onScrollToAbout?.call();
  }

  @override
  void dispose() {
    _recognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 680),
      child: MouseRegion(
        cursor: SystemMouseCursors.basic,
        child: Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: 'A UX designer who builds. Scroll down to see my work, or head to the ',
              ),
              TextSpan(
                text: 'About me',
                recognizer: _recognizer,
                mouseCursor: SystemMouseCursors.click,
                onEnter: (_) => setState(() => _hovered = true),
                onExit: (_) => setState(() => _hovered = false),
                style: TextStyle(
                  color: AppColors.accent,
                  fontWeight: FontWeight.w600,
                  decoration: _hovered ? TextDecoration.underline : TextDecoration.none,
                  decorationColor: AppColors.accent,
                ),
              ),
              const TextSpan(text: ' section for CV and links.'),
            ],
          ),
          style: textTheme.bodyMedium?.copyWith(
            color: Colors.white70,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}

// ─── Scroll button ────────────────────────────────────────────────────────────

class _ScrollButton extends StatefulWidget {
  const _ScrollButton({this.onTap});
  final VoidCallback? onTap;

  @override
  State<_ScrollButton> createState() => _ScrollButtonState();
}

class _ScrollButtonState extends State<_ScrollButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _pulse;
  bool _hovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);
    _pulse = Tween<double>(begin: 1.0, end: 1.18).animate(
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

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBuilder(
              animation: _pulse,
              builder: (context, child) {
                return Transform.scale(
                  scale: _hovered ? 1.1 : _pulse.value,
                  child: child,
                );
              },
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withValues(alpha: _hovered ? 0.6 : 0.3),
                    width: 1.5,
                  ),
                  color: Colors.white.withValues(alpha: _hovered ? 0.12 : 0.05),
                ),
                child: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.white70,
                  size: 22,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Scroll',
              style: textTheme.bodySmall?.copyWith(
                color: Colors.white38,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Collaboration badge ──────────────────────────────────────────────────────

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
