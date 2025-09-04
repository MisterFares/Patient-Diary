// lib/presentation/pages/appointments/appointments_upcoming.dart
import 'package:flutter/material.dart';
import 'package:project/core/constants/app_constants.dart';
import 'package:project/presentation/pages/appointments/appointments_completed.dart';
import 'package:project/presentation/pages/appointments/appointments_missed.dart';

class AppointmentsUpcoming extends StatelessWidget {
  const AppointmentsUpcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const AppointmentsAppBar(),
          backgroundColor: AppConstants.primaryColor,
        ),
        body: const AppointmentsTabView(),
      ),
    );
  }
}

class AppointmentsAppBar extends StatelessWidget {
  const AppointmentsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Appointments',
          style: TextStyle(
            fontFamily: AppConstants.fontFamily,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppConstants.routeSearch);
          },
          icon: const Icon(Icons.search, color: Colors.white),
        ),
      ],
    );
  }
}

class AppointmentsTabView extends StatelessWidget {
  const AppointmentsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: 42,
          child: const TabBar(
            indicatorColor: AppConstants.primaryColor,
            indicatorWeight: 3,
            labelColor: AppConstants.primaryColor,
            unselectedLabelColor: AppConstants.textTertiary,
            tabs: [
              Tab(text: 'Upcoming'),
              Tab(text: 'Missed'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            children: [
              IncomingContent(),
              AppointmentsMissed(),
              AppointmentsCompleted(),
            ],
          ),
        ),
      ],
    );
  }
}

class IncomingContent extends StatelessWidget {
  const IncomingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: 'Today'),
        Expanded(
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppConstants.routePatientProfile);
                },
                child: _buildAppointmentItem(
                  'Anupama Gurung',
                  '32 years',
                  '10.00 AM',
                ),
              ),
              _buildAppointmentItem('Deepa Gupta', '27 years', '10.30 AM'),
              _buildAppointmentItem('Ankur Sharma', '24 years', '11.00 AM'),
              _buildAppointmentItem('Neelam Singh', '31 years', '11.30 AM'),
              _buildAppointmentItem('Jayshree Singhal', '48 years', '12.00 PM'),
              _buildAppointmentItem('Mridul Varshney', '30 years', '12.30 PM'),
              _buildAppointmentItem('Leena Dutta', '33 years', '04.00 PM'),
              const ViewPastAppointmentsButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAppointmentItem(String name, String age, String time) {
    return AppointmentListItem(
      name: name,
      age: age,
      time: time,
      statusColor: AppConstants.primaryColor,
    );
  }
}

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

class AppointmentListItem extends StatelessWidget {
  final String name;
  final String age;
  final String time;
  final Color statusColor;
  final VoidCallback? onTap;
  
  const AppointmentListItem({
    super.key,
    required this.name,
    required this.age,
    required this.time,
    required this.statusColor,
    this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        backgroundColor: AppConstants.primaryColor.withOpacity(0.1),
        child: Icon(Icons.person, color: AppConstants.primaryColor),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontFamily: AppConstants.fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppConstants.textPrimary,
        ),
      ),
      subtitle: Row(
        children: [
          Text(
            '$age | $time ',
            style: const TextStyle(
              fontFamily: AppConstants.fontFamily,
              fontSize: 14,
              color: AppConstants.textSecondary,
            ),
          ),
          Icon(Icons.circle, color: statusColor, size: 8),
        ],
      ),
      trailing: const Icon(Icons.more_vert, color: AppConstants.textTertiary, size: 25),
    );
  }
}

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