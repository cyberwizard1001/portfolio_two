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

class PerroOnboardingPage extends StatelessWidget {
  const PerroOnboardingPage({super.key});

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
            const _PerroHero(),

            // ── 1b. HERO IMAGE ────────────────────────────────────────────────
            const _HeroImageBlock(
              caption:
              'Onboarding was where most users quietly left \u2014 before they\u2019d seen what Perro could do for them',
            ),

            // ── 2. VITALS ─────────────────────────────────────────────────────
            const ProjectMetaStripBlock(
              themeConfig: softTheme,
              items: [
                ProjectMetaItem(
                  label: 'Role',
                  value: 'UX, UI, and Flutter implementation',
                ),
                ProjectMetaItem(
                  label: 'Product',
                  value: 'Perro \u2014 Dog Care & Rewards App',
                ),
                ProjectMetaItem(
                  label: 'Timeline',
                  value: '2 weeks (part-time)',
                ),
                ProjectMetaItem(
                  label: 'Platform',
                  value: 'Flutter \u2014 iOS & Android',
                ),
              ],
            ),

            // ── 3. PROBLEM ────────────────────────────────────────────────────
            const ProjectProblemKeyInfoBlock(
              themeConfig: lightTheme,
              problemTitle: 'The problem',
              problemBody:
              'Perro is a UK dog care and rewards app \u2014 activity tracking, enrichment content, family collaboration, and up to \u00a3500 of Woof benefits over time. The value proposition was genuinely strong. The first-time experience was not. Funnel data showed a large share of new users dropping off during onboarding, often before they had seen what Perro could actually do for them, with a direct knock-on effect on subscriptions and longer-term plan uptake.',
              contextBody:
              'The onboarding flow felt like a form, not an introduction. Optional data was treated as mandatory. Users were asked for information without a clear connection to what they\u2019d get back. Photo upload bottlenecks sent people out of the app. And by the time users reached fitness and location screens, they were already fatigued and questioning whether any of it was worth it.',
              infoItems: [
                ProjectMetaItem(
                  label: 'Objective',
                  value:
                  'Shorter, clearer, more trustworthy onboarding that reduces drop-off and increases subscription conversions',
                ),
                ProjectMetaItem(
                  label: 'Success measure',
                  value:
                  'Onboarding completion, subscription conversion rate, share of longer-term plans chosen',
                ),
                ProjectMetaItem(
                  label: 'Constraints',
                  value:
                  'Flutter only, no backend changes, part-time sprint, stable experience for existing users',
                ),
                ProjectMetaItem(
                  label: 'Scope',
                  value:
                  'Landing, onboarding steps, subscription hand-off',
                ),
              ],
            ),

            // ── 4a. RESEARCH: BEHAVIOURAL DATA ────────────────────────────────
            const ProjectFindingsGridBlock(
              themeConfig: softTheme,
              title: 'What the data showed',
              items: [
                ProjectFindingItem(
                  title: 'Three clear drop-off points',
                  body:
                  'Mixpanel funnels (via Twilio Segment) showed users leaving at the landing and sign-in screen, at dog profile setup (especially photo and health conditions), and at user profile setup (fitness level, activities, location).',
                ),
                ProjectFindingItem(
                  title: 'Not one broken screen \u2014 a broken journey',
                  body:
                  'Drop-offs were distributed across the flow rather than concentrated at a single step, which indicated accumulated effort and eroding motivation rather than a single usability failure.',
                ),
                ProjectFindingItem(
                  title: 'Photo upload was a silent exit trigger',
                  body:
                  'Usability sessions confirmed what the data suggested: users left the app to find a \u201cbetter\u201d dog photo and frequently did not return. A mandatory step had become an unintentional churn driver.',
                ),
                ProjectFindingItem(
                  title: 'Health questions felt out of proportion',
                  body:
                  'Pre-existing conditions and detailed health inputs were prominent early in the flow. Users in sessions described them as \u201cintense\u201d for where they were in the journey \u2014 they hadn\u2019t yet seen enough value to justify the effort.',
                ),
                ProjectFindingItem(
                  title: 'Fitness and location questions came too late',
                  body:
                  'By the time users reached the user profile stage, they were already fatigued. Without a clear explanation of why each piece of information mattered, many questioned the point and gave up.',
                ),
                ProjectFindingItem(
                  title: 'Qualitative and quantitative data aligned',
                  body:
                  'Every usability session pattern \u2014 photo friction, health question resistance, late-funnel fatigue \u2014 matched a corresponding drop-off point in the Mixpanel data.',
                ),
              ],
            ),

