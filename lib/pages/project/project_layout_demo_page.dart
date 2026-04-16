import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import '../../widgets/common/responsive_section.dart';
import '../../widgets/project/project_before_after_block.dart';
import '../../widgets/project/project_findings_grid_block.dart';
import '../../widgets/project/project_image_gallery_block.dart';
import '../../widgets/project/project_intro_block.dart';
import '../../widgets/project/project_learnings_block.dart';
import '../../widgets/project/project_meta_strip_block.dart';
import '../../widgets/project/project_metrics_band_block.dart';
import '../../widgets/project/project_problem_key_info_block.dart';
import '../../widgets/project/project_process_steps_block.dart';
import '../../widgets/project/project_quote_block.dart';
import '../../widgets/project/project_section_theme.dart';
import '../../widgets/project/project_text_image_block.dart';
import 'project_demo_block_label.dart';

class ProjectLayoutDemoPage extends StatelessWidget {
  const ProjectLayoutDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    const darkTheme = ProjectSectionTheme(
      backgroundColor: Color(0xFF050505),
      foregroundColor: Color(0xFFF5F2EA),
      accentColor: Color(0xFFFB6000),
      borderColor: Color(0x26FFFFFF),
      mutedColor: Color(0xB3F5F2EA),
    );

    const lightTheme = ProjectSectionTheme(
      backgroundColor: Color(0xFFE9E4DD),
      foregroundColor: Color(0xFF111111),
      accentColor: Color(0xFFB95317),
      borderColor: Color(0x1A111111),
      mutedColor: Color(0xCC111111),
    );

    const softTheme = ProjectSectionTheme(
      backgroundColor: Color(0xFFF7F3EC),
      foregroundColor: Color(0xFF1A1816),
      accentColor: Color(0xFFCD5A17),
      borderColor: Color(0x221A1816),
      mutedColor: Color(0xB31A1816),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFEEEAE3),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _DemoHero(),
            const _DemoIndex(),
            const SizedBox(height: AppSpacing.lg),

            const ProjectDemoBlockLabel(
              fileName: 'widgets/project/project_intro_block.dart',
              className: 'ProjectIntroBlock',
              usageNote:
              'Use for the opening of a case study: title, context-setting summary, and optional route or state label.',
              child: ProjectIntroBlock(
                themeConfig: darkTheme,
                eyebrow: 'Layout demo',
                title: 'Project case study blocks for UX storytelling',
                summary:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere, tortor vitae faucibus tempor, est arcu cursus nisi, a pellentesque lorem velit sed risus. Suspendisse potenti. Sed vehicula, leo eu imperdiet congue, justo ligula viverra purus, a dictum nibh massa at sapien.',
                trailingLabel: '/work/layout-demo',
              ),
            ),

            const ProjectDemoBlockLabel(
              fileName: 'widgets/project/project_meta_strip_block.dart',
              className: 'ProjectMetaStripBlock',
              usageNote:
              'Use for compact project metadata such as role, scope, team, duration, deliverables, or platform.',
              child: ProjectMetaStripBlock(
                themeConfig: softTheme,
                items: [
                  ProjectMetaItem(label: 'Role', value: 'UX / Product Design'),
                  ProjectMetaItem(label: 'Scope', value: 'Reusable case study system'),
                  ProjectMetaItem(label: 'Format', value: 'Modular Flutter widgets'),
                  ProjectMetaItem(label: 'Use case', value: 'Custom project storytelling'),
                ],
              ),
            ),

