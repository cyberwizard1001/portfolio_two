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

            // ── 1. HERO ──────────────────────────────────────────────────────
            // Full-bleed opener: back nav, eyebrow, title, hook, sprint summary.
            // Replaces the empty _HeroImageBlock + ProjectIntroBlock + _HookAndBlurbBlock.
            const _CaseStudyHero(),

            // ── 2. VITALS ────────────────────────────────────────────────────
            // Quick-scan metadata so a reviewer immediately knows role, team,
            // timeline without reading prose.
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

            // ── 3. PROBLEM ───────────────────────────────────────────────────
            // State the problem before anything else. The reader needs to know
            // what was broken and why it mattered before they care about personas,
            // methods, or decisions.
            const ProjectProblemKeyInfoBlock(
              themeConfig: lightTheme,
              problemTitle: 'The problem',
              problemBody:
              'Perfect Pet Insurance\u2019s quote journey lets users select cover, review their policy, and continue to purchase. The Review Details stage \u2014 where a user actually decides whether to buy \u2014 was failing them. Dense text, weak hierarchy, and a near-total absence of reassurance cues meant users arrived at the most important moment in the flow without the clarity they needed to proceed confidently.',
              contextBody:
              'The existing experience was technically complete but practically unusable. For users arriving from aggregator journeys mid-funnel \u2014 encountering the brand for the first time with no prior context \u2014 the page asked too much. It buried the information that mattered, foregrounded compliance language, and provided no signal that the product was worth trusting. The redesign needed to fix that without stripping policy detail or breaking FCA requirements.',
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

            // ── 4. EVIDENCE ──────────────────────────────────────────────────
            // How we know it was broken. Behavioural data, session recordings,
            // internal feedback. Grounds the problem in observation rather than
            // assumption.
            const ProjectFindingsGridBlock(
              themeConfig: softTheme,
              title: 'What the evidence showed',
              items: [
                ProjectFindingItem(
                  title: 'Users were spending too long on review',
                  body:
                  'Hotjar recordings showed users spending 5 to 8 minutes on the Review Details stage, repeatedly scanning the page and revisiting content before deciding whether to continue.',
                ),
                ProjectFindingItem(
                  title: 'Users left the flow to find reassurance',
                  body:
                  'Some users exited the quote journey entirely and visited the main website to understand what was included in their policy \u2014 the review page itself was not providing enough clarity.',
                ),
                ProjectFindingItem(
                  title: 'Behaviour signalled friction and overload',
                  body:
                  'Session recordings showed long pauses, repeated scrolling, and rage clicks on non-interactive elements \u2014 confusion rather than confident progression.',
                ),
                ProjectFindingItem(
                  title: 'Competitors handled trust more effectively',
                  body:
                  'Competitor and aggregator-linked journeys used stronger brand alignment, more visible trust signals, and clearer policy summaries at comparable decision points.',
                ),
                ProjectFindingItem(
                  title: 'The interface lacked consistency',
                  body:
                  'Buttons, pop-ups, close states, and text formatting varied across the flow, weakening the sense of polish and reliability.',
                ),
                ProjectFindingItem(
                  title: 'Internal teams heard the same concerns',
                  body:
                  'Call-centre colleagues flagged recurring uncertainty around cover details and next steps, reinforcing what the behavioural analysis already showed.',
                ),
              ],
            ),

            // ── 5. THE CORE INSIGHT ──────────────────────────────────────────
            // A single crystallising statement before we introduce who was
            // affected. Sets up the personas with purpose.
            const ProjectQuoteBlock(
              themeConfig: darkTheme,
              quote:
              'The issue was not a lack of demand. It was the amount of effort users had to expend to understand the product and feel confident proceeding.',
              attribution:
              'Summary of the core finding across research and internal feedback',
            ),

            // ── 6. WHO WE WERE DESIGNING FOR ─────────────────────────────────
            // Personas land here, after the problem is established and the
            // reader understands why these people matter. Both archetypes were
            // failing: the first-timer lost in jargon, and the experienced buyer
            // who couldn't trust what he was reading.
            const ProjectPersonaBlock(
              themeConfig: softTheme,
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
              themeConfig: lightTheme,
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

            // ── 7. NORTH STAR ────────────────────────────────────────────────
            // With the problem and the people clear, state the single principle
            // that governed every subsequent decision before the method is shown.
            const ProjectCalloutBlock(
              themeConfig: darkTheme,
              style: CalloutStyle.principle,
              label: 'Design principle',
              icon: Icons.compass_calibration_outlined,
              body:
              'Every decision in this redesign was evaluated against one question: does this reduce the effort a user has to make in order to understand what they are reviewing? Visual polish, brand alignment, and FCA compliance all mattered \u2014 but none of them were the north star. Reducing interpretation burden was.',
            ),

            // ── 8. METHOD ────────────────────────────────────────────────────
            // How we approached the work. Five steps from evidence review
            // through benchmarking, heuristic audit, constrained exploration,
            // and internal validation.
            const ProjectProcessStepsBlock(
              themeConfig: lightTheme,
              title: 'How we approached it',
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

            // ── 9. OPPORTUNITY FRAMING ───────────────────────────────────────
            // HMW questions bridge the research phase to the ideation phase.
            // Placed after method, before solutions, they show the thinking
            // that shaped the design direction.
            const ProjectHowMightWeBlock(
              themeConfig: softTheme,
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

            // ── 10. BEFORE / AFTER ───────────────────────────────────────────
            // Show the direction of change at a high level before the decision
            // log unpacks the reasoning behind specific choices.
            const ProjectBeforeAfterBlock(
              themeConfig: darkTheme,
              beforeTitle: 'Before',
              beforeBody:
              'The previous experience presented important policy information in a way that was technically complete but difficult to process quickly. Dense paragraphs, weak emphasis, and inconsistent interface elements made the journey feel dated and harder to trust.',
              afterTitle: 'After',
              afterBody:
              'The redesigned version introduced clearer hierarchy, stronger sectioning, and more deliberate reassurance cues. The goal was not to reduce necessary information, but to structure it in a way that felt more readable, coherent, and aligned with the wider brand experience.',
            ),

            // ── 11. DECISIONS ────────────────────────────────────────────────
            // The log of specific design choices: why each was made, what
            // happened, and which were tradeoffs rather than clean wins.
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
                  'Consistency was restored across buttons, tooltips, modals, and toggle states. Engineering estimated lower maintenance cost as a secondary benefit.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision:
                  'Deferred mobile layout optimisation to a follow-up sprint',
                  rationale:
                  'Two-week timeline and MudBlazor grid constraints made a full responsive overhaul impractical. Mobile represented roughly 35% of traffic but the majority of completions still happened on desktop.',
                  outcome:
                  'Known gap. A follow-up ticket exists to revisit the mobile layout once A/B results are available and engineering capacity allows.',
                  outcomeType: DecisionOutcomeType.tradeoff,
                ),
              ],
            ),

            // ── 12. THE REDESIGN ─────────────────────────────────────────────
            // Now we show the solution. Reader has full context: the problem,
            // the evidence, the people, the principle, the method, and the
            // decisions. The redesign lands with meaning.
            ProjectTextImageBlock(
              themeConfig: darkTheme,
              eyebrow: 'Solution',
              title: 'What the redesigned flow looks like',
              body:
              'Key policy information was surfaced earlier, related content was grouped more deliberately, and the layout was reworked to reduce visual density. Greater attention was given to trust cues and interface consistency so the journey felt credible and in keeping with the wider brand. The goal was not to simplify for the sake of it \u2014 it was to help users answer three questions quickly: what am I reviewing, what does it include, and what do I do next.',
              image: const _CaseStudyImageCard(
                label: 'Replace with final redesigned Review Details screen',
                height: 460,
              ),
            ),

            // ── 13. ACCESSIBILITY ────────────────────────────────────────────
            // Shows that the redesign went beyond visual. Placed after the
            // solution image so the reader sees the output first, then the
            // rigour behind it.
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
                  'Keyboard accessibility was restored by ensuring the MudExpansionPanel component received focus correctly and responded to Enter and Space.',
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
                  'The primary action button read \u201cContinue\u201d with no context. Screen reader users navigating by button had no indication of what they were continuing to.',
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
                  'MudBlazor focus styles re-enabled and customised to use the brand accent colour at 2px width, passing 3:1 contrast against all backgrounds.',
                ),
                ProjectA11yIssue(
                  issue: 'Page title does not reflect current step',
                  description:
                  'The document title remained \u201cPerfect Pet Insurance\u201d throughout the multi-step flow with no indication of the current stage.',
                  severity: A11ySeverity.moderate,
                  wcagCriterion: '2.4.2 Page Titled',
                  fix:
                  'Title updated to include the current step name: \u201cReview your policy \u2014 Perfect Pet Insurance\u201d.',
                ),
              ],
            ),

            // ── 14. OUTCOMES ─────────────────────────────────────────────────
            // What the redesign was expected to move. Qualitative outcomes
            // while A/B data is still pending.
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

            // ── 15. DESIGNING FOR NON-EXPERTS ────────────────────────────────
            // A reflective beat: most users are not insurance-literate.
            // Sits after outcomes to add qualitative depth before the screens.
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

            // ── 16. SCREENS ──────────────────────────────────────────────────
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

            // ── 17. WHAT'S NEXT ──────────────────────────────────────────────
            const ProjectLearningsBlock(
              themeConfig: lightTheme,
              title: 'What happens next',
              points: [
                'Internal testing suggested the revised flow was easier to understand and felt more credible, particularly in terms of readability and structure.',
                'The redesigned Review Details experience is now being prepared for A/B testing in Amplitude, with results expected over the next few weeks.',
                'Once the experiment has run long enough to produce reliable findings, this case study will be updated with completion data and any broader behavioural changes.',
                'The most important learning from the project: improving visual polish alone would not have been enough. The meaningful change came from reducing the effort required for users to understand what they were reviewing.',
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

// ── HERO ─────────────────────────────────────────────────────────────────────
// Replaces _HeroImageBlock (empty 420px black box) + ProjectIntroBlock
// (duplicate title) + _HookAndBlurbBlock (floating context card).
// All three are merged into one purposeful full-bleed section: back nav,
// eyebrow tag, large title, and a two-part hook + sprint summary.
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
              // Back nav
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

              // Eyebrow
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

              // Title
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

              // Divider
              Container(
                width: 40,
                height: 2,
                color: const Color(0xFFFB6000),
              ),

              const SizedBox(height: AppSpacing.xl),

              // Hook + sprint summary side by side on wide, stacked on narrow
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
      'A redesign of the critical conversion point in the pet insurance journey \u2014 making policy information easier to understand and the overall experience more trustworthy.',
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
      'Over a two-week sprint, I reworked the Review Details stage of the quote flow to better align with the updated brand, reduce cognitive load, and support more confident decision-making. The work was shaped by behavioural evidence, competitive analysis, heuristic review, and practical constraints including FCA compliance and MudBlazor.',
      style: textTheme.bodyMedium?.copyWith(
        color: Colors.white54,
        height: 1.7,
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
