import 'package:flutter/material.dart';

class SecondaryTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const SecondaryTextButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(Icons.info_outline_rounded, size: 20, color: colorScheme.primary),
      label: Text(
        label,
        style: TextStyle(
          color: colorScheme.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
