import 'package:go_router/go_router.dart';
import 'package:portfolio_2/pages/project/perfect_pet_quote_flow_page.dart';
import 'package:portfolio_2/pages/project/perro_onboarding_page.dart';

import '../pages/contact/contact_page.dart';
import '../pages/home/home_page.dart';
import '../pages/project/project_layout_demo_page.dart';
import '../pages/project/project_page.dart';
import '../pages/site/site_documentation_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/contact',
        name: 'contact',
        builder: (context, state) => const ContactPage(),
      ),
      GoRoute(
        path: '/documentation',
        name: 'documentation',
        builder: (context, state) => const SiteDocumentationPage(),
      ),

      // Specific named project routes
      GoRoute(
        path: '/work/layout-demo',
        name: 'project-layout-demo',
        builder: (context, state) => const ProjectLayoutDemoPage(),
      ),
      GoRoute(
        path: '/work/perfect-pet-insurance-quote-flow',
        name: 'perfect-pet-quote-flow',
        builder: (context, state) => const PerfectPetQuoteFlowPage(),
      ),
      GoRoute(
        path: '/work/perro-onboarding-subscription',
        name: 'perro-onboarding',
        builder: (context, state) => const PerroOnboardingPage(),
      ),

      // Dynamic catch-all route — must be last
      GoRoute(
        path: '/work/:slug',
        name: 'project',
        builder: (context, state) {
          final slug = state.pathParameters['slug'] ?? '';
          return ProjectPage(slug: slug);
        },
      ),
    ],
  );
}
