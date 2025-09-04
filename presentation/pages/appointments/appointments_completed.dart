import 'package:flutter/material.dart';
import 'package:project/core/constants/app_constants.dart';
import 'package:project/presentation/pages/appointments/appointments_upcoming.dart';

class AppointmentsCompleted extends StatelessWidget {
  const AppointmentsCompleted({super.key});

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
                _buildAppointmentItem('Poonam Bhatt', '24 years', '5.00 AM'),
                _buildAppointmentItem('Aiswarya Rohilla', '32 years', '4.00 AM'),
                _buildAppointmentItem('Anant Sagar', '37 years', '12.30 AM'),
                _buildAppointmentItem('Deepmala Rey', '52 years', '12.00 AM'),
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
      statusColor: AppConstants.secondaryColor,
    );
  }
}