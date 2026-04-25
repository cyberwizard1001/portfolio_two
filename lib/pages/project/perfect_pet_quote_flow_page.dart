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

            // ── 1. HERO ───────────────────────────────────────────────────────
            const _CaseStudyHero(),

            // ── 1b. HERO IMAGE ────────────────────────────────────────────────
            const _CaseStudyHeroImage(
              caption:
              'The Review Details page \u2014 where most users were quietly giving up',
            ),

            // ── 2. VITALS ─────────────────────────────────────────────────────
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

            // ── 3. PROBLEM ────────────────────────────────────────────────────
            // Background + problem statement + team-agreed objective.
            const ProjectProblemKeyInfoBlock(
              themeConfig: lightTheme,
              problemTitle: 'The problem',
              problemBody:
              'The existing quote flow for Perfect Pet Insurance felt disconnected from the brand\u2019s updated digital identity. It presented users with dense text blocks and minimal visual structure, making policy information difficult to scan or comprehend at a glance. The lack of trust signals and inconsistent visual language further diminished user confidence, resulting in lower conversion rates and a drop in perceived credibility.',
              contextBody:
              'The redesign focused on the Review Details screen \u2014 the essential conversion touchpoint where a user actually decides whether to buy. For users arriving mid-funnel from comparison sites, encountering the brand for the first time with no prior context, the page demanded too much. It buried the information that mattered, foregrounded compliance language, and provided no signal that the product was worth trusting. The scope covered reworking this stage while maintaining functional continuity with the existing platform.',
              infoItems: [
                ProjectMetaItem(
                  label: 'Objective',
                  value: 'Redesign the quote review experience to create a more intuitive, trustworthy, and conversion-friendly interface',
                ),
                ProjectMetaItem(
                  label: 'Success measure',
                  value: 'Improved quote completion rates and increased user confidence when reviewing policy details',
                ),
                ProjectMetaItem(
                  label: 'Constraints',
                  value: 'FCA compliance, legacy continuity, MudBlazor framework',
                ),
                ProjectMetaItem(
                  label: 'Focus',
                  value: 'Simplify information hierarchy, reduce cognitive load, mitigate decision paralysis',
                ),
              ],
            ),

            // ── 4a. RESEARCH: COMPETITOR ANALYSIS + HEURISTIC AUDIT ──────────
            const ProjectFindingsGridBlock(
              themeConfig: softTheme,
              title: 'Competitor analysis and heuristic audit',
              items: [
                ProjectFindingItem(
                  title: 'Competitors front-loaded trust',
                  body:
                  'Every aggregator-linked competitor reviewed used cohesive branding, explicit aggregator acknowledgement (\u201cYou came from Compare the Market\u201d), and prominent Trustpilot ratings before asking users to commit.',
                ),
                ProjectFindingItem(
                  title: 'Policy information was scannable, not scrollable',
                  body:
                  'Competitors used comparison tables and concise summaries rather than long paragraphs. All critical content \u2014 terms, FAQs, policy detail \u2014 stayed within the flow, removing reasons to navigate away.',
                ),
                ProjectFindingItem(
                  title: 'Our landing screen buried what mattered',
                  body:
                  'The existing quote page opened with uninterrupted paragraphs and no visual hierarchy. Key actions and cover details were buried in text. Core benefits hid behind low-contrast \u201cclick here\u201d links.',
                ),
                ProjectFindingItem(
                  title: 'Inconsistent UI eroded credibility',
                  body:
                  'Close buttons varied across the flow \u2014 some purple and rectangular, others orange and rounded. Pop-ups had random capitalisation and uneven alignment. The overall aesthetic felt disconnected from the refreshed brand.',
                ),
                ProjectFindingItem(
                  title: 'Form and feedback gaps at critical moments',
                  body:
                  'Mandatory fields were not clearly marked, error messages were sparse, and the payment stage lacked progress indicators \u2014 leaving users uncertain whether the process was working.',
                ),
              ],
            ),

            // ── 4b. RESEARCH: BEHAVIOURAL INSIGHTS ────────────────────────────
            const ProjectFindingsGridBlock(
              themeConfig: darkTheme,
              title: 'Behavioural insights and internal feedback',
              items: [
                ProjectFindingItem(
                  title: '5\u20138 minutes spent scanning for basic answers',
                  body:
                  'Hotjar session recordings showed users repeatedly revisiting policy PDFs and scrolling text-heavy sections, spending far longer than necessary just to understand what their cover included.',
                ),
                ProjectFindingItem(
                  title: 'Users left the flow to find clarity elsewhere',
                  body:
                  'A significant proportion exited the quote journey to visit the main website, then often didn\u2019t return. The review page itself was not providing sufficient information to support a decision.',
                ),
                ProjectFindingItem(
                  title: 'Rage clicks and long pauses signalled overload',
                  body:
                  'Repeated clicks on non-interactive elements and prolonged pauses at decision points were consistent indicators of confusion and frustration \u2014 not deliberation.',
                ),
                ProjectFindingItem(
                  title: 'Call-centre and session data told the same story',
                  body:
                  'Interviews with call-centre colleagues confirmed recurring patterns: difficulty locating cover details, uncertainty about next steps, and decision paralysis driven by an inability to compare options confidently.',
                ),
              ],
            ),

            // ── 5. THE CORE FINDING ───────────────────────────────────────────
            const ProjectQuoteBlock(
              themeConfig: softTheme,
              quote:
              'Across all research inputs, one message was clear: the quote flow lacked both clarity and trustworthiness. The content structure demanded too much cognitive effort, the interface looked disconnected from the broader brand experience, and system feedback failed to reassure or guide users through key tasks.',
              attribution:
              'Synthesis across competitor analysis, heuristic audit, and behavioural research',
            ),

            // ── 6. WHO WE WERE DESIGNING FOR ──────────────────────────────────
            // Personas land here, after the evidence is laid out.
            // Both archetypes were failing the existing flow for different reasons.
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
              'David is 42, works in finance, and approaches insurance decisions with careful scrutiny. He has had two claims in the past and is acutely aware of policy gaps. He bookmarked the quote and returned to it across two sessions. Session recordings showed repeated toggling between the cover summary and the detailed terms panel, suggesting a need for side-by-side clarity that the existing layout did not support.',
              contextTags: [
                'Returning customer',
                'High scrutiny',
                'Multi-session journey',
                'Claims experience',
              ],
            ),

            // ── 7. NORTH STAR ─────────────────────────────────────────────────
            const ProjectCalloutBlock(
              themeConfig: softTheme,
              style: CalloutStyle.principle,
              label: 'Design principle',
              icon: Icons.compass_calibration_outlined,
              body:
              'Every decision in this redesign was evaluated against one question: does this reduce the effort a user has to make in order to understand what they are reviewing? Visual polish, brand alignment, and FCA compliance all mattered \u2014 but none of them were the north star. Reducing interpretation burden was.',
            ),

            // ── 8. METHOD ─────────────────────────────────────────────────────
            // The real process from the snapshot: competitive review → BA/dev
            // collaboration → internal usability testing → A/B test prep.
            // Crucially: a parallel segment was already live, and its learnings
            // directly informed this redesign.
            const ProjectProcessStepsBlock(
              themeConfig: lightTheme,
              title: 'How we approached it',
              steps: [
                ProjectProcessStep(
                  title: 'Rapid competitive review',
                  body:
                  'I began with a competitive review of leading pet insurance providers and aggregators to identify UX patterns that improved clarity, trust, and decision confidence at comparable mid-funnel touchpoints.',
                ),
                ProjectProcessStep(
                  title: 'Heuristic evaluation of the existing flow',
                  body:
                  'Using the Nielsen Norman framework, I systematically assessed the current experience against principles including visibility of system status, consistency, and aesthetic integrity \u2014 surfacing specific failure points to prioritise.',
                ),
                ProjectProcessStep(
                  title: 'Behavioural analysis and internal interviews',
                  body:
                  'Hotjar session recordings from aggregator referral users were reviewed to identify patterns: where users paused, what they clicked, and where they abandoned. Call-centre interviews added qualitative depth.',
                ),
                ProjectProcessStep(
                  title: 'Collaborative layout exploration within constraints',
                  body:
                  'Working with the BA and front-end developer, I explored layout variations within MudBlazor\u2019s constraints, iterating through design reviews focused on hierarchy, readability, and clear trust signals.',
                ),
                ProjectProcessStep(
                  title: 'Internal usability testing',
                  body:
                  'The redesigned Review Details flow went through internal usability testing to validate comprehension, trust, and task completion before being prepared for live experimentation.',
                ),
                ProjectProcessStep(
                  title: 'Informed by a live parallel experiment',
                  body:
                  'In parallel, another segment of the redesigned quote flow was already deployed and tested with real users. Learnings from that experiment \u2014 particularly around visual density, information ordering, and user reassurance \u2014 directly informed the refinements applied to the Review Details stage.',
                ),
              ],
            ),

            // ── 9. OPPORTUNITY FRAMING ────────────────────────────────────────
            const ProjectHowMightWeBlock(
              themeConfig: darkTheme,
              title: 'How might we\u2026',
              intro:
              'Opportunity questions distilled from competitive analysis, heuristic audit, and behavioural research.',
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
                  'How might we design for users who are encountering the brand for the first time mid-journey, arriving from a comparison site with no prior context?',
                  theme: 'Entry point',
                ),
                ProjectHmwItem(
                  question:
                  'How might we maintain all legally required policy language while making the experience feel less like a compliance document?',
                  theme: 'Compliance',
                ),
              ],
            ),

            // ── 10. BEFORE / AFTER ────────────────────────────────────────────
            const ProjectBeforeAfterBlock(
              themeConfig: softTheme,
              beforeTitle: 'Before',
              beforeBody:
              'The previous experience was technically complete but practically unusable. Dense paragraphs, near-zero visual hierarchy, hidden essential information, and inconsistent UI components made the journey feel dated, untrustworthy, and disconnected from the refreshed brand identity.',
              afterTitle: 'After',
              afterBody:
              'The redesigned version simplified information hierarchy, embedded reassurance cues, and modernised the visual experience within the constraints of MudBlazor and FCA compliance. The result was a flow that felt coherent, credible, and easier to navigate at the most critical moment in the journey.',
            ),

            // ── 11. KEY DECISIONS ─────────────────────────────────────────────
            const ProjectDecisionLogBlock(
              themeConfig: lightTheme,
              title: 'Key decisions',
              intro:
              'Choices made during the sprint, the reasoning behind them, and what we observed as a result.',
              decisions: [
                ProjectDecisionItem(
                  decision:
                  'Surfaced the three most critical cover details above the fold rather than placing them behind an accordion',
                  rationale:
                  'Session recordings showed users repeatedly expanding and collapsing the same accordion sections. Forcing key information behind interaction added effort at exactly the point where users needed certainty.',
                  outcome:
                  'Internal testing showed significantly faster comprehension of cover scope. Users could answer \u201cwhat am I covered for?\u201d within the first scroll pass.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision:
                  'Retained all FCA-required policy language in full rather than replacing it with simplified summaries',
                  rationale:
                  'Compliance was non-negotiable. We explored simplified secondary panels but the legal team required full wording to remain primary and unchanged.',
                  outcome:
                  'Resolved through visual hierarchy rather than content reduction: legal language was retained but de-emphasised typographically so key information could be scanned first.',
                  outcomeType: DecisionOutcomeType.neutral,
                ),
                ProjectDecisionItem(
                  decision:
                  'Chose not to introduce a progress indicator on the Review Details page',
                  rationale:
                  'Standard guidance favours visible progress in multi-step flows. However, testing suggested that showing \u201cstep 3 of 5\u201d created anxiety about how much remained rather than reassurance about how far users had come.',
                  outcome:
                  'Omitting it reduced reported pressure in internal sessions. May need revisiting if A/B data shows drop-off before the CTA.',
                  outcomeType: DecisionOutcomeType.tradeoff,
                ),
                ProjectDecisionItem(
                  decision:
                  'Standardised all interactive component styles to a single consistent token set',
                  rationale:
                  'The heuristic audit found at least four distinct button styles and three different expansion panel treatments \u2014 all inconsistent with each other and the wider brand.',
                  outcome:
                  'Consistency restored across buttons, tooltips, modals, and toggle states. Engineering noted lower maintenance cost as a secondary benefit.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision:
                  'Applied learnings from the live parallel experiment to the Review Details redesign',
                  rationale:
                  'A separate segment of the quote flow had already been deployed and tested with real users. Its findings around visual density, information ordering, and reassurance were directly applicable.',
                  outcome:
                  'Reduced iteration risk. Several layout decisions were validated by the parallel experiment before this stage reached internal testing.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision:
                  'Deferred mobile layout optimisation to a follow-up sprint',
                  rationale:
                  'Two-week timeline and MudBlazor grid constraints made a full responsive overhaul impractical. Mobile represented roughly 35% of traffic but the majority of completions still occurred on desktop.',
                  outcome:
                  'Known gap. A follow-up ticket exists to revisit once A/B results are available and engineering capacity allows.',
                  outcomeType: DecisionOutcomeType.tradeoff,
                ),
              ],
            ),

            // ── 12. THE REDESIGN ──────────────────────────────────────────────
            ProjectTextImageBlock(
              themeConfig: darkTheme,
              eyebrow: 'Solution',
              title: 'What the redesigned flow delivers',
              body:
              'The redesign simplified information hierarchy, embedded reassurance cues, and modernised the visual experience while remaining compliant with FCA requirements and MudBlazor\u2019s constraints. Key policy information was surfaced earlier, related content was grouped deliberately, and inconsistencies in the component library were resolved. The goal was to help users answer three questions quickly: what am I reviewing, what does it include, and what do I do next \u2014 without requiring them to read extensively or leave the flow.',
              image: const _CaseStudyImageCard(
                label: 'Replace with final redesigned Review Details screen',
                height: 460,
              ),
            ),

            // ── 13. ACCESSIBILITY ─────────────────────────────────────────────
            const ProjectAccessibilityAuditBlock(
              themeConfig: softTheme,
              title: 'Accessibility considerations',
              intro:
              'Issues identified during a heuristic and partial WCAG 2.1 AA review of the existing flow, which directly informed the redesign.',
              issues: [
                ProjectA11yIssue(
                  issue: 'Policy text contrast below minimum threshold',
                  description:
                  'Secondary text used for exclusion notes and footnotes rendered at approximately 3.2:1 against the card background. Users with moderate visual impairment would struggle to read this at a key decision point.',
                  severity: A11ySeverity.critical,
                  wcagCriterion: '1.4.3 Contrast (Minimum)',
                  fix:
                  'Text token updated from the legacy muted grey to a value passing 4.5:1 on all background colours used in the flow.',
                ),
                ProjectA11yIssue(
                  issue: 'Accordion expand controls not keyboard accessible',
                  description:
                  'Policy detail accordions could not be expanded via keyboard alone. Users navigating without a mouse had no access to the content hidden behind them.',
                  severity: A11ySeverity.critical,
                  wcagCriterion: '2.1.1 Keyboard',
                  fix:
                  'Keyboard accessibility restored by ensuring MudExpansionPanel received focus correctly and responded to Enter and Space.',
                ),
                ProjectA11yIssue(
                  issue: 'Tooltip-only disclosure of exclusion detail',
                  description:
                  'Several exclusion items showed their full description only on hover via a tooltip, with no fallback for touch or keyboard users.',
                  severity: A11ySeverity.serious,
                  wcagCriterion: '1.3.3 Sensory Characteristics / 2.1.1 Keyboard',
                  fix:
                  'Redesign moves exclusion detail into inline expandable rows accessible regardless of input method.',
                ),
                ProjectA11yIssue(
                  issue: 'CTA button label does not describe the action clearly',
                  description:
                  'The primary action button read \u201cContinue\u201d with no context. Screen reader users navigating by button had no indication of what they were continuing to.',
                  severity: A11ySeverity.serious,
                  wcagCriterion: '2.4.6 Headings and Labels',
                  fix:
                  'Button label revised to \u201cContinue to payment\u201d with aria-describedby linking to a brief summary of the selected policy.',
                ),
                ProjectA11yIssue(
                  issue: 'No visible focus ring on interactive elements',
                  description:
                  'Focus outlines were suppressed globally in the component library configuration, making it impossible to track keyboard position across the entire flow.',
                  severity: A11ySeverity.serious,
                  wcagCriterion: '2.4.7 Focus Visible',
                  fix:
                  'MudBlazor focus styles re-enabled and customised to use the brand accent colour at 2px width, passing 3:1 contrast against all backgrounds.',
                ),
                ProjectA11yIssue(
                  issue: 'Page title does not reflect the current step',
                  description:
                  'The document title remained \u201cPerfect Pet Insurance\u201d throughout the multi-step flow with no indication of the current stage.',
                  severity: A11ySeverity.moderate,
                  wcagCriterion: '2.4.2 Page Titled',
                  fix:
                  'Title updated to include the current step: \u201cReview your policy \u2014 Perfect Pet Insurance\u201d.',
                ),
              ],
            ),

            // ── 14. OUTCOMES ──────────────────────────────────────────────────
            const ProjectMetricsBandBlock(
              themeConfig: darkTheme,
              items: [
                ProjectMetricItem(
                  value: 'Clarity',
                  label: 'Policy details easier to scan and interpret',
                ),
                ProjectMetricItem(
                  value: 'Trust',
                  label: 'Reassurance built into the journey structure',
                ),
                ProjectMetricItem(
                  value: 'Consistency',
                  label: 'Unified component language across the flow',
                ),
                ProjectMetricItem(
                  value: 'A/B ready',
                  label: 'Scheduled for Amplitude live traffic experiment',
                ),
              ],
            ),

            // ── 15. USER CONTEXT ──────────────────────────────────────────────
            ProjectTextImageBlock(
              themeConfig: lightTheme,
              eyebrow: 'User context',
              title: 'Designing for people who are not insurance experts',
              body:
              'Most users arriving at this page were not trying to become experts in pet insurance. They were asking a much simpler set of questions: is my pet covered if something goes wrong, how much does it cost, and do I trust this enough to hand over my card details? The design had to meet people where they were \u2014 not where the policy document assumed they would be.',
              reverse: true,
              image: const _CaseStudyImageCard(
                label: 'Replace with annotated screen showing hierarchy and trust cues',
                height: 420,
              ),
            ),

            // ── 16. SCREENS ───────────────────────────────────────────────────
            ProjectImageGalleryBlock(
              themeConfig: softTheme,
              title: 'Screen gallery',
              images: const [
                _CaseStudyImageCard(label: 'Entry \u2014 quote selection', height: 300),
                _CaseStudyImageCard(label: 'Review Details \u2014 before', height: 300),
                _CaseStudyImageCard(label: 'Review Details \u2014 after', height: 300),
                _CaseStudyImageCard(label: 'Policy detail expanded state', height: 300),
                _CaseStudyImageCard(label: 'Checkout / payment step', height: 300),
                _CaseStudyImageCard(label: 'Responsive mobile view', height: 300),
              ],
            ),

            // ── 17. WHAT'S NEXT ───────────────────────────────────────────────
            const ProjectLearningsBlock(
              themeConfig: lightTheme,
              title: 'What happens next',
              points: [
                'Internal testing suggested the revised flow was easier to understand and felt more credible, particularly in terms of readability, structure, and the reduction of visual inconsistency.',
                'The redesigned Review Details experience is now scheduled for A/B testing in Amplitude alongside live traffic, to measure its impact on conversion and engagement metrics.',
                'A parallel segment of the redesigned quote flow was already deployed and tested with real users during this project. Learnings from that experiment \u2014 around visual density, information ordering, and reassurance \u2014 directly shaped the decisions made here.',
                'Once the A/B experiment has run long enough to produce reliable findings, this case study will be updated with completion rate data and any broader changes in user behaviour.',
                'The most important takeaway: improving visual polish alone would not have moved the needle. The meaningful change came from reducing the cognitive effort required for users to understand what they were reviewing and feel confident enough to proceed.',
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

// ── HERO ──────────────────────────────────────────────────────────────────────
class _CaseStudyHero extends StatelessWidget {
  const _CaseStudyHero();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isNarrow = screenWidth < 720;

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
                icon: const Icon(Icons.arrow_back_rounded, size: 16),
                label: const Text('Back home'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white54,
                  textStyle: textTheme.bodySmall,
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),

              SizedBox(height: isNarrow ? AppSpacing.xl : AppSpacing.xxl),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xxs,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFB6000).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(AppRadii.sm),
                  border: Border.all(
                    color: const Color(0xFFFB6000).withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  'Perfect Pet Insurance \u2014 Case study 01',
                  style: textTheme.labelSmall?.copyWith(
                    color: const Color(0xFFFB6000),
                    letterSpacing: 0.6,
                  ),
                ),
              ),

              const SizedBox(height: AppSpacing.lg),

              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 820),
                child: Text(
                  'Pet insurance checkout page redesign',
                  style: (isNarrow
                      ? textTheme.headlineLarge
                      : textTheme.displayMedium)
                      ?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: 1.08,
                    letterSpacing: -0.5,
                  ),
                ),
              ),

              SizedBox(height: isNarrow ? AppSpacing.lg : AppSpacing.xl),

              Container(width: 40, height: 2, color: const Color(0xFFFB6000)),

              const SizedBox(height: AppSpacing.xl),

              isNarrow
                  ? _HeroTextColumn(textTheme: textTheme)
                  : _HeroTextRow(textTheme: textTheme),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroTextRow extends StatelessWidget {
  const _HeroTextRow({required this.textTheme});
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: _HookText(textTheme: textTheme),
        ),
        const SizedBox(width: AppSpacing.xxl),
        Expanded(
          flex: 4,
          child: _SprintSummaryText(textTheme: textTheme),
        ),
      ],
    );
  }
}

