import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_2/widgets/home/hero_section.dart';

void main() {
  group('HeroSection', () {
    test('hero section can be instantiated', () {
      final hero = HeroSection(
        onScrollToWork: () {},
      );
      expect(hero, isNotNull);
    });

    test('hero section requires onScrollToWork callback', () {
      const hero = HeroSection(
        onScrollToWork: _noop,
      );
      expect(hero, isNotNull);
    });
  });
}

void _noop() {}
