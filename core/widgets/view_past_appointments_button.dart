// lib/core/widgets/view_past_appointments_button.dart
import 'package:flutter/material.dart';
import 'package:project/core/constants/app_constants.dart';

class ViewPastAppointmentsButton extends StatelessWidget {
  const ViewPastAppointmentsButton({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextButton(
        onPressed: () {
          // Add navigation to past appointments
        },
        child: const Text(
          'View past appointments >',
          style: TextStyle(
            color: AppConstants.primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: AppConstants.fontFamily,
          ),
        ),
      ),
    );
  }
}