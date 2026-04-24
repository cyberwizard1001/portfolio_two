import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../responsive/responsive_builder.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import '../common/responsive_section.dart';

// ─── ASCII art strings ────────────────────────────────────────────────────────

// "Nirmal" in figlet slant font
const _asciiNirmal = '    _   ___                      __\n'
    '   / | / (_)________ ___  ____ _/ /\n'
    '  /  |/ / / ___/ __ `__ \\/ __ `/ / \n'
    ' / /|  / / /  / / / / / / /_/ / /  \n'
    '/_/ |_/_/_/  /_/ /_/ /_/\\__,_/_/   ';

// "@cyberwizard1001" in figlet mini font
const _asciiHandle = '  __                             _  _    \n'
    ' /  \\ _  |_  _ ._   o_  _..__|/|/ \\/ \\/| \n'
    '| (|/(_\\/|_)(/_|\\/\\/|/_(_||(_| |\\_/\\_/ | \n'
    ' \\__   /                                 ';

// ─── Full section ─────────────────────────────────────────────────────────────

class TerminalAboutSection extends StatelessWidget {
  const TerminalAboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ResponsiveSection(
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.section),
        child: ResponsiveBuilder(
          builder: (context, info) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About me',
                  style: textTheme.headlineMedium?.copyWith(
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                // Outer terminal frame
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.ink,
                    borderRadius: BorderRadius.circular(AppRadii.xl),
                    border: Border.all(color: AppColors.border),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x12000000),
                        blurRadius: 42,
                        offset: Offset(0, 18),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF101010),
                        borderRadius: BorderRadius.circular(AppRadii.lg),
                        border: Border.all(color: const Color(0xFF2A2A2A)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _TerminalTitleBar(),
                          info.isMobile
                              ? _TerminalBodyMobile()
                              : _TerminalBodyDesktop(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// ─── Title bar ────────────────────────────────────────────────────────────────

class _TerminalTitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFF2A2A2A))),
      ),
      child: Row(
        children: [
          const _TerminalDot(color: Color(0xFFFF5F57)),
          const SizedBox(width: AppSpacing.xs),
          const _TerminalDot(color: Color(0xFFFFBD2E)),
          const SizedBox(width: AppSpacing.xs),
          const _TerminalDot(color: Color(0xFF28C840)),
          const SizedBox(width: AppSpacing.md),
          Text(
            '~/about_me — bash',
            style: GoogleFonts.ibmPlexMono(
              fontSize: 12,
              color: Colors.white38,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Desktop: ASCII left panel + terminal right ───────────────────────────────

class _TerminalBodyDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left: ASCII art only
          Container(
            width: 340,
            decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: Color(0xFF2A2A2A))),
            ),
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: const _AsciiPanel(),
          ),
          // Right: typing terminal (with buttons at end)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: _TypingTerminal(),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Mobile: ASCII top + terminal below ──────────────────────────────────────

class _TerminalBodyMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xFF2A2A2A))),
          ),
          padding: const EdgeInsets.all(AppSpacing.md),
          child: const _AsciiPanel(),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: _TypingTerminal(),
        ),
      ],
    );
  }
}

// ─── ASCII panel (art only, no buttons) ──────────────────────────────────────

class _AsciiPanel extends StatelessWidget {
  const _AsciiPanel();

  @override
  Widget build(BuildContext context) {
    final green = GoogleFonts.ibmPlexMono(
      fontSize: 10.5,
      height: 1.4,
      color: const Color(0xFF28C840),
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    );
    final dimGreen = GoogleFonts.ibmPlexMono(
      fontSize: 9.5,
      height: 1.4,
      color: const Color(0xFF28C840).withValues(alpha: 0.85),
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Fancy "Nirmal" in slant
        Text(_asciiNirmal, style: green),
        const SizedBox(height: AppSpacing.sm),
        // Dimmer "@cyberwizard1001" in mini below
        Text(_asciiHandle, style: dimGreen),
      ],
    );
  }
}

