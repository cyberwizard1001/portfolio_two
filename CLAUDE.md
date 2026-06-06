# portfolio_two — CLAUDE.md

Flutter web portfolio. Static site. No backend, no forms. Deployed as a Flutter web app.

---

## Stack

- **Flutter** (web target) — widget-based architecture
- **go_router ^17** — URL routing
- **google_fonts** — Nobile, Fustat, IBM Plex Mono
- **flutter_layout_grid** — grid layouts
- **animated_text_kit** — hero typewriter animation
- **qr_flutter** — QR code on contact page
- **url_launcher** — outbound links (email, LinkedIn, CV)

Run: `fvm flutter run -d chrome`
Build: `fvm flutter build web`

---

## Directory layout

```
lib/
  main.dart                        entry point
  app/portfolio_app.dart           MaterialApp + theme wiring
  router/app_router.dart           all GoRouter routes
  theme/
    app_colors.dart                color tokens
    app_spacing.dart               spacing scale
    app_radii.dart                 border-radius scale
    app_text_styles.dart           TextTheme definitions
    app_theme.dart                 ThemeData assembly
  responsive/
    app_breakpoints.dart           breakpoint constants
    responsive_builder.dart        LayoutBuilder wrapper → ResponsiveInfo
  pages/
    home/home_page.dart            homepage (scroll + snap logic)
    contact/contact_page.dart      static contact page
    site/site_documentation_page.dart   /documentation
    project/
      project_page.dart            catch-all slug-based page
      project_layout_demo_page.dart    /work/layout-demo
      perfect_pet_quote_flow_page.dart /work/perfect-pet-insurance-quote-flow
      perro_onboarding_page.dart       /work/perro-onboarding-subscription
      crafting_counselling_companions_page.dart  /work/crafting-counselling-companions
      project_demo_block_label.dart    dev-only label helper
  widgets/
    common/
      app_shell.dart               top-level scaffold wrapper
      responsive_section.dart      centered max-width container
    home/
      hero_section.dart            full-viewport hero panel
      home_nav_bar.dart            sticky nav, dark↔light on scroll
      dynamic_headline.dart        typewriter animated headline
      project_stack_section.dart   "selected work" cards
      terminal_about_section.dart  terminal-style about block
    project/                       ← reusable case-study blocks (see below)
    site/
      site_footer.dart             global footer with QR + links
assets/
  images/                          general images
  images/counselling/              Crafting Counselling Companions photos
```

---

## Routes

| Path | Name | Page |
|---|---|---|
| `/` | `home` | HomePage |
| `/contact` | `contact` | ContactPage |
| `/documentation` | `documentation` | SiteDocumentationPage |
| `/work/layout-demo` | `project-layout-demo` | ProjectLayoutDemoPage |
| `/work/perfect-pet-insurance-quote-flow` | `perfect-pet-quote-flow` | PerfectPetQuoteFlowPage |
| `/work/perro-onboarding-subscription` | `perro-onboarding` | PerroOnboardingPage |
| `/work/crafting-counselling-companions` | `crafting-counselling-companions` | CraftingCounsellingCompanionsPage |
| `/work/:slug` | `project` | ProjectPage (catch-all, must be last) |

Navigate with `context.goNamed('route-name')`.

---

## Theme tokens

**AppColors** (`lib/theme/app_colors.dart`)
| Token | Hex | Use |
|---|---|---|
| `background` | `#F7F7F3` | page bg |
| `surface` | `#FFFFFF` | card bg |
| `surfaceAlt` | `#F1F1EC` | alternate surface |
| `ink` | `#090909` | primary text / dark bg |
| `inkMuted` | `#5A5A55` | secondary text |
| `border` | `#1A090909` | dividers |
| `accent` | `#FB6000` | orange — hover, highlights |
| `accentSoft` | `#FFEFE4` | accent tint |
| `success` | `#1E9E61` | positive outcomes |

**AppSpacing** — `xxs:4 xs:8 sm:12 md:16 lg:24 xl:32 xxl:48 xxxl:64 section:96`

**AppRadii** — `sm:8 md:14 lg:20 xl:28 pill:999`

**Typography** (google_fonts)
| Role | Font | Size |
|---|---|---|
| displayLarge | Nobile 500 | 86px |
| displayMedium | Nobile 500 | 64px |
| headlineLarge | Fustat 500 | 40px |
| headlineMedium | Fustat 500 | 28px |
| titleLarge | IBM Plex Mono 500 | 18px |
| bodyLarge | Fustat 400 | 18px |
| bodyMedium | Fustat 400 | 16px |
| bodySmall | IBM Plex Mono 400 | 13px |
| labelLarge | IBM Plex Mono 500 | 14px |

