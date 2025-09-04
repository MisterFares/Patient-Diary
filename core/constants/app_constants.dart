// lib/core/constants/app_constants.dart
import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'Patient Diary';
  static const String fontFamily = 'Inter';
  
  // Colors
  static const Color primaryColor = Color(0xFF1EB6B9);
  static const Color secondaryColor = Color(0xFF42CD69);
  static const Color errorColor = Color(0xFFFF6161);
  static const Color textPrimary = Color(0xFF222222);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textTertiary = Color(0xFF888888);
  static const Color backgroundLight = Color(0xFFF2F2F2);
  static const Color borderColor = Color(0xFFCCCCCC);
  
  // Assets
  static const String logoPath = 'assets/icons/Logo.png';
  static const String boarding1Path = 'assets/images/boarding1.png';
  static const String boarding2Path = 'assets/images/boarding2.png';
  static const String boarding3Path = 'assets/images/boarding3.png';
  static const String boarding1DotsPath = 'assets/images/boarding1_dots.png';
  static const String boarding2DotsPath = 'assets/images/boarding2_dots.png';
  static const String boarding3DotsPath = 'assets/images/boarding3_dots.png';
  static const String googleIconPath = 'assets/images/google.png';
  static const String filterIconPath = 'assets/images/filter.png';
  static const String completedIconPath = 'assets/images/completed.png';
  static const String cancelIconPath = 'assets/images/cancel.png';
  static const String rescheduleIconPath = 'assets/images/reschedule.png';
  static const String desc1Path = 'assets/images/desc1.png';
  static const String desc2Path = 'assets/images/desc2.png';
  static const String ellipse6Path = 'assets/images/Ellipse_6.png';
  static const String appointmentsIconPath = 'assets/images/appointments.png';
  static const String patientsListIconPath = 'assets/images/patients_list.png';
  static const String profileIconPath = 'assets/images/profile.png';
  
  // Routes
  static const String routeSplash = '/';
  static const String routeOnboarding1 = '/onboarding1';
  static const String routeOnboarding2 = '/boarding2';
  static const String routeOnboarding3 = '/boarding3';
  static const String routeSignIn = '/sign_in';
  static const String routeVerification = '/verification';
  static const String routeMain = '/main';
  static const String routeSearch = '/search';
  static const String routeProfile = '/profile';
  static const String routeNewAppointment = '/new';
  static const String routeSelectDateTime = '/select';
  static const String routeAppointmentDetails = '/details';
  static const String routeReschedule = '/reschedule';
  static const String routePatientProfile = '/patient_profile';
  static const String routeUpcoming = '/upcoming';
  static const String routeMissed = '/missed';
  static const String routeCompleted = '/completed';
  static const String routePatientList = '/patient_list';
  
  // Time slots
  static const List<String> timeSlots = [
    '10:00 AM', '10:30 AM', '11:00 AM',
    '11:30 AM', '12:00 PM', '12:30 PM',
    '03:30 PM', '04:00 PM', '04:30 PM',
    '05:00 PM', '05:30 PM'
  ];
  
  // Date formats
  static const String dateFormat = 'EEE, d MMM yyyy';
  static const String timeFormat = 'hh:mm a';
  
  // Validation messages
  static const String requiredField = 'This field is required';
  static const String invalidPhone = 'Please enter a valid phone number';
  static const String invalidEmail = 'Please enter a valid email address';
  
  // API endpoints (if applicable)
  static const String baseUrl = 'https://api.example.com';
  static const String appointmentsEndpoint = '/appointments';
  static const String patientsEndpoint = '/patients';
}