class _HeroTextColumn extends StatelessWidget {
  const _HeroTextColumn({required this.textTheme});
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HookText(textTheme: textTheme),
        const SizedBox(height: AppSpacing.xl),
        _SprintSummaryText(textTheme: textTheme),
      ],
    );
  }
}

class _HookText extends StatelessWidget {
  const _HookText({required this.textTheme});
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Text(
      'How do you help someone buy pet insurance when they can\u2019t understand what they\u2019re actually buying?',
      style: textTheme.titleLarge?.copyWith(
        color: Colors.white,
        height: 1.45,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _SprintSummaryText extends StatelessWidget {
  const _SprintSummaryText({required this.textTheme});
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Text(
      'The existing quote flow felt disconnected from the brand\u2019s updated identity and presented users with dense text, minimal visual structure, and no meaningful trust signals \u2014 resulting in lower conversion and a drop in perceived credibility. Over two weeks, I researched, redesigned, and validated a new Review Details experience that aimed to fix all three.',
      style: textTheme.bodyMedium?.copyWith(
        color: Colors.white54,
        height: 1.7,
      ),
    );
  }
}

// ── HERO IMAGE BLOCK ──────────────────────────────────────────────────────────
class _CaseStudyHeroImage extends StatelessWidget {
  const _CaseStudyHeroImage({
    this.imagePath,
    required this.caption,
  });

  final String? imagePath;
  final String caption;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final imageHeight = screenWidth < 600 ? 280.0 : 480.0;

    DecorationImage? decorationImage;
    if (imagePath != null) {
      decorationImage = DecorationImage(
        image: AssetImage(imagePath!),
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      );
    }

    return Container(
      width: double.infinity,
      color: AppColors.ink,
      child: SizedBox(
        width: double.infinity,
        height: imageHeight,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                image: decorationImage,
                gradient: decorationImage == null
                    ? const LinearGradient(
                        colors: [
                          Color(0xFF1C1814),
                          Color(0xFF0E0C0A),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.45, 1.0],
                  colors: [
                    Color(0x00000000),
                    Color(0x26000000),
                    Color(0xCC000000),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 3,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0x00FB6000), Color(0x99FB6000)],
                  ),
                ),
              ),
            ),
            Positioned(
              left: AppSpacing.xl,
              right: AppSpacing.xl,
              bottom: AppSpacing.xl,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      caption,
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.white60,
                        letterSpacing: 0.4,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.lg),
                  if (imagePath == null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm,
                        vertical: AppSpacing.xxs,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.06),
                        borderRadius: BorderRadius.circular(AppRadii.sm),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.12),
                        ),
                      ),
                      child: Text(
                        'Image placeholder',
                        style: textTheme.labelSmall?.copyWith(
                          color: Colors.white38,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── IMAGE PLACEHOLDER ─────────────────────────────────────────────────────────
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
          colors: [Color(0xFF2E2A26), Color(0xFF171412)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppRadii.xl),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
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