            const ProjectDemoBlockLabel(
              fileName: 'widgets/project/project_problem_key_info_block.dart',
              className: 'ProjectProblemKeyInfoBlock',
              usageNote:
              'Use when you need to explain the problem space clearly while surfacing stakeholders, tools, timeframe, or category beside it.',
              child: ProjectProblemKeyInfoBlock(
                themeConfig: lightTheme,
                problemTitle: 'Problem',
                problemBody:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ac sapien nec elit faucibus blandit. Duis in libero non lacus sodales mattis. Integer malesuada, augue nec gravida tempor, sapien mauris tincidunt orci, eu tincidunt justo augue sed enim. Curabitur fermentum justo id nisl interdum, in aliquet eros feugiat.',
                contextBody:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ligula vel velit tincidunt laoreet. Maecenas tempor, tortor eu porttitor vestibulum, mi justo posuere sapien, vitae posuere lorem sem vel erat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed varius, nisl id sodales ultrices, lectus ligula volutpat mi, vel consequat turpis justo eu lorem.',
                infoItems: [
                  ProjectMetaItem(
                    label: 'Stakeholders',
                    value: 'Product, engineering, compliance',
                  ),
                  ProjectMetaItem(label: 'Timeframe', value: '6 weeks'),
                  ProjectMetaItem(
                    label: 'Tools',
                    value: 'Figma, Hotjar, Maze, Notion',
                  ),
                  ProjectMetaItem(label: 'Category', value: 'UI / UX'),
                ],
              ),
            ),

            ProjectDemoBlockLabel(
              fileName: 'widgets/project/project_text_image_block.dart',
              className: 'ProjectTextImageBlock',
              usageNote:
              'Use for narrative sections that pair explanation with a supporting image, board, wireframe, journey map, or artifact.',
              child: ProjectTextImageBlock(
                themeConfig: darkTheme,
                eyebrow: 'Research',
                title: 'Use text and image blocks for narrative sections',
                body:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nec consequat lectus. Integer volutpat eros non sem fermentum, et lacinia magna malesuada. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Duis ut arcu ullamcorper, egestas lorem a, vulputate tortor. Curabitur venenatis velit a diam sodales, sit amet volutpat sem luctus.',
                image: const _DemoImageCard(
                  label: 'Research board placeholder',
                  height: 420,
                ),
              ),
            ),

            const ProjectDemoBlockLabel(
              fileName: 'widgets/project/project_findings_grid_block.dart',
              className: 'ProjectFindingsGridBlock',
              usageNote:
              'Use to summarize recurring observations, themes, usability issues, or interview findings.',
              child: ProjectFindingsGridBlock(
                themeConfig: softTheme,
                title: 'Findings grid',
                items: [
                  ProjectFindingItem(
                    title: 'Finding one',
                    body:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut id lorem et velit efficitur tristique.',
                  ),
                  ProjectFindingItem(
                    title: 'Finding two',
                    body:
                    'Mauris non sem in purus tristique mollis. Donec feugiat magna a lacinia malesuada.',
                  ),
                  ProjectFindingItem(
                    title: 'Finding three',
                    body:
                    'Suspendisse venenatis lacus quis dui volutpat, vel interdum risus cursus.',
                  ),
                  ProjectFindingItem(
                    title: 'Finding four',
                    body:
                    'Aliquam tristique nisi sed odio suscipit, non condimentum risus ultrices.',
                  ),
                  ProjectFindingItem(
                    title: 'Finding five',
                    body:
                    'Nullam bibendum turpis vitae augue volutpat, vitae vulputate est interdum.',
                  ),
                  ProjectFindingItem(
                    title: 'Finding six',
                    body:
                    'Morbi luctus turpis et augue facilisis, quis faucibus lectus fermentum.',
                  ),
                ],
              ),
            ),

            const ProjectDemoBlockLabel(
              fileName: 'widgets/project/project_quote_block.dart',
              className: 'ProjectQuoteBlock',
              usageNote:
              'Use for interview quotes, stakeholder pull-quotes, or a strong line that deserves visual emphasis.',
              child: ProjectQuoteBlock(
                themeConfig: darkTheme,
                quote:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                attribution: 'Interview participant',
              ),
            ),

