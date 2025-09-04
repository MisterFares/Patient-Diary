// lib/core/widgets/detail_row.dart
import 'package:flutter/material.dart';
import 'package:project/core/constants/app_constants.dart';

class DetailRow extends StatelessWidget {
  final String label;
  final String value;
  
  const DetailRow({
    super.key,
    required this.label,
    required this.value,
  });
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppConstants.textTertiary,
            fontSize: 14,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: AppConstants.textSecondary,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}