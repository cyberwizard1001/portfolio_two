import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import '../../utils/home_scroll_memory.dart';
import '../common/responsive_section.dart';

class ProjectStackSection extends StatelessWidget {
  const ProjectStackSection({
    super.key,
    this.cursorNotifier,
    required this.scrollController,
  });

  final ValueNotifier<bool>? cursorNotifier;
  final ScrollController scrollController;

  static const projects = [
    _ProjectData(
      year: '2026',
      title: 'Pet Insurance Checkout Redesign',
      category: 'UI/UX',
      slug: 'perfect-pet-insurance-quote-flow',
      routeName: 'perfect-pet-quote-flow',
      summary:
          "The Review Details screen in Perfect Pet Insurance's quote flow was losing users at the point of conversion. A dense, inconsistent experience was replaced with a clearer, more trustworthy one.",
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
          "Perro had a strong product. Users were dropping off during onboarding before they’d seen any of it. A shorter, value-first flow reduced drop-offs, lifted subscription conversion, and contributed to the company’s acquisition.",
      highlights: [
        'Cut screens from 5 to 4, questions from 16 to 11',
        'Replaced photo friction with an avatar system',
        'Designed and implemented in Flutter within 2 weeks',
      ],
    ),
    _ProjectData(
      year: '2024',
      title: 'Crafting Counselling Companions',
      category: 'UX Research / HCI',
      slug: 'crafting-counselling-companions',
      routeName: 'crafting-counselling-companions',
      summary:
          'My MSc dissertation in Human-Computer Interaction. Seven practitioner interviews, a low-contact co-design workshop, and iterative Figma prototyping — leading to a validated concept for a practice dashboard that reduces admin overhead for mental health practitioners.',
      highlights: [
        '47 codes, 7 themes from reflexive thematic analysis',
        'Low-contact co-design workshop with time-poor practitioners',
        'RRI ethical review surfacing AI risk and consent boundaries',
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
                cursorNotifier: cursorNotifier,
                onTap: () {
                  HomeScrollMemory.savedOffset = scrollController.offset;
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
    this.cursorNotifier,
  });

  final _ProjectData project;
  final int index;
  final VoidCallback onTap;
  final ValueNotifier<bool>? cursorNotifier;

  @override
  State<_InteractiveProjectCard> createState() =>
      _InteractiveProjectCardState();
}

class _InteractiveProjectCardState extends State<_InteractiveProjectCard> {
  bool _isHovered = false;
  bool _isPressed = false;

  void _setHovered(bool value) {
    if (_isHovered == value) return;
    setState(() => _isHovered = value);
    widget.cursorNotifier?.value = value;
  }

  void _setPressed(bool value) {
    if (_isPressed == value) return;
    setState(() => _isPressed = value);
  }

  Widget _buildVisual(double imageHeight) {
    switch (widget.project.slug) {
      case 'crafting-counselling-companions':
        return _CounsellingVisual(imageHeight: imageHeight, isHovered: _isHovered);
      case 'perfect-pet-insurance-quote-flow':
        return _PetQuoteVisual(imageHeight: imageHeight, isHovered: _isHovered);
      case 'perro-onboarding-subscription':
        return _PerroVisual(imageHeight: imageHeight, isHovered: _isHovered);
      default:
        return _DummyProjectVisual(imageHeight: imageHeight, isHovered: _isHovered);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ResponsiveBuilder(
      builder: (context, info) {
        final imageHeight = info.isMobile
            ? 220.0
            : info.isTablet
            ? 320.0
            : 420.0;
        final titleSize = info.isMobile
            ? 28.0
            : info.isTablet
            ? 42.0
            : 56.0;
        final horizontalLayout = !info.isMobile;

        final baseOffset = widget.index * -4.0;
        final hoverLift = _isHovered ? -10.0 : 0.0;
        final pressOffset = _isPressed ? 4.0 : 0.0;

        return MouseRegion(
          cursor: MouseCursor.defer,
          onEnter: (_) => _setHovered(true),
          onExit: (_) {
            _setHovered(false);
            _setPressed(false);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            transform: Matrix4.identity()
              ..translate(0.0, baseOffset + hoverLift + pressOffset),
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
                        color: Color(0x144F42B5),
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
                  mouseCursor: MouseCursor.defer,
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
                                borderRadius: BorderRadius.circular(
                                  AppRadii.pill,
                                ),
                              ),
                              child: Icon(
                                Icons.arrow_outward_rounded,
                                color: _isHovered
                                    ? Colors.white
                                    : AppColors.accent,
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
                                    child: _buildVisual(imageHeight),
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
                                  _buildVisual(imageHeight),
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

// ─── Default gradient + phone mockup visual ──────────────────────────────────

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
                        const Color(0xFF6B5EC8),
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
            _ViewProjectPill(isHovered: isHovered),
          ],
        ),
      ),
    );
  }
}

// ─── Shared visual shell + pill ───────────────────────────────────────────────

class _ViewProjectPill extends StatelessWidget {
  const _ViewProjectPill({required this.isHovered});

  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.ink),
          ),
        ),
      ),
    );
  }
}

