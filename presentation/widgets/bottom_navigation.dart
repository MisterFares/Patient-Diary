// lib/presentation/widgets/bottom_navigation.dart
import 'package:flutter/material.dart';
import 'package:project/core/constants/app_constants.dart';
import 'package:project/presentation/pages/appointments/appointments_upcoming.dart';
import 'package:project/presentation/pages/patients/patient_list.dart';
import 'package:project/presentation/pages/profile/profile.dart';

class BottomNavigation extends StatefulWidget {
  final int initialIndex;
  const BottomNavigation({super.key, this.initialIndex = 0});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  final List<Widget> _screens = const [
    AppointmentsUpcoming(),
    PatientListScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _buildBottomNavItem(
            iconPath: 'assets/images/appointments.png',
            label: 'Appointments',
            index: 0,
          ),
          _buildBottomNavItem(
            iconPath: 'assets/images/patients_list.png',
            label: 'Patient List',
            index: 1,
          ),
          _buildBottomNavItem(
            iconPath: 'assets/images/profile.png',
            label: 'Profile',
            index: 2,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppConstants.primaryColor,
        unselectedItemColor: AppConstants.textTertiary,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppConstants.routeNewAppointment);
        },
        backgroundColor: AppConstants.primaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(54),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  BottomNavigationBarItem _buildBottomNavItem({
    required String iconPath,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        iconPath,
        width: 26,
        height: 28,
        color: _selectedIndex == index
            ? AppConstants.primaryColor
            : AppConstants.textTertiary,
      ),
      activeIcon: Image.asset(
        iconPath,
        width: 26,
        height: 28,
        color: AppConstants.primaryColor,
      ),
      label: label,
    );
  }
}