            // ── 4b. RESEARCH: HEURISTIC REVIEW ────────────────────────────────
            const ProjectFindingsGridBlock(
              themeConfig: darkTheme,
              title: 'Heuristic review',
              items: [
                ProjectFindingItem(
                  title: 'Too much, too early',
                  body:
                  'Optional or nice-to-have data was treated as mandatory. Onboarding felt like a bureaucratic form rather than an invitation into the product.',
                ),
                ProjectFindingItem(
                  title: 'Unclear value and purpose',
                  body:
                  'Users were asked for information and permissions without a clear connection to what they\u2019d receive in return. There was no moment where Perro explained what it would actually do for them.',
                ),
                ProjectFindingItem(
                  title: 'Inconsistent details eroding trust',
                  body:
                  'Visual inconsistencies, copy issues, and uneven patterns across screens made the flow feel less polished than the product deserved and chipped away at first impressions.',
                ),
              ],
            ),

            // ── 4c. RESEARCH: COMPETITIVE ANALYSIS ────────────────────────────
            const ProjectFindingsGridBlock(
              themeConfig: lightTheme,
              title: 'Market and competitor analysis',
              items: [
                ProjectFindingItem(
                  title: 'Lead with value, not forms',
                  body:
                  'Strong onboarding experiences \u2014 including Biscuit and broader app best practices \u2014 explained what the product would do for the user before asking anything of them.',
                ),
                ProjectFindingItem(
                  title: 'Short, visual sequences outperform long forms',
                  body:
                  'Feature carousels and progress indicators were consistently associated with higher engagement and lower drop-off compared to text-heavy, question-first flows.',
                ),
                ProjectFindingItem(
                  title: 'Explicit about what\u2019s optional',
                  body:
                  'The best examples made it very clear what was required, what was optional, and \u2014 crucially \u2014 why each piece of information was being requested.',
                ),
              ],
            ),

            // ── 5. CORE FINDING ───────────────────────────────────────────────
            const ProjectQuoteBlock(
              themeConfig: softTheme,
              quote:
              'Users weren\u2019t leaving because Perro wasn\u2019t good enough. They were leaving because the onboarding asked too much, too early, before it had given anything back.',
              attribution: 'Synthesis across funnel data, heuristic review, and usability sessions',
            ),

            // ── 6. WHO WE WERE DESIGNING FOR ──────────────────────────────────
            const ProjectPersonaBlock(
              themeConfig: darkTheme,
              eyebrow: 'User persona',
              name: 'Jess Harrington',
              role: 'New dog owner, recently rehomed a 2-year-old rescue Greyhound',
              quote:
              'I downloaded it because the rewards looked interesting, but I gave up when it started asking about vaccinations. I just wanted to track walks.',
              goals: [
                'Track her dog\u2019s activity and wellbeing in a way that feels lightweight',
                'Understand what the rewards programme actually offers before committing',
                'Complete setup quickly without needing to gather documents or photos',
                'Feel like the app is on her side, not working against her',
              ],
              frustrations: [
                'Being asked for detailed health information before she\u2019s seen any value',
                'Having to leave the app to find a suitable photo just to continue',
                'Permissions prompts that feel like interruptions rather than part of the experience',
                'Subscription screens that feel like a hard sell rather than a natural continuation',
              ],
              context:
              'Jess is 31, uses health and fitness apps regularly, and has a low tolerance for onboarding friction. She\u2019s familiar with digital products and quick to abandon if an experience feels unnecessarily complicated. She was a strong fit for Perro\u2019s value proposition but dropped off at the dog health screen on her first attempt.',
              contextTags: [
                'New dog owner',
                'App-savvy',
                'Low friction tolerance',
                'Rewards-motivated',
              ],
            ),

