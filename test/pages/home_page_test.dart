import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_2/pages/home/home_page.dart';

void main() {
  group('HomePage', () {
    test('home page can be instantiated', () {
      const page = HomePage();
      expect(page, isNotNull);
    });

    test('home page is a stateful widget', () {
      const page = HomePage();
      expect(page, isA<HomePage>());
    });
  });
}
