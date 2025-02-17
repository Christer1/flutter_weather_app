import 'package:flutter/material.dart';

class AdditionalInfoItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String value;

  const AdditionalInfoItem({
    super.key,
    required this.icon,
    required this.text,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Icon(icon, size: 32),
      const SizedBox(height: 8),
      Text(text, style: const TextStyle(fontSize: 16),),
      const SizedBox(height: 8),
      Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
      ],
    );
  }
}