// lib/presentation/pages/appointments/appointment_details.dart
import 'package:flutter/material.dart';
import 'package:project/core/constants/app_constants.dart';
import 'package:project/core/widgets/buttons/primary_button.dart';

class AppointmentDetails extends StatelessWidget {
  const AppointmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppointmentDetailsAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: const [
              AppointmentActionsSection(),
              SizedBox(height: 10),
              PatientDetailsSection(),
              SizedBox(height: 10),
              PrescriptionsSection(),
              SizedBox(height: 27),
              SaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppointmentDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppConstants.primaryColor,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
      ),
      title: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 20,
            child: Text(
              'A',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Anupama Gurung',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: AppConstants.fontFamily,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 2),
              Text(
                '32 yrs',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: AppConstants.fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppointmentActionsSection extends StatelessWidget {
  const AppointmentActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: const Color(0xFFE3FEFF),
      height: 150,
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            'Wed, 12 may 24 | 10:00 PM',
            style: TextStyle(
              color: AppConstants.primaryColor,
              fontFamily: AppConstants.fontFamily,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppointmentActionButton(
                iconPath: 'assets/images/completed.png',
                title: 'Mark as',
                subtitle: 'Completed',
                onTap: () => _showSuccessDialog(context),
              ),
              AppointmentActionButton(
                iconPath: 'assets/images/cancel.png',
                title: 'Cancel',
                subtitle: 'Appointment',
                onTap: () => _showDeleteDialog(context),
              ),
              AppointmentActionButton(
                iconPath: 'assets/images/reschedule.png',
                title: 'Reschedule',
                subtitle: 'Appointment',
                onTap: () {
                  Navigator.pushNamed(context, AppConstants.routeReschedule);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              'Success',
              style: TextStyle(
                color: AppConstants.textPrimary,
                fontSize: 18,
                fontFamily: AppConstants.fontFamily,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(
            left: 40,
            right: 40,
            top: 32,
          ),
          content: SizedBox(
            height: 170,
            child: Column(
              children: [
                const Text(
                  'Appointment scheduled',
                  style: TextStyle(
                    color: AppConstants.textSecondary,
                    fontSize: 16,
                    fontFamily: AppConstants.fontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Text(
                  'successfully for:',
                  style: TextStyle(
                    color: AppConstants.textSecondary,
                    fontSize: 16,
                    fontFamily: AppConstants.fontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Text(
                  'Sat 12 Jul 2024, 10:00 PM',
                  style: TextStyle(
                    color: AppConstants.primaryColor,
                    fontSize: 16,
                    fontFamily: AppConstants.fontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: 110,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppConstants.routeMain, // go to BottomNavigation
                        (route) => false,
                        arguments: 0, // Appointments tab
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppConstants.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      side: const BorderSide(color: AppConstants.primaryColor),
                    ),
                    child: const Text('Close'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              'Delete Appointment',
              style: TextStyle(
                color: AppConstants.textPrimary,
                fontSize: 18,
                fontFamily: AppConstants.fontFamily,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(
            left: 40,
            right: 40,
            top: 32,
          ),
          content: SizedBox(
            height: 170,
            child: Column(
              children: [
                const Text(
                  'Are you sure you want to delete',
                  style: TextStyle(
                    color: AppConstants.textSecondary,
                    fontSize: 16,
                    fontFamily: AppConstants.fontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Text(
                  'this item?',
                  style: TextStyle(
                    color: AppConstants.textSecondary,
                    fontSize: 16,
                    fontFamily: AppConstants.fontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 110,
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppConstants.primaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          side: const BorderSide(color: AppConstants.primaryColor),
                        ),
                        child: const Text('No'),
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppConstants.primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          side: BorderSide.none,
                        ),
                        child: const Text('Yes'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AppointmentActionButton extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const AppointmentActionButton({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 100,
        width: 110,
        child: Card(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                iconPath,
                height: 30,
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(
                  color: AppConstants.textSecondary,
                  fontFamily: AppConstants.fontFamily,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppConstants.textSecondary,
                  fontFamily: AppConstants.fontFamily,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PatientDetailsSection extends StatelessWidget {
  const PatientDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: 'Patient Details'),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.only(left: 21, right: 21),
          child: Column(
            children: const [
              DetailRow(label: 'Full Name:', value: 'Anupama Gurung'),
              SizedBox(height: 15),
              DetailRow(label: 'Age:', value: '32 years'),
              SizedBox(height: 15),
              DetailRow(label: 'Gender:', value: 'Female'),
              SizedBox(height: 15),
              DetailRow(label: 'Phone No:', value: '7500190739'),
              SizedBox(height: 15),
              DetailRow(label: 'Address:', value: '2/4 ST. Tilak Road, Dehradun'),
              SizedBox(height: 15),
              DetailRow(label: 'Medical History:', value: 'No'),
            ],
          ),
        ),
      ],
    );
  }
}

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

class PrescriptionsSection extends StatelessWidget {
  const PrescriptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: 'Perscriptions'),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/desc1.png',
              height: 210,
              width: 190,
            ),
            Image.asset(
              'assets/images/desc2.png',
              height: 210,
              width: 190,
            ),
          ],
        ),
      ],
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: 42,
      width: double.infinity,
      child: PrimaryButton(
        text: 'Save',
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppConstants.routeMain,
            (route) => false,
            arguments: 0,
          );
        },
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.infinity,
      color: const Color(0xFFF2F2F2),
      child: Text(
        title,
        style: const TextStyle(
          color: AppConstants.textPrimary,
          fontFamily: AppConstants.fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
