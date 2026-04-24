import 'package:flutter/material.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import 'project_section_theme.dart';

/// A structured log of design decisions with the decision, rationale,
/// and outcome. Useful for showing design thinking and tradeoffs.
/// Renders as a table on desktop and as stacked cards on mobile.
class ProjectDecisionLogBlock extends StatelessWidget {
  const ProjectDecisionLogBlock({
    super.key,
    required this.themeConfig,
    required this.decisions,
    this.title = 'Decision log',
    this.intro,
  });

  final ProjectSectionTheme themeConfig;
  final List<ProjectDecisionItem> decisions;
  final String title;
  final String? intro;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      color: themeConfig.backgroundColor,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.section,
      ),
      child: ResponsiveBuilder(
        builder: (context, info) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.headlineLarge?.copyWith(
                  color: themeConfig.foregroundColor,
                ),
              ),
              if (intro != null) ...[
                const SizedBox(height: AppSpacing.sm),
                Text(
                  intro!,
                  style: textTheme.bodyLarge?.copyWith(
                    color: themeConfig.effectiveMutedColor,
                    height: 1.6,
                  ),
                ),
              ],
              const SizedBox(height: AppSpacing.xl),

              if (info.isMobile)
                _DecisionCardList(
                  decisions: decisions,
                  themeConfig: themeConfig,
                )
              else
                _DecisionTable(
                  decisions: decisions,
                  themeConfig: themeConfig,
                ),
            ],
          );
        },
      ),
    );
  }
}

// ─── Desktop table ────────────────────────────────────────────────────────────

class _DecisionTable extends StatelessWidget {
  const _DecisionTable({
    required this.decisions,
    required this.themeConfig,
  });

  final List<ProjectDecisionItem> decisions;
  final ProjectSectionTheme themeConfig;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final headerStyle = textTheme.labelLarge?.copyWith(
      color: themeConfig.accentColor,
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadii.xl),
        border: Border.all(color: themeConfig.borderColor),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadii.xl),
        child: Column(
          children: [
            // Header row
            Container(
              color: themeConfig.accentColor.withValues(alpha: 0.08),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.md,
              ),
              child: Row(
                children: [
                  Expanded(flex: 3, child: Text('#  Decision', style: headerStyle)),
                  Expanded(flex: 3, child: Text('Rationale', style: headerStyle)),
                  Expanded(flex: 2, child: Text('Outcome', style: headerStyle)),
                ],
              ),
            ),
            const Divider(height: 1),
            // Data rows
            ...decisions.asMap().entries.map((entry) {
              final i = entry.key;
              final d = entry.value;
              final isLast = i == decisions.length - 1;

              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg,
                      vertical: AppSpacing.lg,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Index badge
                              Container(
                                width: 26,
                                height: 26,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: themeConfig.accentColor
                                      .withValues(alpha: 0.12),
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  '${i + 1}',
                                  style: textTheme.bodySmall?.copyWith(
                                    color: themeConfig.accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              Expanded(
                                child: Text(
                                  d.decision,
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: themeConfig.foregroundColor,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          flex: 3,
                          child: Text(
                            d.rationale,
                            style: textTheme.bodyMedium?.copyWith(
                              color: themeConfig.effectiveMutedColor,
                              height: 1.5,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          flex: 2,
                          child: _OutcomeChip(
                            outcome: d.outcome,
                            type: d.outcomeType,
                            themeConfig: themeConfig,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!isLast)
                    Divider(
                      height: 1,
                      color: themeConfig.borderColor,
                    ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

// ─── Mobile cards ─────────────────────────────────────────────────────────────

class _DecisionCardList extends StatelessWidget {
  const _DecisionCardList({
    required this.decisions,
    required this.themeConfig,
  });

  final List<ProjectDecisionItem> decisions;
  final ProjectSectionTheme themeConfig;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: decisions.asMap().entries.map((entry) {
        final i = entry.key;
        final d = entry.value;

        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.md),
          child: Container(
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadii.xl),
              border: Border.all(color: themeConfig.borderColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 26,
                      height: 26,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: themeConfig.accentColor.withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${i + 1}',
                        style: textTheme.bodySmall?.copyWith(
                          color: themeConfig.accentColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(
                        d.decision,
                        style: textTheme.bodyLarge?.copyWith(
                          color: themeConfig.foregroundColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  d.rationale,
                  style: textTheme.bodyMedium?.copyWith(
                    color: themeConfig.effectiveMutedColor,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                _OutcomeChip(
                  outcome: d.outcome,
                  type: d.outcomeType,
                  themeConfig: themeConfig,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ─── Outcome chip ─────────────────────────────────────────────────────────────

class _OutcomeChip extends StatelessWidget {
  const _OutcomeChip({
    required this.outcome,
    required this.type,
    required this.themeConfig,
  });

  final String outcome;
  final DecisionOutcomeType type;
  final ProjectSectionTheme themeConfig;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    Color chipColor;
    switch (type) {
      case DecisionOutcomeType.positive:
        chipColor = const Color(0xFF1E9E61);
        break;
      case DecisionOutcomeType.neutral:
        chipColor = themeConfig.accentColor;
        break;
      case DecisionOutcomeType.tradeoff:
        chipColor = const Color(0xFFD97706);
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xxs,
          ),
          decoration: BoxDecoration(
            color: chipColor.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(AppRadii.pill),
            border: Border.all(color: chipColor.withValues(alpha: 0.25)),
          ),
          child: Text(
            type.label,
            style: textTheme.bodySmall?.copyWith(
              color: chipColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          outcome,
          style: textTheme.bodySmall?.copyWith(
            color: themeConfig.effectiveMutedColor,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

// ─── Data models ──────────────────────────────────────────────────────────────

enum DecisionOutcomeType {
  positive('Positive'),
  neutral('Neutral'),
  tradeoff('Trade-off');

  const DecisionOutcomeType(this.label);
  final String label;
}

class ProjectDecisionItem {
  const ProjectDecisionItem({
    required this.decision,
    required this.rationale,
    required this.outcome,
    this.outcomeType = DecisionOutcomeType.neutral,
  });

  final String decision;
  final String rationale;
  final String outcome;
  final DecisionOutcomeType outcomeType;
}
