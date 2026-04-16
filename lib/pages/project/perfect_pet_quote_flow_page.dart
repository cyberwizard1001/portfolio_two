import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_2/widgets/project/more_projects_block.dart';
import 'package:portfolio_2/widgets/site/site_footer.dart';

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

class PerfectPetQuoteFlowPage extends StatelessWidget {
  const PerfectPetQuoteFlowPage({super.key});

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
      backgroundColor: AppColors.ink,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _ProjectTopBar(),
            const _HeroImageBlock(),
            const ProjectIntroBlock(
              themeConfig: darkTheme,
              eyebrow: 'Perfect Pet Insurance',
              title: 'Pet Insurance Quote Flow redesign',
              summary:
              'This project focused on the quote and review journey for Perfect Pet Insurance, specifically the stage where users review the details of their selected policy before deciding whether to continue to purchase. The redesign aimed to improve clarity, trust, and readability at a critical decision point, particularly for users arriving from comparison sites with limited context and little familiarity with insurance terminology.',
              trailingLabel: 'Case study 01',
            ),
            const _HookAndBlurbBlock(
              hook:
              'A redesign of a critical conversion point in the pet insurance journey, focused on making policy information easier to understand and the overall experience more trustworthy.',
              blurb:
              'Over a two-week sprint, I reworked the Review Details stage of the quote flow to better align with the updated brand, reduce cognitive load, and support more confident decision-making. The work was shaped by behavioural evidence, competitive analysis, heuristic review, and practical constraints including FCA compliance and the limitations of MudBlazor.',
            ),
            const ProjectMetaStripBlock(
              themeConfig: softTheme,
              items: [
                ProjectMetaItem(label: 'Role', value: 'UX research and design'),
                ProjectMetaItem(
                  label: 'Product',
                  value: 'Perfect Pet Insurance — Quote Flow',
                ),
                ProjectMetaItem(
                  label: 'Team',
                  value: 'Me, front-end dev, QA, BA',
                ),
                ProjectMetaItem(label: 'Timeline', value: '2 weeks'),
              ],
            ),
            const ProjectProblemKeyInfoBlock(
              themeConfig: lightTheme,
              problemTitle: 'Context and challenge',
              problemBody:
              'Perfect Pet Insurance’s quote journey allows users to select cover, review the details of their policy, and then continue towards purchase. The Review Details stage sits at the point where a user stops to assess what they are actually buying: what level of cover they have chosen, what is included, and whether the overall price and proposition feel right for them. It is a critical point in the journey because it is where uncertainty tends to surface most clearly.',
              contextBody:
              'The existing experience made that assessment harder than it needed to be. The page relied heavily on dense text blocks, offered limited visual hierarchy, and lacked the reassurance cues needed to support confident decision-making. For users arriving from aggregator journeys, this was especially problematic. Many were encountering the brand mid-funnel, with limited context, and needed a quick, clear understanding of what they were reviewing. The redesign therefore needed to make the journey easier to understand without reducing essential policy detail or compromising compliance.',
              infoItems: [
                ProjectMetaItem(
                  label: 'Objective',
                  value: 'Improve clarity, trust, and completion',
                ),
                ProjectMetaItem(
                  label: 'Users',
                  value: 'Pet owners reviewing quotes online',
                ),
                ProjectMetaItem(
                  label: 'Constraints',
                  value: 'FCA compliance, legacy continuity, MudBlazor',
                ),
                ProjectMetaItem(
                  label: 'Success measure',
                  value: 'Completion rate and user confidence',
                ),
              ],
            ),
            const ProjectFindingsGridBlock(
              themeConfig: softTheme,
              title: 'How the issue was identified',
              items: [
                ProjectFindingItem(
                  title: 'Users were spending too long on review',
                  body:
                  'Hotjar recordings showed users spending 5 to 8 minutes on the Review Details stage, repeatedly scanning the page and revisiting content before deciding whether to continue.',
                ),
                ProjectFindingItem(
                  title: 'Users were leaving the flow to find reassurance',
                  body:
                  'Some users left the quote journey and visited the main website to better understand what was included in their policy, indicating that the review experience itself was not providing enough clarity.',
                ),
                ProjectFindingItem(
                  title: 'Behaviour suggested friction and overload',
                  body:
                  'Session recordings showed long pauses, repeated scrolling, and rage clicks on non-interactive elements, all of which suggested confusion rather than confident progression.',
                ),
                ProjectFindingItem(
                  title: 'Competitors handled trust more effectively',
                  body:
                  'Competitor and aggregator-linked journeys used stronger brand alignment, more visible trust signals, and clearer summaries of policy information at comparable decision points.',
                ),
                ProjectFindingItem(
                  title: 'The interface lacked consistency',
                  body:
                  'Buttons, pop-ups, close states, and text formatting varied across the flow, which weakened the sense of polish and overall reliability.',
                ),
                ProjectFindingItem(
                  title: 'Internal teams were hearing similar concerns',
                  body:
                  'Feedback from call-centre colleagues highlighted recurring uncertainty around cover details and next steps, reinforcing the patterns already visible in behavioural analysis.',
                ),
              ],
            ),
            const ProjectQuoteBlock(
              themeConfig: darkTheme,
              quote:
              'The issue was not a lack of demand. It was the amount of effort users had to expend to understand the product and feel confident proceeding.',
              attribution: 'Summary of the core finding across research and internal feedback',
            ),
            const ProjectProcessStepsBlock(
              themeConfig: lightTheme,
              title: 'Approach',
              steps: [
                ProjectProcessStep(
                  title: 'Reviewed behavioural evidence',
                  body:
                  'I began by reviewing session recordings, internal feedback, and the existing journey to ensure the redesign was grounded in user behaviour rather than visual preference alone.',
                ),
                ProjectProcessStep(
                  title: 'Benchmarked the category',
                  body:
                  'I reviewed other pet insurance and aggregator-linked experiences to understand how comparable journeys used structure, reassurance, and branding to support decision-making.',
                ),
                ProjectProcessStep(
                  title: 'Conducted a heuristic audit',
                  body:
                  'Using Nielsen Norman heuristics, I evaluated the existing flow against established usability principles such as clarity, consistency, and visibility of system status.',
                ),
                ProjectProcessStep(
                  title: 'Explored solutions within constraints',
                  body:
                  'Working with the BA and front-end developer, I developed layout directions that improved legibility and trust while remaining realistic within MudBlazor and compliant with required policy language.',
                ),
                ProjectProcessStep(
                  title: 'Validated the redesign internally',
                  body:
                  'Once the revised Review Details stage had been finalised, it went through internal usability testing to assess comprehension, confidence, and task completion before live experimentation.',
                ),
              ],
            ),
            const ProjectBeforeAfterBlock(
              themeConfig: softTheme,
              beforeTitle: 'Before',
              beforeBody:
              'The previous experience presented important policy information in a way that was technically complete but difficult to process quickly. Dense paragraphs, weak emphasis, and inconsistent interface elements made the journey feel dated and harder to trust.',
              afterTitle: 'After',
              afterBody:
              'The redesigned version introduced clearer hierarchy, stronger sectioning, and more deliberate reassurance cues. The goal was not to reduce necessary information, but to structure it in a way that felt more readable, coherent, and aligned with the wider brand experience.',
            ),
            ProjectTextImageBlock(
              themeConfig: darkTheme,
              eyebrow: 'Solution',
              title: 'What changed in the redesigned flow',
              body:
              'The redesign focused on making the Review Details stage easier to understand at a glance. Key policy information was surfaced earlier, related content was grouped more deliberately, and the overall layout was reworked to reduce visual density. Greater attention was also given to trust cues and interface consistency, so that the journey felt more credible and more in keeping with the rest of the digital experience. In practice, this meant helping users understand what they were reviewing, what their selected policy included, and what action to take next without unnecessary effort.',
              image: const _CaseStudyImageCard(
                label: 'Replace with final redesigned Review Details screen',
                height: 460,
              ),
            ),
            const ProjectMetricsBandBlock(
              themeConfig: darkTheme,
              items: [
                ProjectMetricItem(
                  value: 'Clarity',
                  label: 'Policy details easier to scan and interpret',
                ),
                ProjectMetricItem(
                  value: 'Trust',
                  label: 'Reassurance built into the journey',
                ),
                ProjectMetricItem(
                  value: 'Structure',
                  label: 'Improved hierarchy and visual balance',
                ),
                ProjectMetricItem(
                  value: 'Progression',
                  label: 'Designed to support completion',
                ),
              ],
            ),
            ProjectTextImageBlock(
              themeConfig: lightTheme,
              eyebrow: 'User context',
              title: 'Designing for users outside the insurance world',
              body:
              'A central consideration throughout the project was that most users would not arrive with detailed knowledge of insurance terminology. They were trying to answer relatively straightforward questions about cost, cover, and whether the policy felt right for them and their pet. The design therefore needed to reduce the burden of interpretation and present information in a way that supported confidence without expecting specialist knowledge.',
              reverse: true,
              image: const _CaseStudyImageCard(
                label: 'Replace with annotated screen showing hierarchy and trust cues',
                height: 420,
              ),
            ),
            ProjectImageGalleryBlock(
              themeConfig: softTheme,
              title: 'Screen gallery',
              images: const [
                _CaseStudyImageCard(
                  label: 'Hero / entry screen',
                  height: 300,
                ),
                _CaseStudyImageCard(
                  label: 'Review Details — previous version',
                  height: 300,
                ),
                _CaseStudyImageCard(
                  label: 'Review Details — redesigned version',
                  height: 300,
                ),
                _CaseStudyImageCard(
                  label: 'Policy details state',
                  height: 300,
                ),
                _CaseStudyImageCard(
                  label: 'Checkout or progress state',
                  height: 300,
                ),
                _CaseStudyImageCard(
                  label: 'Mobile or responsive view',
                  height: 300,
                ),
              ],
            ),
            const ProjectLearningsBlock(
              themeConfig: lightTheme,
              title: 'What happens next',
              points: [
                'Internal testing suggested that the revised flow was easier to understand and felt more credible, particularly in terms of readability and structure.',
                'The redesigned Review Details experience is now being prepared for A/B testing in Amplitude, with results expected over the next few weeks.',
                'Once the experiment has run long enough to produce reliable findings, this case study will be updated with completion data and any broader behavioural changes.',
                'A key learning from the project was that improving visual polish alone would not have been enough. The most meaningful change came from reducing the effort required for users to understand what they were reviewing.',
              ],
            ),
            //const _ProjectFooterNote(),
            const MoreProjectsBlock(
              themeConfig: darkTheme,
              title: 'More projects',
              projects: [
                RelatedProjectItem(
                  title: 'Layout demo',
                  blurb:
                  'A reference page for reusable case study blocks and section patterns used across the portfolio.',
                  routeName: 'project-layout-demo',
                  category: 'System / Portfolio',
                ),
                RelatedProjectItem(
                  title: 'Technical documentation',
                  blurb:
                  'A documentation page covering framework, routing, theming, and the structure behind this portfolio site.',
                  routeName: 'documentation',
                  category: 'Documentation',
                ),
                RelatedProjectItem(
                  title: 'Contact page',
                  blurb:
                  'A simple static contact page with direct paths to email, LinkedIn, and supporting materials.',
                  routeName: 'contact',
                  category: 'Profile',
                ),
              ],
            ),
            const SiteFooter(),
          ],
        ),
      ),
    );
  }
}

