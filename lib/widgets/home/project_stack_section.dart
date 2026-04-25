import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import '../common/responsive_section.dart';

class ProjectStackSection extends StatelessWidget {
  const ProjectStackSection({
    super.key,
    this.scrollController,
  });

  final ScrollController? scrollController;

  static const projects = [
    _ProjectData(
      year: '2026',
      title: 'Pet Insurance Checkout Redesign',
      category: 'UI/UX',
      slug: 'perfect-pet-insurance-quote-flow',
      routeName: 'perfect-pet-quote-flow',
      summary:
      'The Review Details screen in Perfect Pet Insurance\u2019s quote flow was losing users at the point of conversion. A dense, inconsistent experience was replaced with a clearer, more trustworthy one.',
      highlights: [
        'Grounded in Hotjar session data and heuristic audit',
        'Improved hierarchy, trust signals, and visual consistency',
        'Designed within FCA compliance and MudBlazor constraints',
      ],
    ),
    _ProjectData(
      year: '2025',
      title: 'Perro Onboarding & Subscription',
      category: 'UX / Flutter',
      slug: 'perro-onboarding-subscription',
      routeName: 'perro-onboarding',
      summary:
      'Perro had a strong product. Users were dropping off during onboarding before they\u2019d seen any of it. A shorter, value-first flow reduced drop-offs, lifted subscription conversion, and contributed to the company\u2019s acquisition.',
      highlights: [
        'Cut screens from 5 to 4, questions from 16 to 11',
        'Replaced photo friction with an avatar system',
        'Designed and implemented in Flutter within 2 weeks',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selected work',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: AppSpacing.xl),
          ...List.generate(
            projects.length,
                (index) => Padding(
              padding: EdgeInsets.only(
                bottom: index == projects.length - 1 ? 0 : AppSpacing.lg,
              ),
              child: _InteractiveProjectCard(
                project: projects[index],
                index: index,
                onTap: () {
                  context.goNamed(projects[index].routeName);
                },
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.section),
        ],
      ),
    );
  }
}

class _InteractiveProjectCard extends StatefulWidget {
  const _InteractiveProjectCard({
    required this.project,
    required this.index,
    required this.onTap,
  });

  final _ProjectData project;
  final int index;
  final VoidCallback onTap;

  @override
  State<_InteractiveProjectCard> createState() => _InteractiveProjectCardState();
}

class _InteractiveProjectCardState extends State<_InteractiveProjectCard> {
  bool _isHovered = false;
  bool _isPressed = false;

  void _setHovered(bool value) {
    if (_isHovered == value) return;
    setState(() => _isHovered = value);
  }