---

## Responsive system

**AppBreakpoints**: mobile `0`, tablet `768`, smallDesktop `1024`, desktop `1280`

**ResponsiveBuilder** — wraps `LayoutBuilder`, passes `ResponsiveInfo` with `.isMobile`, `.isTablet`, `.isSmallDesktop`, `.isDesktop` flags.

**ResponsiveSection** — centered `ConstrainedBox(maxWidth:1320)` with responsive horizontal padding (`md` → `xxxl`). Use this as the outer wrapper for any page content.

---

## Project page system

Each case study is a standalone `StatelessWidget` page composed from blocks in `lib/widgets/project/`. All blocks take a `ProjectSectionTheme` as first arg — swap themes between sections for visual variety.

### ProjectSectionTheme

```dart
ProjectSectionTheme(
  backgroundColor: Color,   // required
  foregroundColor: Color,   // required
  accentColor: Color,       // default: #FB6000
  borderColor: Color,       // default: rgba(0,0,0,0.10)
  mutedColor: Color?,       // defaults to foreground @ 72% opacity
)
```

Per-project palettes are defined as `const` locals at the top of each page file.

---

## Content widgets (lib/widgets/project/)

### ProjectIntroBlock
Hero opening section. Eyebrow label + large title + summary paragraph. Optional trailing label.
```dart
ProjectIntroBlock(
  themeConfig: theme,
  eyebrow: 'UX Design · 2024',
  title: 'Project title',
  summary: 'One paragraph overview…',
  trailingLabel: 'Scroll to explore',  // optional
)
```

### ProjectMetaStripBlock
Horizontal strip of label/value pairs (role, timeline, platform, etc). Responsive: stacks on mobile.
```dart
ProjectMetaStripBlock(
  themeConfig: theme,
  items: [
    ProjectMetaItem(label: 'Role', value: 'Lead designer'),
    ProjectMetaItem(label: 'Timeline', value: '3 months'),
  ],
)
```

### ProjectProblemKeyInfoBlock
Split layout: problem statement on left, context paragraph + metadata items on right.
```dart
ProjectProblemKeyInfoBlock(
  themeConfig: theme,
  problemTitle: 'The problem',
  problemBody: 'Description…',
  contextBody: 'Additional context…',
  infoItems: [ ProjectMetaItem(label: 'Users', value: '40k+') ],
)
```

### ProjectTextImageBlock
Two-column text + image. Toggle `reverse: true` to flip order.
```dart
ProjectTextImageBlock(
  themeConfig: theme,
  eyebrow: 'Research',
  title: 'Section heading',
  body: 'Body text…',
  image: Image.asset('assets/images/foo.png'),
  reverse: false,  // optional
)
```

### ProjectPersonaBlock
User persona card with name, role, quote, goals list, frustrations list. Optional context string and tags.
```dart
ProjectPersonaBlock(
  themeConfig: theme,
  eyebrow: 'Primary persona',
  name: 'Sarah',
  role: 'First-time pet owner',
  quote: '"I just want this to be simple."',
  goals: ['Protect her dog', 'Understand what's covered'],
  frustrations: ['Insurance jargon', 'Hidden fees'],
  context: 'Found via Google ad',       // optional
  contextTags: ['Mobile user', '28–35'], // optional
)
```

### ProjectFindingsGridBlock
Grid of research finding cards. Each card has title + body. Auto-responsive columns.
```dart
ProjectFindingsGridBlock(
  themeConfig: theme,
  title: 'Key findings',
  items: [
    ProjectFindingItem(title: 'Finding 1', body: 'Detail…'),
  ],
)
```

### ProjectHowMightWeBlock
Grid of HMW question cards with optional theme tags. Shows item count badge. 1/2/3 columns by breakpoint.
```dart
ProjectHowMightWeBlock(
  themeConfig: theme,
  title: 'How might we…',      // optional, has default
  intro: 'Framing questions…', // optional
  items: [
    ProjectHmwItem(question: 'HMW reduce cognitive load?', theme: 'Clarity'),
  ],
)
```

### ProjectProcessStepsBlock
Numbered step list with title + body per step.
```dart
ProjectProcessStepsBlock(
  themeConfig: theme,
  title: 'Our process',
  steps: [
    ProjectProcessStep(title: 'Discover', body: 'What we did…'),
  ],
)
```

### ProjectQuoteBlock
Pull quote with optional attribution.
```dart
ProjectQuoteBlock(
  themeConfig: theme,
  quote: '"The experience felt invisible."',
  attribution: '— Usability participant, session 3', // optional
)
```

