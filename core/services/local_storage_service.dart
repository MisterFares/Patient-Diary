import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/data/models/appointment_model.dart';
import 'package:project/data/models/doctor_model.dart';

class LocalStorageService {
  static Future<void> init() async {
    await Hive.initFlutter(); // ✅ works on mobile & web

    // Register adapters
    Hive.registerAdapter(DoctorAdapter());
    Hive.registerAdapter(WorkDayAdapter());
    Hive.registerAdapter(AppointmentAdapter());
    Hive.registerAdapter(AppointmentStatusAdapter());

    // Open boxes
    await Hive.openBox('session');
    await Hive.openBox('doctors');
    await Hive.openBox('appointments');
    await Hive.openBox('patients');
  }

  static Box get sessionBox => Hive.box('session');
  static Box get doctorsBox => Hive.box('doctors');
  static Box get appointmentsBox => Hive.box('appointments');
  static Box get patientsBox => Hive.box('patients');
}