            const ProjectPersonaBlock(
              themeConfig: softTheme,
              eyebrow: 'User persona',
              name: 'Marcus Webb',
              role: 'Long-term dog owner, two Spaniels, active walker',
              quote:
              'I don\u2019t mind giving information if I understand why you need it. But this kept asking things I couldn\u2019t see the point of yet.',
              goals: [
                'Log walks and activity alongside Apple Health data he already tracks',
                'Use the training and enrichment content to try new things with his dogs',
                'Share the app with his partner so they can both track the dogs',
                'Get genuine value from the rewards before deciding on a subscription tier',
              ],
              frustrations: [
                'Unclear explanations for why location and notification permissions are requested',
                'Duplicate effort \u2014 being asked for fitness information that his health app already holds',
                'Subscription options that don\u2019t clearly map to what he actually wants to use',
                'Feeling like setup is designed for a single dog rather than his household',
              ],
              context:
              'Marcus is 44, runs regularly, and is meticulous about tracking his health data. He was willing to invest time in setup if the payoff was clear, but hit friction at the permissions screen and again at the subscription step. His pattern was to bookmark and return rather than abandon completely \u2014 but the second attempt also stalled.',
              contextTags: [
                'Experienced dog owner',
                'Health data user',
                'Multi-dog household',
                'Return visitor',
              ],
            ),

            // ── 7. NORTH STAR ─────────────────────────────────────────────────
            const ProjectCalloutBlock(
              themeConfig: darkTheme,
              style: CalloutStyle.principle,
              label: 'Strategy',
              icon: Icons.route_outlined,
              body:
              'Three moves shaped every decision: shorten and refocus onboarding around what genuinely improves the first session; start with value before asking for anything; and remove the specific friction points \u2014 photo uploads, unexplained permissions, and late-funnel fatigue \u2014 that were silently driving people away.',
            ),

            // ── 8. METHOD ─────────────────────────────────────────────────────
            const ProjectProcessStepsBlock(
              themeConfig: lightTheme,
              title: 'How we approached it',
              steps: [
                ProjectProcessStep(
                  title: 'Scoped from data, not assumptions',
                  body:
                  'Mixpanel funnels defined the scope. Screens with the steepest drop-offs \u2014 landing, dog profile, user profile, and the subscription hand-off \u2014 became the core workstream.',
                ),
                ProjectProcessStep(
                  title: 'Audited every field: critical or ask later?',
                  body:
                  'Each onboarding field was assessed against one question: does the first session genuinely require this? Pet illnesses and detailed health information were removed entirely. Activity level and some fitness questions were moved to in-app prompts post-signup.',
                ),
                ProjectProcessStep(
                  title: 'Designed and tested a feature carousel',
                  body:
                  'A compact carousel introduced Perro through four lenses: Woof rewards and discounts, health and activity monitoring with Apple Health or Google Fit, guided enrichment and training content, and Perro Family & Social features. A version with the carousel was tested against a minimal version that went straight to forms. The carousel variant performed better on engagement and downstream completion.',
                ),
                ProjectProcessStep(
                  title: 'Introduced avatars to remove photo friction',
                  body:
                  'Default avatars for both dog and user replaced mandatory photo upload. Photo upload was marked clearly as optional and something users could return to later. This allowed anyone to complete setup without leaving the app.',
                ),
                ProjectProcessStep(
                  title: 'Added a permissions explainer screen',
                  body:
                  'A dedicated screen before the OS prompts explained, in plain language, why Perro needed location (walk tracking, weather-aware suggestions, local insights) and why notifications mattered (reminders, rewards, wellbeing nudges). The permission requests became part of the experience rather than a technical interruption.',
                ),
                ProjectProcessStep(
                  title: 'Refreshed subscription UI and implemented in Flutter',
                  body:
                  'The plan selection flow was redesigned to present options side-by-side with clear summaries, gentle visual emphasis on longer-term plans, and the same benefits highlighted in the feature carousel \u2014 so the paywall felt like a continuation, not a hard pivot. The full redesign was implemented directly in Flutter and refined through a small test build.',
                ),
              ],
            ),

