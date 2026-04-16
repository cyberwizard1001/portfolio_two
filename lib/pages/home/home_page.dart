import 'package:flutter/material.dart';
import 'package:portfolio_2/widgets/site/site_footer.dart';
import '../../widgets/common/app_shell.dart';
import '../../widgets/home/hero_section.dart';
import '../../widgets/home/home_nav_bar.dart';
import '../../widgets/home/project_stack_section.dart';
import '../../widgets/home/terminal_about_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _workKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _footerKey = GlobalKey();

  Future<void> _scrollTo(GlobalKey key) async {
    final context = key.currentContext;
    if (context == null) return;

    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 750),
      curve: Curves.easeInOutCubic,
      alignment: 0.02,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _heroKey,
                  child: const HeroSection(),
                ),
              ),
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _workKey,
                  child: const ProjectStackSection(),
                ),
              ),
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _aboutKey,
                  child: const TerminalAboutSection(),
                ),
              ),
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _footerKey,
                  child: const SiteFooter(),
                ),
              ),
            ],
          ),
          HomeNavBar(
            onHeroTap: () => _scrollTo(_heroKey),
            onWorkTap: () => _scrollTo(_workKey),
            onAboutTap: () => _scrollTo(_aboutKey),
            onContactTap: () => _scrollTo(_footerKey),
          ),
        ],
      ),
    );
  }
}