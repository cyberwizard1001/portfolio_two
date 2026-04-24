import 'package:flutter/material.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import 'project_section_theme.dart';

/// A list of accessibility issues with severity indicators, WCAG criterion
/// references, and a fix description. Ideal for accessibility-focused case
/// studies or design audits.
class ProjectAccessibilityAuditBlock extends StatelessWidget {
  const ProjectAccessibilityAuditBlock({
    super.key,
    required this.themeConfig,
    required this.issues,
    this.title = 'Accessibility audit',
    this.intro,
  });

  final ProjectSectionTheme themeConfig;
  final List<ProjectA11yIssue> issues;
  final String title;
  final String? intro;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // Group by severity for summary chips
    final criticalCount =
        issues.where((i) => i.severity == A11ySeverity.critical).length;
    final seriousCount =
        issues.where((i) => i.severity == A11ySeverity.serious).length;
    final moderateCount =
        issues.where((i) => i.severity == A11ySeverity.moderate).length;
    final minorCount =
        issues.where((i) => i.severity == A11ySeverity.minor).length;

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
              // Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
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
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),

              // Severity summary bar
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: [
                  if (criticalCount > 0)
                    _SeveritySummaryChip(
                      label: 'Critical',
                      count: criticalCount,
                      color: A11ySeverity.critical.color,
                    ),
                  if (seriousCount > 0)
                    _SeveritySummaryChip(
                      label: 'Serious',
                      count: seriousCount,
                      color: A11ySeverity.serious.color,
                    ),
                  if (moderateCount > 0)
                    _SeveritySummaryChip(
                      label: 'Moderate',
                      count: moderateCount,
                      color: A11ySeverity.moderate.color,
                    ),
                  if (minorCount > 0)
                    _SeveritySummaryChip(
                      label: 'Minor',
                      count: minorCount,
                      color: A11ySeverity.minor.color,
                    ),
                ],
              ),
              const SizedBox(height: AppSpacing.xl),

              // Issues list
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadii.xl),
                  border: Border.all(color: themeConfig.borderColor),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadii.xl),
                  child: Column(
                    children: issues.asMap().entries.map((entry) {
                      final i = entry.key;
                      final issue = entry.value;
                      final isLast = i == issues.length - 1;

                      return Column(
                        children: [
                          _A11yIssueRow(
                            issue: issue,
                            themeConfig: themeConfig,
                            isMobile: info.isMobile,
                          ),
                          if (!isLast)
                            Divider(
                              height: 1,
                              color: themeConfig.borderColor,
                            ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ─── Issue row ────────────────────────────────────────────────────────────────

class _A11yIssueRow extends StatelessWidget {
  const _A11yIssueRow({
    required this.issue,
    required this.themeConfig,
    required this.isMobile,
  });

  final ProjectA11yIssue issue;
  final ProjectSectionTheme themeConfig;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final severityColor = issue.severity.color;

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _IssueHeader(
                  issue: issue,
                  themeConfig: themeConfig,
                  severityColor: severityColor,
                ),
                const SizedBox(height: AppSpacing.sm),
                _IssueDetails(issue: issue, themeConfig: themeConfig),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left: severity + issue name
                Expanded(
                  flex: 4,
                  child: _IssueHeader(
                    issue: issue,
                    themeConfig: themeConfig,
                    severityColor: severityColor,
                  ),
                ),
                const SizedBox(width: AppSpacing.lg),
                // Right: description + fix
                Expanded(
                  flex: 6,
                  child: _IssueDetails(issue: issue, themeConfig: themeConfig),
                ),
              ],
            ),
    );
  }
}

class _IssueHeader extends StatelessWidget {
  const _IssueHeader({
    required this.issue,
    required this.themeConfig,
    required this.severityColor,
  });

  final ProjectA11yIssue issue;
  final ProjectSectionTheme themeConfig;
  final Color severityColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Severity chip
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xxs,
          ),
          decoration: BoxDecoration(
            color: severityColor.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(AppRadii.pill),
            border: Border.all(color: severityColor.withValues(alpha: 0.25)),
          ),
          child: Text(
            issue.severity.label,
            style: textTheme.bodySmall?.copyWith(
              color: severityColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          issue.issue,
          style: textTheme.bodyLarge?.copyWith(
            color: themeConfig.foregroundColor,
            fontWeight: FontWeight.w500,
            height: 1.4,
          ),
        ),
        if (issue.wcagCriterion != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            issue.wcagCriterion!,
            style: textTheme.bodySmall?.copyWith(
              color: themeConfig.effectiveMutedColor,
            ),
          ),
        ],
      ],
    );
  }
}

class _IssueDetails extends StatelessWidget {
  const _IssueDetails({
    required this.issue,
    required this.themeConfig,
  });

  final ProjectA11yIssue issue;
  final ProjectSectionTheme themeConfig;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          issue.description,
          style: textTheme.bodyMedium?.copyWith(
            color: themeConfig.effectiveMutedColor,
            height: 1.6,
          ),
        ),
        if (issue.fix != null) ...[
          const SizedBox(height: AppSpacing.sm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.build_outlined,
                size: 14,
                color: themeConfig.accentColor,
              ),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: Text(
                  issue.fix!,
                  style: textTheme.bodySmall?.copyWith(
                    color: themeConfig.accentColor,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

// ─── Severity summary chip ────────────────────────────────────────────────────

class _SeveritySummaryChip extends StatelessWidget {
  const _SeveritySummaryChip({
    required this.label,
    required this.count,
    required this.color,
  });

  final String label;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(AppRadii.pill),
        border: Border.all(color: color.withValues(alpha: 0.22)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: AppSpacing.xs),
          Text(
            '$count $label',
            style: textTheme.bodySmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Data models ──────────────────────────────────────────────────────────────

enum A11ySeverity {
  critical('Critical', Color(0xFFDC2626)),
  serious('Serious', Color(0xFFD97706)),
  moderate('Moderate', Color(0xFF2563EB)),
  minor('Minor', Color(0xFF6B7280));

  const A11ySeverity(this.label, this.color);
  final String label;
  final Color color;
}

class ProjectA11yIssue {
  const ProjectA11yIssue({
    required this.issue,
    required this.description,
    required this.severity,
    this.wcagCriterion,
    this.fix,
  });

  final String issue;
  final String description;
  final A11ySeverity severity;
  final String? wcagCriterion;
  final String? fix;
}
