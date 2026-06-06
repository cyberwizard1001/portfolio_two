# Portfolio — Acceptance Criteria

This document describes the expected behaviour of each page and widget in the Flutter web portfolio. Use this as the source of truth for what should be tested.

---

## Pages

### HomePage

The main portfolio page with scroll-based snap logic, nav theming, and keyboard navigation.

**Scroll snap:**
- Hero section occupies full viewport on load.
- Downward scroll past 80px (and within 50% of hero height) auto-snaps view to the projects section ("Selected work").
- Snap animation runs for 900ms with easeInOutQuart easing.
- Snap only fires once per scroll down; reset when user scrolls back up past 20px offset.
- While snap animation runs, scroll listeners do not re-trigger snap (prevent double-snap).

**Nav theming:**
- Nav bar is dark (`isDark: true`) when hero section is on-screen.
- Nav bar is light (`isDark: false`) when scrolled past hero (approx. 80px past hero bottom).
- Transition is smooth (no flicker).

**Terminal section trigger:**
- Terminal-style "About me" section does not animate on page load.
- Animation triggers once the top edge of the terminal section enters the viewport (within 85% of viewport height from top).
- Triggers only once per scroll; subsequent scrolls do not re-trigger.

**Keyboard navigation:**
- Arrow Up / Down / Left / Right: scroll by 120px per press.
- Space / PageDown: scroll by one full viewport.
- PageUp: scroll back one full viewport.
- Home key: animate to top of page (offset 0).
- End key: animate to bottom of page (maxScrollExtent).
- All scroll animations use easeInOutQuart easing, 900ms duration.

**TickerMode optimization:**
- Hero section animations (dot-grid canvas) are disabled once scrolled past, reducing CPU/GPU load.
- Hero reticle on-screen → tickers enabled; off-screen → tickers disabled.

### ContactPage

A standalone dark-themed contact page with link collection and QR code.

**Link rendering:**
- Four contact links present: Email, LinkedIn, Medium, CV PDF.
- Each link is clickable and navigates to the correct destination:
  - Email: `mailto:nirmalkarthikeyan1503@gmail.com`
  - LinkedIn: LinkedIn profile URL
  - Medium: Medium profile URL
  - CV: PDF download or external link
- All links have a hover shine effect (animated gradient overlay on mouse over).

**QR code:**
- QR code widget present on page.
- QR code encodes the email mailto link (`mailto:nirmalkarthikeyan1503@gmail.com`).
- QR code is scannable.

**Styling:**
- Dark background (likely `#0D0B18` or similar).
- Footer visible at bottom.

### ProjectPage (Dynamic catch-all)

Renders a project given a slug. Fallback for routes not explicitly defined.

**Behaviour:**
- Route matches `/work/:slug` (must be last GoRoute to avoid shadowing explicit routes).
- Unknown slugs (e.g., `/work/nonexistent`) render the page without crashing.
- Page structure is generic (may show a placeholder or a simple layout).
- No runtime errors or exceptions thrown.

### PerfectPetQuoteFlowPage

Dedicated project page for the Pet Insurance quote flow redesign.

**Behaviour:**
- Page loads without crashing.
- All content blocks render (intro, meta strip, findings, personas, decision log, etc.).
- `MoreProjectsBlock` present at bottom, linking to adjacent case studies.
- Images and content strings display correctly.
- Responsive: no text overflow, layout adjusts to viewport.

### PerroOnboardingPage

Dedicated project page for the Perro onboarding/subscription case study.

**Behaviour:**
- Page loads without crashing.
- All content blocks render.
- `MoreProjectsBlock` present at bottom.
- Images and content strings display correctly.
- Responsive layout.

### CraftingCounsellingCompanionsPage

Dedicated project page for the MSc HCI dissertation (Crafting Counselling Companions).

**Behaviour:**
- Page loads without crashing.
- All content blocks render.
- Images in `assets/images/counselling/` load and display correctly (workshop photos, prototypes, etc.).
- `MoreProjectsBlock` present at bottom.
- Responsive layout.

---

## Widgets — Home

### HeroSection

Full-viewport hero panel with animated headline and scroll affordance.

**Rendering:**
- Hero occupies full viewport (100vh height).
- Dark background colour (`#0D0B18`).
- Dot-grid canvas background visible (RepaintBoundary, static geometry).
- Responsive headline text visible (scales by breakpoint).
- "About me" inline link clickable and styled.
- Scroll button (pulsing down-arrow) visible at bottom.
- "Open for collaboration" animated badge visible (likely top-right or corner).