### ProjectCalloutBlock
Highlighted annotation block. Three styles:
- `CalloutStyle.insight` — accent-bordered left strip
- `CalloutStyle.principle` — accent-tinted background
- `CalloutStyle.warning` — amber warning tint

```dart
ProjectCalloutBlock(
  themeConfig: theme,
  body: 'Key insight text here.',
  label: 'Design principle',  // optional, renders uppercase
  icon: Icons.lightbulb_outline, // optional
  style: CalloutStyle.insight,   // optional, default: insight
)
```

### ProjectBeforeAfterBlock
Side-by-side before/after comparison panels.
```dart
ProjectBeforeAfterBlock(
  themeConfig: theme,
  beforeTitle: 'Before',
  beforeBody: 'Old flow description…',
  afterTitle: 'After',
  afterBody: 'New flow description…',
)
```

### ProjectDecisionLogBlock
Structured table of design decisions. Desktop: table view. Mobile: stacked cards. Outcome chip colors: positive=green, neutral=accent, tradeoff=amber.
```dart
ProjectDecisionLogBlock(
  themeConfig: theme,
  title: 'Decision log',  // optional, has default
  intro: 'Rationale…',   // optional
  decisions: [
    ProjectDecisionItem(
      decision: 'Use progressive disclosure',
      rationale: 'Reduces initial cognitive load',
      outcome: 'Dropped error rate by 18%',
      outcomeType: DecisionOutcomeType.positive, // optional, default: neutral
    ),
  ],
)
```
`DecisionOutcomeType` values: `positive`, `neutral`, `tradeoff`

### ProjectMetricsBandBlock
Horizontal band of large metric value + label pairs. Auto-responsive columns.
```dart
ProjectMetricsBandBlock(
  themeConfig: theme,
  items: [
    ProjectMetricItem(value: '94%', label: 'Task completion'),
    ProjectMetricItem(value: '2.3x', label: 'Faster to quote'),
  ],
)
```

### ProjectImageGalleryBlock
Responsive image grid (1 col mobile, 2 col desktop).
```dart
ProjectImageGalleryBlock(
  themeConfig: theme,
  title: 'Workshop artifacts',
  images: [
    Image.asset('assets/images/counselling/workshop_drive.jpg'),
  ],
)
```

### ProjectAccessibilityAuditBlock
Accessibility findings list with severity chips and WCAG criterion references. Auto-groups issues by severity for summary bar.
```dart
ProjectAccessibilityAuditBlock(
  themeConfig: theme,
  title: 'Accessibility audit',  // optional, has default
  intro: 'Audit scope…',         // optional
  issues: [
    ProjectA11yIssue(
      issue: 'Insufficient colour contrast',
      description: 'Body text fails WCAG AA at 2.8:1.',
      severity: A11ySeverity.serious,
      wcagCriterion: 'WCAG 1.4.3 Contrast (Minimum)',  // optional
      fix: 'Darken text to #595959 for 4.6:1 ratio.',  // optional
    ),
  ],
)
```
`A11ySeverity` values: `critical` (red), `serious` (amber), `moderate` (blue), `minor` (grey)

### ProjectLearningsBlock
Bulleted list of reflections / retrospective points.
```dart
ProjectLearningsBlock(
  themeConfig: theme,
  title: 'What I learned',
  points: [
    'Co-design surfaces constraints earlier.',
    'Prototype fidelity should match research goals.',
  ],
)
```

### MoreProjectsBlock
"See also" section with cards linking to other case studies.
```dart
MoreProjectsBlock(
  themeConfig: theme,
  title: 'More work',
  projects: [
    RelatedProjectItem(
      title: 'Perro onboarding',
      blurb: 'Short description.',
      routeName: 'perro-onboarding',
      category: 'UX Design',
    ),
  ],
)
```

---

## Adding a new case study

1. Create `lib/pages/project/my_project_page.dart` — compose blocks in a `SingleChildScrollView > Column`.
2. Import page in `lib/router/app_router.dart`, add a `GoRoute` before the catch-all `/work/:slug`.
3. Add assets to `assets/images/my_project/` and declare the folder in `pubspec.yaml` under `flutter.assets`.
4. Add a card to `ProjectStackSection` on the homepage.
5. Add a `RelatedProjectItem` in `MoreProjectsBlock` on adjacent case studies.

---

## Documentation page (/documentation)

`SiteDocumentationPage` is a living reference rendered at `/documentation`. It covers: framework, routing, styling, homepage structure, project system, contact page, interaction details, and extension guidance. Update it when architecture changes significantly.
