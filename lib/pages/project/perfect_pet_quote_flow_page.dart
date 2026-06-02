import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_2/widgets/project/more_projects_block.dart';
import 'package:portfolio_2/widgets/site/site_footer.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import '../../widgets/common/responsive_section.dart';
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
              'The Review Details page — where most users were quietly giving up',
            ),

            // ── 2. VITALS ─────────────────────────────────────────────────────
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

            // ── 3. PROBLEM ────────────────────────────────────────────────────
            const ProjectProblemKeyInfoBlock(
              themeConfig: lightTheme,
              problemTitle: 'The problem',
              problemBody:
              'The review page is the last thing someone sees before they hand over their payment details. And for the aggregator traffic that makes up most of Perfect Pet\'s sales, it\'s usually the first time they\'ve seen the brand at all. So it has an awkward double job: explain the product and earn trust at the same time, for a user who\'s never heard of the brand. Hotjar recordings showed people regularly spending upwards of five minutes on the page, opening policy PDFs mid-flow, and in quite a few cases wandering off to the main site for something and never making it back.',
              contextBody:
              'I had two weeks to redesign the page, working with technical BAs, the Head of Product, Compliance and a developer. Two constraints shaped everything: it had to be buildable in the MudBlazor component framework, and all the existing policy copy had to stay for compliance reasons.',
              infoItems: [
                ProjectMetaItem(
                  label: 'Objective',
                  value: 'Make the review step easier to understand and more trustworthy, especially for users meeting the brand for the first time mid-funnel',
                ),
                ProjectMetaItem(
                  label: 'Success measures',
                  value: 'Quote completion rate, dwell time on the review page, and longer-term cancellation and complaint volume',
                ),
                ProjectMetaItem(
                  label: 'Constraints',
                  value: 'FCA compliance, MudBlazor component framework, legacy platform, 2-week sprint',
                ),
              ],
            ),

            // ── 15. USER CONTEXT (moved here) ─────────────────────────────────
            ProjectTextImageBlock(
              themeConfig: softTheme,
              eyebrow: 'User context',
              title: 'Designing for people who aren\'t insurance experts',
              body:
              'If I\'m honest, the last time I read a full insurance policy before buying was never. Most people arriving at this page won\'t either — they\'re not trying to, and shouldn\'t need to. They want to know three things: is my pet covered if something goes wrong, how much will it cost, and does this company actually seem legit? A considerable amount of time and effort went into deciding which information earned a place at the top of the page and what needed to be surfaced in each section to answer these questions, and what can reasonably sit behind an accordion for anyone who wants to dig deeper.',
              reverse: true,
              image: const _CaseStudyImageCard(
                label: 'Replace with annotated screen showing hierarchy and trust cues',
                height: 420,
              ),
            ),

            // ── 8. PROCESS ────────────────────────────────────────────────────
            const ProjectProcessStepsBlock(
              themeConfig: darkTheme,
              title: 'How I approached it',
              steps: [
                ProjectProcessStep(
                  title: 'Competitor UX audit',
                  body:
                  'I looked at how other pet insurers handle the review step for aggregator traffic. The better ones share some fairly consistent patterns, and working out why they do what they do was a useful starting point considering the timeline.',
                ),
                ProjectProcessStep(
                  title: 'Heuristic evaluation',
                  body:
                  'I conducted a heuristic evaluation of the existing page using Nielsen Norman\'s framework — useful for turning a vague sense that something\'s off into a specific, actionable list. I also worked through what was structurally achievable in MudBlazor with the BA and developer, so most layout calls were made before anything hit Figma.',
                ),
                ProjectProcessStep(
                  title: 'Hotjar session analysis',
                  body:
                  'I went through recordings of aggregator-referred users, watching where they paused and where they gave up. One user spent nearly nine minutes before selecting anything — and it wasn\'t an idle cursor, they were actively highlighting different bits of text trying to make sense of it.',
                ),
                ProjectProcessStep(
                  title: 'Internal usability sessions',
                  body:
                  'Eleven moderated one-to-one walkthroughs of the prototype, each followed by a semi-structured interview, recorded and coded into themes. The testers came from claims, complaints, finance and renewals — the people who spend their days cleaning up after a customer has misunderstood what they bought — which is exactly why their feedback turned out to be far more than a stopgap.',
                ),
              ],
            ),

            // ── 4a. COMPETITOR FINDINGS ───────────────────────────────────────
            const ProjectFindingsGridBlock(
              themeConfig: softTheme,
              title: 'What good looks like — competitor and heuristic review',
              items: [
                ProjectFindingItem(
                  title: 'Trust comes before the ask',
                  body:
                  'On our competitors\' sites, Trustpilot ratings, customer numbers and claim stats were all front-loaded. They spend the first part of the page earning your trust, and only then ask you to commit to anything.',
                ),
                ProjectFindingItem(
                  title: 'Policy information you can actually scan',
                  body:
                  'Tables instead of dense paragraphs, everything built into the flow rather than buried in a linked PDF, and a price and CTA that stayed visible the whole way down — so there was never a moment where you had to leave the page to work out what you were buying.',
                ),
                ProjectFindingItem(
                  title: 'Our page had a hierarchy problem',
                  body:
                  'The heuristic audit gave me specific things to point at: four different button styles, benefit details hidden behind low-contrast links, unmarked mandatory fields, and a payment step that gave no sign it was processing. Small frictions individually, but they cluster exactly when users are least sure about continuing.',
                ),
              ],
            ),

            // ── 4b. BEHAVIOURAL FINDINGS ──────────────────────────────────────
            const ProjectFindingsGridBlock(
              themeConfig: darkTheme,
              title: 'What the research surfaced',
              items: [
                ProjectFindingItem(
                  title: 'Pre-existing conditions, not the visuals, was the real problem',
                  body:
                  'Every one of the eleven participants raised pre-existing conditions, unprompted, as the main driver of complaints and declined claims. The core misunderstanding: customers assume "pre-existing" means a formally diagnosed condition, not symptoms already noted in the vet\'s history — and that gap is where a large share of disputes start. It changed what the project was actually about.',
                ),
                ProjectFindingItem(
                  title: 'The numbers that matter were missing',
                  body:
                  'Nine of eleven flagged it. The excess wasn\'t on the first page despite being one of the lowest in the market — Kerry from Claims pointed out that\'s a selling point we were hiding. Age limits, how co-payment works in practice, and the per-condition vet-fee limit were all missing or explained too vaguely to help.',
                ),
                ProjectFindingItem(
                  title: 'The lifetime cover headline overpromises',
                  body:
                  'Tom in Claims — himself a practising vet — flagged that "any veterinary treatment for illnesses and injuries is covered during your pet\'s lifetime" reads as unconditional. Since pre-existing conditions are the most common reason a claim is declined, that sentence sets up the exact expectation the policy can\'t always meet.',
                ),
                ProjectFindingItem(
                  title: 'Trust signals land harder than you\'d think from the inside',
                  body:
                  'The Trustpilot integration went down well, and Rochelle from finance mentioned she hadn\'t heard of Perfect Pet before working here — a fair proxy for how most first-time aggregator visitors feel. Users who left to find missing information on the main site mostly didn\'t come back, so getting trust and detail right on the page itself matters more than it looks.',
                ),
              ],
            ),

            // ── 5. THE CORE FINDING ───────────────────────────────────────────
            const ProjectQuoteBlock(
              themeConfig: softTheme,
              quote:
              'Claim-stage problems are pre-sold at quote stage. The people processing complaints and declined claims were asking, almost in unison, for sales-stage honesty about the things they see go wrong most often.',
              attribution:
              'Synthesis from eleven internal stakeholder sessions — claims, complaints, finance, and renewals',
            ),

            // ── 6c. PERSONA: MIA ──────────────────────────────────────────────
            const ProjectPersonaBlock(
              themeConfig: lightTheme,
              eyebrow: 'Composite persona — derived from 11 SME interview sessions',
              name: 'Mia Chen',
              role: 'First-time pet owner, recently adopted a Labrador, arrived from a comparison aggregator',
              quote:
              '"I just want to know if he\'s covered if something goes wrong. I don\'t know what half of these words mean — and I\'m not sure I trust a brand I\'ve never heard of."',
              goals: [
                'Understand what the policy actually covers without reading a 40-page document',
                'Feel confident the brand is legitimate before entering card details — she\'s never heard of Perfect Pet',
                'Know exactly what she\'ll be charged each month, with no surprises on the first direct debit',
                'Complete the purchase without needing to call anyone or navigate away from the page',
              ],
              frustrations: [
                'Terms like co-payment, excess, and pre-existing condition with no plain-English explanation alongside them',
                'Arriving on a page that looks visually disconnected from the comparison site she just came from',
                'No clear signal that signs and symptoms in her dog\'s vet history might count as a pre-existing condition — even without a diagnosis',
                'Uncertainty about whether the monthly price shown is exactly what will leave her account, or whether it \'may differ slightly\'',
              ],
              context:
              'Mia is built from the patterns Tracy, Kerry and Michelle described from their day-to-day work. As Tracy put it: "people just don\'t understand — they think pre-existing has to be a named condition, and sometimes pets have symptoms without anyone knowing what it is until six months later." Michelle confirmed cases like this make up a real chunk of the complaints she handles. The thing that makes Mia worth designing for is that careful readers get caught too — linked and bilateral conditions (ACL surgery on one leg, then the other) surprise even people who read the wording closely. Mia leaves the flow thinking she\'s covered, and finds out otherwise when her first claim is filed.',
              contextTags: [
                'First-time buyer',
                'Aggregator entry',
                'Brand unfamiliar',
                'Pre-existing risk',
                'Jargon-averse',
              ],
            ),

            // ── 9. OPPORTUNITY FRAMING ────────────────────────────────────────
            const ProjectHowMightWeBlock(
              themeConfig: softTheme,
              title: 'How might we…',
              intro:
              'Three questions from the research, each pointing at a gap between what users think they\'ve bought and what the policy actually covers.',
              items: [
                ProjectHmwItem(
                  question:
                  'How might we make the pre-existing exclusion specific enough that customers understand it covers symptoms in the vet\'s history, not just diagnosed conditions?',
                  theme: 'Transparency',
                ),
                ProjectHmwItem(
                  question:
                  'How might we put excess, co-payment and benefit limits in front of users while they\'re deciding — not after they\'ve filed a claim?',
                  theme: 'Clarity',
                ),
                ProjectHmwItem(
                  question:
                  'How might we build enough trust with someone who\'s never heard of Perfect Pet that they\'re willing to commit by the end of the page?',
                  theme: 'Trust',
                ),
              ],
            ),

            // ── 7. NORTH STAR ─────────────────────────────────────────────────
            const ProjectCalloutBlock(
              themeConfig: lightTheme,
              style: CalloutStyle.principle,
              label: 'Design principle',
              icon: Icons.compass_calibration_outlined,
              body:
              'Through every layout decision there was one question I kept dragging things back to: does this make it easier for someone to understand what they\'re actually looking at? I cared about visual consistency and brand alignment too — but surfacing the right information at the right moment came first.',
            ),

            // ── 10. BEFORE / AFTER ────────────────────────────────────────────
            const ProjectBeforeAfterBlock(
              themeConfig: darkTheme,
              beforeTitle: 'Before',
              beforeBody:
              'A single scrolling page that piled marketing preferences, assumptions and declarations, cover details and payment into one view, mostly as paragraphs of text. The information was technically all there, but it expected you to read the whole thing — and gave you little reason to trust the brand before asking you to commit.',
              afterTitle: 'After',
              afterBody:
              'A two-page flow. Page one leads with price and trust signals, then cover details, warranty questions and personal information. Page two handles assumptions and declarations — including an explicit, acknowledged call-out of the pre-existing conditions rules — before payment. All the FCA-mandated language is still there; it\'s just no longer cluttering the page and has been laid out so it\'s easier to consume.',
            ),

            // ── 11. KEY DECISIONS ─────────────────────────────────────────────
            const ProjectDecisionLogBlock(
              themeConfig: softTheme,
              title: 'Key decisions',
              intro:
              'The calls that shaped the redesign, what drove them, and what we saw.',
              decisions: [
                ProjectDecisionItem(
                  decision:
                  'Pre-existing conditions got their own page with an explicit tick-box',
                  rationale:
                  'All eleven raised it unprompted. A checkbox buried in an assumptions section was never going to fix a misunderstanding this fundamental.',
                  outcome:
                  'Stanley from Finance summed it up: "Having it as its own page — we\'re not hiding it. It\'s quite helpful." Kerry noted it changes the claims conversation, since customers have declared from the outset.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision: 'Excess moved to page one',
                  rationale:
                  'It was missing entirely, which was both a clarity gap and a missed marketing opportunity given it\'s one of the lowest excesses in the market.',
                  outcome:
                  'Now visible alongside cover details, presented as a feature rather than a buried disclosure.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision: 'A qualifier was added to the lifetime cover headline',
                  rationale:
                  'The unconditional wording sets an expectation the policy can\'t always keep, and pre-existing exclusions are the most common reason a claim is declined.',
                  outcome:
                  'Something like "subject to your pet\'s health history" keeps it accurate without changing the meaning for most customers. Flagged to copy and compliance.',
                  outcomeType: DecisionOutcomeType.tradeoff,
                ),
                ProjectDecisionItem(
                  decision: 'Interactive components were standardised',
                  rationale:
                  'The audit found four button styles and three expansion-panel treatments across the flow — enough inconsistency to make the page feel unconsidered, which doesn\'t help when you\'re trying to earn trust.',
                  outcome:
                  'One token set across buttons, tooltips, modals and toggles. Engineering noted it\'d cut maintenance overhead too, with all components being standardised at the time of writing.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision: 'Mobile was deferred to a follow-up sprint',
                  rationale:
                  'A full responsive overhaul wasn\'t realistic in two weeks within MudBlazor\'s grid, though the designs exist for when development catches up. Mobile is ~35% of traffic but most completions still happen on desktop.',
                  outcome:
                  'Backlogged, to be picked up once the A/B experiment gives us something to work with.',
                  outcomeType: DecisionOutcomeType.tradeoff,
                ),
              ],
            ),

            // ── 12. THE REDESIGN ──────────────────────────────────────────────
            ProjectTextImageBlock(
              themeConfig: lightTheme,
              eyebrow: 'Solution',
              title: 'What the redesigned flow delivers',
              body:
              'The redesign simplified information hierarchy, embedded reassurance cues, and modernised the visual experience while remaining compliant with FCA requirements and MudBlazor\'s constraints. Key policy information was surfaced earlier, related content was grouped deliberately, and inconsistencies in the component library were resolved. The goal was to help users answer three questions quickly: what am I reviewing, what does it include, and what do I do next — without requiring them to read extensively or leave the flow.',
              image: const _CaseStudyImageCard(
                label: 'Replace with final redesigned Review Details screen',
                height: 460,
              ),
            ),

            // ── 16. SCREENS ───────────────────────────────────────────────────
            ProjectImageGalleryBlock(
              themeConfig: darkTheme,
              title: 'Screen gallery',
              images: const [
                _CaseStudyImageCard(label: 'Entry — quote selection', height: 300),
                _CaseStudyImageCard(label: 'Review Details — before', height: 300),
                _CaseStudyImageCard(label: 'Review Details — after', height: 300),
                _CaseStudyImageCard(label: 'Policy detail expanded state', height: 300),
                _CaseStudyImageCard(label: 'Checkout / payment step', height: 300),
                _CaseStudyImageCard(label: 'Responsive mobile view', height: 300),
              ],
            ),

            // ── 14. OUTCOMES ──────────────────────────────────────────────────
            const ProjectMetricsBandBlock(
              themeConfig: softTheme,
              items: [
                ProjectMetricItem(
                  value: 'Conversion',
                  label: 'Quote completion rate — primary measure for the A/B experiment',
                ),
                ProjectMetricItem(
                  value: 'Dwell time',
                  label: 'Time-to-decision on the review page',
                ),
                ProjectMetricItem(
                  value: 'Post-sale complaints',
                  label: 'Claim-decline disputes and cancellations over time',
                ),
                ProjectMetricItem(
                  value: 'A/B live',
                  label: '4 variants live in Amplitude with real traffic',
                ),
              ],
            ),

            // ── 17. LEARNINGS ─────────────────────────────────────────────────
            const ProjectLearningsBlock(
              themeConfig: lightTheme,
              title: 'What I took from it',
              points: [
                'The most useful finding was that this isn\'t only a conversion problem. The review page is where the complaints and declined claims of six months\' time are quietly being set up — and getting it right has effects you\'ll never see in a completion rate. They show up much later, in call volumes and cancellations, long after anyone\'s looking at this page.',
                'The sessions left a clear backlog: pre-existing wording that explicitly covers symptoms in the vet\'s history and bilateral conditions, co-payment shown with a worked example, and the monthly-versus-annual price difference explained somewhere visible.',
                'Four variants are live in Amplitude — two desktop, two mobile — each testing where navigation and the CTA sit relative to the cover details. A parallel segment was already running with real users during the sprint, so some layout calls were partly validated before I finished. Once it\'s run long enough to mean something, I\'ll update this with the real numbers.',
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
                  'Perfect Pet Insurance — Case study 01',
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
      'Insuring your pet is an emotional exercise. You hand over a fair bit of money every month hoping the insurer takes the financial — and mental — stress off your hands when your pet isn\'t at its best. So when you\'ve never heard of a brand and the first thing it shows you is a wall of policy text, would you buy? I probably wouldn\'t. This is what customers were faced with when they landed on Perfect Pet\'s \'Review Quote\' page: they\'d come through aggregators like Compare the Market and Money Super Market, and were met with the exact same wall of text. Given that aggregators are our main source of sales, getting this right could make a genuine difference for customers as well as the business.',
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
      'I was allocated one sprint - 2 weeks. I went in thinking it was a tidy-up job — make a dated page look like it belonged in the modern world, no copy changes. I decided to begin with a competitor review, went through Hotjar recordings of the existing page, came up with a redesign and then sat down with eleven colleagues from claims, complaints, finance and renewals for testing. Recruiting internally was a time-crunch call, and yes, conventional wisdom states that people who deal with pet insurance all day make poor stand-in users, but halfway through the first interview, I realised I should go down a different angle. It was obvious they knew exactly what happens when this page doesn\'t do its job — and the interviews quietly turned a visual refresh into something more interesting.',
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