  void _setPressed(bool value) {
    if (_isPressed == value) return;
    setState(() => _isPressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ResponsiveBuilder(
      builder: (context, info) {
        final imageHeight = info.isMobile ? 220.0 : info.isTablet ? 320.0 : 420.0;
        final titleSize = info.isMobile ? 28.0 : info.isTablet ? 42.0 : 56.0;
        final horizontalLayout = !info.isMobile;

        final baseOffset = widget.index * -4.0;
        final hoverLift = _isHovered ? -10.0 : 0.0;
        final pressOffset = _isPressed ? 4.0 : 0.0;

        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => _setHovered(true),
          onExit: (_) {
            _setHovered(false);
            _setPressed(false);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            transform: Matrix4.identity()
              ..translate(0.0, baseOffset + hoverLift + pressOffset)
              ..scale(_isHovered ? 1.008 : 1.0),
            transformAlignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadii.xl),
              border: Border.all(
                color: _isHovered
                    ? AppColors.accent.withValues(alpha: 0.22)
                    : AppColors.border,
              ),
              boxShadow: _isHovered
                  ? const [
                BoxShadow(
                  color: Color(0x1F000000),
                  blurRadius: 44,
                  offset: Offset(0, 24),
                ),
                BoxShadow(
                  color: Color(0x14FB6000),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ]
                  : const [
                BoxShadow(
                  color: Color(0x12000000),
                  blurRadius: 34,
                  offset: Offset(0, 18),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadii.xl),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: widget.onTap,
                  onHover: _setHovered,
                  onHighlightChanged: _setPressed,
                  splashColor: AppColors.accent.withValues(alpha: 0.08),
                  highlightColor: AppColors.accent.withValues(alpha: 0.04),
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 180),
                          opacity: _isHovered ? 1.0 : 0.88,
                          child: Row(
                            children: [
                              Text(
                                widget.project.year,
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppColors.inkMuted,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                widget.project.category,
                                style: textTheme.bodySmall?.copyWith(
                                  color: _isHovered
                                      ? AppColors.accent
                                      : AppColors.inkMuted,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 180),
                                curve: Curves.easeOutCubic,
                                style: textTheme.headlineLarge!.copyWith(
                                  fontSize: titleSize,
                                  color: AppColors.ink,
                                  height: 0.95,
                                ),
                                child: Text(widget.project.title),
                              ),
                            ),
                            const SizedBox(width: AppSpacing.md),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 220),
                              curve: Curves.easeOutCubic,
                              width: info.isMobile ? 44 : 58,
                              height: info.isMobile ? 44 : 58,
                              decoration: BoxDecoration(
                                color: _isHovered
                                    ? AppColors.accent
                                    : AppColors.accentSoft,
                                borderRadius: BorderRadius.circular(AppRadii.pill),
                              ),
                              child: Icon(
                                Icons.arrow_outward_rounded,
                                color: _isHovered ? Colors.white : AppColors.accent,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        horizontalLayout
                            ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 7,
                              child: _DummyProjectVisual(
                                imageHeight: imageHeight,
                                isHovered: _isHovered,
                              ),
                            ),
                            const SizedBox(width: AppSpacing.lg),
                            Expanded(
                              flex: 5,
                              child: _ProjectDetails(
                                project: widget.project,
                                isHovered: _isHovered,
                              ),
                            ),
                          ],
                        )
                            : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _DummyProjectVisual(
                              imageHeight: imageHeight,
                              isHovered: _isHovered,
                            ),
                            const SizedBox(height: AppSpacing.lg),
                            _ProjectDetails(
                              project: widget.project,
                              isHovered: _isHovered,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DummyProjectVisual extends StatelessWidget {
  const _DummyProjectVisual({
    required this.imageHeight,
    required this.isHovered,
  });

  final double imageHeight;
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 240),
      curve: Curves.easeOutCubic,
      height: imageHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F3EE),
        borderRadius: BorderRadius.circular(AppRadii.lg),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadii.lg),
        child: Stack(
          children: [
            Positioned.fill(
              child: AnimatedScale(
                duration: const Duration(milliseconds: 260),
                curve: Curves.easeOutCubic,
                scale: isHovered ? 1.03 : 1.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.accent.withValues(alpha: 0.94),
                        const Color(0xFFFF8A3D),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 240),
              curve: Curves.easeOutCubic,
              right: isHovered ? 28 : 40,
              top: isHovered ? 20 : 28,
              child: Transform.rotate(
                angle: -0.52,
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 240),
                  curve: Curves.easeOutCubic,
                  scale: isHovered ? 1.04 : 1.0,
                  child: Container(
                    width: imageHeight * 0.42,
                    height: imageHeight * 0.82,
                    decoration: BoxDecoration(
                      color: AppColors.ink,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black54, width: 6),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x44000000),
                          blurRadius: 28,
                          offset: Offset(0, 16),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '.nitro',
                        style: textTheme.headlineMedium?.copyWith(
                          color: AppColors.accent,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: AppSpacing.md,
              bottom: AppSpacing.md,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 180),
                opacity: isHovered ? 1.0 : 0.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.92),
                    borderRadius: BorderRadius.circular(AppRadii.pill),
                  ),
                  child: Text(
                    'View project',
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.ink,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectDetails extends StatelessWidget {
  const _ProjectDetails({
    required this.project,
    required this.isHovered,
  });

  final _ProjectData project;
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
      padding: EdgeInsets.all(isHovered ? AppSpacing.sm : 0),
      decoration: BoxDecoration(
        color: isHovered ? AppColors.accentSoft.withValues(alpha: 0.42) : Colors.transparent,
        borderRadius: BorderRadius.circular(AppRadii.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overview',
            style: textTheme.titleLarge?.copyWith(color: AppColors.accent),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            project.summary,
            style: textTheme.bodyMedium?.copyWith(color: AppColors.ink),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Highlights',
            style: textTheme.titleLarge?.copyWith(color: AppColors.ink),
          ),
          const SizedBox(height: AppSpacing.sm),
          ...project.highlights.map(
                (item) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    margin: const EdgeInsets.only(top: 8),
                    width: isHovered ? 10 : 8,
                    height: isHovered ? 10 : 8,
                    decoration: const BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      item,
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.inkMuted,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectData {
  const _ProjectData({
    required this.year,
    required this.title,
    required this.category,
    required this.slug,
    required this.routeName,
    required this.summary,
    required this.highlights,
  });

  final String year;
  final String title;
  final String category;
  final String slug;
  final String routeName;
  final String summary;
  final List<String> highlights;
}