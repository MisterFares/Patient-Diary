// lib/core/widgets/section_header.dart
import 'package:flutter/material.dart';
import 'package:project/core/constants/app_constants.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  
  const SectionHeader({super.key, required this.title});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConstants.backgroundLight,
      height: 34,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: AppConstants.fontFamily,
            fontSize: 14,
            color: AppConstants.textTertiary,
          ),
        ),
      ),
    );
  }
}