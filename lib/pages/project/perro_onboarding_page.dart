import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_2/widgets/project/more_projects_block.dart';
import 'package:portfolio_2/widgets/site/site_footer.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import '../../widgets/common/responsive_section.dart';
import '../../widgets/common/scrollable_page_shell.dart';
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

class PerroOnboardingPage extends StatelessWidget {
  const PerroOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const baseTheme = ProjectSectionTheme(
      backgroundColor: Color(0xFFF3F1FA),
      foregroundColor: Color(0xFF1A1628),
      accentColor: Color(0xFF7B5EA7),
      borderColor: Color(0x221A1628),
      mutedColor: Color(0xB31A1628),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: ScrollablePageShell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── 1. HERO ───────────────────────────────────────────────────────
            const _PerroHero(),

            // ── 1b. HERO IMAGE ────────────────────────────────────────────────
            const _HeroImageBlock(
              caption:
              'Onboarding was where most people quietly left, before they had seen what Perro could do for them.',
            ),

            // ── 2. VITALS ─────────────────────────────────────────────────────
            const ProjectMetaStripBlock(
              themeConfig: baseTheme,
              items: [
                ProjectMetaItem(
                  label: 'Role',
                  value: 'UX, UI, and Flutter implementation',
                ),
                ProjectMetaItem(
                  label: 'Product',
                  value: 'Perro — Dog Care & Rewards App',
                ),
                ProjectMetaItem(
                  label: 'Timeline',
                  value: '2 weeks (part-time)',
                ),
                ProjectMetaItem(
                  label: 'Platform',
                  value: 'Flutter — iOS & Android',
                ),
              ],
            ),

            // ── 3. PROBLEM ────────────────────────────────────────────────────
            const ProjectProblemKeyInfoBlock(
              themeConfig: baseTheme,
              problemTitle: 'The problem',
              problemBody:
              'Perro is a UK dog care and rewards app, and the value is real: activity tracking, enrichment and training content, household collaboration, and up to £500 of Woof benefits over time. The people who stuck around past the first session tended to like it. Getting them past that first session was the problem. The funnel data showed a large share of new users dropping off during onboarding, very often before they’d reached anything that showed them what Perro could do, and that fed straight into lower subscriptions and fewer people choosing longer-term plans.',
              contextBody:
              'When I went through the flow myself, the reason wasn’t a mystery for long. It felt like a form rather than an introduction. Optional information was being treated as mandatory, people were being asked for things with no sense of what they’d get back, the photo upload step quietly sent people out of the app to hunt for a better picture, and by the time anyone reached the fitness and location questions they were already tired and wondering whether it was worth it.',
              infoItems: [
                ProjectMetaItem(
                  label: 'Objective',
                  value: 'Make onboarding shorter, clearer and more trustworthy, in a way that reduces drop-off and gives subscription conversion a reason to climb',
                ),
                ProjectMetaItem(
                  label: 'Success measure',
                  value: 'Onboarding completion, subscription conversion rate, and the share of longer-term plans chosen',
                ),
                ProjectMetaItem(
                  label: 'Constraints',
                  value: 'Flutter only, no backend changes, a two-week part-time sprint, and a stable experience for existing users',
                ),
                ProjectMetaItem(
                  label: 'Scope',
                  value: 'Landing, onboarding steps, and the subscription hand-off',
                ),
              ],
            ),

            // ── 4a. RESEARCH: BEHAVIOURAL DATA ────────────────────────────────
            const ProjectFindingsGridBlock(
              themeConfig: baseTheme,
              title: 'What the data showed',
              items: [
                ProjectFindingItem(
                  title: 'Three clear drop-off points',
                  body:
                  'The Mixpanel funnels, piped in through Twilio Segment, showed people leaving in three places: the landing and sign-in screen, the dog profile setup, and the user profile setup with its fitness, activity and location questions.',
                ),
                ProjectFindingItem(
                  title: 'A broken journey, not one broken screen',
                  body:
                  'The drop-offs were spread across the flow rather than piling up at one obvious failure point. That told me this wasn’t a screen I could patch — it was effort accumulating and motivation draining a little at each step until people had simply had enough.',
                ),
                ProjectFindingItem(
                  title: 'Photo upload was a silent exit',
                  body:
                  'The usability sessions confirmed what the data only hinted at. People left the app to find a nicer photo of their dog and frequently didn’t return, so a step nobody thought twice about had quietly become a churn driver.',
                ),
                ProjectFindingItem(
                  title: 'Health questions felt out of proportion',
                  body:
                  'Pre-existing conditions and detailed health inputs sat early in the flow, and people in sessions described them as “intense” for where they were in the journey. They hadn’t seen enough yet to feel that was a fair thing to be asked.',
                ),
                ProjectFindingItem(
                  title: 'Fitness and location questions came too late',
                  body:
                  'By the time people reached the user profile stage they were already worn down, and without a clear reason for why any of it mattered, plenty of them simply gave up.',
                ),
                ProjectFindingItem(
                  title: 'The qual and the quant agreed',
                  body:
                  'Every pattern I saw in a session lined up with a corresponding dip in the Mixpanel data. When the recordings and the numbers tell you the same story, you can stop second-guessing and start designing.',
                ),
              ],
            ),

            // ── 4b. RESEARCH: HEURISTIC REVIEW ────────────────────────────────
            const ProjectFindingsGridBlock(
              themeConfig: baseTheme,
              title: 'Heuristic review',
              items: [
                ProjectFindingItem(
                  title: 'Too much, too early',
                  body:
                  'Optional, nice-to-have data was being treated as mandatory, so onboarding felt like a bureaucratic form rather than an invitation into the product.',
                ),
                ProjectFindingItem(
                  title: 'No sense of value or purpose',
                  body:
                  'People were asked for information and permissions with no clear connection to what they’d get back. There was no moment where Perro stopped to explain what it would actually do for them.',
                ),
                ProjectFindingItem(
                  title: 'Small inconsistencies eroding trust',
                  body:
                  'Visual inconsistencies, copy issues and uneven patterns across screens made the flow feel less polished than the product deserved, and chipped away at the first impression.',
                ),
              ],
            ),

            // ── 4c. RESEARCH: COMPETITIVE ANALYSIS ────────────────────────────
            const ProjectFindingsGridBlock(
              themeConfig: baseTheme,
              title: 'Market and competitor analysis',
              items: [
                ProjectFindingItem(
                  title: 'Lead with value, not forms',
                  body:
                  'The onboarding experiences I admired, Biscuit among them, explained what the product would do for you before asking anything of you.',
                ),
                ProjectFindingItem(
                  title: 'Short, visual sequences beat long forms',
                  body:
                  'Feature carousels and progress indicators were consistently tied to higher engagement and lower drop-off than text-heavy, question-first flows.',
                ),
                ProjectFindingItem(
                  title: 'Be explicit about what’s optional',
                  body:
                  'The best examples were clear about what was required, what was optional, and, most importantly, why each piece of information was being asked for.',
                ),
              ],
            ),

            // ── 5. CORE FINDING ───────────────────────────────────────────────
            const ProjectQuoteBlock(
              themeConfig: baseTheme,
              quote:
              'People weren’t leaving because Perro wasn’t good enough. They were leaving because onboarding asked too much, too early, before it had given anything back.',
              attribution: 'Synthesis across funnel data, heuristic review, and usability sessions',
            ),

            // ── 6. WHO WE WERE DESIGNING FOR ──────────────────────────────────
            const ProjectPersonaBlock(
              themeConfig: baseTheme,
              eyebrow: 'User persona',
              name: 'Jess Harrington',
              role: 'New dog owner, recently rehomed a 2-year-old rescue Greyhound',
              quote:
              'I downloaded it because the rewards looked interesting, but I gave up when it started asking about vaccinations. I just wanted to track walks.',
              goals: [
                'Track her dog’s activity and wellbeing without it feeling like a chore',
                'Understand what the rewards programme actually gives her before committing to anything',
                'Get through setup quickly, without digging out documents or the perfect photo',
                'Feel like the app is on her side rather than quietly working against her',
              ],
              frustrations: [
                'Being asked for detailed health information before she’s seen a single thing in return',
                'Having to leave the app to find a usable photo just to carry on',
                'Permission prompts that interrupt her instead of feeling like part of the experience',
                'A subscription screen that reads like a hard sell rather than a natural next step',
              ],
              context:
              'Jess is 31 and lives in health and fitness apps already, so she has very little patience for onboarding that gets in her way. She’s comfortable with digital products and quick to abandon anything that feels more complicated than it needs to be. She was a strong fit for what Perro offers, but dropped off at the dog health screen on her first attempt and didn’t come back.',
              contextTags: [
                'New dog owner',
                'App-savvy',
                'Low friction tolerance',
                'Rewards-motivated',
              ],
            ),

            const ProjectPersonaBlock(
              themeConfig: baseTheme,
              eyebrow: 'User persona',
              name: 'Marcus Webb',
              role: 'Long-term dog owner, two Spaniels, active walker',
              quote:
              'I don’t mind giving information if I understand why you need it. But this kept asking things I couldn’t see the point of yet.',
              goals: [
                'Log walks and activity alongside the Apple Health data he already tracks',
                'Use the training and enrichment content to try new things with his dogs',
                'Share the app with his partner so they can both keep an eye on the dogs',
                'Get real value out of the rewards before deciding on a subscription tier',
              ],
              frustrations: [
                'No clear reason given for why location and notification permissions are needed',
                'Being asked for fitness information his health app already holds',
                'Subscription options that don’t map cleanly onto what he actually wants to use',
                'Setup that seems designed for a single dog rather than his household',
              ],
              context:
              'Marcus is 44, runs regularly, and is meticulous about the health data he tracks. He was happy to invest time in setup as long as the payoff was clear, but hit friction at the permissions screen and again at subscription. His instinct is to bookmark and come back rather than abandon outright, but the second attempt stalled in the same places.',
              contextTags: [
                'Experienced dog owner',
                'Health data user',
                'Multi-dog household',
                'Return visitor',
              ],
            ),

            // ── 7. NORTH STAR ─────────────────────────────────────────────────
            const ProjectCalloutBlock(
              themeConfig: baseTheme,
              style: CalloutStyle.principle,
              label: 'Strategy',
              icon: Icons.route_outlined,
              body:
              'Three ideas shaped more or less every decision I made. Shorten and refocus onboarding around what actually improves the first session rather than what’s nice to have on file. Lead with value before asking for anything. And go after the specific friction points the research had surfaced, namely the photo upload, the unexplained permissions and the late-funnel fatigue, rather than redesigning for the sake of it.',
            ),

            // ── 8. METHOD ─────────────────────────────────────────────────────
            const ProjectProcessStepsBlock(
              themeConfig: baseTheme,
              title: 'How I approached it',
              steps: [
                ProjectProcessStep(
                  title: 'Scoped from the data, not assumptions',
                  body:
                  'The Mixpanel funnels defined the scope. The screens with the steepest drop-offs became the core of the sprint, and everything else waited.',
                ),
                ProjectProcessStep(
                  title: 'Audited every field: needed now, or ask later?',
                  body:
                  'I went through every onboarding field and asked one question of each — does the first session genuinely need this? Pet illnesses and detailed health information didn’t survive that test and came out entirely. Activity level and some fitness questions moved to in-app prompts after signup.',
                ),
                ProjectProcessStep(
                  title: 'Designed and tested a feature carousel',
                  body:
                  'A compact carousel introduced Perro through four lenses: Woof rewards and discounts, health and activity monitoring with Apple Health or Google Fit, guided enrichment and training content, and the Perro Family and social features. I tested it against a stripped-back version that went straight to the forms, half-expecting fewer screens to win. It didn’t — the carousel did better on engagement and on downstream completion.',
                ),
                ProjectProcessStep(
                  title: 'Introduced avatars to kill the photo friction',
                  body:
                  'Default avatars for both dog and user replaced the mandatory photo upload, with photo upload marked clearly as optional and something you could come back to. Anyone could now finish setup without leaving the app.',
                ),
                ProjectProcessStep(
                  title: 'Added a permissions explainer',
                  body:
                  'A short screen before the OS prompts explained, in plain language, why Perro wanted location (walk tracking, weather-aware suggestions, local insights) and why notifications were worth allowing (reminders, rewards, the occasional wellbeing nudge), so the request felt like part of the experience rather than a technical interruption.',
                ),
                ProjectProcessStep(
                  title: 'Redesigned the subscription step and built it in Flutter',
                  body:
                  'I laid the plans out side by side with clear summaries, a gentle nudge towards the longer-term options, and the same four benefits from the carousel, so the paywall felt like the story continuing rather than a hard pivot. The whole redesign was built directly in Flutter and refined through a small test build.',
                ),
              ],
            ),

            // ── 9. OPPORTUNITY FRAMING ────────────────────────────────────────
            const ProjectHowMightWeBlock(
              themeConfig: baseTheme,
              title: 'How might we…',
              intro:
              'The opportunity questions that shaped the design direction, most of them really about fairness.',
              items: [
                ProjectHmwItem(
                  question:
                  'How might we show new users what Perro will do for them before asking anything of them?',
                  theme: 'Value first',
                ),
                ProjectHmwItem(
                  question:
                  'How might we let someone finish setup without leaving the app, even when they don’t have the right photo to hand?',
                  theme: 'Friction removal',
                ),
                ProjectHmwItem(
                  question:
                  'How might we make every question feel necessary and clearly tied to something the user cares about?',
                  theme: 'Purpose',
                ),
                ProjectHmwItem(
                  question:
                  'How might we explain permissions so they feel like part of the product rather than a legal formality?',
                  theme: 'Trust',
                ),
                ProjectHmwItem(
                  question:
                  'How might we make the subscription step feel like a natural next move rather than a jarring upsell?',
                  theme: 'Continuity',
                ),
                ProjectHmwItem(
                  question:
                  'How might we cut the number of questions without losing the ones that genuinely improve the first session?',
                  theme: 'Progressive disclosure',
                ),
              ],
            ),

            // ── 10. BEFORE / AFTER ────────────────────────────────────────────
            const ProjectBeforeAfterBlock(
              themeConfig: baseTheme,
              beforeTitle: 'Before',
              beforeBody:
              'Five screens, sixteen questions, a mandatory photo upload, abrupt system permission prompts, and no explanation anywhere of what Perro actually offered. It asked for a lot and gave very little back before the first moment that might have made someone care.',
              afterTitle: 'After',
              afterBody:
              'Four screens and eleven questions, with the avatar system and optional photo, a feature carousel front-loading the value, a permissions explainer, and a subscription step that carries the same story through to the end. Setup stopped feeling like paperwork and started feeling like an introduction.',
            ),

            // ── 11. KEY DECISIONS ─────────────────────────────────────────────
            const ProjectDecisionLogBlock(
              themeConfig: baseTheme,
              title: 'The decisions I’d defend',
              intro: 'The calls that shaped the redesign, what drove them, and what I saw.',
              decisions: [
                ProjectDecisionItem(
                  decision:
                  'Took pet illnesses and detailed health information out of onboarding entirely',
                  rationale:
                  'These fields sat early, added real perceived effort, and offered nothing back in the first session. People weren’t invested enough yet to feel it was a fair trade.',
                  outcome:
                  'A major resistance point disappeared. The information moved to a later in-app prompt, where people had the context and the motivation to give it.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision:
                  'Led with a feature carousel before the first form screen',
                  rationale:
                  'Both the competitive analysis and the sessions pointed at the same gap — people had no idea what Perro would do for them before being asked to hand over information.',
                  outcome:
                  'Tested against a minimal version without it. The carousel did better on engagement and downstream completion, and became the production baseline.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision:
                  'Replaced mandatory photo upload with an avatar system and optional image',
                  rationale:
                  'Sessions showed this was a silent exit trigger. People left to find a suitable photo and frequently didn’t come back, so making it optional removed a low-value blocker.',
                  outcome:
                  'Drop-off at the dog profile step fell noticeably after launch, and people could finish setup in one sitting without leaving the app.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision:
                  'Added a plain-language permissions explainer before the OS prompts',
                  rationale:
                  'Abrupt system dialogs for location and notifications appeared out of nowhere. Most people either dismissed them or felt ambushed.',
                  outcome:
                  'Acceptance improved. People who read the explainer were far more likely to grant both location and notification access.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision:
                  'Echoed the carousel benefits on the subscription screen',
                  rationale:
                  'The paywall used to feel disconnected from the onboarding story. Repeating the same four benefit areas tied it back in.',
                  outcome:
                  'Subscription conversion rose and more people chose longer-term plans. Feedback described the step as feeling “fairer” and “more honest”.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision:
                  'Moved activity level and some fitness questions to post-signup prompts',
                  rationale:
                  'They were arriving when people were already fatigued, and before they’d done anything in the app that made the questions feel relevant.',
                  outcome:
                  'Late-funnel fatigue dropped. The information still gets collected, just at a point where people have a reason to care about it.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
              ],
            ),

            // ── 12. THE SOLUTION ──────────────────────────────────────────────
            ProjectTextImageBlock(
              themeConfig: baseTheme,
              eyebrow: 'Solution',
              title: 'A shorter, value-first introduction to Perro',
              body:
              'The refreshed onboarding turns what used to feel like a long, slightly opaque form into a short introduction that actually leads with value. New users see what Perro will do for them, answer fewer but more relevant questions, stay inside the app while setting up their dog, and understand exactly why they’re being asked for location, notifications and payment. The subscription step carries the same story through, so starting a plan feels like a natural next move rather than a pivot.',
              image: const _CaseStudyImageCard(
                label: 'Replace with feature carousel or onboarding screen recording',
                height: 460,
              ),
            ),

            // ── 13. ACCESSIBILITY ─────────────────────────────────────────────
            const ProjectAccessibilityAuditBlock(
              themeConfig: baseTheme,
              title: 'Accessibility considerations',
              intro:
              'Issues that came up during the heuristic review, fixed as part of the redesign rather than filed for later.',
              issues: [
                ProjectA11yIssue(
                  issue: 'No progress indicator in a five-screen flow',
                  description:
                  'People had no way to gauge how far through onboarding they were or how much was left, which fed straight into the sense that the effort was open-ended.',
                  severity: A11ySeverity.serious,
                  wcagCriterion: '2.4.8 Location',
                  fix:
                  'Added a step indicator to every onboarding screen, showing current position and total steps.',
                ),
                ProjectA11yIssue(
                  issue: 'System permission dialogs appeared with no context',
                  description:
                  'OS-level prompts for location and notifications arrived abruptly with no prior explanation. For anyone using a screen reader, the sudden modal shift was especially disorienting.',
                  severity: A11ySeverity.serious,
                  wcagCriterion: '3.3.2 Labels or Instructions',
                  fix:
                  'Added a dedicated explainer screen before each OS prompt, with a plain-language reason and benefit for each permission requested.',
                ),
                ProjectA11yIssue(
                  issue: 'Avatar selection wasn’t usable with VoiceOver or TalkBack',
                  description:
                  'The initial avatar grid used tap targets that were too small and had no accessible labels, making selection hard for anyone navigating by touch or screen reader.',
                  severity: A11ySeverity.serious,
                  wcagCriterion: '2.5.5 Target Size / 4.1.2 Name, Role, Value',
                  fix:
                  'Increased avatar tap targets to a minimum of 48x48dp and gave each one a semantic label describing the breed or character.',
                ),
                ProjectA11yIssue(
                  issue: 'Optional fields weren’t labelled as optional',
                  description:
                  'Photo upload and several profile fields were effectively optional but weren’t marked as such, so people assumed they had to complete them to proceed.',
                  severity: A11ySeverity.moderate,
                  wcagCriterion: '3.3.2 Labels or Instructions',
                  fix:
                  'Labelled optional fields explicitly as “Optional — you can add this later” and added skip affordances where relevant.',
                ),
                ProjectA11yIssue(
                  issue: 'The feature carousel had no pause or manual control',
                  description:
                  'The carousel auto-advanced on a timer with no way to pause or step through it, which is a problem for anyone who needs more time to read.',
                  severity: A11ySeverity.moderate,
                  wcagCriterion: '2.2.2 Pause, Stop, Hide',
                  fix:
                  'Made the carousel manually navigated by default, with swipe and dot-tap controls, and removed the auto-advance.',
                ),
              ],
            ),

            // ── 14. OUTCOMES ──────────────────────────────────────────────────
            const ProjectMetricsBandBlock(
              themeConfig: baseTheme,
              items: [
                ProjectMetricItem(
                  value: '↓ Drop-off',
                  label: 'Most clearly at the old photo and health bottlenecks',
                ),
                ProjectMetricItem(
                  value: '↑ Completion',
                  label: 'More people reaching their first real in-app actions',
                ),
                ProjectMetricItem(
                  value: '↑ Conversion',
                  label: 'Higher subscription take-up after launch',
                ),
                ProjectMetricItem(
                  value: 'Acquired',
                  label: 'UX cited as a product strength during acquisition',
                ),
              ],
            ),

            // ── 15. DESIGNING WITHIN CONSTRAINTS ─────────────────────────────
            ProjectTextImageBlock(
              themeConfig: baseTheme,
              eyebrow: 'Constraints and craft',
              title: 'Designing and building inside a two-week Flutter sprint',
              body:
              'Being both the designer and the developer meant every idea had to be something I could actually build, which is a useful discipline. There were no backend changes on the table, so everything lived in UX, UI and client-side logic. The two-week part-time window pushed me towards focused, incremental changes rather than a grand rewrite, and because existing users still needed a stable app, the work had to be additive rather than disruptive. The upside of building in Flutter myself was the tight feedback loop — I could validate a decision in the real product instead of a prototype, which surfaced the real problems earlier and saved a lot of time I’d otherwise have spent guessing.',
              reverse: true,
              image: const _CaseStudyImageCard(
                label: 'Replace with Flutter implementation or design/code side-by-side',
                height: 420,
              ),
            ),

            // ── 16. SCREENS ───────────────────────────────────────────────────
            ProjectImageGalleryBlock(
              themeConfig: baseTheme,
              title: 'Screen gallery',
              images: const [
                _CaseStudyImageCard(label: 'Feature carousel — slide 1', height: 300),
                _CaseStudyImageCard(label: 'Dog profile — avatar selection', height: 300),
                _CaseStudyImageCard(label: 'Permissions explainer screen', height: 300),
                _CaseStudyImageCard(label: 'User profile — reduced questions', height: 300),
                _CaseStudyImageCard(label: 'Subscription — plan selection', height: 300),
                _CaseStudyImageCard(label: 'First session — home screen', height: 300),
              ],
            ),

            // ── 17. WHAT HAPPENED AFTER ───────────────────────────────────────
            const ProjectLearningsBlock(
              themeConfig: baseTheme,
              title: 'What I took from it',
              points: [
                'The post-launch funnel data showed a noticeable drop in abandonment across onboarding, and most clearly at the old photo upload and health information bottlenecks — exactly the places the research had flagged.',
                'Completion went up, with more people reaching their first real in-app actions. That’s the number I actually care about, because it means the first session was finally delivering something.',
                'Subscription conversions rose and more people chose the longer-term plans, which lined up with the goal of making the paywall feel like a continuation rather than an interruption.',
                'The qualitative feedback from users and stakeholders kept landing on the same words: clearer, simpler, more trustworthy.',
                'The thing I keep coming back to is that none of this worked because it looked nicer. It worked because it stopped asking people for things before it had given them a reason to say yes — and if I’d spent the two weeks making the old form prettier, I don’t think the numbers would have moved at all.',
              ],
            ),

            const MoreProjectsBlock(
              themeConfig: baseTheme,
              title: 'More projects',
              projects: [
                RelatedProjectItem(
                  title: 'Pet Insurance Checkout Redesign',
                  blurb:
                  'Redesigning the Review Details stage of the Perfect Pet Insurance quote flow to reduce friction, improve clarity, and support confident decision-making.',
                  routeName: 'perfect-pet-quote-flow',
                  category: 'UI/UX',
                ),
                RelatedProjectItem(
                  title: 'Crafting Counselling Companions',
                  blurb:
                  'Co-designing a session-planning tool with counsellors — from research through prototype — to reduce the admin overhead that gets in the way of client work.',
                  routeName: 'crafting-counselling-companions',
                  category: 'UX Research',
                ),
                RelatedProjectItem(
                  title: 'Contact',
                  blurb:
                  'Direct paths to email, LinkedIn, and supporting materials.',
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
class _PerroHero extends StatelessWidget {
  const _PerroHero();

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
                  color: const Color(0xFF9B7FD4).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(AppRadii.sm),
                  border: Border.all(
                    color: const Color(0xFF9B7FD4).withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  'Perro — Case study 02',
                  style: textTheme.labelSmall?.copyWith(
                    color: const Color(0xFF9B7FD4),
                    letterSpacing: 0.6,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 820),
                child: Text(
                  'Perro onboarding and subscription redesign',
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
              Container(width: 40, height: 2, color: const Color(0xFF9B7FD4)),
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
      'Perro had a genuinely strong product. You could track your dog’s activity, work through enrichment and training content, set things up so the whole household could collaborate, and earn up to £500 of Woof benefits over time. The people who got past the first session tended to like it, which was rather the problem, because a large share of new users never got that far. They were leaving during onboarding, very often before they’d reached anything that showed them what Perro could actually do for them. Would you stick around for a setup flow that asks a lot and hands back nothing first? Most people didn’t, and that was costing real subscriptions.',
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
      'I had two weeks, part-time, and a tight set of constraints: Flutter only, no backend changes, and nothing that broke the experience for existing users. Rather than redesign on a hunch, I started from the Mixpanel funnels, watched usability sessions to understand the why behind each drop-off, and then redesigned the onboarding and subscription flow and built it directly in Flutter, since I was the developer too. It reduced drop-off, lifted completion, and increased subscription conversion, and the work was later cited as one of the product’s strengths when the company was acquired.',
      style: textTheme.bodyMedium?.copyWith(
        color: Colors.white54,
        height: 1.7,
      ),
    );
  }
}

// ── HERO IMAGE ────────────────────────────────────────────────────────────────
class _HeroImageBlock extends StatelessWidget {
  const _HeroImageBlock({
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
                        colors: [Color(0xFF150F24), Color(0xFF0A0812)],
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
              left: 0, top: 0, bottom: 0,
              child: Container(
                width: 3,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0x009B7FD4), Color(0x999B7FD4)],
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
          colors: [Color(0xFF221B36), Color(0xFF130F1E)],
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