            const ProjectDemoBlockLabel(
              fileName: 'widgets/project/project_process_steps_block.dart',
              className: 'ProjectProcessStepsBlock',
              usageNote:
              'Use to show the shape of the work across phases such as audit, define, prototype, test, refine, or handoff.',
              child: ProjectProcessStepsBlock(
                themeConfig: lightTheme,
                title: 'Process steps',
                steps: [
                  ProjectProcessStep(
                    title: 'Audit the current state',
                    body:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec lectus eu dui feugiat tristique.',
                  ),
                  ProjectProcessStep(
                    title: 'Define opportunity areas',
                    body:
                    'Vestibulum euismod nibh nec lectus volutpat, nec ullamcorper tortor aliquet.',
                  ),
                  ProjectProcessStep(
                    title: 'Prototype and test',
                    body:
                    'Donec tincidunt, metus nec luctus ultrices, arcu mi imperdiet nibh, eget tincidunt velit odio sed dui.',
                  ),
                  ProjectProcessStep(
                    title: 'Refine and align',
                    body:
                    'Etiam luctus sem non mauris posuere, vel tempus augue dignissim.',
                  ),
                ],
              ),
            ),

            const ProjectDemoBlockLabel(
              fileName: 'widgets/project/project_before_after_block.dart',
              className: 'ProjectBeforeAfterBlock',
              usageNote:
              'Use when contrasting an old experience with a revised direction, especially for clarity, hierarchy, or trust improvements.',
              child: ProjectBeforeAfterBlock(
                themeConfig: softTheme,
                beforeTitle: 'Dense and ambiguous',
                beforeBody:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel odio vitae nibh pretium malesuada. Nam euismod tortor et fermentum iaculis.',
                afterTitle: 'Clearer and more confidence-building',
                afterBody:
                'Integer efficitur, velit nec tincidunt imperdiet, massa eros semper odio, vel vulputate justo velit eu leo.',
              ),
            ),

            const ProjectDemoBlockLabel(
              fileName: 'widgets/project/project_metrics_band_block.dart',
              className: 'ProjectMetricsBandBlock',
              usageNote:
              'Use for impact snapshots such as conversion, drop-off, confidence, speed, satisfaction, or adoption metrics.',
              child: ProjectMetricsBandBlock(
                themeConfig: darkTheme,
                items: [
                  ProjectMetricItem(value: '+21%', label: 'Lorem ipsum conversion lift'),
                  ProjectMetricItem(value: '-34%', label: 'Dolor sit amet drop-off'),
                  ProjectMetricItem(value: '4.7/5', label: 'Usability confidence score'),
                  ProjectMetricItem(value: '2.1x', label: 'Faster critical task completion'),
                ],
              ),
            ),

            ProjectDemoBlockLabel(
              fileName: 'widgets/project/project_text_image_block.dart',
              className: 'ProjectTextImageBlock',
              usageNote:
              'Use the reverse variant when you want visual pacing and do not want every narrative section to read the same way.',
              child: ProjectTextImageBlock(
                themeConfig: lightTheme,
                eyebrow: 'Flows',
                title: 'Reverse layouts for variety and pacing',
                body:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque dapibus nibh a orci vestibulum, ac pulvinar sapien sodales. Nulla facilisi. Curabitur sit amet massa at dui feugiat aliquet. In nec turpis id erat feugiat convallis.',
                reverse: true,
                image: const _DemoImageCard(
                  label: 'User flow placeholder',
                  height: 420,
                ),
              ),
            ),

            ProjectDemoBlockLabel(
              fileName: 'widgets/project/project_image_gallery_block.dart',
              className: 'ProjectImageGalleryBlock',
              usageNote:
              'Use for showing multiple artifacts together such as wireframes, maps, interface iterations, or prototype frames.',
              child: ProjectImageGalleryBlock(
                themeConfig: softTheme,
                title: 'Image gallery block',
                images: const [
                  _DemoImageCard(label: 'Wireframe gallery item', height: 320),
                  _DemoImageCard(label: 'Journey map gallery item', height: 320),
                  _DemoImageCard(label: 'UI exploration gallery item', height: 320),
                  _DemoImageCard(label: 'Prototype gallery item', height: 320),
                ],
              ),
            ),