// ─── Terminal line model ──────────────────────────────────────────────────────

class _TerminalLine {
  const _TerminalLine({
    this.prompt,
    required this.text,
    this.isOutput = false,
  });

  final String? prompt;
  final String text;
  final bool isOutput;
}

// ─── Interactive typing terminal ──────────────────────────────────────────────

class _TypingTerminal extends StatefulWidget {
  @override
  State<_TypingTerminal> createState() => _TypingTerminalState();
}

class _TypingTerminalState extends State<_TypingTerminal> {
  static const _lines = [
    _TerminalLine(prompt: '~\$ ', text: 'about --nirmal'),
    _TerminalLine(
      text: 'CS grad and former Flutter developer now designing accessible UX. '
          'Linux desktop customisation sparked my love for thoughtful, '
          'human-centered design.',
      isOutput: true,
    ),
    _TerminalLine(prompt: '~\$ ', text: 'skills --list'),
    _TerminalLine(
      text: 'Accessibility-first  ·  Systems thinker\n'
          'Flutter background  ·  Linux enthusiast',
      isOutput: true,
    ),
    _TerminalLine(prompt: '~\$ ', text: 'contact --open'),
    _TerminalLine(
      text: 'Opening links panel…  ✓  Ready.',
      isOutput: true,
    ),
  ];

  int _revealedLines = 0;
  int _charIndex = 0;
  bool _cursorVisible = true;
  bool _showButtons = false;
  double _buttonsOpacity = 0;

  Timer? _typeTimer;
  Timer? _cursorTimer;

  static const _charDelay = 28;
  static const _lineDelay = 520;
  static const _outputDelay = 180;

  @override
  void initState() {
    super.initState();
    _startCursorBlink();
    Future.delayed(const Duration(milliseconds: 600), _typeNextChar);
  }

  void _startCursorBlink() {
    _cursorTimer = Timer.periodic(const Duration(milliseconds: 530), (_) {
      if (mounted) setState(() => _cursorVisible = !_cursorVisible);
    });
  }

  void _typeNextChar() {
    if (!mounted) return;
    if (_revealedLines >= _lines.length) {
      // All lines done — fade in buttons
      _fadeInButtons();
      return;
    }

    final currentLine = _lines[_revealedLines];

    if (currentLine.isOutput) {
      setState(() => _charIndex = currentLine.text.length);
      _typeTimer = Timer(const Duration(milliseconds: _lineDelay), () {
        if (!mounted) return;
        setState(() {
          _revealedLines++;
          _charIndex = 0;
        });
        _typeNextChar();
      });
      return;
    }

    final fullText = currentLine.text;
    if (_charIndex < fullText.length) {
      setState(() => _charIndex++);
      _typeTimer =
          Timer(const Duration(milliseconds: _charDelay), _typeNextChar);
    } else {
      _typeTimer = Timer(const Duration(milliseconds: _lineDelay), () {
        if (!mounted) return;
        setState(() {
          _revealedLines++;
          _charIndex = 0;
        });
        Timer(const Duration(milliseconds: _outputDelay), _typeNextChar);
      });
    }
  }

  void _fadeInButtons() {
    setState(() => _showButtons = true);
    // Slight delay then fade to full opacity
    Future.delayed(const Duration(milliseconds: 120), () {
      if (mounted) setState(() => _buttonsOpacity = 1.0);
    });
  }

