import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScrollablePageShell extends StatefulWidget {
  const ScrollablePageShell({super.key, required this.child});

  final Widget child;

  @override
  State<ScrollablePageShell> createState() => _ScrollablePageShellState();
}

class _ScrollablePageShellState extends State<ScrollablePageShell> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    if (!_scrollController.hasClients) return KeyEventResult.ignored;

    final key = event.logicalKey;
    const double step = 120.0;
    final double page = _scrollController.position.viewportDimension;

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
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      onKeyEvent: _handleKeyEvent,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: widget.child,
      ),
    );
  }
}
