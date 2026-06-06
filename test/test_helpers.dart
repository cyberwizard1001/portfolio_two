import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_2/app/portfolio_app.dart';

/// Pump the full app (MaterialApp + router) for testing navigation.
Future<void> pumpApp(WidgetTester tester) async {
  await tester.pumpWidget(const PortfolioApp());
}

/// Pump a widget wrapped in a SingleChildScrollView + Material scaffold.
/// Use this for isolated widget tests that need space to render.
Future<void> pumpWidget(WidgetTester tester, Widget widget) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: widget,
        ),
      ),
    ),
  );
}

/// Pump with a specific surface size (for responsive testing).
Future<void> pumpWidgetWithSize(
  WidgetTester tester,
  Widget widget, {
  required Size size,
}) async {
  addTearDown(() {
    tester.binding.window.clearPhysicalSizeTestValue();
  });

  tester.binding.window.physicalSizeTestValue = size;

  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: widget,
        ),
      ),
    ),
  );
}

/// Common mobile breakpoint (375px).
const Size mobileSurface = Size(375, 812);

/// Common tablet breakpoint (768px).
const Size tabletSurface = Size(768, 1024);

/// Common desktop breakpoint (1440px).
const Size desktopSurface = Size(1440, 900);
