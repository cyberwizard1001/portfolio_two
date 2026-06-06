import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_2/pages/contact/contact_page.dart';

void main() {
  group('ContactPage', () {
    test('contact page can be instantiated', () {
      const page = ContactPage();
      expect(page, isNotNull);
    });

    test('contact page is a stateless widget', () {
      const page = ContactPage();
      expect(page, isA<ContactPage>());
    });
  });
}
