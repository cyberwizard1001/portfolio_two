import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import '../common/responsive_section.dart';
import 'project_section_theme.dart';

class RelatedProjectItem {
  final String title;
  final String blurb;
  final String routeName;
  final String category;

  const RelatedProjectItem({
    required this.title,
    required this.blurb,
    required this.routeName,
    required this.category,
  });
}

class MoreProjectsBlock extends StatelessWidget {
  const MoreProjectsBlock({
    super.key,
    required this.themeConfig,
    required this.title,
    required this.projects,
  });

  final ProjectSectionTheme themeConfig;
  final String title;
  final List<RelatedProjectItem> projects;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: themeConfig.backgroundColor,
      child: ResponsiveSection(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.section),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.headlineMedium?.copyWith(
                  color: themeConfig.foregroundColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Text(
                  'A few other projects from the portfolio that explore adjacent product, service, and UX problems.',
                  style: textTheme.bodyLarge?.copyWith(
                    color: themeConfig.mutedColor,
                    height: 1.6,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              LayoutBuilder(
                builder: (context, constraints) {
                  int columns = 3;
                  if (constraints.maxWidth < 1100) columns = 2;
                  if (constraints.maxWidth < 700) columns = 1;

                  final totalSpacing = AppSpacing.lg * (columns - 1);
                  final cardWidth = (constraints.maxWidth - totalSpacing) / columns;

                  return Wrap(
                    spacing: AppSpacing.lg,
                    runSpacing: AppSpacing.lg,
                    children: projects.map((project) {
                      return SizedBox(
                        width: cardWidth,
                        child: _RelatedProjectCard(
                          item: project,
                          themeConfig: themeConfig,
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RelatedProjectCard extends StatefulWidget {
  const _RelatedProjectCard({
    required this.item,
    required this.themeConfig,
  });

  final RelatedProjectItem item;
  final ProjectSectionTheme themeConfig;

  @override
  State<_RelatedProjectCard> createState() => _RelatedProjectCardState();
}

class _RelatedProjectCardState extends State<_RelatedProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => context.goNamed(widget.item.routeName),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          constraints: const BoxConstraints(minHeight: 220),
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: _isHovered
                ? Colors.white.withValues(alpha: 0.06)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(AppRadii.xl),
            border: Border.all(
              color: _isHovered
                  ? widget.themeConfig.accentColor
                  : widget.themeConfig.borderColor,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item.category,
                style: textTheme.labelMedium?.copyWith(
                  color: widget.themeConfig.accentColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                widget.item.title,
                style: textTheme.titleLarge?.copyWith(
                  color: widget.themeConfig.foregroundColor,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                widget.item.blurb,
                style: textTheme.bodyMedium?.copyWith(
                  color: widget.themeConfig.mutedColor,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'View project →',
                style: textTheme.bodyMedium?.copyWith(
                  color: _isHovered
                      ? widget.themeConfig.accentColor
                      : widget.themeConfig.foregroundColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}