**Interaction:**
- Mouse over headline or "About me" link triggers custom cursor change.
- Downward scroll fires the `onScrollToWork` callback (triggers hero snap in HomePage).
- Scroll button can be clicked to trigger scroll-to-work.

**Animation:**
- TickerMode controls whether animations run (dot-grid, badge pulse, scroll button pulse).
- When hero is off-screen, all animations pause (CPU savings).

### HomeNavBar

Floating pill-shaped navigation bar.

**Rendering:**
- Overlaid as a floating pill widget.
- Positioned near top of viewport (likely fixed/floating).
- Contains nav links: Home, (removed: Contact), Documentation, More.
- CTA button labeled "Get in touch".

**Theming:**
- `isDark: true` → dark semi-transparent background, light text.
- `isDark: false` → light/opaque background, dark text.
- Transition is smooth (animated).

**Interaction:**
- "Get in touch" button navigates to `/contact` via `context.goNamed('contact')`.
- Nav links navigate to their respective routes.
- Mouse over nav items triggers custom cursor notifier.

**Hover effects:**
- Nav items may have hover states (colour shift, underline, etc.).
- CTA button has distinct hover state.

### ProjectStackSection

"Selected work" section showing three featured case studies.

**Rendering:**
- Section title "Selected work" visible.
- Three project cards rendered side-by-side (desktop) or stacked (mobile):
  1. Perfect Pet Insurance Quote Flow
  2. Perro Onboarding
  3. Crafting Counselling Companions
- Each card displays:
  - Project title
  - Brief description
  - Bespoke visual mockup (Flutter-drawn graphics per project)
  - Category/role label
  - A clickable details/explore panel or interaction area

**Interaction:**
- Tapping a card navigates to the correct route:
  - Pet Insurance → `context.goNamed('perfect-pet-quote-flow')`
  - Perro → `context.goNamed('perro-onboarding')`
  - Counselling → `context.goNamed('crafting-counselling-companions')`
- Hovering over a card triggers hover animations (lift, scale, shadow increase).

**Responsive:**
- Desktop (≥1024px): cards in a row, full detail visible.
- Tablet (768px–1023px): cards may wrap or adjust spacing.
- Mobile (<768px): cards stack vertically, full width.

### TerminalAboutSection

Terminal-style "About me" block with typing animation and action buttons.

**Rendering (when `startAnimation: false`):**
- Section renders but animation does not start.
- Typed text, terminal lines, and action buttons are not visible or are in initial state.

**Rendering (when `startAnimation: true`):**
- Terminal header renders.
- Text types character-by-character in monospace font (IBM Plex Mono).
- Typing sequence: shell prompt → command line → output text → blank line.
- Each line types with a small character-by-character delay (~50–100ms per char).
- Once typing completes, CV button and LinkedIn button fade in.

**Layout:**
- Desktop: ASCII art panel (left) + typing terminal (right), side-by-side.
- Mobile: stacked vertically (ASCII art above, terminal below).

**Buttons (visible after animation):**
- CV button: links to CV PDF.
- LinkedIn button: links to LinkedIn profile.
- Both buttons are clickable and navigate correctly.

**Animation performance:**
- Typing uses `Timer` chains to animate character-by-character.
- No frame drops or jank during typing.

### DynamicHeadline

Animated rotating headline text.

**Rendering:**
- Displays a single headline string at a time.
- Font and size match hero section styling (large, prominent).

**Animation:**
- Cycles through multiple headline strings (exact list TBD in code).
- Each cycle fades/slides the old headline out and the new one in.
- Animation is smooth (no abrupt text changes).

---

## Widgets — Project Blocks

All project block widgets should render without throwing exceptions. Each block accepts a `ProjectSectionTheme` object as the first argument (defining background, foreground, accent, border, and muted colours).

### ProjectIntroBlock

Hero opening section: eyebrow label + title + summary paragraph.

**Acceptance criteria:**
- Renders without error.
- Eyebrow label displays correctly.
- Title text is large and prominent.
- Summary paragraph text wraps and flows properly.
- Optional trailing label (e.g., "Scroll to explore") displays if provided.
- Theme colours applied correctly (background, foreground).

### ProjectMetaStripBlock

Horizontal strip of label/value metadata pairs.

