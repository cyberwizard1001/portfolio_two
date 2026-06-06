import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_2/widgets/project/project_intro_block.dart';
import 'package:portfolio_2/widgets/project/project_meta_strip_block.dart';
import 'package:portfolio_2/widgets/project/project_quote_block.dart';
import 'package:portfolio_2/widgets/project/project_learnings_block.dart';
import 'package:portfolio_2/widgets/project/project_section_theme.dart';

void main() {
  final testTheme = ProjectSectionTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  );

  group('Project Blocks', () {
    test('ProjectIntroBlock can be instantiated', () {
      final block = ProjectIntroBlock(
        themeConfig: testTheme,
        eyebrow: 'UX Design · 2024',
        title: 'Test Project',
        summary: 'This is a test project summary.',
      );
      expect(block, isNotNull);
    });

    test('ProjectMetaStripBlock can be instantiated', () {
      final block = ProjectMetaStripBlock(
        themeConfig: testTheme,
        items: const [
          ProjectMetaItem(label: 'Role', value: 'Designer'),
          ProjectMetaItem(label: 'Timeline', value: '3 months'),
        ],
      );
      expect(block, isNotNull);
    });

    test('ProjectQuoteBlock can be instantiated', () {
      final block = ProjectQuoteBlock(
        themeConfig: testTheme,
        quote: '"This is a test quote."',
        attribution: '— Test Author',
      );
      expect(block, isNotNull);
    });

    test('ProjectLearningsBlock can be instantiated', () {
      final block = ProjectLearningsBlock(
        themeConfig: testTheme,
        title: 'What I Learned',
        points: const [
          'First learning',
          'Second learning',
        ],
      );
      expect(block, isNotNull);
    });

    test('ProjectSectionTheme accepts custom colors', () {
      final theme = ProjectSectionTheme(
        backgroundColor: const Color(0xFFFF0000),
        foregroundColor: const Color(0xFF00FF00),
      );
      expect(theme, isNotNull);
    });
  });
}
