// lib/presentation/pages/patients/patient_profile.dart
import 'package:flutter/material.dart';
import 'package:project/core/constants/app_constants.dart';

class PatientProfile extends StatelessWidget {
  const PatientProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.primaryColor,
        title: const Text(
          'Patient Profile',
          style: TextStyle(
            color: Colors.white,
            fontFamily: AppConstants.fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
        ),
      ),
      body: ListView(
        children: const [
          PatientProfileCard(),
          PatientAppointmentsSection(),
        ],
      ),
    );
  }
}

class PatientProfileCard extends StatelessWidget {
  const PatientProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundColor: AppConstants.primaryColor,
            child: Icon(Icons.person, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Anupama Gurung",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "32 yrs",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: const [
                    Icon(Icons.phone, size: 16, color: AppConstants.primaryColor),
                    SizedBox(width: 6),
                    Text(
                      "7500190739 |",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      " View Details",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppConstants.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PatientAppointmentsSection extends StatelessWidget {
  const PatientAppointmentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Appointments",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          AppointmentCard(
            time: "04:00 PM",
            date: "Tue, 12 Feb 2024",
            dotColor: AppConstants.primaryColor,
            highlight: true,
          ),
          AppointmentCard(
            time: "10:00 AM",
            date: "Sat, 9 Feb 2024",
            status: "Completed",
            dotColor: AppConstants.secondaryColor,
          ),
          AppointmentCard(
            time: "10:00 AM",
            date: "Fri, 8 Feb 2024",
            status: "Missed",
            dotColor: AppConstants.errorColor,
          ),
        ],
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String time;
  final String date;
  final String? status;
  final Color dotColor;
  final bool highlight;

  const AppointmentCard({
    super.key,
    required this.time,
    required this.date,
    this.status,
    required this.dotColor,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                time,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: highlight ? AppConstants.primaryColor : AppConstants.textTertiary,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    date,
                    style: const TextStyle(fontSize: 16, color: AppConstants.textPrimary),
                  ),
                  if (status != null) ...[
                    const SizedBox(width: 4),
                    Text(
                      "($status)",
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppConstants.textTertiary,
                      ),
                    ),
                  ],
                  const SizedBox(width: 6),
                  Icon(Icons.circle, size: 10, color: dotColor),
                ],
              ),
            ],
          ),
          const Icon(Icons.more_vert, color: AppConstants.textTertiary),
        ],
      ),
    );
  }
}