import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import '../../widgets/common/responsive_section.dart';

class SiteDocumentationPage extends StatelessWidget {
  const SiteDocumentationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.ink,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResponsiveSection(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
                  child: Row(
                    children: [
                      TextButton.icon(
                        onPressed: () => context.goNamed('home'),
                        icon: const Icon(Icons.arrow_back_rounded),
                        label: const Text('Back home'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveSection(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.section),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Technical documentation',
                        style: textTheme.displayLarge?.copyWith(
                          color: AppColors.accent,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 760),
                        child: Text(
                          'A high-level reference for the portfolio architecture, frontend choices, routing, theming, and reusable content systems.',
                          style: textTheme.bodyLarge?.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const _DocSection(
                title: 'Framework',
                body:
                'This website is built in Flutter for web. The interface uses a widget-based architecture so reusable sections can be composed into homepage modules, project case studies, and standalone static pages. The site is intentionally static, with outbound links used for CV, LinkedIn, and email rather than server-backed forms.',
              ),
              const _DocSection(
                title: 'Routing',
                body:
                'Navigation is handled with go_router. Routes exist for the homepage, project pages by slug, the layout demo route, the contact page, and this documentation page. This keeps URLs readable and allows page-like navigation while staying within a single Flutter web application.',
              ),
              const _DocSection(
                title: 'Styling',
                body:
                'The site uses a centralized theme layer with shared color, spacing, radius, and typography definitions. Reusable widgets accept local overrides where needed, especially for project case-study sections that require different background and foreground color pairings.',
              ),
              const _DocSection(
                title: 'Homepage structure',
                body:
                'The homepage is composed from modular sections including the hero, selected work, about content, and footer. The hero is designed to behave like a strong opening panel, while the project cards route into deeper project pages.',
              ),
              const _DocSection(
                title: 'Project system',
                body:
                'Project pages are not restricted to a single rigid template. Instead, a library of reusable project blocks exists under widgets/project, covering intro layouts, metadata strips, problem framing, research findings, quotes, process, before-and-after comparisons, metrics, galleries, and reflections.',
              ),
              const _DocSection(
                title: 'Contact page',
                body:
                'The contact page is also static. It avoids forms and backend handling, instead relying on direct outbound actions such as mailto links, LinkedIn, CV links, and a QR code that points to email.',
              ),
              const _DocSection(
                title: 'Interaction details',
                body:
                'Hover interactions are implemented for web-facing elements such as cards and footer links. MouseRegion is used to detect pointer entry and exit so interactive elements can respond visually, including hover color changes to orange.',
              ),
              const _DocSection(
                title: 'Extending the site',
                body:
                'New project pages can be assembled by combining reusable case-study blocks in different orders. Additional static routes can also be added for writing, experiments, talks, or downloadable resources without changing the overall architecture.',
              ),
              const SizedBox(height: AppSpacing.section),
            ],
          ),
        ),
      ),
    );
  }
}

class _DocSection extends StatelessWidget {
  const _DocSection({
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ResponsiveSection(
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.xl),
        child: Container(
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
                title,
                style: textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 820),
                child: Text(
                  body,
                  style: textTheme.bodyLarge?.copyWith(
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}