            // ── 9. OPPORTUNITY FRAMING ────────────────────────────────────────
            const ProjectHowMightWeBlock(
              themeConfig: softTheme,
              title: 'How might we\u2026',
              intro:
              'Opportunity questions that shaped the design direction.',
              items: [
                ProjectHmwItem(
                  question:
                  'How might we show new users what Perro will do for them before asking anything of them?',
                  theme: 'Value first',
                ),
                ProjectHmwItem(
                  question:
                  'How might we let users complete setup without leaving the app, even if they don\u2019t have the right photo to hand?',
                  theme: 'Friction removal',
                ),
                ProjectHmwItem(
                  question:
                  'How might we make every question feel necessary and clearly connected to a benefit the user cares about?',
                  theme: 'Purpose',
                ),
                ProjectHmwItem(
                  question:
                  'How might we explain permissions in a way that feels like part of the product rather than a legal formality?',
                  theme: 'Trust',
                ),
                ProjectHmwItem(
                  question:
                  'How might we make the subscription step feel like a natural next move rather than a jarring upsell?',
                  theme: 'Continuity',
                ),
                ProjectHmwItem(
                  question:
                  'How might we reduce the number of questions without losing the information that genuinely improves the first session?',
                  theme: 'Progressive disclosure',
                ),
              ],
            ),

            // ── 10. BEFORE / AFTER ────────────────────────────────────────────
            const ProjectBeforeAfterBlock(
              themeConfig: lightTheme,
              beforeTitle: 'Before',
              beforeBody:
              '5 screens, 16 questions, mandatory photo upload, abrupt system permission prompts, no explanation of what Perro offers. The flow asked for a lot and gave back very little before the first meaningful moment of value.',
              afterTitle: 'After',
              afterBody:
              '4 screens, 11 questions, avatar system with optional photo, a feature carousel that front-loads value, a permissions explainer, and a subscription step that continues the same story. Setup became a genuine introduction to the product.',
            ),