**Acceptance criteria:**
- Renders without error.
- All metadata items display (e.g., Role, Timeline, Platform, Users).
- Desktop: items in a single horizontal row.
- Mobile: items stack vertically or wrap to fit width.
- Label and value text display correctly.
- Theme colours applied correctly.

### ProjectProblemKeyInfoBlock

Split layout: problem statement (left) + context + metadata (right).

**Acceptance criteria:**
- Renders without error.
- Problem title and body display on left.
- Context paragraph and info items display on right.
- Desktop: side-by-side layout.
- Mobile: stacked vertically.
- All text and metadata display correctly.
- Theme colours applied correctly.

### ProjectTextImageBlock

Two-column layout: text + image (or reversed).

**Acceptance criteria:**
- Renders without error.
- Eyebrow, title, and body text display.
- Image renders (no missing assets).
- Desktop: text and image side-by-side.
- Mobile: stacked vertically.
- `reverse: true` flips the order (image left, text right).
- Theme colours applied correctly.

### ProjectPersonaBlock

User persona card: name, role, quote, goals, frustrations.

**Acceptance criteria:**
- Renders without error.
- Eyebrow label, name, role, and quote display.
- Goals list displays (bullet or icon-prefixed).
- Frustrations list displays.
- Optional context string displays if provided (e.g., "Found via Google ad").
- Optional context tags (e.g., "Mobile user", "28–35") display as chips/tags.
- Card styling consistent with theme.

### ProjectFindingsGridBlock

Grid of research finding cards.

**Acceptance criteria:**
- Renders without error.
- Title displays.
- Grid of finding cards displays (auto-responsive columns: 1 on mobile, 2–3 on desktop).
- Each card shows title and body text.
- Theme colours applied correctly.

### ProjectHowMightWeBlock

Grid of HMW (How Might We) question cards.

**Acceptance criteria:**
- Renders without error.
- Title and optional intro text display.
- Grid of question cards displays (1 col mobile, 2–3 cols desktop).
- Each card shows the question and optional theme tag (e.g., "Clarity", "Engagement").
- Item count badge displays (e.g., "7 questions").
- Theme colours applied correctly.

### ProjectProcessStepsBlock

Numbered step list.

**Acceptance criteria:**
- Renders without error.
- Title displays.
- Steps display with sequential numbering (1, 2, 3, ...).
- Each step shows title and body text.
- Step numbers are distinct (bold, accent colour, large).
- Theme colours applied correctly.

### ProjectQuoteBlock

Pull quote with optional attribution.

**Acceptance criteria:**
- Renders without error.
- Quote text displays and is visually distinct (larger, italicized, or indented).
- Optional attribution line displays (e.g., "— Usability participant, session 3").
- Theme colours applied correctly.

### ProjectCalloutBlock

Highlighted annotation block with optional icon and label.

**Acceptance criteria:**
- Renders without error.
- Body text displays.
- Optional label renders uppercase.
- Optional icon (if provided) displays.
- Three style variants render correctly:
  - `CalloutStyle.insight`: accent-coloured left border.
  - `CalloutStyle.principle`: accent-tinted background.
  - `CalloutStyle.warning`: amber/warning-tinted background.
- Theme colours applied correctly.

### ProjectBeforeAfterBlock

Side-by-side before/after comparison.

**Acceptance criteria:**
- Renders without error.
- Before section (title + body) displays on left.
- After section (title + body) displays on right.
- Mobile: stacks vertically.
- Sections are visually distinct (different background or border treatment).
- Theme colours applied correctly.

### ProjectDecisionLogBlock

Structured table of design decisions.

**Acceptance criteria:**
- Renders without error.
- Title and optional intro text display.
- Desktop: table format with columns: Decision, Rationale, Outcome.
- Mobile: stacked cards (one decision per card).
- Each decision shows decision, rationale, and outcome text.
- Outcome type chips display with correct colours:
  - `DecisionOutcomeType.positive`: green.
  - `DecisionOutcomeType.neutral`: accent (orange).
  - `DecisionOutcomeType.tradeoff`: amber.
- Theme colours applied correctly.

### ProjectMetricsBandBlock

Horizontal band of large metric values + labels.

**Acceptance criteria:**
- Renders without error.
- Metric items (value + label) display in a horizontal band.
- Values are large and prominent (e.g., "94%", "2.3x").
- Labels are smaller and descriptive.
- Auto-responsive columns (1 col mobile, 2–4 cols desktop).
- Theme colours applied correctly.

