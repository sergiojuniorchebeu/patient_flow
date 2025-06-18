import 'package:flutter/material.dart';

class CustomFeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomFeatureItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            icon,
            color: colorScheme.primary,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: colorScheme.onBackground.withOpacity(0.8),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
