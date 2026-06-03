import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_2/widgets/site/site_footer.dart';
import '../../widgets/common/app_shell.dart';
import '../../widgets/home/custom_cursor.dart';
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
  final ValueNotifier<bool> _cursorHovering = ValueNotifier(false);

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _workKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _footerKey = GlobalKey();

  bool _heroSnapped = false;
  bool _isProgrammaticScroll = false;
  double _cachedHeroHeight = 0;

  /// True while the scroll position is still inside the hero section,
  /// so the nav bar uses its dark/glass style.
  bool _navIsDark = true;

  Future<void> _scrollTo(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx == null) return;

    _isProgrammaticScroll = true;
    try {
      await Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOutQuart,
        alignment: 0.02,
      );
    } finally {
      _isProgrammaticScroll = false;
    }
  }

  void _cacheHeroHeight() {
    final ctx = _heroKey.currentContext;
    if (ctx == null) return;
    final box = ctx.findRenderObject() as RenderBox?;
    _cachedHeroHeight = box?.size.height ?? 0;
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    final heroH = _cachedHeroHeight;

    // Switch nav theme: dark while within hero, light once past it
    final shouldBeDark = heroH == 0 || offset < heroH - 80;
    if (shouldBeDark != _navIsDark) {
      setState(() => _navIsDark = shouldBeDark);
    }

    // Reset snap flag when back at top
    if (offset < 20) _heroSnapped = false;
  }

  void _onScrollNotification(ScrollNotification notification) {
    if (_heroSnapped || _isProgrammaticScroll) return;
    if (notification is! ScrollUpdateNotification) return;
    if (notification.scrollDelta == null || notification.scrollDelta! <= 0) return;

    final offset = _scrollController.offset;
    if (offset >= 80 && offset < _cachedHeroHeight * 0.5) {
      _heroSnapped = true;
      _scrollTo(_workKey);
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) => _cacheHeroHeight());
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _cursorHovering.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: CursorOverlay(
        hoveringNotifier: _cursorHovering,
        child: Stack(
          children: [
            Focus(
              autofocus: true,
              onKeyEvent: (node, event) {
                if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
                  return KeyEventResult.ignored;
                }
                if (!_scrollController.hasClients) return KeyEventResult.ignored;
                final key = event.logicalKey;
                const double step = 120.0;
                final double page =
                    _scrollController.position.viewportDimension;

                if (key == LogicalKeyboardKey.arrowDown ||
                    key == LogicalKeyboardKey.arrowRight) {
                  _scrollController.animateTo(
                    _scrollController.offset + step,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                  );
                  return KeyEventResult.handled;
                }
                if (key == LogicalKeyboardKey.arrowUp ||
                    key == LogicalKeyboardKey.arrowLeft) {
                  _scrollController.animateTo(
                    _scrollController.offset - step,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                  );
                  return KeyEventResult.handled;
                }
                if (key == LogicalKeyboardKey.space ||
                    key == LogicalKeyboardKey.pageDown) {
                  _scrollController.animateTo(
                    _scrollController.offset + page,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOutCubic,
                  );
                  return KeyEventResult.handled;
                }
                if (key == LogicalKeyboardKey.pageUp) {
                  _scrollController.animateTo(
                    _scrollController.offset - page,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOutCubic,
                  );
                  return KeyEventResult.handled;
                }
                if (key == LogicalKeyboardKey.home) {
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOutCubic,
                  );
                  return KeyEventResult.handled;
                }
                if (key == LogicalKeyboardKey.end) {
                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOutCubic,
                  );
                  return KeyEventResult.handled;
                }
                return KeyEventResult.ignored;
              },
              child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                _onScrollNotification(notification);
                return false;
              },
              child: CustomScrollView(
                controller: _scrollController,
                physics: const ClampingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: KeyedSubtree(
                      key: _heroKey,
                      child: TickerMode(
                        enabled: _navIsDark,
                        child: HeroSection(
                          onScrollToWork: () => _scrollTo(_workKey),
                          onScrollToAbout: () => _scrollTo(_aboutKey),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: KeyedSubtree(
                      key: _workKey,
                      child: ProjectStackSection(
                        cursorNotifier: _cursorHovering,
                      ),
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
            ),
            HomeNavBar(
              isDark: _navIsDark,
              cursorNotifier: _cursorHovering,
              onHeroTap: () => _scrollTo(_heroKey),
              onWorkTap: () => _scrollTo(_workKey),
              onAboutTap: () => _scrollTo(_aboutKey),
              onContactTap: () => _scrollTo(_footerKey),
            ),
          ],
        ),
      ),
    );
  }
}