            // ── 11. KEY DECISIONS ─────────────────────────────────────────────
            const ProjectDecisionLogBlock(
              themeConfig: darkTheme,
              title: 'Key decisions',
              intro: 'What was decided, why, and what we observed.',
              decisions: [
                ProjectDecisionItem(
                  decision:
                  'Removed pet illnesses and detailed health information from onboarding entirely',
                  rationale:
                  'These fields appeared early but added significant perceived effort without an obvious first-session payoff. Users were not yet invested enough in the product to feel this was a fair exchange.',
                  outcome:
                  'A major resistance point was eliminated. Health information was moved to an in-app prompt later in the journey, where users had more context and motivation to provide it.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision:
                  'Led with a feature carousel before the first form screen',
                  rationale:
                  'Competitive analysis and usability sessions both pointed to the same gap: users had no idea what Perro would do for them before they were asked to give information. The carousel was designed to close that gap in three or four screens.',
                  outcome:
                  'Tested against a minimal version without the carousel. The carousel variant performed better on engagement and downstream completion, and became the production baseline.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision:
                  'Replaced mandatory photo upload with an avatar system and optional image',
                  rationale:
                  'Usability sessions showed this was a silent exit trigger. Users left the app to find a suitable photo and frequently did not return. Making it optional removed a low-value blocker.',
                  outcome:
                  'Drop-off at the dog profile step fell noticeably post-launch. Users could complete setup in a single session without leaving the app.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision:
                  'Added a dedicated permissions explainer screen before OS prompts',
                  rationale:
                  'Abrupt system dialogs for location and notifications appeared out of nowhere with no context. Most users either dismissed them or felt ambushed. A brief plain-language screen before each prompt changed the framing entirely.',
                  outcome:
                  'Permission acceptance improved. Users who read the explainer were significantly more likely to grant both location and notification access.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision:
                  'Redesigned subscription UI to echo the feature carousel benefits',
                  rationale:
                  'The paywall previously felt disconnected from the onboarding story. By repeating the same four benefit areas from the carousel, the subscription step became a natural continuation rather than an interruption.',
                  outcome:
                  'Subscription conversion increased and the share of users choosing longer-term plans rose. Qualitative feedback described the step as feeling \u201cfairer\u201d and \u201cmore honest\u201d.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision:
                  'Moved activity level and certain fitness questions to post-signup in-app prompts',
                  rationale:
                  'These questions were arriving when users were already fatigued and before they had done anything in the app that would make the questions feel relevant.',
                  outcome:
                  'Reduced late-funnel fatigue. The information was still collected, just at a point in the journey where users had more reason to care about it.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
              ],
            ),

            // ── 12. THE SOLUTION ──────────────────────────────────────────────
            ProjectTextImageBlock(
              themeConfig: softTheme,
              eyebrow: 'Solution',
              title: 'A shorter, value-first introduction to Perro',
              body:
              'The refreshed onboarding turns what used to feel like a long, slightly opaque form into a short, value-driven introduction to the product. New users see what Perro will do for them, answer fewer but more relevant questions, stay inside the app while setting up their dog, and understand exactly why they\u2019re being asked for location, notifications, and payment. The subscription step continues the same story \u2014 starting a plan feels like a natural next move rather than a pivot.',
              image: const _CaseStudyImageCard(
                label: 'Replace with feature carousel or onboarding screen recording',
                height: 460,
              ),
            ),

            // ── 13. ACCESSIBILITY ─────────────────────────────────────────────
            const ProjectAccessibilityAuditBlock(
              themeConfig: lightTheme,
              title: 'Accessibility considerations',
              intro:
              'Issues identified during the heuristic review and addressed as part of the redesign.',
              issues: [
                ProjectA11yIssue(
                  issue: 'Progress indicator absent from a 5-screen flow',
                  description:
                  'Users had no way to gauge how far through onboarding they were or how much remained. This contributed to the sense of effort being open-ended.',
                  severity: A11ySeverity.serious,
                  wcagCriterion: '2.4.8 Location',
                  fix:
                  'A step indicator was added to each onboarding screen, clearly showing current position and total steps.',
                ),
                ProjectA11yIssue(
                  issue: 'System permission dialogs appeared without context',
                  description:
                  'OS-level prompts for location and notifications arrived abruptly, with no prior explanation. For users relying on screen readers, the sudden modal shift was especially disorienting.',
                  severity: A11ySeverity.serious,
                  wcagCriterion: '3.3.2 Labels or Instructions',
                  fix:
                  'Dedicated explainer screen added before each OS prompt. Plain-language explanation of purpose and benefit included for each permission requested.',
                ),
                ProjectA11yIssue(
                  issue: 'Avatar selection not accessible via VoiceOver or TalkBack',
                  description:
                  'The initial avatar grid used tap targets that were too small and lacked accessible labels, making selection difficult for users navigating by touch or screen reader.',
                  severity: A11ySeverity.serious,
                  wcagCriterion: '2.5.5 Target Size / 4.1.2 Name, Role, Value',
                  fix:
                  'Avatar tap targets increased to a minimum 48x48dp. Each avatar received a semantic label describing the dog breed or character depicted.',
                ),
                ProjectA11yIssue(
                  issue: 'Optional fields not labelled as optional',
                  description:
                  'Photo upload and several profile fields were effectively optional but were not marked as such, leading users to believe they had to complete them to proceed.',
                  severity: A11ySeverity.moderate,
                  wcagCriterion: '3.3.2 Labels or Instructions',
                  fix:
                  'Optional fields labelled explicitly as \u201cOptional \u2014 you can add this later\u201d. Skip affordances added where relevant.',
                ),
                ProjectA11yIssue(
                  issue: 'Feature carousel had no pause control or manual navigation',
                  description:
                  'The auto-advancing carousel moved between slides on a timer with no way to pause or step through manually, which was problematic for users who needed more time to read.',
                  severity: A11ySeverity.moderate,
                  wcagCriterion: '2.2.2 Pause, Stop, Hide',
                  fix:
                  'Carousel updated to be manually navigated by default, with swipe and dot-tap controls. Auto-advance removed.',
                ),
              ],
            ),

            // ── 14. OUTCOMES ──────────────────────────────────────────────────
            const ProjectMetricsBandBlock(
              themeConfig: darkTheme,
              items: [
                ProjectMetricItem(
                  value: '\u2193 Drop-off',
                  label: 'Particularly at photo and health bottlenecks',
                ),
                ProjectMetricItem(
                  value: '\u2191 Completion',
                  label: 'More users reaching first key in-app actions',
                ),
                ProjectMetricItem(
                  value: '\u2191 Conversion',
                  label: 'Higher subscription take-up post-launch',
                ),
                ProjectMetricItem(
                  value: 'Acquired',
                  label: 'UX cited as a product strength at acquisition',
                ),
              ],
            ),

            // ── 15. DESIGNING WITHIN CONSTRAINTS ─────────────────────────────
            ProjectTextImageBlock(
              themeConfig: softTheme,
              eyebrow: 'Constraints and craft',
              title: 'Designing and building within a two-week Flutter sprint',
              body:
              'Acting as both designer and developer meant every decision had to be immediately buildable. There were no backend changes available, so all improvements lived in UX, UI, and client-side logic. The two-week part-time window encouraged focused, incremental changes over a full rewrite \u2014 and because existing users still needed a stable experience, the work had to be additive rather than disruptive. Building in Flutter meant tight feedback loops: design decisions could be validated in the actual product rather than in a prototype, which reduced iteration time and surfaced real issues earlier.',
              reverse: true,
              image: const _CaseStudyImageCard(
                label: 'Replace with Flutter implementation or design/code side-by-side',
                height: 420,
              ),
            ),

            // ── 16. SCREENS ───────────────────────────────────────────────────
            ProjectImageGalleryBlock(
              themeConfig: lightTheme,
              title: 'Screen gallery',
              images: const [
                _CaseStudyImageCard(label: 'Feature carousel \u2014 slide 1', height: 300),
                _CaseStudyImageCard(label: 'Dog profile \u2014 avatar selection', height: 300),
                _CaseStudyImageCard(label: 'Permissions explainer screen', height: 300),
                _CaseStudyImageCard(label: 'User profile \u2014 reduced questions', height: 300),
                _CaseStudyImageCard(label: 'Subscription \u2014 plan selection', height: 300),
                _CaseStudyImageCard(label: 'First session \u2014 home screen', height: 300),
              ],
            ),

            // ── 17. WHAT HAPPENED AFTER ───────────────────────────────────────
            const ProjectLearningsBlock(
              themeConfig: darkTheme,
              title: 'What happened after',
              points: [
                'Post-launch funnel data showed a noticeable reduction in drop-offs across onboarding, particularly at the previous photo upload and health information bottlenecks.',
                'Onboarding completion increased, with more users reaching their first key in-app actions \u2014 the indicator that the first session was genuinely delivering value.',
                'Subscription conversions increased and a greater share of users chose longer-term plans, consistent with the goal of making the paywall feel like a continuation rather than an interruption.',
                'Qualitative feedback from users and stakeholders described the experience as clearer, simpler, and more trustworthy than before.',
                'Over time, Perro\u2019s improved onboarding and product quality contributed to the company\u2019s acquisition \u2014 with the app\u2019s UX highlighted as one of the strengths of the product during the process.',
              ],
            ),

            const MoreProjectsBlock(
              themeConfig: softTheme,
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
                  title: 'Layout demo',
                  blurb:
                  'A reference page for reusable case study blocks and section patterns used across the portfolio.',
                  routeName: 'project-layout-demo',
                  category: 'System',
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
                  color: const Color(0xFFFB6000).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(AppRadii.sm),
                  border: Border.all(
                    color: const Color(0xFFFB6000).withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  'Perro \u2014 Case study 02',
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
      'Perro had a genuinely strong product. Users were leaving during onboarding before they\u2019d seen any of it.',
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
      'In a two-week part-time sprint, I redesigned and implemented in Flutter a shorter, value-first onboarding and subscription flow that reduced drop-offs, increased completions, and lifted subscription conversion \u2014 contributing to an outcome that led to the company\u2019s acquisition.',
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
                        colors: [Color(0xFF1C1814), Color(0xFF0E0C0A)],
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
