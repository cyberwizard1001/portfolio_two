import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_2/widgets/home/home_nav_bar.dart';

void main() {
  group('HomeNavBar', () {
    test('nav bar can be instantiated with isDark true', () {
      final navbar = HomeNavBar(
        isDark: true,
        onHeroTap: () {},
        onWorkTap: () {},
        onAboutTap: () {},
        onContactTap: () {},
      );
      expect(navbar, isNotNull);
    });

    test('nav bar can be instantiated with isDark false', () {
      final navbar = HomeNavBar(
        isDark: false,
        onHeroTap: () {},
        onWorkTap: () {},
        onAboutTap: () {},
        onContactTap: () {},
      );
      expect(navbar, isNotNull);
    });

    test('nav bar accepts isDark parameter', () {
      final dark = HomeNavBar(
        isDark: true,
        onHeroTap: () {},
        onWorkTap: () {},
        onAboutTap: () {},
        onContactTap: () {},
      );
      final light = HomeNavBar(
        isDark: false,
        onHeroTap: () {},
        onWorkTap: () {},
        onAboutTap: () {},
        onContactTap: () {},
      );
      expect(dark, isNotNull);
      expect(light, isNotNull);
    });
  });
}