class _ProjectVisualShell extends StatelessWidget {
  const _ProjectVisualShell({
    required this.imageHeight,
    required this.isHovered,
    required this.content,
  });

  static const _bgLight = Color(0xFFD4D0F2);
  static const _bgDark = Color(0xFF231E52);

  final double imageHeight;
  final bool isHovered;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imageHeight,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadii.lg),
          gradient: const LinearGradient(
            colors: [_bgLight, _bgDark],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppRadii.lg),
          child: Stack(
            children: [
              RepaintBoundary(child: content),
              Positioned.fill(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 240),
                  opacity: isHovered ? 0.10 : 0.0,
                  child: const ColoredBox(color: Colors.black),
                ),
              ),
              _ViewProjectPill(isHovered: isHovered),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Pet Insurance bespoke visual ─────────────────────────────────────────────

class _PetQuoteVisual extends StatelessWidget {
  const _PetQuoteVisual({required this.imageHeight, required this.isHovered});

  final double imageHeight;
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    final s = (imageHeight / 420.0).clamp(0.5, 1.0);

    return _ProjectVisualShell(
      imageHeight: imageHeight,
      isHovered: isHovered,
      content: Stack(
        children: [
          Align(
            alignment: const Alignment(0.55, 0.05),
            child: Transform.rotate(
              angle: 0.04,
              child: SizedBox(
                width: imageHeight * 0.60,
                height: imageHeight * 0.72,
                child: _QuoteCard(scale: s),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-0.78, 0.18),
            child: Transform.rotate(
              angle: -0.06,
              child: SizedBox(
                width: imageHeight * 0.28,
                height: imageHeight * 0.26,
                child: _TrustBadge(scale: s),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuoteCard extends StatelessWidget {
  const _QuoteCard({required this.scale});

  final double scale;

  static const _navy = Color(0xFF1A1640);
  static const _accent = Color(0xFFFAD430);
  static const _soft = Color(0xFFFFF8D4);
  static const _muted = Color(0xFFC0BCDA);
  static const _success = Color(0xFF1E9E61);

  static const _coverFills = [0.90, 0.72, 0.84, 0.65];

  @override
  Widget build(BuildContext context) {
    final navH = (30 * scale).clamp(18.0, 34.0);
    final rowH = (14 * scale).clamp(8.0, 17.0);
    final pad = (10 * scale).clamp(6.0, 12.0);
    final gap = (4 * scale).clamp(2.0, 5.0);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: _navy.withValues(alpha: 0.22),
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: navH,
            decoration: const BoxDecoration(
              color: _navy,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: pad),
            child: Row(
              children: [
                Container(
                  width: (60 * scale).clamp(32.0, 72.0),
                  height: (5 * scale).clamp(3.0, 7.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.85),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                const Spacer(),
                Container(
                  width: (20 * scale).clamp(12.0, 24.0),
                  height: (5 * scale).clamp(3.0, 7.0),
                  decoration: BoxDecoration(
                    color: _accent.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(pad),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: (28 * scale).clamp(16.0, 34.0),
                    width: (80 * scale).clamp(44.0, 96.0),
                    decoration: BoxDecoration(
                      color: _navy.withValues(alpha: 0.82),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(height: gap * 0.8),
                  Container(
                    height: (7 * scale).clamp(4.0, 9.0),
                    width: (50 * scale).clamp(28.0, 60.0),
                    decoration: BoxDecoration(
                      color: _muted.withValues(alpha: 0.65),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  SizedBox(height: gap * 2),
                  Container(height: 1, color: _soft),
                  SizedBox(height: gap * 1.6),
                  ...List.generate(_coverFills.length, (i) => Padding(
                    padding: EdgeInsets.only(bottom: gap),
                    child: Row(
                      children: [
                        Container(
                          width: rowH * 0.75,
                          height: rowH * 0.75,
                          decoration: BoxDecoration(
                            color: _success.withValues(alpha: 0.18),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Container(
                              width: rowH * 0.38,
                              height: rowH * 0.28,
                              decoration: BoxDecoration(
                                color: _success,
                                borderRadius: BorderRadius.circular(1),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 6 * scale),
                        Expanded(
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: _coverFills[i],
                            child: Container(
                              height: (5.5 * scale).clamp(3.5, 7.0),
                              decoration: BoxDecoration(
                                color: _muted.withValues(alpha: 0.50),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                  const Spacer(),
                  Container(
                    height: (22 * scale).clamp(14.0, 28.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: _accent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Container(
                        height: (5 * scale).clamp(3.0, 6.5),
                        width: (48 * scale).clamp(28.0, 60.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.88),
                          borderRadius: BorderRadius.circular(2),
                        ),
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

class _TrustBadge extends StatelessWidget {
  const _TrustBadge({required this.scale});

  final double scale;

  static const _navy = Color(0xFF1A1640);
  static const _soft = Color(0xFFFFF8D4);
  static const _muted = Color(0xFFC0BCDA);

  @override
  Widget build(BuildContext context) {
    final pad = (10 * scale).clamp(6.0, 12.0);
    final barH = (6 * scale).clamp(4.0, 8.0);
    final gap = (5 * scale).clamp(3.0, 7.0);
    final iconD = (22 * scale).clamp(14.0, 28.0);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: _navy.withValues(alpha: 0.14),
            blurRadius: 8,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: EdgeInsets.all(pad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: iconD,
            height: iconD,
            decoration: BoxDecoration(
              color: _soft,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          SizedBox(height: gap),
          Container(
            height: barH,
            width: double.infinity,
            decoration: BoxDecoration(
              color: _navy.withValues(alpha: 0.72),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(height: gap * 0.7),
          Container(
            height: barH * 0.8,
            width: (50 * scale).clamp(32.0, 64.0),
            decoration: BoxDecoration(
              color: _muted.withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Perro bespoke visual ──────────────────────────────────────────────────────

class _PerroVisual extends StatelessWidget {
  const _PerroVisual({required this.imageHeight, required this.isHovered});

  final double imageHeight;
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    final s = (imageHeight / 420.0).clamp(0.5, 1.0);

    return _ProjectVisualShell(
      imageHeight: imageHeight,
      isHovered: isHovered,
      content: Stack(
        children: [
          Align(
            alignment: const Alignment(0.30, 0.0),
            child: Transform.rotate(
              angle: 0.04,
              child: SizedBox(
                width: imageHeight * 0.36,
                height: imageHeight * 0.84,
                child: _PerroPhone(scale: s),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-0.60, 0.10),
            child: Transform.rotate(
              angle: -0.07,
              child: SizedBox(
                width: imageHeight * 0.26,
                height: imageHeight * 0.56,
                child: _PerroPhoneSmall(scale: s),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PerroPhone extends StatelessWidget {
  const _PerroPhone({required this.scale});

  final double scale;

  static const _frame = Color(0xFF1A1640);
  static const _screen = Color(0xFFF5FFFE);
  static const _accent = Color(0xFF0D9488);
  static const _muted = Color(0xFFB0C8C6);
  static const _avatarA = Color(0xFF99E6DA);
  static const _avatarB = Color(0xFF2DD4BF);
  static const _avatarC = Color(0xFF0D9488);

  @override
  Widget build(BuildContext context) {
    final pad = (8 * scale).clamp(5.0, 10.0);
    final gap = (4 * scale).clamp(2.5, 5.0);
    final barH = (6 * scale).clamp(4.0, 8.0);
    final dotD = (6 * scale).clamp(4.0, 8.0);
    final avatarD = (28 * scale).clamp(18.0, 36.0);

    return Container(
      decoration: BoxDecoration(
        color: _frame,
        borderRadius: BorderRadius.circular(22 * scale),
        border: Border.all(color: Colors.black54, width: 4 * scale),
        boxShadow: [
          BoxShadow(
            color: _frame.withValues(alpha: 0.30),
            blurRadius: 16,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18 * scale),
        child: Container(
          color: _screen,
          padding: EdgeInsets.all(pad),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (i) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.5 * scale),
                  child: Container(
                    width: i == 2 ? dotD * 2.2 : dotD,
                    height: dotD,
                    decoration: BoxDecoration(
                      color: i == 2 ? _accent : _muted.withValues(alpha: 0.55),
                      borderRadius: BorderRadius.circular(dotD),
                    ),
                  ),
                )),
              ),
              SizedBox(height: gap * 2.0),
              Container(
                height: barH * 1.4,
                width: (90 * scale).clamp(55.0, 110.0),
                decoration: BoxDecoration(
                  color: _frame.withValues(alpha: 0.80),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              SizedBox(height: gap * 0.8),
              Container(
                height: barH,
                width: (70 * scale).clamp(44.0, 84.0),
                decoration: BoxDecoration(
                  color: _muted.withValues(alpha: 0.55),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(height: gap * 2.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _avatarCircle(avatarD, _avatarA, selected: false, scale: scale),
                  _avatarCircle(avatarD, _avatarB, selected: true, scale: scale),
                ],
              ),
              SizedBox(height: gap),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _avatarCircle(avatarD, _avatarC, selected: false, scale: scale),
                  _avatarCircle(avatarD, _avatarA.withValues(alpha: 0.6), selected: false, scale: scale),
                ],
              ),
              const Spacer(),
              Container(
                height: (20 * scale).clamp(13.0, 25.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: _accent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Container(
                    height: (4.5 * scale).clamp(3.0, 6.0),
                    width: (36 * scale).clamp(22.0, 46.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.88),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatarCircle(double d, Color color, {required bool selected, required double scale}) {
    return Container(
      width: d,
      height: d,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: selected ? Border.all(color: _accent, width: 2.5 * scale) : null,
        boxShadow: selected
            ? [BoxShadow(color: _accent.withValues(alpha: 0.28), blurRadius: 6, offset: const Offset(0, 2))]
            : null,
      ),
    );
  }
}

class _PerroPhoneSmall extends StatelessWidget {
  const _PerroPhoneSmall({required this.scale});

  final double scale;

  static const _frame = Color(0xFF1A1640);
  static const _screen = Color(0xFFF5FFFE);
  static const _accent = Color(0xFF0D9488);
  static const _muted = Color(0xFFB0C8C6);

  @override
  Widget build(BuildContext context) {
    final pad = (7 * scale).clamp(4.0, 9.0);
    final gap = (4 * scale).clamp(2.5, 5.0);
    final barH = (5 * scale).clamp(3.5, 7.0);

    return Container(
      decoration: BoxDecoration(
        color: _frame,
        borderRadius: BorderRadius.circular(18 * scale),
        border: Border.all(color: Colors.black54, width: 3 * scale),
        boxShadow: [
          BoxShadow(
            color: _frame.withValues(alpha: 0.22),
            blurRadius: 10,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15 * scale),
        child: Container(
          color: _screen,
          padding: EdgeInsets.all(pad),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: barH * 1.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: _frame.withValues(alpha: 0.72),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              SizedBox(height: gap),
              Container(
                height: barH,
                width: (50 * scale).clamp(30.0, 62.0),
                decoration: BoxDecoration(
                  color: _muted.withValues(alpha: 0.55),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(height: gap * 1.5),
              ...List.generate(3, (i) => Padding(
                padding: EdgeInsets.only(bottom: gap * 0.8),
                child: Container(
                  height: barH * 0.85,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: _muted.withValues(alpha: i == 0 ? 0.45 : 0.28),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              )),
              const Spacer(),
              Container(
                height: (16 * scale).clamp(10.0, 20.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: _accent.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: _accent.withValues(alpha: 0.55), width: 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Counselling Companions bespoke visual ────────────────────────────────────

class _CounsellingVisual extends StatelessWidget {
  const _CounsellingVisual({
    required this.imageHeight,
    required this.isHovered,
  });

  final double imageHeight;
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    final s = (imageHeight / 420.0).clamp(0.5, 1.0);
    final cardW = imageHeight * 0.68;
    final cardH = imageHeight * 0.80;
    final sideW = imageHeight * 0.30;
    final sideH = imageHeight * 0.38;

    return _ProjectVisualShell(
      imageHeight: imageHeight,
      isHovered: isHovered,
      content: Stack(
        children: [
          Align(
            alignment: const Alignment(0.68, 0.05),
            child: Transform.rotate(
              angle: 0.045,
              child: SizedBox(
                width: cardW,
                height: cardH,
                child: _DashboardCard(scale: s),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-0.82, 0.12),
            child: Transform.rotate(
              angle: -0.07,
              child: SizedBox(
                width: sideW,
                height: sideH,
                child: _ClientCard(scale: s),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  const _DashboardCard({required this.scale});

  final double scale;

  static const _dark = Color(0xFF1A1640);
  static const _card = Color(0xFFF4F3FC);
  static const _greenMid = Color(0xFF5F52BE);
  static const _greenLight = Color(0xFFC8C4EB);
  static const _amber = Color(0xFFFB6000);
  static const _muted = Color(0xFFB0ABCF);

  // 7 cols × 3 rows — true = has session block
  static const _cal = [
    [true, false, true, false, true, false, false],
    [false, true, false, true, false, true, false],
    [true, false, false, true, false, false, true],
  ];

  static const _sessionColors = [_greenMid, _amber, _greenMid];
  static const _sessionFills = [0.80, 0.58, 0.70];

  @override
  Widget build(BuildContext context) {
    final navH = (30 * scale).clamp(18.0, 34.0);
    final cellH = (13 * scale).clamp(7.0, 15.0);
    final sessionH = (20 * scale).clamp(12.0, 24.0);
    final pad = (10 * scale).clamp(6.0, 12.0);
    final gap = (4 * scale).clamp(2.0, 5.0);

    return Container(
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: _dark.withValues(alpha: 0.22),
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // Nav bar
          Container(
            height: navH,
            decoration: const BoxDecoration(
              color: _dark,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: pad),
            child: Row(
              children: [
                _navTab('Schedule', active: true, scale: scale),
                SizedBox(width: 10 * scale),
                _navTab('People', active: false, scale: scale),
                SizedBox(width: 10 * scale),
                _navTab('Notes', active: false, scale: scale),
              ],
            ),
          ),

          // Body
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(pad),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Calendar grid
                  ..._cal.map(
                    (row) => Padding(
                      padding: EdgeInsets.only(bottom: gap),
                      child: Row(
                        children: List.generate(
                          row.length,
                          (i) => Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 2 * scale,
                              ),
                              child: Container(
                                height: cellH,
                                decoration: BoxDecoration(
                                  color: row[i]
                                      ? _greenLight
                                      : _muted.withValues(alpha: 0.35),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 8 * scale),

                  // Session list
                  ...List.generate(
                    3,
                    (i) => Padding(
                      padding: EdgeInsets.only(bottom: gap),
                      child: Container(
                        height: sessionH,
                        decoration: BoxDecoration(
                          color: _muted.withValues(alpha: 0.20),
                          borderRadius: BorderRadius.circular(5),
                          border: Border(
                            left: BorderSide(
                              color: _sessionColors[i],
                              width: 3,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 7 * scale,
                          vertical: 5 * scale,
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: _sessionFills[i],
                          child: Container(
                            decoration: BoxDecoration(
                              color: _muted.withValues(alpha: 0.55),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
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

  Widget _navTab(String label, {required bool active, required double scale}) {
    final w = label == 'Schedule'
        ? 38.0
        : label == 'People'
        ? 30.0
        : 26.0;
    return Container(
      width: (w * scale).clamp(14.0, 44.0),
      height: (4.5 * scale).clamp(3.0, 6.0),
      decoration: BoxDecoration(
        color: active ? _greenMid : Colors.white.withValues(alpha: 0.22),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class _ClientCard extends StatelessWidget {
  const _ClientCard({required this.scale});

  final double scale;

  static const _dark = Color(0xFF1A1640);
  static const _greenLight = Color(0xFFC8C4EB);
  static const _green = Color(0xFF4840A0);
  static const _muted = Color(0xFFB0ABCF);

  @override
  Widget build(BuildContext context) {
    final pad = (10 * scale).clamp(6.0, 12.0);
    final avatarD = (28 * scale).clamp(18.0, 32.0);
    final barH = (6 * scale).clamp(4.0, 8.0);
    final gap = (5 * scale).clamp(3.0, 7.0);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: _dark.withValues(alpha: 0.15),
            blurRadius: 8,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: EdgeInsets.all(pad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Avatar + name
          Row(
            children: [
              Container(
                width: avatarD,
                height: avatarD,
                decoration: const BoxDecoration(
                  color: _greenLight,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 7 * scale),
              Expanded(
                child: Container(
                  height: (7 * scale).clamp(5.0, 9.0),
                  decoration: BoxDecoration(
                    color: _dark.withValues(alpha: 0.72),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: gap * 1.6),

          // Text lines
          Container(
            height: barH,
            width: double.infinity,
            decoration: BoxDecoration(
              color: _muted.withValues(alpha: 0.65),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(height: gap),
          Container(
            height: barH,
            width: (58 * scale).clamp(36.0, 72.0),
            decoration: BoxDecoration(
              color: _muted.withValues(alpha: 0.45),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          SizedBox(height: gap * 1.6),

          // Status chip
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8 * scale,
              vertical: 4 * scale,
            ),
            decoration: BoxDecoration(
              color: _greenLight,
              borderRadius: BorderRadius.circular(99),
            ),
            child: Container(
              height: (5 * scale).clamp(3.0, 7.0),
              width: (36 * scale).clamp(22.0, 48.0),
              decoration: BoxDecoration(
                color: _green,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Project details panel ────────────────────────────────────────────────────

class _ProjectDetails extends StatelessWidget {
  const _ProjectDetails({required this.project, required this.isHovered});

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
        color: isHovered
            ? AppColors.accentSoft.withValues(alpha: 0.42)
            : AppColors.accentSoft.withValues(alpha: 0),
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

// ─── Data ─────────────────────────────────────────────────────────────────────

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
