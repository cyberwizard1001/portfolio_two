import 'dart:ui';

import 'package:flutter/material.dart';

import '../router/app_router.dart';
import '../theme/app_theme.dart';

class PortfolioScrollBehavior extends MaterialScrollBehavior {
  const PortfolioScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
    PointerDeviceKind.stylus,
    PointerDeviceKind.unknown,
  };

  @override
  Widget buildScrollbar(
      BuildContext context,
      Widget child,
      ScrollableDetails details,
      ) {
    return RawScrollbar(
      controller: details.controller,
      thumbVisibility: false,
      thickness: 6,
      radius: const Radius.circular(999),
      child: child,
    );
  }
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Nirmal Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: AppRouter.router,
      scrollBehavior: const PortfolioScrollBehavior(),
    );
  }
}