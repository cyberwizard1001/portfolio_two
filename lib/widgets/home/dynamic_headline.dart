import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_colors.dart';

class DynamicHeadline extends StatelessWidget {
  const DynamicHeadline({super.key});

  static const phrases = [
    'accessible mobile interfaces',
    'insight-led user experiences',
    'human-centred app flows',
    'inclusive design systems',
  ];

  double _reservedHeight(ResponsiveInfo info) {
    if (info.isMobile) return 84;
    if (info.isTablet) return 98;
    if (info.isSmallDesktop) return 112;
    return 124;
  }

  TextStyle? _styleFor(BuildContext context, ResponsiveInfo info) {
    final textTheme = Theme.of(context).textTheme;

    if (info.isMobile) {
      return textTheme.headlineLarge?.copyWith(
        fontSize: 36,
        height: 1.02,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.8,
        color: AppColors.accent,
      );
    }

    if (info.isTablet) {
      return textTheme.displayMedium?.copyWith(
        fontSize: 46,
        height: 1.0,
        fontWeight: FontWeight.w500,
        letterSpacing: -1.0,
        color: AppColors.accent,
      );
    }

    return textTheme.displayMedium?.copyWith(
      fontSize: info.isDesktop ? 58 : 52,
      height: 0.98,
      fontWeight: FontWeight.w500,
      letterSpacing: -1.2,
      color: AppColors.accent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, info) {
        final style = _styleFor(context, info);

        return SizedBox(
          width: double.infinity,
          height: _reservedHeight(info),
          child: Align(
            alignment: Alignment.topLeft,
            child: _DropFadeAnimatedText(
              textStyle: style,
            ),
          ),
        );
      },
    );
  }
}

class _DropFadeAnimatedText extends StatefulWidget {
  const _DropFadeAnimatedText({
    required this.textStyle,
  });

  final TextStyle? textStyle;

  @override
  State<_DropFadeAnimatedText> createState() => _DropFadeAnimatedTextState();
}

class _DropFadeAnimatedTextState extends State<_DropFadeAnimatedText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _translateY;
  late final Animation<double> _opacity;

  static const _dropDuration = Duration(milliseconds: 900);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: _dropDuration,
    );

    _translateY = Tween<double>(
      begin: -10,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutQuart,
      ),
    );

    _opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.12, 1.0, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant _DropFadeAnimatedText oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller
      ..reset()
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final texts = DynamicHeadline.phrases
        .map(
          (phrase) => FadeAnimatedText(
        phrase,
        duration: const Duration(milliseconds: 3600),
        fadeOutBegin: 0.82,
        fadeInEnd: 0.22,
        textStyle: widget.textStyle,
      ),
    )
        .toList();

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _translateY.value),
          child: Opacity(
            opacity: _opacity.value,
            child: child,
          ),
        );
      },
      child: DefaultTextStyle(
        style: widget.textStyle ?? const TextStyle(),
        child: AnimatedTextKit(
          animatedTexts: texts,
          repeatForever: true,
          pause: const Duration(milliseconds: 400),
          isRepeatingAnimation: true,
          displayFullTextOnTap: false,
          stopPauseOnTap: false,
        ),
      ),
    );
  }
}