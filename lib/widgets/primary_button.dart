import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const PrimaryButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
       //icon: const Icon(Icons.arrow_forward_rounded),
        label: Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600,fontFamily: "Poppins"),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(56),
        ),
      ),
    );
  }
}
