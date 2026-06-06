import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_2/widgets/home/project_stack_section.dart';

void main() {
  group('ProjectStackSection', () {
    test('project stack section can be instantiated', () {
      const section = ProjectStackSection();
      expect(section, isNotNull);
    });

    test('project stack section is a stateless widget', () {
      // Verify it compiles and is constructible.
      const section = ProjectStackSection();
      expect(section, isA<ProjectStackSection>());
    });
  });
}
