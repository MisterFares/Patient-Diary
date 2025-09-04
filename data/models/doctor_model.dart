// lib/data/models/doctor_model.dart
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'doctor_model.g.dart';

@HiveType(typeId: 0)
class Doctor {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String name;
  
  @HiveField(2)
  final String specialty;
  
  @HiveField(3)
  final String avatarUrl;
  
  @HiveField(4)
  final List<WorkDay> workDays;
  
  Doctor({
    String? id,
    required this.name,
    required this.specialty,
    required this.avatarUrl,
    required this.workDays,
  }) : id = id ?? const Uuid().v4();
}

@HiveType(typeId: 1)
class WorkDay {
  @HiveField(0)
  final int weekday; // 1 = Monday, 7 = Sunday
  
  @HiveField(1)
  final List<String> slots;
  
  WorkDay({
    required this.weekday,
    required this.slots,
  });
}