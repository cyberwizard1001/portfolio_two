import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../responsive/responsive_builder.dart';

class CursorOverlay extends StatefulWidget {
  const CursorOverlay({
    super.key,
    required this.child,
    required this.hoveringNotifier,
  });

  final Widget child;
  final ValueNotifier<bool> hoveringNotifier;

  @override
  State<CursorOverlay> createState() => _CursorOverlayState();
}

class _CursorOverlayState extends State<CursorOverlay>
    with SingleTickerProviderStateMixin {
  Offset _mousePos = Offset.zero;
  Offset _ringPos = Offset.zero;
  double _ringRadius = _kNormalRadius;
  bool _visible = false;

  late final Ticker _ticker;

  static const double _kNormalRadius = 22.0;
  static const double _kHoverRadius = 52.0;
  static const double _kDotRadius = 5.0;
  static const double _kLerpPos = 0.12;
  static const double _kLerpRadius = 0.15;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTick)..start();
  }

  void _onTick(Duration _) {
    final targetRadius =
        widget.hoveringNotifier.value ? _kHoverRadius : _kNormalRadius;
    final newRingPos = Offset.lerp(_ringPos, _mousePos, _kLerpPos)!;
    final newRadius = lerpDouble(_ringRadius, targetRadius, _kLerpRadius)!;

    final posChanged =
        (newRingPos - _ringPos).distanceSquared > 0.001;
    final radiusChanged = (newRadius - _ringRadius).abs() > 0.01;

    if (posChanged || radiusChanged) {
      setState(() {
        _ringPos = newRingPos;
        _ringRadius = newRadius;
      });
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, info) {
        if (info.isMobile) return widget.child;

        return MouseRegion(
          cursor: SystemMouseCursors.none,
          onEnter: (_) => setState(() => _visible = true),
          onExit: (_) => setState(() => _visible = false),
          child: Listener(
            behavior: HitTestBehavior.translucent,
            onPointerHover: (event) {
              setState(() {
                _mousePos = event.localPosition;
                _visible = true;
              });
            },
            child: Stack(
              children: [
                widget.child,
                if (_visible)
                  Positioned.fill(
                    child: IgnorePointer(
                      child: CustomPaint(
                        painter: _CursorPainter(
                          mousePos: _mousePos,
                          ringPos: _ringPos,
                          ringRadius: _ringRadius,
                          dotRadius: _kDotRadius,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CursorPainter extends CustomPainter {
  const _CursorPainter({
    required this.mousePos,
    required this.ringPos,
    required this.ringRadius,
    required this.dotRadius,
  });

  final Offset mousePos;
  final Offset ringPos;
  final double ringRadius;
  final double dotRadius;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.saveLayer(
      Offset.zero & size,
      Paint()..blendMode = BlendMode.difference,
    );

    canvas.drawCircle(mousePos, dotRadius, Paint()..color = Colors.white);

    canvas.drawCircle(
      ringPos,
      ringRadius,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(_CursorPainter old) =>
      old.mousePos != mousePos ||
      old.ringPos != ringPos ||
      old.ringRadius != ringRadius;
}
