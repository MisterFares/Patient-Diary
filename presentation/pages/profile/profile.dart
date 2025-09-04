// lib/presentation/pages/profile/profile.dart
import 'package:flutter/material.dart';
import 'package:project/core/constants/app_constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isToogled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ProfileHeader(),
          ProfileOption(
            title: "Today's Availability",
            trailing: Switch(
              inactiveThumbColor: AppConstants.textSecondary,
              value: _isToogled,
              activeColor: AppConstants.primaryColor,
              inactiveTrackColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _isToogled = value;
                });
              },
            ),
          ),
          const ProfileOption(
            title: "Upcoming Availability",
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: AppConstants.textTertiary,
            ),
          ),
          ProfileOption(
            title: "Logout",
            titleColor: AppConstants.errorColor,
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppConstants.textTertiary,
            ),
            onTap: () {
              Navigator.pushNamed(context, AppConstants.routeSplash);
            },
          ),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConstants.primaryColor,
      height: 150,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 75,
            child: Image.asset('assets/images/Ellipse_6.png', height: 75),
          ),
          const SizedBox(height: 7),
          const Text(
            'Dr. Neelam Joshi',
            style: TextStyle(
              color: Colors.white,
              fontFamily: AppConstants.fontFamily,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Widget trailing;
  final VoidCallback? onTap;
  
  const ProfileOption({
    super.key,
    required this.title,
    this.titleColor = AppConstants.textPrimary,
    required this.trailing,
    this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.1)),
        ),
        height: 62,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(color: titleColor)),
            SizedBox(
              width: 60,
              height: 31,
              child: trailing,
            ),
          ],
        ),
      ),
    );
  }
}