// lib/data/models/patient_model.dart
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'patient_model.g.dart';

@HiveType(typeId: 4)
class Patient {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String fullName;
  
  @HiveField(2)
  final int age;
  
  @HiveField(3)
  final String gender;
  
  @HiveField(4)
  final String phoneNumber;
  
  @HiveField(5)
  final String address;
  
  @HiveField(6)
  final String medicalHistory;
  
  @HiveField(7)
  final DateTime createdAt;

  Patient({
    String? id,
    required this.fullName,
    required this.age,
    required this.gender,
    required this.phoneNumber,
    required this.address,
    required this.medicalHistory,
    DateTime? createdAt,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now();
}