import 'package:flutter/material.dart';
import 'custom_feature_item.dart';

class CustomFeatureRow extends StatelessWidget {
  final List<({IconData icon, String label})> features;

  const CustomFeatureRow({super.key, required this.features});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: features
          .map((feature) => CustomFeatureItem(icon: feature.icon, text: feature.label))
          .toList(),
    );
  }
}
