import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackHomeButton extends StatelessWidget {
  const BackHomeButton({super.key, this.foregroundColor = Colors.white});

  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => context.goNamed('home'),
      icon: const Icon(Icons.arrow_back_rounded),
      label: const Text('Back home'),
      style: TextButton.styleFrom(foregroundColor: foregroundColor),
    );
  }
}
