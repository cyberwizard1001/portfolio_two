import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_2/widgets/home/terminal_about_section.dart';

void main() {
  group('TerminalAboutSection', () {
    test('terminal section can be instantiated with animation disabled', () {
      const section = TerminalAboutSection(startAnimation: false);
      expect(section, isNotNull);
    });

    test('terminal section can be instantiated with animation enabled', () {
      const section = TerminalAboutSection(startAnimation: true);
      expect(section, isNotNull);
    });

    test('terminal section accepts startAnimation parameter', () {
      const disabled = TerminalAboutSection(startAnimation: false);
      const enabled = TerminalAboutSection(startAnimation: true);
      expect(disabled, isNotNull);
      expect(enabled, isNotNull);
    });
  });
}