class _ProjectTopBar extends StatelessWidget {
  const _ProjectTopBar();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: AppColors.ink,
      child: ResponsiveSection(
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSpacing.xl,
            bottom: AppSpacing.lg,
          ),
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
              const Spacer(),
              Text(
                'Perfect Pet Insurance',
                style: textTheme.bodySmall?.copyWith(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroImageBlock extends StatelessWidget {
  const _HeroImageBlock();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: AppColors.ink,
      child: ResponsiveSection(
        child: Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.xl),
          child: Container(
            width: double.infinity,
            height: 420,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadii.xl),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF1A1714),
                  Color(0xFF0C0B0A),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadii.xl),
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.16),
                    ),
                  ),
                ),
                Positioned(
                  left: AppSpacing.xl,
                  right: AppSpacing.xl,
                  bottom: AppSpacing.xl,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 860),
                    child: Text(
                      'Pet Insurance Quote Flow redesign',
                      style: textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                        height: 1.0,
                        fontWeight: FontWeight.w600,
                      ),
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

class _HookAndBlurbBlock extends StatelessWidget {
  const _HookAndBlurbBlock({
    required this.hook,
    required this.blurb,
  });

  final String hook;
  final String blurb;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ResponsiveSection(
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.section),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F3EC),
            borderRadius: BorderRadius.circular(AppRadii.xl),
            border: Border.all(
              color: Colors.black.withValues(alpha: 0.06),
            ),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 840),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hook,
                  style: textTheme.titleMedium?.copyWith(
                    color: const Color(0xFF171412),
                    height: 1.45,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  blurb,
                  style: textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF4F4A45),
                    height: 1.7,
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


class _CaseStudyImageCard extends StatelessWidget {
  const _CaseStudyImageCard({
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
            Color(0xFF2E2A26),
            Color(0xFF171412),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppRadii.xl),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.12),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Text(
            label,
            style: textTheme.bodyLarge?.copyWith(
              color: Colors.white60,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}