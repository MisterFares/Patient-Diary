// lib/main.dart
import 'package:flutter/material.dart';
import 'package:project/core/constants/app_constants.dart';
import 'package:project/core/services/navigation_service.dart';
import 'package:project/presentation/pages/appointments/appointment_details.dart';
import 'package:project/presentation/pages/appointments/appointments_upcoming.dart';
import 'package:project/presentation/pages/appointments/schedule_new_appointment.dart';
import 'package:project/presentation/pages/auth/sign_in.dart';
import 'package:project/presentation/pages/auth/verification.dart';
import 'package:project/presentation/pages/calendar/select_date_time.dart';
import 'package:project/presentation/pages/onboarding/onboarding1.dart';
import 'package:project/presentation/pages/onboarding/onboarding2.dart';
import 'package:project/presentation/pages/onboarding/onboarding3.dart';
import 'package:project/presentation/pages/patients/patient_profile.dart';
import 'package:project/presentation/pages/profile/profile.dart';
import 'package:project/presentation/pages/search/search.dart';
import 'package:project/presentation/pages/splash/splash.dart';
import 'package:project/presentation/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';
import 'package:project/core/services/local_storage_service.dart';
import 'package:project/core/services/notification_service.dart';
import 'package:project/core/services/seed_data_service.dart';
import 'package:project/data/repositories/appointment_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive
  await LocalStorageService.init();
  
  // Initialize notifications
  await NotificationService.initialize();
  
  // Seed initial data
  await SeedDataService.seedDoctors();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppointmentRepository>(
          create: (_) => AppointmentRepository(
            appointmentsBox: LocalStorageService.appointmentsBox,
          ),
        ),
        // Add other providers as needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Patient Diary',
        theme: ThemeData(),
        navigatorKey: NavigationService().navigatorKey,
            routes: {
              AppConstants.routeSplash: (context) => const Splash(),
              AppConstants.routeUpcoming: (context) => const AppointmentsUpcoming(),
              AppConstants.routeOnboarding1: (context) => const OnBoarding1(),
              AppConstants.routeOnboarding2: (context) => const OnBoarding2(),
              AppConstants.routeOnboarding3: (context) => const OnBoarding3(),
              AppConstants.routeSignIn: (context) => const SignIn(),
              AppConstants.routeVerification: (context) => const Verification(),
              AppConstants.routeMain: (context) => const BottomNavigation(),
              AppConstants.routeSearch: (context) => const Search(),
              AppConstants.routeProfile: (context) => const ProfileScreen(),
              AppConstants.routeNewAppointment: (context) => const ScheduleNewAppointment(),
              AppConstants.routeSelectDateTime: (context) => const SelectDateTime(),
              AppConstants.routeAppointmentDetails: (context) => const AppointmentDetails(),
              AppConstants.routeReschedule: (context) => const RescheduleAppointment(),
              AppConstants.routePatientProfile: (context) => const PatientProfile(),
            },
      )
          );
  }
}
