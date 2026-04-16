import 'package:flutter/widgets.dart';

import 'app_breakpoints.dart';

enum DeviceType { mobile, tablet, smallDesktop, desktop }

class ResponsiveInfo {
  const ResponsiveInfo({required this.width, required this.deviceType});

  final double width;
  final DeviceType deviceType;

  bool get isMobile => deviceType == DeviceType.mobile;
  bool get isTablet => deviceType == DeviceType.tablet;
  bool get isSmallDesktop => deviceType == DeviceType.smallDesktop;
  bool get isDesktop => deviceType == DeviceType.desktop;
}

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({super.key, required this.builder});

  final Widget Function(BuildContext context, ResponsiveInfo info) builder;

  static DeviceType getDeviceType(double width) {
    if (width >= AppBreakpoints.desktop) return DeviceType.desktop;
    if (width >= AppBreakpoints.smallDesktop) return DeviceType.smallDesktop;
    if (width >= AppBreakpoints.tablet) return DeviceType.tablet;
    return DeviceType.mobile;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return builder(
          context,
          ResponsiveInfo(width: width, deviceType: getDeviceType(width)),
        );
      },
    );
  }
}