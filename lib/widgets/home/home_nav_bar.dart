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
  });

  final VoidCallback onHeroTap;
  final VoidCallback onWorkTap;
  final VoidCallback onAboutTap;
  final VoidCallback onContactTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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

              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.82),
                  borderRadius: BorderRadius.circular(AppRadii.xl),
                  border: Border.all(color: AppColors.border),
                  boxShadow: const [
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
                        child: Text(
                          'Nirmal',
                          style: textTheme.labelLarge?.copyWith(
                            color: AppColors.ink,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    if (!compact) ...[
                      _NavLink(
                        label: 'Work',
                        onTap: onWorkTap,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      _NavLink(
                        label: 'About',
                        onTap: onAboutTap,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      _NavLink(
                        label: 'Contact',
                        onTap: () => context.goNamed('contact'),
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
  });

  final String label;
  final VoidCallback onTap;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
            color: _hovered ? AppColors.accentSoft : Colors.transparent,
            borderRadius: BorderRadius.circular(AppRadii.pill),
          ),
          child: Text(
            widget.label,
            style: textTheme.bodySmall?.copyWith(
              color: _hovered ? AppColors.accent : AppColors.inkMuted,
            ),
          ),
        ),
      ),
    );
  }
}