            const ProjectDemoBlockLabel(
              fileName: 'widgets/project/project_learnings_block.dart',
              className: 'ProjectLearningsBlock',
              usageNote:
              'Use near the end of a case study to reflect on what changed, what was learned, and what you would improve next.',
              child: ProjectLearningsBlock(
                themeConfig: darkTheme,
                title: 'Learnings and reflection',
                points: [
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum luctus erat non neque consequat, in tincidunt orci porta.',
                  'Mauris eu nisl vitae felis ullamcorper aliquet. Donec rhoncus ex in neque luctus, at suscipit augue tincidunt.',
                  'Suspendisse potenti. Integer varius velit nec consequat luctus, est lorem gravida justo, vel bibendum orci lorem non nibh.',
                  'Curabitur faucibus leo quis nunc fermentum, vitae posuere urna efficitur.',
                ],
              ),
            ),

            const _DemoFooterNote(),
          ],
        ),
      ),
    );
  }
}

class _DemoHero extends StatelessWidget {
  const _DemoHero();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      color: AppColors.ink,
      child: ResponsiveSection(
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSpacing.xl,
            bottom: AppSpacing.xxl,
          ),
          child: Column(
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
              const SizedBox(height: AppSpacing.lg),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.xl),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(AppRadii.xl),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Case study block reference',
                      style: textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 820),
                      child: Text(
                        'This page is an internal reference for reusable project-page blocks. Each section below shows the widget filename, class name, and a short note explaining when to use it.',
                        style: textTheme.bodyLarge?.copyWith(
                          color: Colors.white70,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DemoIndex extends StatelessWidget {
  const _DemoIndex();

  static const items = [
    'Intro block',
    'Meta strip',
    'Problem + key info',
    'Text + image',
    'Findings grid',
    'Quote block',
    'Process steps',
    'Before / after',
    'Metrics band',
    'Gallery',
    'Learnings',
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ResponsiveSection(
      child: Padding(
        padding: const EdgeInsets.only(top: AppSpacing.xl),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppRadii.xl),
            border: Border.all(
              color: Colors.black.withValues(alpha: 0.08),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x12000000),
                blurRadius: 24,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What’s on this page',
                style: textTheme.headlineSmall?.copyWith(
                  color: const Color(0xFF141414),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Use this as a pattern library rather than a fixed template. Real project pages can mix these blocks in whatever order the story needs.',
                style: textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF4E4A45),
                  height: 1.6,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: items
                    .map(
                      (item) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.sm,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F1EA),
                      borderRadius: BorderRadius.circular(AppRadii.pill),
                      border: Border.all(
                        color: Colors.black.withValues(alpha: 0.06),
                      ),
                    ),
                    child: Text(
                      item,
                      style: textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF2C2823),
                      ),
                    ),
                  ),
                )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DemoFooterNote extends StatelessWidget {
  const _DemoFooterNote();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      color: AppColors.ink,
      child: ResponsiveSection(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.section),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.xl),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(AppRadii.xl),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'End of reference',
                  style: textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 760),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer feugiat leo at lectus dictum, sit amet feugiat turpis viverra. Use these blocks as a flexible library rather than a rigid template.',
                    style: textTheme.bodyLarge?.copyWith(
                      color: Colors.white70,
                      height: 1.6,
                    ),
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

class _DemoImageCard extends StatelessWidget {
  const _DemoImageCard({
    required this.label,
    required this.height,
  });

  final String label;
  final double height;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF2B2B2B),
            Color(0xFF121212),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(AppRadii.xl),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Text(
            label,
            style: textTheme.bodyLarge?.copyWith(
              color: Colors.white54,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}