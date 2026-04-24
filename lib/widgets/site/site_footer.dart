import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme/app_spacing.dart';
import '../common/responsive_section.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      color: const Color(0xFF050505),
      child: ResponsiveSection(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.section,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 960;

              if (isMobile) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _FooterBrand(textTheme: textTheme),
                    const SizedBox(height: AppSpacing.xl),
                    const _FooterDivider(),
                    const SizedBox(height: AppSpacing.xl),
                    const _FooterLinksMobile(),
                    const SizedBox(height: AppSpacing.xl),
                    const _FooterDivider(),
                    const SizedBox(height: AppSpacing.lg),
                    _FooterBottomRow(textTheme: textTheme),
                  ],
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: _FooterBrand(textTheme: textTheme),
                      ),
                      const SizedBox(width: 72),
                      const Expanded(
                        flex: 6,
                        child: _FooterLinksDesktop(),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  const _FooterDivider(),
                  const SizedBox(height: AppSpacing.lg),
                  _FooterBottomRow(textTheme: textTheme),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _FooterBrand extends StatelessWidget {
  const _FooterBrand({
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 420),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nirmal Karthikeyan',
            style: textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              height: 1.1,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'UX designer focused on clear, thoughtful digital experiences across product, service, and web journeys.',
            style: textTheme.bodyLarge?.copyWith(
              color: Colors.white70,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterLinksDesktop extends StatelessWidget {
  const _FooterLinksDesktop();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      runSpacing: AppSpacing.xl,
      spacing: 48,
      children: const [
        SizedBox(
          width: 180,
          child: _FooterLinkGroup(
            title: 'Navigate',
            links: [
              FooterLinkItem(label: 'Home', routeName: 'home'),
              FooterLinkItem(label: 'Documentation', routeName: 'documentation'),
              FooterLinkItem(label: 'Contact', routeName: 'contact'),
            ],
          ),
        ),
        SizedBox(
          width: 220,
          child: _FooterLinkGroup(
            title: 'Projects',
            links: [
              FooterLinkItem(
                label: 'Pet Insurance Quote Flow',
                routeName: 'perfect-pet-quote-flow',
              ),
              FooterLinkItem(
                label: 'Layout demo',
                routeName: 'project-layout-demo',
              ),
            ],
          ),
        ),
        SizedBox(
          width: 160,
          child: _FooterLinkGroup(
            title: 'Elsewhere',
            links: [
              FooterLinkItem(label: 'LinkedIn', externalUrl: 'https://linkedin.com/in/nirmalkarthikeyan'),
              FooterLinkItem(label: 'Medium', externalUrl: 'https://nirmalkarthikeyan.medium.com/'),
              FooterLinkItem(label: 'CV', externalUrl: 'https://cyberwizard.dev/cv'),
              FooterLinkItem(label: 'Email', externalUrl: 'mailto:hello@cyberwizard.dev'),
            ],
          ),
        ),
      ],
    );
  }
}

class _FooterLinksMobile extends StatelessWidget {
  const _FooterLinksMobile();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FooterLinkGroup(
          title: 'Navigate',
          links: [
            FooterLinkItem(label: 'Home', routeName: 'home'),
            FooterLinkItem(label: 'Documentation', routeName: 'documentation'),
            FooterLinkItem(label: 'Contact', routeName: 'contact'),
          ],
        ),
        SizedBox(height: AppSpacing.xl),
        _FooterLinkGroup(
          title: 'Projects',
          links: [
            FooterLinkItem(
              label: 'Pet Insurance Quote Flow',
              routeName: 'perfect-pet-quote-flow',
            ),
            FooterLinkItem(
              label: 'Layout demo',
              routeName: 'project-layout-demo',
            ),
          ],
        ),
        SizedBox(height: AppSpacing.xl),
        _FooterLinkGroup(
          title: 'Elsewhere',
          links: [
            FooterLinkItem(label: 'LinkedIn', externalUrl: 'https://linkedin.com/in/nirmalkarthikeyan'),
            FooterLinkItem(label: 'Medium', externalUrl: 'https://nirmalkarthikeyan.medium.com/'),
            FooterLinkItem(label: 'CV', externalUrl: 'https://cyberwizard.dev/cv'),
            FooterLinkItem(label: 'Email', externalUrl: 'mailto:hello@cyberwizard.dev'),
          ],
        ),
      ],
    );
  }
}

class FooterLinkItem {
  final String label;
  final String? routeName;
  final String? externalUrl;

  const FooterLinkItem({
    required this.label,
    this.routeName,
    this.externalUrl,
  });
}

class _FooterLinkGroup extends StatelessWidget {
  const _FooterLinkGroup({
    required this.title,
    required this.links,
  });

  final String title;
  final List<FooterLinkItem> links;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.labelLarge?.copyWith(
            color: const Color(0xFFFB6000),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        ...links.map(
              (link) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: _FooterLink(item: link),
          ),
        ),
      ],
    );
  }
}

class _FooterLink extends StatefulWidget {
  const _FooterLink({
    required this.item,
  });

  final FooterLinkItem item;

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _isHovered = false;

  Future<void> _handleTap(BuildContext context) async {
    final routeName = widget.item.routeName;
    final externalUrl = widget.item.externalUrl;
    if (routeName != null) {
      context.goNamed(routeName);
    } else if (externalUrl != null) {
      final uri = Uri.parse(externalUrl);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        debugPrint('Could not open $externalUrl');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isInteractive = widget.item.routeName != null || widget.item.externalUrl != null;

    return MouseRegion(
      cursor: isInteractive
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: isInteractive ? () => _handleTap(context) : null,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 160),
          style: textTheme.bodyLarge!.copyWith(
            color: _isHovered && isInteractive
                ? const Color(0xFFFB6000)
                : Colors.white70,
            height: 1.6,
          ),
          child: Text(widget.item.label),
        ),
      ),
    );
  }
}

class _FooterDivider extends StatelessWidget {
  const _FooterDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.white.withValues(alpha: 0.08),
    );
  }
}

class _FooterBottomRow extends StatelessWidget {
  const _FooterBottomRow({
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '© 2026 Nirmal Karthikeyan',
            style: textTheme.bodyMedium?.copyWith(
              color: Colors.white54,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Designed and built in Flutter.',
            style: textTheme.bodyMedium?.copyWith(
              color: Colors.white54,
            ),
          ),
        ],
      );
    }

    return Row(
      children: [
        Text(
          '© 2026 Nirmal Karthikeyan',
          style: textTheme.bodyMedium?.copyWith(
            color: Colors.white54,
          ),
        ),
        const Spacer(),
        Text(
          'Designed and built in Flutter.',
          style: textTheme.bodyMedium?.copyWith(
            color: Colors.white54,
          ),
        ),
      ],
    );
  }
}