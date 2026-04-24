import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import '../common/responsive_section.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({
    super.key,
    required this.onHeroTap,
    required this.onWorkTap,
    required this.onAboutTap,
    required this.onContactTap,
    this.isDark = true,
  });

  final VoidCallback onHeroTap;
  final VoidCallback onWorkTap;
  final VoidCallback onAboutTap;
  final VoidCallback onContactTap;

  /// True when the nav is floating over the dark hero section.
  /// False when over the light scaffold background.
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // Colours derived from context
    final bgColor = isDark
        ? Colors.white.withValues(alpha: 0.08)
        : Colors.white.withValues(alpha: 0.88);
    final borderColor = isDark
        ? Colors.white.withValues(alpha: 0.12)
        : AppColors.border;
    final logoColor = isDark ? Colors.white : AppColors.ink;
    final navLinkDefaultColor = isDark ? Colors.white60 : AppColors.inkMuted;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: ResponsiveSection(
        child: Padding(
          padding: const EdgeInsets.only(top: AppSpacing.lg),
          child: ResponsiveBuilder(
            builder: (context, info) {
              final compact = info.isMobile;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 280),
                curve: Curves.easeOutCubic,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(AppRadii.xl),
                  border: Border.all(color: borderColor),
                  boxShadow: isDark
                      ? const []
                      : const [
                          BoxShadow(
                            color: Color(0x10000000),
                            blurRadius: 26,
                            offset: Offset(0, 12),
                          ),
                        ],
                ),
                child: Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(AppRadii.md),
                      onTap: onHeroTap,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.xs,
                          vertical: AppSpacing.xs,
                        ),
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 280),
                          curve: Curves.easeOutCubic,
                          style: textTheme.labelLarge!.copyWith(
                            color: logoColor,
                          ),
                          child: const Text('Nirmal'),
                        ),
                      ),
                    ),
                    const Spacer(),
                    if (!compact) ...[
                      _NavLink(
                        label: 'Work',
                        onTap: onWorkTap,
                        isDark: isDark,
                        defaultColor: navLinkDefaultColor,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      _NavLink(
                        label: 'About',
                        onTap: onAboutTap,
                        isDark: isDark,
                        defaultColor: navLinkDefaultColor,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      _NavLink(
                        label: 'Contact',
                        onTap: () => context.goNamed('contact'),
                        isDark: isDark,
                        defaultColor: navLinkDefaultColor,
                      ),
                      const SizedBox(width: AppSpacing.lg),
                    ],
                    InkWell(
                      onTap: () => context.goNamed('contact'),
                      borderRadius: BorderRadius.circular(AppRadii.pill),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                          vertical: AppSpacing.sm,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(AppRadii.pill),
                        ),
                        child: Text(
                          compact ? 'Contact' : 'Available for projects',
                          style: textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({
    required this.label,
    required this.onTap,
    required this.isDark,
    required this.defaultColor,
  });

  final String label;
  final VoidCallback onTap;
  final bool isDark;
  final Color defaultColor;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final hoverBg = widget.isDark
        ? Colors.white.withValues(alpha: 0.10)
        : AppColors.accentSoft;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadii.pill),
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: _hovered ? hoverBg : Colors.transparent,
            borderRadius: BorderRadius.circular(AppRadii.pill),
          ),
          child: Text(
            widget.label,
            style: textTheme.bodySmall?.copyWith(
              color: _hovered ? AppColors.accent : widget.defaultColor,
            ),
          ),
        ),
      ),
    );
  }
}
