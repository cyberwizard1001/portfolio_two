import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_2/widgets/project/more_projects_block.dart';
import 'package:portfolio_2/widgets/site/site_footer.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import '../../widgets/common/responsive_section.dart';
import '../../widgets/project/project_accessibility_audit_block.dart';
import '../../widgets/project/project_before_after_block.dart';
import '../../widgets/project/project_callout_block.dart';
import '../../widgets/project/project_decision_log_block.dart';
import '../../widgets/project/project_findings_grid_block.dart';
import '../../widgets/project/project_how_might_we_block.dart';
import '../../widgets/project/project_image_gallery_block.dart';
import '../../widgets/project/project_intro_block.dart';
import '../../widgets/project/project_learnings_block.dart';
import '../../widgets/project/project_meta_strip_block.dart';
import '../../widgets/project/project_metrics_band_block.dart';
import '../../widgets/project/project_persona_block.dart';
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
                  value: 'Perfect Pet Insurance \u2014 Quote Flow',
                ),
                ProjectMetaItem(
                  label: 'Team',
                  value: 'Me, front-end dev, QA, BA',
                ),
                ProjectMetaItem(label: 'Timeline', value: '2 weeks'),
              ],
            ),

            // ── Persona 1: First-time pet insurer ──────────────────────────
            const ProjectPersonaBlock(
              themeConfig: lightTheme,
              eyebrow: 'User persona',
              name: 'Chloe Watkins',
              role: 'First-time pet owner, recently adopted a Labrador puppy',
              quote:
              'I have no idea what half of this means. I just want to know if my dog is going to be covered if something goes wrong.',
              goals: [
                'Understand what the policy actually covers in plain terms',
                'Feel confident she is choosing the right level of cover for a young dog',
                'Complete the quote without needing to call anyone or Google insurance terms',
                'Know what she will pay each month with no surprises later',
              ],
              frustrations: [
                'Insurance jargon like excess, co-pay, and sub-limits with no plain-language explanation',
                'Unclear what is and is not included without reading long policy documents',
                'Feeling pressured to decide before she fully understands the product',
                'Comparison site results that look similar but are difficult to meaningfully compare',
              ],
              context:
              'Chloe is 27, works in marketing, and is comfortable online but has never bought insurance independently before. She came through a comparison site and arrived at the Review Details page with moderate intent but high uncertainty. She spent nearly seven minutes on the page before abandoning and returning the next day to complete on mobile.',
              contextTags: [
                'First-time buyer',
                'Comparison site entry',
                'Mobile completer',
                'High uncertainty',
              ],
            ),

            // ── Persona 2: Experienced but anxious re-evaluator ────────────
            const ProjectPersonaBlock(
              themeConfig: darkTheme,
              eyebrow: 'User persona',
              name: 'David Okafor',
              role: 'Returning customer renewing cover for a 6-year-old Spaniel',
              quote:
              'My last insurer kept changing the terms at renewal. I need to actually read this properly before I commit to anything.',
              goals: [
                'Verify that cover levels match what he had previously',
                'Understand what has changed since his last policy renewal',
                'Be confident the exclusions do not catch him out if his dog needs treatment',
                'Complete the purchase efficiently without redundant steps',
              ],
              frustrations: [
                'Policy wording that differs from what was shown on the comparison site',
                'Important exclusions buried in fine print rather than surfaced clearly',
                'No way to directly compare his current cover with the new quote',
                'Friction caused by inconsistent UI that makes the journey feel less trustworthy',
              ],
              context:
              'David is 42, works in finance, and approaches insurance decisions with careful scrutiny. He has had two claims in the past and is acutely aware of policy gaps. He bookmarked the quote and returned to it across two sessions. His behaviour on session recordings showed repeated toggling between the cover summary and the detailed terms panel, suggesting a need for side-by-side clarity that the existing layout did not support.',
              contextTags: [
                'Returning customer',
                'High scrutiny',
                'Multi-session journey',
                'Claims experience',
              ],
            ),

            const ProjectProblemKeyInfoBlock(
              themeConfig: lightTheme,
              problemTitle: 'Context and challenge',
              problemBody:
              'Perfect Pet Insurance\u2019s quote journey allows users to select cover, review the details of their policy, and then continue towards purchase. The Review Details stage sits at the point where a user stops to assess what they are actually buying: what level of cover they have chosen, what is included, and whether the overall price and proposition feel right for them. It is a critical point in the journey because it is where uncertainty tends to surface most clearly.',
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
              attribution:
              'Summary of the core finding across research and internal feedback',
            ),

            // ── Callout: the single design principle driving everything ──────
            const ProjectCalloutBlock(
              themeConfig: softTheme,
              style: CalloutStyle.principle,
              label: 'Design principle',
              icon: Icons.compass_calibration_outlined,
              body:
              'Every decision in this redesign was evaluated against one question: does this reduce the effort a user has to make in order to understand what they are reviewing? Visual polish, brand alignment, and FCA compliance all mattered \u2014 but none of them were the north star. Reducing interpretation burden was.',
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

            // ── How might we: bridges research to design direction ───────────
            const ProjectHowMightWeBlock(
              themeConfig: darkTheme,
              title: 'How might we\u2026',
              intro:
              'Opportunity questions distilled from session recordings, internal feedback, and heuristic review.',
              items: [
                ProjectHmwItem(
                  question:
                  'How might we help users understand what they are actually covered for without expecting them to read the full policy document?',
                  theme: 'Clarity',
                ),
                ProjectHmwItem(
                  question:
                  'How might we reduce the time users spend trying to decide whether a policy feels right, so that confidence replaces hesitation?',
                  theme: 'Trust',
                ),
                ProjectHmwItem(
                  question:
                  'How might we surface the most important cover details at the moment they are most needed, rather than hiding them behind toggles and footnotes?',
                  theme: 'Hierarchy',
                ),
                ProjectHmwItem(
                  question:
                  'How might we make the review stage feel like a confident summary rather than a final exam users have to pass?',
                  theme: 'Tone',
                ),
                ProjectHmwItem(
                  question:
                  'How might we design for users who are encountering the brand for the first time mid-journey, arriving with no prior context?',
                  theme: 'Entry point',
                ),
                ProjectHmwItem(
                  question:
                  'How might we maintain all legally required policy language while making the experience feel less like a compliance document?',
                  theme: 'Compliance',
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

            // ── Decision log: why the design landed where it did ────────────
            const ProjectDecisionLogBlock(
              themeConfig: lightTheme,
              title: 'Decision log',
              intro:
              'Key design choices made during the sprint, the reasoning behind them, and what we observed.',
              decisions: [
                ProjectDecisionItem(
                  decision:
                  'Surfaced the three most critical cover details above the fold rather than placing them behind an accordion',
                  rationale:
                  'Session data showed users repeatedly expanding and collapsing the same accordion sections. Forcing key information behind interaction added effort at exactly the point where users needed to feel certain.',
                  outcome:
                  'Internal testing showed significantly faster comprehension of cover scope. Users could answer \u201cwhat am I covered for\u201d within the first scroll pass.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision:
                  'Retained all FCA-required policy language in full rather than replacing it with simplified summaries',
                  rationale:
                  'Compliance requirement was non-negotiable. We explored simplified language panels as a secondary layer but the legal team required full wording to remain primary and unchanged.',
                  outcome:
                  'Resolved through visual hierarchy rather than content reduction: legal language was retained but de-emphasised typographically so key information could be scanned first.',
                  outcomeType: DecisionOutcomeType.neutral,
                ),
                ProjectDecisionItem(
                  decision:
                  'Chose not to introduce a progress indicator on the Review Details page',
                  rationale:
                  'Standard UX guidance favours visible progress in multi-step flows. However, testing suggested that showing \u201cstep 3 of 5\u201d created anxiety about how much was left rather than reassurance about how far they had come.',
                  outcome:
                  'Omitting it reduced reported pressure in internal sessions. This may need to be revisited if A/B data suggests drop-off before the CTA.',
                  outcomeType: DecisionOutcomeType.tradeoff,
                ),
                ProjectDecisionItem(
                  decision:
                  'Standardised all interactive component styles to a single consistent token set',
                  rationale:
                  'Heuristic audit found at least four distinct button styles and three different expansion panel treatments across the flow, all inconsistent with each other and with the wider brand.',
                  outcome:
                  'Resolved in the redesign. Consistency was restored across buttons, tooltips, modals, and toggle states. Engineering estimated lower maintenance cost as a secondary benefit.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision:
                  'Deferred mobile layout optimisation to a follow-up sprint',
                  rationale:
                  'Two-week timeline and MudBlazor grid constraints made a full responsive overhaul impractical. Mobile represented roughly 35% of traffic on this page but the majority of completions still happened on desktop.',
                  outcome:
                  'Known gap. A follow-up ticket exists to revisit the mobile layout once A/B results are available and engineering capacity allows.',
                  outcomeType: DecisionOutcomeType.tradeoff,
                ),
              ],
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

            // ── Accessibility audit: design rigour beyond the visual ─────────
            const ProjectAccessibilityAuditBlock(
              themeConfig: softTheme,
              title: 'Accessibility considerations',
              intro:
              'Issues identified during a heuristic and partial WCAG 2.1 AA review of the existing quote flow, which informed the redesign.',
              issues: [
                ProjectA11yIssue(
                  issue: 'Policy text contrast below minimum threshold',
                  description:
                  'Secondary text used for exclusion notes and footnotes rendered at approximately 3.2:1 against the card background. Users with moderate visual impairment would struggle to read this at a key decision point.',
                  severity: A11ySeverity.critical,
                  wcagCriterion: '1.4.3 Contrast (Minimum)',
                  fix:
                  'Text token updated in the redesign from the legacy muted grey to a value passing 4.5:1 on all background colours used in the flow.',
                ),
                ProjectA11yIssue(
                  issue: 'Accordion expand controls not keyboard accessible',
                  description:
                  'Policy detail accordions could not be expanded via keyboard alone. Users navigating without a mouse had no access to the content hidden behind them.',
                  severity: A11ySeverity.critical,
                  wcagCriterion: '2.1.1 Keyboard',
                  fix:
                  'Raised as a MudBlazor configuration issue. Keyboard accessibility was restored by ensuring the MudExpansionPanel component received focus correctly and responded to Enter and Space.',
                ),
                ProjectA11yIssue(
                  issue: 'Tooltip-only disclosure of exclusion detail',
                  description:
                  'Several exclusion items showed their full description only on hover via a tooltip, providing no fallback for touch or keyboard users.',
                  severity: A11ySeverity.serious,
                  wcagCriterion: '1.3.3 Sensory Characteristics / 2.1.1 Keyboard',
                  fix:
                  'Redesign moves exclusion detail into inline expandable rows rather than tooltips, accessible regardless of input method.',
                ),
                ProjectA11yIssue(
                  issue: 'CTA button label does not describe the action clearly',
                  description:
                  'The primary action button read \u201cContinue\u201d with no context. Screen reader users navigating by button had no indication of what they were continuing to or what the consequence of the action was.',
                  severity: A11ySeverity.serious,
                  wcagCriterion: '2.4.6 Headings and Labels',
                  fix:
                  'Button label revised to \u201cContinue to payment\u201d with an aria-describedby linking to a brief summary of the selected policy.',
                ),
                ProjectA11yIssue(
                  issue: 'No visible focus ring on interactive elements',
                  description:
                  'Focus outlines were suppressed globally in the component library configuration, making it impossible to track keyboard position across the entire flow.',
                  severity: A11ySeverity.serious,
                  wcagCriterion: '2.4.7 Focus Visible',
                  fix:
                  'MudBlazor focus styles re-enabled and customised to use the brand accent colour at 2px width, passing 3:1 contrast against all backgrounds in the flow.',
                ),
                ProjectA11yIssue(
                  issue: 'Page title does not reflect current step',
                  description:
                  'The document title remained \u201cPerfect Pet Insurance\u201d throughout the multi-step flow with no indication of the current stage, making it hard for assistive technology users to orient themselves.',
                  severity: A11ySeverity.moderate,
                  wcagCriterion: '2.4.2 Page Titled',
                  fix:
                  'Title updated to include the current step name, e.g. \u201cReview your policy \u2014 Perfect Pet Insurance\u201d.',
                ),
              ],
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
                label:
                'Replace with annotated screen showing hierarchy and trust cues',
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
                  label: 'Review Details \u2014 previous version',
                  height: 300,
                ),
                _CaseStudyImageCard(
                  label: 'Review Details \u2014 redesigned version',
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
