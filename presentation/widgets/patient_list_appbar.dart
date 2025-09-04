// lib/presentation/widgets/patient_list_appbar.dart
import 'package:flutter/material.dart';
import 'package:project/core/constants/app_constants.dart';

class PatientListAppBar extends StatelessWidget {
  const PatientListAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Patient List',
          style: TextStyle(
            color: Colors.white,
            fontFamily: AppConstants.fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                _showFilterBottomSheet(context);
              },
              icon: Image.asset(
                'assets/images/filter.png',
                width: 26,
                height: 22,
              ),
            ),
            const Icon(Icons.search, color: Colors.white),
          ],
        ),
      ],
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    // Your existing filter bottom sheet code
  }
}