### ProjectImageGalleryBlock

Responsive image grid.

**Acceptance criteria:**
- Renders without error.
- Title displays.
- Images display in a responsive grid (1 col mobile, 2 cols desktop).
- All images load without "missing asset" errors.
- No text overflow or layout issues.
- Theme colours applied correctly.

### ProjectAccessibilityAuditBlock

Accessibility findings list with severity badges.

**Acceptance criteria:**
- Renders without error.
- Title and optional intro text display.
- Each issue displays with:
  - Issue title
  - Description text
  - Severity chip (colour: critical=red, serious=amber, moderate=blue, minor=grey)
  - Optional WCAG criterion reference
  - Optional fix text
- Summary bar at top shows count breakdown by severity.
- Issues are grouped by severity (critical first, then serious, moderate, minor).
- Theme colours applied correctly.

### ProjectLearningsBlock

Bulleted list of reflections.

**Acceptance criteria:**
- Renders without error.
- Title displays.
- Points display as a bulleted list (bullet or icon-prefixed).
- All text wraps and displays correctly.
- Theme colours applied correctly.

### MoreProjectsBlock

"See also" section linking to adjacent case studies.

**Acceptance criteria:**
- Renders without error.
- Title displays (e.g., "More work").
- Related project cards display (typically 2–3 adjacent projects).
- Each card shows:
  - Project title
  - Brief description ("blurb")
  - Category label
  - Clickable / tappable area
- Tapping a card navigates to the correct route (`context.goNamed(routeName)`).
- Theme colours applied correctly.

---

## Routing

### Named Route Resolution

All named routes defined in `AppRouter` should resolve without throwing errors or displaying 404 pages.

**Routes to test:**
- `/` → `home` → `HomePage`
- `/contact` → `contact` → `ContactPage`
- `/documentation` → `documentation` → `SiteDocumentationPage`
- `/work/layout-demo` → `project-layout-demo` → `ProjectLayoutDemoPage`
- `/work/perfect-pet-insurance-quote-flow` → `perfect-pet-quote-flow` → `PerfectPetQuoteFlowPage`
- `/work/perro-onboarding-subscription` → `perro-onboarding` → `PerroOnboardingPage`
- `/work/crafting-counselling-companions` → `crafting-counselling-companions` → `CraftingCounsellingCompanionsPage`

**Named route navigation:**
- `context.goNamed('home')` navigates to home.
- `context.goNamed('contact')` navigates to contact page.
- All other named routes navigate to their correct pages.

### Dynamic Route (Catch-all)

The catch-all route `/work/:slug` should handle unknown slugs gracefully.

**Behaviour:**
- `/work/unknown-project` renders without crashing.
- No error page or exception displayed.
- Page renders with generic/fallback content.

---

## Responsive Behaviour

All major sections should render correctly at common breakpoints without overflow, text cutoff, or layout issues.

### Breakpoints

Per `AppBreakpoints`:
- **Mobile**: 0–767px (e.g., iPhone 375px)
- **Tablet**: 768–1023px (e.g., iPad 768px)
- **Small Desktop**: 1024–1279px
- **Desktop**: 1280px+ (e.g., 1440px)

### Sections to test

1. **Hero section**
   - Mobile (375px): headline scales down, scroll button visible, badge positioned correctly.
   - Desktop (1440px): large headline, button prominent.
   - No horizontal overflow.

2. **Nav bar**
   - Mobile: nav items may condense or stack into a menu.
   - Desktop: all nav items visible in a row.
   - No text cutoff or overflow.

3. **Project cards**
   - Mobile: cards stack vertically, full width minus padding.
   - Tablet: cards may be 2 per row or stacked.
   - Desktop: cards in a row (3 visible or with horizontal scroll).

4. **Terminal section**
   - Mobile: ASCII art stacks above typed terminal.
   - Desktop: side-by-side layout, ASCII art left, terminal right.
   - No text overflow in either layout.

5. **Footer**
   - Mobile: footer is compact, links stack or wrap.
   - Desktop: footer is a full-width bar with all links visible.

---

## Summary

This document serves as the source of truth for testing. Each acceptance criterion should be verifiable via:
- Widget tests (e.g., `testWidgets`)
- Manual testing in `fvm flutter run -d chrome` at different viewport sizes
- Code review (check that widgets accept and apply the stated parameters)

When implementing tests, refer back to this document to ensure coverage of all stated behaviours.
