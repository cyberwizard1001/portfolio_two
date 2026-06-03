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
import '../../widgets/project/project_callout_block.dart';
import '../../widgets/project/project_decision_log_block.dart';
import '../../widgets/project/project_findings_grid_block.dart';
import '../../widgets/project/project_how_might_we_block.dart';
import '../../widgets/project/project_learnings_block.dart';
import '../../widgets/project/project_meta_strip_block.dart';
import '../../widgets/project/project_metrics_band_block.dart';
import '../../widgets/project/project_persona_block.dart';
import '../../widgets/project/project_problem_key_info_block.dart';
import '../../widgets/project/project_process_steps_block.dart';
import '../../widgets/project/project_quote_block.dart';
import '../../widgets/project/project_section_theme.dart';
import '../../widgets/project/project_image_gallery_block.dart';
import '../../widgets/project/project_text_image_block.dart';

class CraftingCounsellingCompanionsPage extends StatelessWidget {
  const CraftingCounsellingCompanionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const baseTheme = ProjectSectionTheme(
      backgroundColor: Color(0xFFF2F8F7),
      foregroundColor: Color(0xFF162220),
      accentColor: Color(0xFF25A08C),
      borderColor: Color(0x22162220),
      mutedColor: Color(0xB3162220),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: ScrollablePageShell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── 1. HERO ────────────────────────────────────────────────────
            const _CounsellingHero(),

            // ── 1b. HERO IMAGE ─────────────────────────────────────────────
            const _HeroImageBlock(
              imagePath: 'assets/images/counselling/hero_ambient.jpg',
              caption:
                  'Mental health practitioners carry both the clinical and administrative weight of their practice \u2014 this project asked what digital tools could lift.',
            ),

            // ── 2. VITALS ─────────────────────────────────────────────────
            const ProjectMetaStripBlock(
              themeConfig: baseTheme,
              items: [
                ProjectMetaItem(
                  label: 'Role',
                  value: 'UX Research, Interaction Design, Prototyping',
                ),
                ProjectMetaItem(
                  label: 'Context',
                  value: 'MSc Human\u2013Computer Interaction \u2014 Newcastle University',
                ),
                ProjectMetaItem(
                  label: 'Methods',
                  value:
                      'Semi-structured interviews, co-design workshop, Figma prototyping, heuristic evaluation',
                ),
                ProjectMetaItem(
                  label: 'Module',
                  value: 'CSC8609 \u2014 Dissertation',
                ),
              ],
            ),

            // ── 3. PROBLEM ────────────────────────────────────────────────
            const ProjectProblemKeyInfoBlock(
              themeConfig: baseTheme,
              problemTitle: 'The problem',
              problemBody:
                  'Mental health practitioners are under intense pressure worldwide. In the UK and India, counsellors and therapists in solo or small practices rely on a patchwork of generic tools \u2014 email, WhatsApp, spreadsheets, Google Drive \u2014 to manage scheduling, client records, resources, and billing. None of these tools were designed for the clinical context, and the result is fragmented information, duplicated effort, and administrative overhead that can eat 15\u201320 minutes out of every 40-minute session.',
              contextBody:
                  'This project set out to understand whether bespoke, practitioner-centred digital tools could reduce that burden and improve both the quality of care and quality of life for therapists \u2014 without compromising the fundamentally human nature of the therapeutic relationship. The focus was deliberately on the back-office layer of practice, not on patient-facing apps or clinical decision-support.',
              infoItems: [
                ProjectMetaItem(
                  label: 'Research question',
                  value:
                      'How can tailored digital tools reduce administrative burden for mental health practitioners while supporting \u2014 not replacing \u2014 the therapeutic relationship?',
                ),
                ProjectMetaItem(
                  label: 'Scope',
                  value:
                      'Discovery research, co-design, prototyping, and RRI ethical review',
                ),
                ProjectMetaItem(
                  label: 'Participants',
                  value:
                      '7 practitioners: counsellors, psychologists, mental health social workers across India and the UK',
                ),
                ProjectMetaItem(
                  label: 'Ethical framework',
                  value: 'Responsible Research and Innovation (RRI)',
                ),
              ],
            ),

            // ── 4. RESEARCH OVERVIEW ──────────────────────────────────────
            const ProjectCalloutBlock(
              themeConfig: baseTheme,
              style: CalloutStyle.principle,
              label: 'Research aim',
              icon: Icons.search_rounded,
              body:
                  'Design a practical, practitioner-centred tool that streamlines administrative tasks and supports mental health professionals before, during and after counselling sessions \u2014 without compromising the therapeutic relationship or introducing ethical risk.',
            ),

            // ── 5. METHODS ────────────────────────────────────────────────
            const ProjectProcessStepsBlock(
              themeConfig: baseTheme,
              title: 'How the research was structured',
              steps: [
                ProjectProcessStep(
                  title: 'Semi-structured interviews',
                  body:
                      'Seven practitioners participated in 60-minute phone or video sessions. Interviews explored current tool use, daily admin workflows, pain points, and attitudes toward AI assistance. Sensitive sections on AI and ethics were made optional, and participants could retract statements after review.',
                ),
                ProjectProcessStep(
                  title: 'Reflexive thematic analysis',
                  body:
                      'Using Clarke and Braun\u2019s reflexive thematic analysis, I coded all interview transcripts independently, generating 47 codes which were iteratively grouped into 7 themes. Analysis was reflexive \u2014 surfacing not just practitioner concerns but also assumptions I brought to the research.',
                ),
                ProjectProcessStep(
                  title: 'Low-contact co-design workshop',
                  body:
                      'To accommodate practitioners\u2019 limited time, I designed an asynchronous one-week co-design workshop using Google Workspace (Gmail, Keep, Sheets, Calendar, Drive). Participants completed seven structured activities and documented their ideas using a physical printed toolkit. A dedicated GitHub Pages site hosted all digital materials.',
                ),
                ProjectProcessStep(
                  title: 'Figma prototyping',
                  body:
                      'Workshop outputs were translated into medium\u2013high fidelity Figma prototypes of a practice-management dashboard and a complementary voice assistant. The design went through two explicit iteration cycles \u2014 one driven by heuristic evaluation, one by practitioner usability testing.',
                ),
                ProjectProcessStep(
                  title: 'Heuristic evaluation',
                  body:
                      'A peer and I walked through the prototype using Nielsen\u2019s ten heuristics. Issues around consistency, spacing, visibility of system status, and label clarity were documented and addressed before the practitioner session.',
                ),
                ProjectProcessStep(
                  title: 'RRI ethical review',
                  body:
                      'Using established RRI prompts and Moral IT cards, I systematically mapped all stakeholders (practitioners, clients, regulators, researchers, support staff) and interrogated data flows, consent boundaries, and AI usage. This informed concrete design decisions around transparency, user control, and privacy.',
                ),
              ],
            ),

            // ── 6. KEY INSIGHTS ───────────────────────────────────────────
            const ProjectFindingsGridBlock(
              themeConfig: baseTheme,
              title: '7 themes from the interviews',
              items: [
                ProjectFindingItem(
                  title: 'Poorly integrated digital tools',
                  body:
                      'Practitioners toggle between Zoom, WhatsApp, email, and calendar apps depending on client needs, producing fragmented records and constant context switching.',
                ),
                ProjectFindingItem(
                  title: 'Documentation and record-keeping',
                  body:
                      'Many still handwrite notes to preserve eye contact during sessions, then struggle to index and search them. Digital searchability is attractive but typing in-session feels intrusive.',
                ),
                ProjectFindingItem(
                  title: 'Progress tracking and goal setting',
                  body:
                      'Goal-setting is central to therapy but tracking is often informal. Practitioners want lightweight, structured tools \u2014 not rigid clinical scales that feel clinical and impersonal.',
                ),
                ProjectFindingItem(
                  title: 'Care vs administration',
                  body:
                      'Admin can consume 15\u201320 minutes of every 40-minute session, covering preparation, notes, scheduling, billing, and follow-up. This directly reduces time available for care.',
                ),
                ProjectFindingItem(
                  title: 'Resource maintenance and sharing',
                  body:
                      'Practitioners curate worksheets, articles, and videos but lack a centralised, searchable library. Resources are often duplicated and emailed rather than shared from a single source.',
                ),
                ProjectFindingItem(
                  title: 'Adapting to varied contexts',
                  body:
                      'School counselling, private practice, and institutional settings have very different workflows. One-size-fits-all software consistently fails because it can\u2019t accommodate the variation.',
                ),
                ProjectFindingItem(
                  title: 'Ethics, privacy, and human connection',
                  body:
                      'Practitioners expressed real anxiety about AI replacing human therapists, commercial misuse of sensitive data, and the risk of depersonalising care through over-automation.',
                ),
              ],
            ),

            // ── 7. CORE INSIGHT ───────────────────────────────────────────
            const ProjectQuoteBlock(
              themeConfig: baseTheme,
              quote:
                  '\u201cI mean, I feel like if it was digital, it would be a lot easier to find things.\u201d',
              attribution: 'Interview participant \u2014 on searching handwritten notes',
            ),

            // ── 8. WHO WE WERE DESIGNING FOR ─────────────────────────────
            const ProjectPersonaBlock(
              themeConfig: baseTheme,
              eyebrow: 'Practitioner persona',
              name: 'Priya Mehta',
              role:
                  'Private-practice counsellor, 8 years experience, solo practitioner in Bangalore',
              quote:
                  'I spend so much time after sessions just trying to organise things. By the time I\u2019ve written my notes, sent the resource, and updated my calendar, I\u2019m exhausted before the next client.',
              goals: [
                'Prepare for each session quickly without switching between five different tools',
                'Send worksheets and resources to clients without hunting through email folders',
                'Keep structured notes that are searchable and securely stored',
                'Spend less time on scheduling, billing, and follow-up chasing',
              ],
              frustrations: [
                'No single tool that combines her session notes, calendar, and client records',
                'Physical notes that are impossible to search retrospectively',
                'Resources scattered across Google Drive, email attachments, and browser bookmarks',
                'Scheduling and billing still handled by separate, unconnected apps',
              ],
              context:
                  'Priya works with 8\u201310 clients per week across video and in-person sessions. She is comfortable with digital tools but deeply sceptical of anything that feels like it might depersonalise her practice. She is willing to invest in a tool if it genuinely reduces friction, but will not tolerate anything that adds steps to her current workflow.',
              contextTags: [
                'Solo practitioner',
                'High trust stakes',
                'Resource curator',
                'Privacy-conscious',
              ],
            ),

            const ProjectPersonaBlock(
              themeConfig: baseTheme,
              eyebrow: 'Practitioner persona',
              name: 'James Okafor',
              role:
                  'Mental health social worker, NHS-adjacent organisation, team of four',
              quote:
                  'I don\u2019t mind AI if I understand what it\u2019s doing and I\u2019m the one who decides what gets sent. The moment it starts acting on its own, I\u2019m out.',
              goals: [
                'Quickly brief himself on a returning client\u2019s history before a session',
                'Share session summaries and referral documents with colleagues securely',
                'Understand what the tool is doing with data before he commits to using it',
                'Reduce the time spent manually tracking client progress between sessions',
              ],
              frustrations: [
                'No transparent audit trail for AI-generated outputs in clinical contexts',
                'Having to explain sensitive client context repeatedly when referring to colleagues',
                'Progress data held in his personal notes rather than a shared, structured format',
                'Generic consent forms that don\u2019t address AI-assisted features specifically',
              ],
              context:
                  'James manages a small caseload alongside a team, so collaboration and handoff are central concerns. He is moderately tech-savvy, follows debates about AI in healthcare, and sets a high bar for explainability and control before he adopts any tool.',
              contextTags: [
                'Team context',
                'AI-sceptical but open',
                'Referral-heavy',
                'Transparency-first',
              ],
            ),

            // ── 9. HOW MIGHT WE ───────────────────────────────────────────
            const ProjectHowMightWeBlock(
              themeConfig: baseTheme,
              title: 'How might we\u2026',
              intro:
                  'Opportunity questions derived from research synthesis that shaped the design direction.',
              items: [
                ProjectHmwItem(
                  question:
                      'How might we bring scheduling, notes, and client records into one coherent interface without forcing practitioners to abandon familiar tools?',
                  theme: 'Integration',
                ),
                ProjectHmwItem(
                  question:
                      'How might we let practitioners capture in-session notes in a way that feels present rather than clinical?',
                  theme: 'Presence',
                ),
                ProjectHmwItem(
                  question:
                      'How might we make AI assistance feel like a controlled, transparent tool rather than an autonomous decision-maker?',
                  theme: 'Trust & control',
                ),
                ProjectHmwItem(
                  question:
                      'How might we surface the right client context quickly at the start of a session without requiring manual preparation?',
                  theme: 'Preparation',
                ),
                ProjectHmwItem(
                  question:
                      'How might we design for the full diversity of practice settings without building an overly complex system?',
                  theme: 'Configurability',
                ),
                ProjectHmwItem(
                  question:
                      'How might we make sharing resources and referral materials feel as easy as sending a message?',
                  theme: 'Sharing',
                ),
              ],
            ),

            // ── 10. DESIGN SOLUTION ───────────────────────────────────────
            ProjectTextImageBlock(
              themeConfig: baseTheme,
              eyebrow: 'Design solution',
              title:
                  'A practitioner-centred practice dashboard',
              body:
                  'The proposed solution integrates with existing office suites (Google Workspace or Microsoft 365) to bring communication, scheduling, documentation, finances, and a resource library into a single coherent interface. A complementary voice assistant lets practitioners issue multi-step instructions in natural language \u2014 scheduling a follow-up, sending a worksheet, and setting a pre-session reminder in a single spoken command \u2014 with each action shown as an editable checklist item before anything is executed.',
              image: _RealImageCard(
                imagePath: 'assets/images/counselling/workshop_gmail.jpg',
                caption: 'Co-design workshop: email drafts configured by a participant during Activity 2',
                height: 460,
              ),
            ),

            // ── 11. CORE FEATURES ─────────────────────────────────────────
            const ProjectFindingsGridBlock(
              themeConfig: baseTheme,
              title: 'Core features',
              items: [
                ProjectFindingItem(
                  title: 'Home dashboard',
                  body:
                      'Upcoming sessions, key client details for the next appointment, a live tasks list, and an embedded email panel \u2014 all on one screen to reduce context switching before a session.',
                ),
                ProjectFindingItem(
                  title: 'Schedule',
                  body:
                      'Week and month calendar views showing all sessions and events. Session cards open into details and direct actions: reschedule, contact client, or view notes from the previous session.',
                ),
                ProjectFindingItem(
                  title: 'People',
                  body:
                      'A searchable client list with each profile showing session history, payments, shared resources, and a secure document store for consent forms. Optional AI-generated case summaries, controlled by a per-client toggle.',
                ),
                ProjectFindingItem(
                  title: 'Library',
                  body:
                      'A structured repository for documents, worksheets, articles, and media, filterable by resource type. Planned browser extension support for capturing resources from the web, similar to Zotero.',
                ),
                ProjectFindingItem(
                  title: 'Notes',
                  body:
                      'Hybrid note-taking supporting typed templates and scanned handwritten notes, with tagging, categorisation, and search. Attachment support for images and videos reflects the embodied nature of some therapeutic exercises.',
                ),
                ProjectFindingItem(
                  title: 'Voice assistant',
                  body:
                      'A cross-screen overlay for multi-step natural-language instructions. The system parses requests into discrete, editable checklist items and executes only what the practitioner explicitly approves.',
                ),
              ],
            ),

            // ── 11b. CO-DESIGN GALLERY ────────────────────────────────────
            ProjectImageGalleryBlock(
              themeConfig: baseTheme,
              title: 'Co-design workshop outputs',
              images: [
                _RealImageCard(
                  imagePath: 'assets/images/counselling/codesign_activity_physical.jpg',
                  caption: 'Activity 2 \u2014 participant working through email task with sticky-note annotations',
                  height: 320,
                ),
                _RealImageCard(
                  imagePath: 'assets/images/counselling/workshop_calendar_booking.jpg',
                  caption: 'Google Calendar bookable appointment schedule \u2014 participant-configured session availability',
                  height: 320,
                ),
                _RealImageCard(
                  imagePath: 'assets/images/counselling/codesign_sheets_physical.jpg',
                  caption: 'Activity 3 \u2014 Google Sheets session tracker with participant feedback: \u201cWell thought out. Easy to store all the details.\u201d',
                  height: 320,
                ),
                _RealImageCard(
                  imagePath: 'assets/images/counselling/workshop_sheets.jpg',
                  caption: 'Session history sheet \u2014 client records, payment status, and session log',
                  height: 320,
                ),
                _RealImageCard(
                  imagePath: 'assets/images/counselling/workshop_drive.jpg',
                  caption: 'Google Drive resource library \u2014 worksheets, reading materials, and client folders',
                  height: 320,
                ),
                _RealImageCard(
                  imagePath: 'assets/images/counselling/codesign_calendar_physical.jpg',
                  caption: 'Activity 1 \u2014 participant note: \u201cFeels like an invisible non-living assistant\u201d',
                  height: 320,
                ),
              ],
            ),

            // ── 11c. THE FINAL PROTOTYPE ──────────────────────────────────
            ProjectTextImageBlock(
              themeConfig: baseTheme,
              eyebrow: 'The final prototype',
              title: 'From a feel for it to the finished thing',
              body:
                  'The co-design workshop was really about getting a feel for things. I gave people a version of the tool stitched together out of Google Workspace so they could live in it for a week and tell me where it pinched, and once I had those findings I sat down and designed the thing properly in Figma. This is what came out of that. The home screen was the part I cared about most, because it is the first thing a practitioner sees before a session and it is where the fragmentation problem shows up worst. So I put the day’s sessions, the details of whoever is next, the running task list, and the inbox all on one screen. The idea was that you could glance at it for ten seconds before a client walks in and actually feel ready, instead of opening four tabs to piece the same picture together yourself.',
              image: _RealImageCard(
                imagePath: 'assets/images/counselling/Home.jpg',
                caption: 'Home dashboard — the day’s sessions, the next client’s details, the task list, and the inbox on a single screen',
                height: 480,
              ),
            ),

            // ── 11d. SCHEDULE VIEWS ────────────────────────────────────────
            ProjectImageGalleryBlock(
              themeConfig: baseTheme,
              title: 'The schedule, two ways to look at it',
              images: [
                _RealImageCard(
                  imagePath: 'assets/images/counselling/Schedule week.jpg',
                  caption: 'Week view — every session laid out against the working day, with cards that open into reschedule, contact the client, or notes from last time',
                  height: 360,
                ),
                _RealImageCard(
                  imagePath: 'assets/images/counselling/Schedule.jpg',
                  caption: 'Month view — the same schedule zoomed out, so the weeks ahead can be read at a glance',
                  height: 360,
                ),
              ],
            ),

            // ── 11e. CLIENT RECORD ─────────────────────────────────────────
            ProjectTextImageBlock(
              themeConfig: baseTheme,
              eyebrow: 'People',
              title: 'The client record, and where the AI lives',
              body:
                  'Every client gets a profile, and this is where most of the AI questions from the interviews ended up living. There is the session history, the resources you have shared, a secure spot for consent forms, and an AI-written summary of where things stand. The part I kept coming back to is the toggle at the top. AI is off unless the practitioner turns it on, and they turn it on per client rather than once for the whole practice. Some of the people I spoke to were wary of AI in a room this sensitive and some were keen, and a single switch buried in settings did not respect either view. Letting them decide client by client felt a lot closer to how they actually think about consent and trust.',
              image: _RealImageCard(
                imagePath: 'assets/images/counselling/People.jpg',
                caption: 'Client profile — session history, shared resources, consent storage, and a per-client toggle that keeps AI off until the practitioner turns it on',
                height: 480,
              ),
            ),

            // ── 11f. NOTES ─────────────────────────────────────────────────
            ProjectTextImageBlock(
              themeConfig: baseTheme,
              eyebrow: 'Notes',
              title: 'Notes that do not pull you out of the room',
              body:
                  'A lot of practitioners told me they still write their notes by hand, not because they love paper but because typing in front of a client breaks the eye contact the whole session depends on. So the notes screen had to hold both. You can type into a template or scan in the sheet you wrote during the session, then tag it, search across all of it, and look back through earlier versions when you need to. The AI summary sits off to the side as something you ask for, not something that quietly happens to your notes while you are not looking. That small distinction mattered more than I expected once people started using it.',
              image: _RealImageCard(
                imagePath: 'assets/images/counselling/Session notes.jpg',
                caption: 'Session notes — typed templates or scanned handwriting, tagged and searchable, with an AI summary you ask for rather than one that happens to you',
                height: 480,
              ),
            ),

            // ── 11g. LIBRARY ────────────────────────────────────────────────
            ProjectTextImageBlock(
              themeConfig: baseTheme,
              eyebrow: 'Library',
              title: 'One place for everything you share',
              body:
                  'Almost everyone I interviewed was quietly keeping their own little library of worksheets and articles and videos, scattered across Drive folders and email attachments and browser bookmarks, and nobody could find anything when they needed it. The library pulls all of that into one place you can filter by type and read inside the tool itself. I also sketched out a browser extension for clipping things off the web as you come across them, the way Zotero does for academic papers, though I should be honest that this stayed a concept rather than something I built.',
              image: _RealImageCard(
                imagePath: 'assets/images/counselling/Resources.jpg',
                caption: 'Library — worksheets, articles, and media in one place, filterable by type and readable inside the tool',
                height: 480,
              ),
            ),

            // ── 11h. AI TRANSPARENCY ───────────────────────────────────────
            ProjectTextImageBlock(
              themeConfig: baseTheme,
              eyebrow: 'Artificial intelligence',
              title: 'Where the AI explains itself',
              body:
                  'This screen probably would not exist if I had not done the ethical review first. Once you have mapped out everywhere sensitive data could flow, it becomes obvious that the AI cannot just work quietly in the background and hope nobody asks. So there is a settings area that does nothing clever on its own. It tells you when AI has been used, it lets you review and approve any summary before it goes anywhere near a client record, and it shows you why a particular suggestion was made. None of that makes the tool smarter. It makes it legible, and for the people I spoke to that was the thing standing between being curious about it and actually trusting it.',
              image: _RealImageCard(
                imagePath: 'assets/images/counselling/Artificial Intelligence.jpg',
                caption: 'AI transparency settings — usage notifications, review-and-approve before anything reaches a client record, and visibility into why a suggestion was made',
                height: 480,
              ),
            ),

            // ── 12. KEY DECISIONS ─────────────────────────────────────────
            const ProjectDecisionLogBlock(
              themeConfig: baseTheme,
              title: 'Key design decisions',
              intro:
                  'Decisions shaped by the tension between capability and trust in a sensitive, high-stakes context.',
              decisions: [
                ProjectDecisionItem(
                  decision:
                      'AI features made opt-in on a per-client basis, not globally',
                  rationale:
                      'Practitioners had strong and varied views on AI in clinical contexts. A single on/off toggle felt too blunt; per-client control let each practitioner calibrate based on their own clinical judgement and the nature of each therapeutic relationship.',
                  outcome:
                      'Usability session participant responded positively to the granularity. The toggle became a visible signal of practitioner agency, not just a compliance checkbox.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision:
                      'Voice assistant outputs shown as editable checklists before execution',
                  rationale:
                      'Early thinking around voice-first interfaces assumed direct execution would feel faster. Research made clear that practitioners need to see and approve what the system intends to do before it acts \u2014 especially for anything client-facing.',
                  outcome:
                      'The checklist model removed the core fear of automated errors in clinical communication. Participants described it as the feature that made the voice assistant feel trustworthy rather than risky.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
                ProjectDecisionItem(
                  decision:
                      'Low-contact asynchronous co-design workshop format instead of synchronous sessions',
                  rationale:
                      'Mental health practitioners have almost no availability for time-intensive research participation. A one-week asynchronous format using Google Workspace tools they already knew lowered the barrier significantly.',
                  outcome:
                      'Higher participation rate than anticipated. Some delay and occasional confusion about instructions, suggesting that a short synchronous briefing call at the start would improve a future iteration.',
                  outcomeType: DecisionOutcomeType.neutral,
                ),
                ProjectDecisionItem(
                  decision:
                      'Focused on practitioner back-office tools, not patient-facing features',
                  rationale:
                      'Patient-facing mental health apps are a crowded and ethically complex space. Practitioner tools are underrepresented in both the market and in HCI research. The scope decision was both strategic and principled.',
                  outcome:
                      'Kept the research focused and gave the design a clearer value proposition. The practitioner-as-primary-user framing also produced sharper, more actionable findings than a broader scope would have allowed.',
                  outcomeType: DecisionOutcomeType.positive,
                ),
              ],
            ),

            // ── 13. ETHICAL REVIEW ────────────────────────────────────────
            const ProjectCalloutBlock(
              themeConfig: baseTheme,
              style: CalloutStyle.warning,
              label: 'RRI ethical review',
              icon: Icons.shield_outlined,
              body:
                  'Using RRI prompts and Moral IT cards, I mapped all stakeholders and systematically interrogated data flows, consent boundaries, and AI usage risks. Key outcomes: AI limited to non-diagnostic roles only (summarisation, scheduling prompts); per-client AI toggles required; on-device or privacy-preserving architectures favoured; explicit practitioner approval required before any client-facing action.',
            ),

            // ── 14. ACCESSIBILITY ─────────────────────────────────────────
            const ProjectAccessibilityAuditBlock(
              themeConfig: baseTheme,
              title: 'Accessibility and usability issues found',
              intro:
                  'Issues surfaced during heuristic evaluation (Nielsen\u2019s ten heuristics) and addressed before practitioner testing.',
              issues: [
                ProjectA11yIssue(
                  issue: 'Inconsistent spacing and visual hierarchy across screens',
                  description:
                      'Card padding, heading sizes, and label styles varied across the dashboard, making it harder to scan quickly \u2014 a significant issue for practitioners working under time pressure.',
                  severity: A11ySeverity.serious,
                  wcagCriterion: 'Nielsen H4: Consistency and Standards',
                  fix:
                      'Standardised spacing tokens and type scale applied across all screens in the second iteration.',
                ),
                ProjectA11yIssue(
                  issue: 'Unclear copy on AI-enabled actions',
                  description:
                      'Labels on AI-generated outputs did not make it obvious that the content was AI-produced, or that it required practitioner review before use.',
                  severity: A11ySeverity.serious,
                  wcagCriterion: 'Nielsen H1: Visibility of System Status',
                  fix:
                      'Explicit \u201cAI-generated \u2014 review before sending\u201d labels added to all AI outputs, with a distinct visual treatment separating them from practitioner-authored content.',
                ),
                ProjectA11yIssue(
                  issue: 'Weak visual affordance on interactive elements',
                  description:
                      'Several action buttons and session cards did not communicate their interactivity clearly, leading the usability participant to hesitate before interacting.',
                  severity: A11ySeverity.moderate,
                  wcagCriterion: 'Nielsen H7: Flexibility and Efficiency / 2.4.7 Focus Visible',
                  fix:
                      'Hover and focus states added. Primary actions given stronger visual weight with filled button styles.',
                ),
                ProjectA11yIssue(
                  issue: 'No system feedback after voice commands',
                  description:
                      'The initial voice assistant prototype gave no visible feedback that a command had been received or understood, leaving practitioners uncertain whether to repeat themselves.',
                  severity: A11ySeverity.moderate,
                  wcagCriterion: 'Nielsen H1: Visibility of System Status',
                  fix:
                      'A brief animated confirmation state added between command input and checklist generation, confirming the assistant had processed the instruction.',
                ),
              ],
            ),

            // ── 15. WHAT THE PRACTITIONER SAID ───────────────────────────
            const ProjectQuoteBlock(
              themeConfig: baseTheme,
              quote:
                  '\u201cThe dashboard would genuinely save me time before every session. If the AI summary is accurate and I can trust it, I would use it every day.\u201d',
              attribution:
                  'Private-practice therapist \u2014 think-aloud usability session',
            ),

            // ── 16. IMPACT AND METRICS ────────────────────────────────────
            const ProjectMetricsBandBlock(
              themeConfig: baseTheme,
              items: [
                ProjectMetricItem(
                  value: '7',
                  label: 'Practitioners interviewed across India and the UK',
                ),
                ProjectMetricItem(
                  value: '47',
                  label: 'Unique codes generated from thematic analysis',
                ),
                ProjectMetricItem(
                  value: '7',
                  label: 'Themes shaping the design direction',
                ),
                ProjectMetricItem(
                  value: '2',
                  label: 'Prototype iteration rounds before practitioner session',
                ),
              ],
            ),

            // ── 17. LEARNINGS ─────────────────────────────────────────────
            const ProjectLearningsBlock(
              themeConfig: baseTheme,
              title: 'What I took away',
              points: [
                'Low-contact co-design is a genuinely viable format for engaging time-poor professional groups \u2014 but it requires more scaffolding than in-person sessions. A short synchronous briefing call at the start would resolve most of the confusion participants experienced.',
                'Practitioner tools are underrepresented in HCI research relative to their importance. The administrative layer of professional practice is where significant burnout risk lives, and it\u2019s a compelling design space.',
                'AI features in sensitive contexts need to feel like controlled tools, not autonomous agents. The per-client toggle and checklist approval model were both responses to this \u2014 and both were validated by research participants.',
                'Reflexive thematic analysis forced me to examine what assumptions I brought to the coding process, not just what the data said. This made the findings more honest and the design rationale more defensible.',
                'The RRI review surfaced risks and trade-offs I would not have found through usability testing alone \u2014 particularly around data flows, consent, and AI scope. It should be a standard part of any health-adjacent design process.',
              ],
            ),

            // ── 18. LIMITATIONS ───────────────────────────────────────────
            const ProjectCalloutBlock(
              themeConfig: baseTheme,
              style: CalloutStyle.insight,
              label: 'Limitations and future work',
              icon: Icons.compass_calibration_outlined,
              body:
                  'The sample of seven practitioners provided rich qualitative insight but limits generalisability. The low-contact workshop introduced delays and occasional ambiguity. The current output is at the prototype and concept-validation stage; future work would involve building an MVP integrated with real Google or Microsoft APIs, trialling it in practice with a small cohort, and adding quantitative usability measurement alongside the qualitative methods.',
            ),

            const MoreProjectsBlock(
              themeConfig: baseTheme,
              title: 'More projects',
              projects: [
                RelatedProjectItem(
                  title: 'Perro Onboarding & Subscription',
                  blurb:
                      'A shorter, value-first onboarding and subscription redesign that reduced drop-offs and lifted conversion \u2014 implemented directly in Flutter.',
                  routeName: 'perro-onboarding',
                  category: 'UX / Flutter',
                ),
                RelatedProjectItem(
                  title: 'Pet Insurance Checkout Redesign',
                  blurb:
                      'Redesigning the Review Details stage of the Perfect Pet Insurance quote flow to reduce friction and support confident decision-making.',
                  routeName: 'perfect-pet-quote-flow',
                  category: 'UI/UX',
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
class _CounsellingHero extends StatelessWidget {
  const _CounsellingHero();

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
                  color: const Color(0xFF3DBFA8).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(AppRadii.sm),
                  border: Border.all(
                    color: const Color(0xFF3DBFA8).withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  'MSc Dissertation \u2014 Case study 03',
                  style: textTheme.labelSmall?.copyWith(
                    color: const Color(0xFF3DBFA8),
                    letterSpacing: 0.6,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 820),
                child: Text(
                  'Crafting Counselling Companions',
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
              Container(
                  width: 40,
                  height: 2,
                  color: const Color(0xFF3DBFA8)),
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
          child: _SummaryText(textTheme: textTheme),
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
        _SummaryText(textTheme: textTheme),
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
      'Mental health practitioners spend 15\u201320 minutes of every session on admin. This project asked what a tool built specifically for them could do about it.',
      style: textTheme.titleLarge?.copyWith(
        color: Colors.white,
        height: 1.45,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _SummaryText extends StatelessWidget {
  const _SummaryText({required this.textTheme});
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Text(
      'My MSc dissertation in Human\u2013Computer Interaction at Newcastle University combined semi-structured interviews with seven practitioners, a low-contact co-design workshop, iterative Figma prototyping, and an RRI ethical review \u2014 producing a validated concept for a practitioner-centred practice dashboard and voice assistant.',
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
                        colors: [Color(0xFF0D2520), Color(0xFF070E0C)],
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
                    colors: [Color(0x003DBFA8), Color(0x993DBFA8)],
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

// ── REAL IMAGE CARD ───────────────────────────────────────────────────────────
class _RealImageCard extends StatelessWidget {
  const _RealImageCard({
    required this.imagePath,
    required this.caption,
    this.height = 360,
  });

  final String imagePath;
  final String caption;
  final double height;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadii.xl),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: const Color(0xFF0C1614),
                child: Center(
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: Colors.white24,
                    size: 40,
                  ),
                ),
              ),
            ),
            // Bottom caption scrim
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.xxl,
                  AppSpacing.lg,
                  AppSpacing.md,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0x00000000), Color(0xCC000000)],
                  ),
                ),
                child: Text(
                  caption,
                  style: textTheme.bodySmall?.copyWith(
                    color: Colors.white70,
                    height: 1.5,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
