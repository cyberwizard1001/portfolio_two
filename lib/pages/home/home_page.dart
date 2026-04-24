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

  bool _heroSnapped = false;

  /// True while the scroll position is still inside the hero section,
  /// so the nav bar uses its dark/glass style.
  bool _navIsDark = true;

  Future<void> _scrollTo(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx == null) return;

    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 750),
      curve: Curves.easeInOutCubic,
      alignment: 0.02,
    );
  }

  double get _heroHeight {
    final ctx = _heroKey.currentContext;
    if (ctx == null) return 0;
    final box = ctx.findRenderObject() as RenderBox?;
    return box?.size.height ?? 0;
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    final heroH = _heroHeight;

    // Switch nav theme: dark while within hero, light once past it
    final shouldBeDark = heroH == 0 || offset < heroH - 80;
    if (shouldBeDark != _navIsDark) {
      setState(() => _navIsDark = shouldBeDark);
    }

    // Reset snap flag when back at top
    if (offset < 20) _heroSnapped = false;
  }

  void _onScrollNotification(ScrollNotification notification) {
    if (_heroSnapped) return;
    if (notification is! ScrollUpdateNotification) return;
    if (notification.scrollDelta == null || notification.scrollDelta! <= 0) return;

    final offset = _scrollController.offset;
    if (offset < _heroHeight * 0.5) {
      _heroSnapped = true;
      _scrollTo(_workKey);
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              _onScrollNotification(notification);
              return false;
            },
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: KeyedSubtree(
                    key: _heroKey,
                    child: HeroSection(
                      onScrollToWork: () => _scrollTo(_workKey),
                      onScrollToAbout: () => _scrollTo(_aboutKey),
                    ),
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
          ),
          HomeNavBar(
            isDark: _navIsDark,
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
