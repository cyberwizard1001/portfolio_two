import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_2/pages/project/project_page.dart';

void main() {
  group('ProjectPage (catch-all)', () {
    test('project page can be instantiated with slug', () {
      const page = ProjectPage(slug: 'test-slug');
      expect(page, isNotNull);
    });

    test('project page can be instantiated with unknown slug', () {
      const page = ProjectPage(slug: 'unknown-project-slug');
      expect(page, isNotNull);
    });

    test('project page can be instantiated with empty slug', () {
      const page = ProjectPage(slug: '');
      expect(page, isNotNull);
    });
  });
}