  @override
  void dispose() {
    _typeTimer?.cancel();
    _cursorTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final promptStyle = GoogleFonts.ibmPlexMono(
      fontSize: 14,
      color: const Color(0xFF28C840),
      height: 1.6,
    );
    final commandStyle = GoogleFonts.ibmPlexMono(
      fontSize: 14,
      color: Colors.white,
      height: 1.6,
    );
    final outputStyle = GoogleFonts.ibmPlexMono(
      fontSize: 13,
      color: Colors.white60,
      height: 1.6,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Terminal lines
        for (int i = 0; i <= _revealedLines && i < _lines.length; i++)
          _buildLine(
            line: _lines[i],
            lineIndex: i,
            promptStyle: promptStyle,
            commandStyle: commandStyle,
            outputStyle: outputStyle,
          ),

        // Blinking cursor after all lines are done
        if (_revealedLines >= _lines.length)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xs),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: '~\$ ', style: promptStyle),
                  if (_cursorVisible)
                    TextSpan(
                      text: '▋',
                      style: commandStyle.copyWith(color: AppColors.accent),
                    ),
                ],
              ),
            ),
          ),

        // CV + LinkedIn buttons — fade in after contact --open resolves
        if (_showButtons) ...[
          const SizedBox(height: AppSpacing.lg),
          AnimatedOpacity(
            opacity: _buttonsOpacity,
            duration: const Duration(milliseconds: 480),
            curve: Curves.easeOut,
            child: const _TerminalLinksPanel(),
          ),
        ],
      ],
    );
  }

  Widget _buildLine({
    required _TerminalLine line,
    required int lineIndex,
    required TextStyle promptStyle,
    required TextStyle commandStyle,
    required TextStyle outputStyle,
  }) {
    final isCurrentLine = lineIndex == _revealedLines;

    if (line.isOutput) {
      final visibleText =
          isCurrentLine ? line.text.substring(0, _charIndex) : line.text;
      return Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.sm),
        child: Text(visibleText, style: outputStyle),
      );
    }

    final fullCommand = line.text;
    final visibleCommand = isCurrentLine
        ? fullCommand.substring(0, _charIndex.clamp(0, fullCommand.length))
        : fullCommand;

    final showCursor = isCurrentLine && _cursorVisible;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: RichText(
        text: TextSpan(
          children: [
            if (line.prompt != null)
              TextSpan(text: line.prompt, style: promptStyle),
            TextSpan(text: visibleCommand, style: commandStyle),
            if (showCursor)
              TextSpan(
                text: '▋',
                style: commandStyle.copyWith(color: AppColors.accent),
              ),
          ],
        ),
      ),
    );
  }
}

// ─── CV / LinkedIn buttons panel ─────────────────────────────────────────────

class _TerminalLinksPanel extends StatelessWidget {
  const _TerminalLinksPanel();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: const [
        _TerminalActionButton(
          label: 'View CV',
          icon: Icons.description_outlined,
          isPrimary: true,
        ),
        _TerminalActionButton(
          label: 'LinkedIn',
          icon: Icons.open_in_new_rounded,
        ),
      ],
    );
  }
}

// ─── Action button ────────────────────────────────────────────────────────────

class _TerminalActionButton extends StatefulWidget {
  const _TerminalActionButton({
    required this.label,
    required this.icon,
    this.isPrimary = false,
  });

  final String label;
  final IconData icon;
  final bool isPrimary;

  @override
  State<_TerminalActionButton> createState() => _TerminalActionButtonState();
}

class _TerminalActionButtonState extends State<_TerminalActionButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadii.pill),
        onTap: () =>
            debugPrint(widget.label == 'View CV' ? 'Open CV' : 'Open LinkedIn'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm + 2,
          ),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? (_hovered ? const Color(0xFFFF7A29) : AppColors.accent)
                : (_hovered
                    ? AppColors.accent.withValues(alpha: 0.14)
                    : AppColors.accent.withValues(alpha: 0.10)),
            borderRadius: BorderRadius.circular(AppRadii.pill),
            border: Border.all(
              color: widget.isPrimary
                  ? (_hovered ? const Color(0xFFFF7A29) : AppColors.accent)
                  : AppColors.accent.withValues(alpha: 0.35),
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, size: 16, color: Colors.white),
              const SizedBox(width: AppSpacing.xs),
              Text(
                widget.label,
                style: textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Terminal dot ─────────────────────────────────────────────────────────────

class _TerminalDot extends StatelessWidget {
  const _TerminalDot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
