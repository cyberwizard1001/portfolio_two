import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import '../../widgets/common/responsive_section.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  static const String email = 'hello@cyberwizard.dev';
  static const String linkedInUrl = 'https://linkedin.com/in/nirmalkarthikeyan';
  static const String cvUrl = 'https://cyberwizard.dev/cv';

  String get mailtoLink =>
      'mailto:$email?subject=Hello%20Nirmal&body=Hi%20Nirmal%2C%20I%27d%20love%20to%20chat.';

  Future<void> _openUrl(String value) async {
    final uri = Uri.parse(value);
    if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
      debugPrint('Could not open $value');
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.ink,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ResponsiveSection(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxl),
              child: ResponsiveBuilder(
                builder: (context, info) {
                  final twoColumn = !info.isMobile;
          
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton.icon(
                        onPressed: () => context.goNamed('home'),
                        icon: const Icon(Icons.arrow_back_rounded),
                        label: const Text('Back home'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      Text(
                        'Contact',
                        style: textTheme.displayLarge?.copyWith(
                          color: AppColors.accent,
                          fontSize: info.isMobile ? 52 : 82,
                          height: 0.95,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 760),
                        child: Text(
                          'No forms, no friction. If my work resonates, send me an email, scan the QR, or find me on LinkedIn.',
                          style: textTheme.bodyLarge?.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xxl),
                      twoColumn
                          ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 7,
                            child: _ContactInfoPanel(
                              onOpenCv: () => _openUrl(cvUrl),
                              onOpenLinkedIn: () => _openUrl(linkedInUrl),
                              onOpenMail: () => _openUrl(mailtoLink),
                              email: email,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.xl),
                          Expanded(
                            flex: 5,
                            child: _ContactVisualPanel(
                              mailtoLink: mailtoLink,
                            ),
                          ),
                        ],
                      )
                          : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _ContactInfoPanel(
                            onOpenCv: () => _openUrl(cvUrl),
                            onOpenLinkedIn: () => _openUrl(linkedInUrl),
                            onOpenMail: () => _openUrl(mailtoLink),
                            email: email,
                          ),
                          const SizedBox(height: AppSpacing.xl),
                          _ContactVisualPanel(
                            mailtoLink: mailtoLink,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactInfoPanel extends StatelessWidget {
  const _ContactInfoPanel({
    required this.onOpenCv,
    required this.onOpenLinkedIn,
    required this.onOpenMail,
    required this.email,
  });

  final VoidCallback onOpenCv;
  final VoidCallback onOpenLinkedIn;
  final VoidCallback onOpenMail;
  final String email;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(AppRadii.xl),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Let’s talk',
            style: textTheme.headlineLarge?.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Best for collaborations, design roles, product conversations, or just a good systems-and-UX chat.',
            style: textTheme.bodyLarge?.copyWith(
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          _ContactLinkTile(
            title: 'Email',
            subtitle: email,
            onTap: onOpenMail,
          ),
          const SizedBox(height: AppSpacing.md),
          _ContactLinkTile(
            title: 'LinkedIn',
            subtitle: 'linkedin.com/in/nirmalkarthikeyan',
            onTap: onOpenLinkedIn,
          ),
          const SizedBox(height: AppSpacing.md),
          _ContactLinkTile(
            title: 'CV',
            subtitle: 'View resume / experience',
            onTap: onOpenCv,
          ),
        ],
      ),
    );
  }
}

class _ContactVisualPanel extends StatelessWidget {
  const _ContactVisualPanel({
    required this.mailtoLink,
  });

  final String mailtoLink;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(AppRadii.xl),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.08),
            ),
          ),
          child: Center(
            child: Text(
              'Image space',
              style: textTheme.bodyLarge?.copyWith(
                color: Colors.white38,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppRadii.xl),
          ),
          child: Column(
            children: [
              QrImageView(
                data: mailtoLink,
                version: QrVersions.auto,
                size: 180,
                backgroundColor: Colors.white,
                foregroundColor: AppColors.ink,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Scan to email me',
                style: textTheme.titleLarge?.copyWith(
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ContactLinkTile extends StatefulWidget {
  const _ContactLinkTile({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  State<_ContactLinkTile> createState() => _ContactLinkTileState();
}

class _ContactLinkTileState extends State<_ContactLinkTile>
    with SingleTickerProviderStateMixin {
  bool _hovered = false;
  late final AnimationController _shineController;

  @override
  void initState() {
    super.initState();
    _shineController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 950),
    );
  }

  @override
  void dispose() {
    _shineController.dispose();
    super.dispose();
  }

  void _setHovered(bool value) {
    if (_hovered == value) return;

    setState(() => _hovered = value);

    if (value) {
      _shineController
        ..reset()
        ..forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    const backgroundColor = Color(0xFF050505);
    final defaultBorder = Colors.white.withValues(alpha: 0.08);
    final hoverBorder = AppColors.accent.withValues(alpha: 0.85);

    final titleColor = _hovered ? AppColors.accent : Colors.white;
    final subtitleColor = _hovered
        ? const Color(0xFFE5D6CB)
        : Colors.white70;
    final iconColor = _hovered ? AppColors.accent : Colors.white;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          width: double.infinity,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(AppRadii.lg),
            border: Border.all(
              color: _hovered ? hoverBorder : defaultBorder,
              width: _hovered ? 1.2 : 1,
            ),
            boxShadow: _hovered
                ? [
              BoxShadow(
                color: AppColors.accent.withValues(alpha: 0.10),
                blurRadius: 22,
                spreadRadius: 0,
              ),
            ]
                : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadii.lg),
            child: Stack(
              children: [
                Positioned.fill(
                  child: IgnorePointer(
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 180),
                      opacity: _hovered ? 1 : 0,
                      child: AnimatedBuilder(
                        animation: _shineController,
                        builder: (context, child) {
                          final t = _shineController.value;
                          final width = MediaQuery.of(context).size.width;
                          final x = lerpDouble(-width * 0.6, width * 0.9, t)!;

                          return Transform.translate(
                            offset: Offset(x, 0),
                            child: child,
                          );
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 88,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.transparent,
                                  AppColors.accent.withValues(alpha: 0.00),
                                  AppColors.accent.withValues(alpha: 0.05),
                                  const Color(0xFFFFE7D6).withValues(alpha: 0.14),
                                  AppColors.accent.withValues(alpha: 0.06),
                                  Colors.transparent,
                                ],
                                stops: const [0.0, 0.18, 0.38, 0.5, 0.62, 1.0],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 220),
                              curve: Curves.easeOutCubic,
                              style: textTheme.titleLarge!.copyWith(
                                color: titleColor,
                                fontWeight: FontWeight.w600,
                              ),
                              child: Text(widget.title),
                            ),
                            const SizedBox(height: AppSpacing.xs),
                            AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 220),
                              curve: Curves.easeOutCubic,
                              style: textTheme.bodyMedium!.copyWith(
                                color: subtitleColor,
                                height: 1.5,
                              ),
                              child: Text(widget.subtitle),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      TweenAnimationBuilder<Offset>(
                        duration: const Duration(milliseconds: 220),
                        curve: Curves.easeOutCubic,
                        tween: Tween(
                          begin: Offset.zero,
                          end: _hovered
                              ? const Offset(0.06, -0.06)
                              : Offset.zero,
                        ),
                        builder: (context, offset, child) {
                          return Transform.translate(
                            offset: Offset(offset.dx * 20, offset.dy * 20),
                            child: child,
                          );
                        },
                        child: Icon(
                          Icons.arrow_outward_rounded,
                          color: iconColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}