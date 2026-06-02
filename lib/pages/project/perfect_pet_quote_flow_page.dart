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
              'The review page is the last thing someone sees before they decide to buy or walk away. And for anyone coming in from a comparison aggregator — which, for Perfect Pet, is most people — it\'s usually also the first time they\'ve laid eyes on the brand. So the page has a slightly awkward job: build trust and explain the product, both at once, to someone who\'s never heard of you. The session recordings weren\'t reassuring. People were spending upwards of five minutes on a single page, opening policy PDFs mid-flow, and in quite a few cases wandering off to the main site to find something and never making it back.',
              contextBody:
              'The scope was the Review Details screen, and the clock was two weeks. I had to research and redesign the step inside MudBlazor\'s component framework and around the FCA policy language — the legal copy that, however much you might want to, you simply can\'t edit away. So I started with a competitor review, ran a heuristic evaluation of the existing page, went through the Hotjar recordings, and tested a Figma prototype with eleven internal colleagues.',
              infoItems: [
                ProjectMetaItem(
                  label: 'Objective',
                  value: 'Make the review step easier to understand and more trustworthy, particularly for users encountering the brand for the first time mid-funnel',
                ),
                ProjectMetaItem(
                  label: 'Success measures',
                  value: 'Quote completion rate, dwell time on the review page, and longer-term signals in cancellation and complaint volume',
                ),
                ProjectMetaItem(
                  label: 'Constraints',
                  value: 'FCA compliance, MudBlazor component framework, legacy platform, 2-week sprint',
                ),
                ProjectMetaItem(
                  label: 'Focus',
                  value: 'Get the right information in front of users before they make a decision they\'ll later dispute',
                ),
              ],
            ),

            // ── 15. USER CONTEXT (moved here) ─────────────────────────────────
            ProjectTextImageBlock(
              themeConfig: softTheme,
              eyebrow: 'User context',
              title: 'Designing for people who aren\'t insurance experts',
              body:
              'Be honest — when did you last read a full insurance policy before buying anything? Most people arriving at this page won\'t either, and they\'re not trying to. They want to know three things: is my pet covered if something goes wrong, how much is it going to cost me, and does this company actually seem legit. A lot of the work was figuring out which information earns its place at the top of the page for those three questions, and what can reasonably sit behind an accordion for the people who do want to dig deeper.',
              reverse: true,
              image: const _CaseStudyImageCard(
                label: 'Replace with annotated screen showing hierarchy and trust cues',
                height: 420,
              ),
            ),

            // ── 6a. WHO I TESTED WITH ─────────────────────────────────────────
            const ProjectCalloutBlock(
              themeConfig: lightTheme,
              style: CalloutStyle.principle,
              label: 'Who I tested with',
              icon: Icons.group_outlined,
              body:
              'I ran sessions with eleven internal colleagues rather than external participants. Partly that was practical — two weeks doesn\'t leave much room for recruiting strangers — but the people I could reach happened to be from claims, complaints, finance and renewals, which is to say the people who spend their days cleaning up after a customer has misunderstood what they bought. Each session was a moderated walkthrough of a Figma prototype followed by a structured interview. I\'d expected them to be a decent stopgap. They turned out to be a lot more than that.',
            ),

            // ── 8. PROCESS ────────────────────────────────────────────────────
            const ProjectProcessStepsBlock(
              themeConfig: darkTheme,
              title: 'How I approached it',
              steps: [
                ProjectProcessStep(
                  title: 'Competitor review',
                  body:
                  'I started by looking at how other pet insurers handle the quote review step for users arriving from comparison sites. There are some fairly consistent patterns across the better ones, and understanding why they work the way they do was a useful starting point.',
                ),
                ProjectProcessStep(
                  title: 'Heuristic evaluation',
                  body:
                  'I ran the existing page through a heuristic evaluation using Nielsen Norman\'s framework. It\'s useful for turning a general sense that something isn\'t working into a specific list of things to fix, which is easier to act on.',
                ),
                ProjectProcessStep(
                  title: 'Hotjar session analysis',
                  body:
                  'I went through session recordings from users who\'d been referred in by aggregators, watching where they paused, what they kept clicking on, and the point at which they gave up and left. One user spent nearly nine minutes on the page before selecting anything, which is a long time to spend on something you\'re either going to buy or not.',
                ),
                ProjectProcessStep(
                  title: 'Collaborative layout exploration',
                  body:
                  'I worked with the BA and front-end developer to figure out what was structurally achievable within MudBlazor. Most of the layout decisions were made before anything went into Figma.',
                ),
                ProjectProcessStep(
                  title: 'Internal usability sessions',
                  body:
                  'Eleven moderated one-to-one walkthroughs of the prototype, each followed by a structured interview. I recorded the lot, had them transcribed, and coded the transcripts into themes.',
                ),
                ProjectProcessStep(
                  title: 'Informed by a live parallel experiment',
                  body:
                  'A separate segment of the redesigned flow was already running with real users during the sprint. Some of the questions about layout and information density had already been partly answered, so I didn\'t have to start from scratch.',
                ),
              ],
            ),

            // ── 4a. COMPETITOR FINDINGS ───────────────────────────────────────
            const ProjectFindingsGridBlock(
              themeConfig: softTheme,
              title: 'Competitor review and heuristic audit',
              items: [
                ProjectFindingItem(
                  title: 'Every competitor acknowledged where users had come from',
                  body:
                  'All the sites I reviewed told users they\'d arrived from a comparison aggregator, sometimes naming it and sometimes just confirming a discount had been applied. It\'s a small detail but it helps to confirm that someone\'s effort on the previous site wasn\'t wasted, particularly when they\'ve never heard of your brand before.',
                ),
                ProjectFindingItem(
                  title: 'Trust signals came before the quote',
                  body:
                  'Trustpilot ratings, customer numbers and claim stats were all front-loaded. The same thing kept showing up across the better sites: they spend the first part of the page earning your trust, and only once they\'ve done that do they ask you to commit to anything.',
                ),
                ProjectFindingItem(
                  title: 'Policy information was easy to scan',
                  body:
                  'They used tables instead of dense paragraphs, and everything a user needed was built into the flow rather than hidden away in a linked PDF. The price and the call to action stayed visible the whole way down the page, so there was never really a moment where you had to leave to work out what you were actually buying.',
                ),
                ProjectFindingItem(
                  title: 'The existing page had a hierarchy problem',
                  body:
                  'The heuristic audit was useful because it gave me specific things to point at instead of a vague feeling that the page needed a refresh. It turned up four different button styles across the flow, benefit details hidden behind low-contrast links, and no clear sense of what should come first at the top of the page.',
                ),
                ProjectFindingItem(
                  title: 'Form feedback at key moments',
                  body:
                  'Mandatory fields weren\'t clearly marked, error states were minimal, and the payment step gave no visible indication it was processing. Each one is a small friction point but they tend to cluster at the moments when users are most uncertain about whether to continue.',
                ),
              ],
            ),

            // ── 4b. BEHAVIOURAL FINDINGS ──────────────────────────────────────
            const ProjectFindingsGridBlock(
              themeConfig: darkTheme,
              title: 'Behavioural insights',
              items: [
                ProjectFindingItem(
                  title: 'More than five minutes to understand basic cover',
                  body:
                  'Session recordings showed users repeatedly re-reading the same sections and opening the same PDFs more than once. The information wasn\'t wrong — it just wasn\'t organised in a way that made it easy to retain, so people kept going back to check things they\'d already looked at.',
                ),
                ProjectFindingItem(
                  title: 'A significant proportion left and didn\'t come back',
                  body:
                  'Users who went to the main website to find information that wasn\'t on the review page mostly didn\'t return to the quote flow. The page was meant to be where users had enough to make a decision, and in quite a few cases it wasn\'t quite getting there.',
                ),
                ProjectFindingItem(
                  title: 'Pre-existing conditions were a bigger issue than the design',
                  body:
                  'Every single participant — all eleven — raised pre-existing conditions without being asked, as the main driver of complaints and declined claims. This wasn\'t something the design team had fully appreciated before the research, and it changed what the project was actually about.',
                ),
                ProjectFindingItem(
                  title: 'The people closest to the problem were asking for the same things',
                  body:
                  'Claims handlers, complaints managers, finance colleagues, renewals — without coordinating with each other, they were all pointing at the same gaps. When the people dealing with the consequences agree on the cause, it\'s probably worth designing around.',
                ),
              ],
            ),

            // ── 6b. RESEARCH THEMES ───────────────────────────────────────────
            const ProjectFindingsGridBlock(
              themeConfig: lightTheme,
              title: 'What the sessions surfaced',
              items: [
                ProjectFindingItem(
                  title: 'Pre-existing conditions — all eleven participants',
                  body:
                  'The redesign had already moved pre-existing conditions to a dedicated page, which everyone thought was right. What they wanted was more specific wording: customers routinely assume pre-existing means a formally diagnosed condition rather than symptoms noted in the vet\'s history, and that misunderstanding is where a large share of claim disputes start.',
                ),
                ProjectFindingItem(
                  title: 'Missing policy limits — nine of eleven participants',
                  body:
                  'The excess wasn\'t on the first page at all, despite it being one of the lower ones in the market. The same went for the age limits on certain benefits, how co-payment actually works in practice, and the per-condition limit on vet fees, all of which were either missing or explained so vaguely they may as well have been. Kerry from the claims team pointed out that the low excess was actually a selling point, so leaving it off entirely was a strange gap to have.',
                ),
                ProjectFindingItem(
                  title: 'The lifetime cover wording — one flag, but a significant one',
                  body:
                  'Tom in Claims noted that \'any veterinary treatment for illnesses and injuries is covered during your pet\'s lifetime\' reads as unconditional. That\'s a problem because pre-existing conditions are the most common reason a claim gets declined, and that sentence doesn\'t hint at any of that.',
                ),
                ProjectFindingItem(
                  title: 'Trust signals — ten of eleven participants',
                  body:
                  'The Trustpilot integration on the redesigned page landed well. Rochelle from IBA mentioned she hadn\'t known Perfect Pet existed before working there, which is a reasonable proxy for how many first-time aggregator visitors feel. Trust signals early in the page matter more than might be obvious from the inside.',
                ),
              ],
            ),

            // ── 5. THE CORE FINDING ───────────────────────────────────────────
            const ProjectQuoteBlock(
              themeConfig: softTheme,
              quote:
              'Claim-stage problems are pre-sold at quote stage. The team processing complaints and claim declines is asking, almost in unison, for sales-stage transparency on the things they see most often.',
              attribution:
              'Synthesis from eleven internal stakeholder sessions — claims, complaints, finance, renewals, and IBA',
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
              'Mia is built from the patterns that Tracy, Kerry and Michelle described from their day-to-day work. Tracy\'s version: \'people just don\'t understand — they think pre-existing has to be a named condition, and sometimes pets have symptoms without ever knowing what it is until six months later.\' Michelle confirmed that cases like this make up a significant portion of the complaints she handles. Mia leaves the quote flow thinking she\'s covered. She finds out otherwise when her first claim is filed.',
              contextTags: [
                'First-time buyer',
                'Aggregator entry',
                'Brand unfamiliar',
                'Pre-existing risk',
                'Jargon-averse',
              ],
            ),

            // ── 6d. PERSONA: ROB ──────────────────────────────────────────────
            const ProjectPersonaBlock(
              themeConfig: darkTheme,
              eyebrow: 'Composite persona — derived from 11 SME interview sessions',
              name: 'Rob Mackenzie',
              role: 'Experienced pet owner, two dogs, has had a claim declined before',
              quote:
              '"I\'ve been through a claim before and I know how these policies work in practice. I need to find the catches before I buy — not after."',
              goals: [
                'Confirm that his older dog\'s prior vet history won\'t invalidate the cover he\'s paying for',
                'Understand what \'bilateral condition\' means and whether it applies to his Spaniel\'s previous cruciate injury',
                'Verify that \'lifetime cover\' actually means what it sounds like — not a promise that disappears at claim stage',
                'Complete the purchase in a single session without toggling between the review page and a 40-page policy PDF',
              ],
              frustrations: [
                'Lifetime cover language that reads as unconditional (\'any veterinary treatment for illnesses and injuries is covered\') when the pre-existing exclusion directly contradicts it',
                'No mention of linked or bilateral conditions anywhere in the buying journey — despite it being the most contested exclusion at claims stage',
                'Ambiguity about whether the vet fees limit is per-condition or capped in total — and no clear answer without calling in',
                'Having to leave the quote flow to find information that should be in the flow itself, knowing that once he leaves he may not return',
              ],
              context:
              'Rob is built from the customer type that Craig, Tom and Gavin each described from different angles. Craig on bilateral conditions: \'if you have ACL surgery on one leg and then it happens on the other — yeah, it\'s bilateral, it\'s in our policy wording.\' Tom flagged the lifetime cover headline as setting up the exact misunderstanding that generates the most complaints. Gavin called linked and bilateral conditions \'the worst thing for us for pre-existing.\' Rob reads carefully and still gets surprised. With clearer information earlier in the journey, he probably wouldn\'t need to call.',
              contextTags: [
                'Experienced buyer',
                'Prior claim declined',
                'Multi-pet household',
                'Scrutinises small print',
                'Bilateral risk',
              ],
            ),

            // ── 9. OPPORTUNITY FRAMING ────────────────────────────────────────
            const ProjectHowMightWeBlock(
              themeConfig: softTheme,
              title: 'How might we…',
              intro:
              'Questions that came out of the research — each one pointing at a gap between what users currently understand and what their policy actually covers.',
              items: [
                ProjectHmwItem(
                  question:
                  'How might we make the pre-existing conditions exclusion specific enough that customers understand it applies to symptoms in the vet\'s history, not just formally diagnosed conditions?',
                  theme: 'Transparency',
                ),
                ProjectHmwItem(
                  question:
                  'How might we put excess, co-payment and benefit limits in front of users while they\'re deciding whether to buy rather than after they\'ve already filed a claim?',
                  theme: 'Clarity',
                ),
                ProjectHmwItem(
                  question:
                  'How might we build enough trust with users who\'ve never heard of Perfect Pet that they\'re willing to commit by the end of this page?',
                  theme: 'Trust',
                ),
                ProjectHmwItem(
                  question:
                  'How might we meet FCA requirements without making the page feel like its primary purpose is compliance?',
                  theme: 'Compliance',
                ),
                ProjectHmwItem(
                  question:
                  'How might we use the review page to prevent the specific misunderstandings that are currently driving complaints and declined claims?',
                  theme: 'Downstream impact',
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
              'Through every layout decision there was one question I kept dragging things back to: does this make it easier for someone to understand what they\'re actually looking at? I cared about visual consistency, brand alignment and getting the FCA side right too — of course I did — but whenever any of those started pulling against that one question, the question won.',
            ),

            // ── 10. BEFORE / AFTER ────────────────────────────────────────────
            const ProjectBeforeAfterBlock(
              themeConfig: darkTheme,
              beforeTitle: 'Before',
              beforeBody:
              'A single scrolling page that combined marketing preferences, assumptions and declarations, cover details and payment selection, presented mostly as paragraphs of text. The information was technically present, but the page didn\'t give users much reason to trust the brand before asking for a commitment.',
              afterTitle: 'After',
              afterBody:
              'A two-page flow. The first page puts price and trust signals up front, with cover details and communication preferences below. The second handles pre-existing conditions as its own step with an explicit acknowledgement mechanism, followed by payment selection. The FCA-required language is still there throughout — it\'s just not leading the page.',
            ),

            // ── 11. KEY DECISIONS ─────────────────────────────────────────────
            const ProjectDecisionLogBlock(
              themeConfig: softTheme,
              title: 'Key decisions',
              intro:
              'The calls that shaped the redesign, what drove them, and what we observed.',
              decisions: [
                ProjectDecisionItem(
                  decision:
                  'Pre-existing conditions got their own dedicated page with an explicit tick-box confirmation',
                  rationale:
                  'All eleven participants raised this without prompting. Tracy and Craig explained the core misunderstanding: customers assume pre-existing means a formally diagnosed condition, not symptoms that appear in the vet\'s history before a diagnosis is ever made. A checkbox buried in an assumptions section wasn\'t changing that.',
                  outcome:
                  'Stanley from Credit Control put it well: \'Having it as its own page — we\'re not hiding it. It\'s quite helpful.\' Kerry from Claims noted that it changes the claims conversation because customers have already declared from the outset.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision: 'Excess was moved to page one',
                  rationale:
                  'Tracy and Kerry both noticed it was missing during the sessions, which was a straightforward oversight. Kerry also mentioned that Perfect Pet offers one of the lower excesses in the market, which meant not showing it was both a clarity gap and a missed opportunity.',
                  outcome:
                  'Excess is now visible alongside the cover details. It\'s presented as a feature rather than just a required disclosure.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision: 'A qualifier was added to the lifetime cover headline',
                  rationale:
                  'Tom in Claims flagged that \'any veterinary treatment for illnesses and injuries is covered during your pet\'s lifetime\' sets an expectation the policy can\'t always keep. Pre-existing conditions are the most common reason for a declined claim, and that sentence doesn\'t suggest any of that.',
                  outcome:
                  'Adding something like \'subject to your pet\'s health history\' makes the statement accurate without changing what it means for most customers. Flagged to copy and compliance.',
                  outcomeType: DecisionOutcomeType.tradeoff,
                ),
                ProjectDecisionItem(
                  decision: 'All FCA-required policy language was kept in full',
                  rationale:
                  'The legal wording couldn\'t be changed or summarised. The approach was to use visual hierarchy to ensure it was present and readable without being the first thing a user encountered.',
                  outcome:
                  'Compliance is satisfied and the page doesn\'t open like a terms and conditions document.',
                  outcomeType: DecisionOutcomeType.neutral,
                ),
                ProjectDecisionItem(
                  decision: 'Interactive components were standardised across the flow',
                  rationale:
                  'The heuristic audit found four button styles and three different expansion panel treatments across the existing flow. Individually each is a small thing. Together they make the page feel less considered, which doesn\'t help when you\'re trying to build trust with a first-time visitor.',
                  outcome:
                  'A single token set applied across buttons, tooltips, modals and toggles. The engineering team mentioned it would also reduce maintenance overhead.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision: 'Mobile layout was deferred to a follow-up sprint',
                  rationale:
                  'A full responsive overhaul wasn\'t achievable in two weeks within MudBlazor\'s grid constraints. Mobile accounted for around 35% of traffic but most completions still happened on desktop.',
                  outcome:
                  'There\'s a backlog ticket for this. It\'ll be revisited once the A/B experiment has produced something to work with.',
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
                  value: 'Conversion rate',
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
                  label: '4 variants ready in Amplitude with live traffic',
                ),
              ],
            ),

            // ── 17. LEARNINGS ─────────────────────────────────────────────────
            const ProjectLearningsBlock(
              themeConfig: lightTheme,
              title: 'What happens next',
              points: [
                'The sessions produced a clear list of things the redesign should still address. The pre-existing wording needs to explicitly cover signs and symptoms in the vet\'s history, bilateral conditions, and the fact that vet records are taken as legally binding. Excess needs to be on page one. Co-payment needs an example rather than just a label. The lifetime cover headline needs qualifying. And the monthly vs annual price difference needs explaining somewhere visible.',
                'The more useful finding was that the review page isn\'t only a conversion problem. It\'s where the complaints and declined claims of six months from now are quietly being set up, and getting the information right here has effects you won\'t see in a completion rate at all. They turn up much later, in call volumes and cancellations, long after anyone\'s stopped looking at this particular page.',
                'Four variants of the redesigned flow are queued in Amplitude for live traffic — two desktop and two mobile, each testing a hypothesis about navigation placement and where the CTA sits relative to the cover details.',
                'A separate segment of the redesigned flow was already running with real users while I was working on this. Some of the layout decisions had already been partially tested, which meant I wasn\'t starting from scratch on everything.',
                'Once the experiment\'s been live long enough to actually mean something, I\'ll come back and update this case study with the real conversion numbers.',
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
      'If you\'ve never heard of a brand and the first thing they show you is a wall of policy text, do you buy? Probably not. That was more or less the situation for anyone landing on Perfect Pet\'s quote review page via a comparison site, which is where most of the sales come from.',
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
      'I spent two weeks on this page. Going in, I assumed it was a tidy-up job — make it look better, ship it, move on. I started with a competitor review to see what everyone else was doing, went through Hotjar recordings to see what was actually happening on ours, and then sat down with eleven colleagues from claims, complaints, finance and renewals. That last group turned out to be the whole thing, really. They know better than anyone what happens when this page doesn\'t do its job, and what they told me quietly turned a visual refresh into something quite a bit more interesting.',
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
