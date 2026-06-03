import 'package:flutter/material.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import 'project_block_section.dart';
import 'project_section_theme.dart';

/// A user persona card with name, role, quote, goals, frustrations,
/// and optional context tags. Supports desktop side-by-side and
/// mobile stacked layout.
class ProjectPersonaBlock extends StatelessWidget {
  const ProjectPersonaBlock({
    super.key,
    required this.themeConfig,
    required this.name,
    required this.role,
    required this.quote,
    required this.goals,
    required this.frustrations,
    this.eyebrow = 'User persona',
    this.context,
    this.contextTags = const [],
  });

  final ProjectSectionTheme themeConfig;
  final String eyebrow;
  final String name;
  final String role;
  final String quote;
  final List<String> goals;
  final List<String> frustrations;
  final String? context;
  final List<String> contextTags;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ProjectBlockSection(
      themeConfig: themeConfig,
      child: ResponsiveBuilder(
        builder: (ctx, info) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Eyebrow
              Text(
                eyebrow,
                style: textTheme.titleLarge?.copyWith(
                  color: themeConfig.accentColor,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Card
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadii.xl),
                  border: Border.all(color: themeConfig.borderColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Identity strip
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.xl),
                      decoration: BoxDecoration(
                        color: themeConfig.accentColor.withValues(alpha: 0.08),
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(AppRadii.xl),
                        ),
                        border: Border(
                          bottom: BorderSide(color: themeConfig.borderColor),
                        ),
                      ),
                      child: _PersonaIdentity(
                              name: name,
                              role: role,
                              quote: quote,
                              themeConfig: themeConfig,
                              isMobile: info.isMobile,
                            ),
                    ),

                    // Goals + frustrations
                    Padding(
                      padding: const EdgeInsets.all(AppSpacing.xl),
                      child: info.isMobile
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _PersonaListSection(
                                  label: 'Goals',
                                  icon: Icons.arrow_upward_rounded,
                                  items: goals,
                                  themeConfig: themeConfig,
                                  positive: true,
                                ),
                                const SizedBox(height: AppSpacing.xl),
                                _PersonaListSection(
                                  label: 'Frustrations',
                                  icon: Icons.arrow_downward_rounded,
                                  items: frustrations,
                                  themeConfig: themeConfig,
                                  positive: false,
                                ),
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: _PersonaListSection(
                                    label: 'Goals',
                                    icon: Icons.arrow_upward_rounded,
                                    items: goals,
                                    themeConfig: themeConfig,
                                    positive: true,
                                  ),
                                ),
                                const SizedBox(width: AppSpacing.xl),
                                Expanded(
                                  child: _PersonaListSection(
                                    label: 'Frustrations',
                                    icon: Icons.arrow_downward_rounded,
                                    items: frustrations,
                                    themeConfig: themeConfig,
                                    positive: false,
                                  ),
                                ),
                              ],
                            ),
                    ),

                    // Context + tags (optional)
                    if (this.context != null || contextTags.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.xl),
                        decoration: BoxDecoration(
                          color: themeConfig.accentColor.withValues(alpha: 0.04),
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(AppRadii.xl),
                          ),
                          border: Border(
                            top: BorderSide(color: themeConfig.borderColor),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (this.context != null) ...[
                              Text(
                                'Context',
                                style: textTheme.labelLarge?.copyWith(
                                  color: themeConfig.accentColor,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.xs),
                              Text(
                                this.context!,
                                style: textTheme.bodyMedium?.copyWith(
                                  color: themeConfig.effectiveMutedColor,
                                  height: 1.6,
                                ),
                              ),
                              if (contextTags.isNotEmpty)
                                const SizedBox(height: AppSpacing.md),
                            ],
                            if (contextTags.isNotEmpty)
                              Wrap(
                                spacing: AppSpacing.xs,
                                runSpacing: AppSpacing.xs,
                                children: contextTags.map((tag) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: AppSpacing.sm,
                                      vertical: AppSpacing.xxs,
                                    ),
                                    decoration: BoxDecoration(
                                      color: themeConfig.borderColor,
                                      borderRadius:
                                          BorderRadius.circular(AppRadii.pill),
                                    ),
                                    child: Text(
                                      tag,
                                      style: textTheme.bodySmall?.copyWith(
                                        color: themeConfig.effectiveMutedColor,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ─── Identity strip ───────────────────────────────────────────────────────────

class _PersonaIdentity extends StatelessWidget {
  const _PersonaIdentity({
    required this.name,
    required this.role,
    required this.quote,
    required this.themeConfig,
    required this.isMobile,
  });

  final String name;
  final String role;
  final String quote;
  final ProjectSectionTheme themeConfig;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final quoteBox = Container(
      padding: EdgeInsets.all(isMobile ? AppSpacing.md : AppSpacing.lg),
      decoration: BoxDecoration(
        color: themeConfig.accentColor.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(AppRadii.lg),
        border: Border.all(color: themeConfig.accentColor.withValues(alpha: 0.14)),
      ),
      child: Text(
        '"$quote"',
        style: (isMobile ? textTheme.bodyMedium : textTheme.bodyLarge)?.copyWith(
          color: themeConfig.foregroundColor,
          fontStyle: FontStyle.italic,
          height: 1.5,
        ),
      ),
    );

    final nameCol = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: (isMobile ? textTheme.headlineSmall : textTheme.headlineMedium)?.copyWith(
            color: themeConfig.foregroundColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (isMobile)
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              role,
              style: textTheme.bodyMedium?.copyWith(color: themeConfig.accentColor),
            ),
          )
        else
          Text(
            role,
            style: textTheme.bodyLarge?.copyWith(color: themeConfig.accentColor),
          ),
      ],
    );

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _PersonaAvatar(name: name, themeConfig: themeConfig),
              const SizedBox(width: AppSpacing.md),
              nameCol,
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          quoteBox,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _PersonaAvatar(name: name, themeConfig: themeConfig),
        const SizedBox(width: AppSpacing.xl),
        Flexible(fit: FlexFit.loose, child: nameCol),
        const SizedBox(width: AppSpacing.xxl),
        Expanded(child: quoteBox),
      ],
    );
  }
}

// ─── Avatar placeholder ───────────────────────────────────────────────────────

class _PersonaAvatar extends StatelessWidget {
  const _PersonaAvatar({required this.name, required this.themeConfig});

  final String name;
  final ProjectSectionTheme themeConfig;

  @override
  Widget build(BuildContext context) {
    final initial = name.isNotEmpty ? name[0].toUpperCase() : '?';
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: themeConfig.accentColor.withValues(alpha: 0.16),
        shape: BoxShape.circle,
        border: Border.all(
          color: themeConfig.accentColor.withValues(alpha: 0.28),
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          initial,
          style: textTheme.headlineMedium?.copyWith(
            color: themeConfig.accentColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

// ─── Goals / Frustrations list ────────────────────────────────────────────────

class _PersonaListSection extends StatelessWidget {
  const _PersonaListSection({
    required this.label,
    required this.icon,
    required this.items,
    required this.themeConfig,
    required this.positive,
  });

  final String label;
  final IconData icon;
  final List<String> items;
  final ProjectSectionTheme themeConfig;
  final bool positive;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final iconColor =
        positive ? themeConfig.accentColor : themeConfig.foregroundColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: iconColor),
            const SizedBox(width: AppSpacing.xs),
            Text(
              label,
              style: textTheme.labelLarge?.copyWith(color: iconColor),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 7),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.5),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    item,
                    style: textTheme.bodyMedium?.copyWith(
                      color: themeConfig.effectiveMutedColor,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
