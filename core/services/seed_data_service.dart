// lib/core/services/seed_data_service.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:project/core/services/local_storage_service.dart';
import 'package:project/data/models/doctor_model.dart';

class SeedDataService {
  static Future<void> seedDoctors() async {
    final doctorsBox = LocalStorageService.doctorsBox;
    
    // Check if already seeded
    if (doctorsBox.isNotEmpty) return;
    
    try {
      final String jsonString = 
          await rootBundle.loadString('assets/seed/seed_doctors.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      
      final List<dynamic> doctorsJson = jsonData['doctors'];
      
      for (var doctorJson in doctorsJson) {
        final doctor = Doctor(
          id: doctorJson['id'],
          name: doctorJson['name'],
          specialty: doctorJson['specialty'],
          avatarUrl: doctorJson['avatarUrl'],
          workDays: (doctorJson['workDays'] as List)
              .map((workDayJson) => WorkDay(
                    weekday: workDayJson['weekday'],
                    slots: List<String>.from(workDayJson['slots']),
                  ))
              .toList(),
        );
        
        await doctorsBox.put(doctor.id, doctor);
      }
    } catch (e) {
      print('Error seeding doctors: $e');
    }
  }
}