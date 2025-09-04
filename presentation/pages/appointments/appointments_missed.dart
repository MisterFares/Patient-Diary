// lib/presentation/pages/appointments/appointments_missed.dart
import 'package:flutter/material.dart';
import 'package:project/core/constants/app_constants.dart';
import 'package:project/presentation/pages/appointments/appointments_upcoming.dart';

class AppointmentsMissed extends StatelessWidget {
  const AppointmentsMissed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SectionHeader(title: 'Today'),
          const SizedBox(height: 15),
          Expanded(
            child: ListView(
              children: [
                _buildAppointmentItem('Preeti Semwal', '27 years', '10.00 AM'),
                _buildAppointmentItem('Rekendu Das', '28 years', '9.30 AM'),
                const ViewPastAppointmentsButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentItem(String name, String age, String time) {
    return AppointmentListItem(
      name: name,
      age: age,
      time: time,
      statusColor: AppConstants.errorColor,
    );
  }
}