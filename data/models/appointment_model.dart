// lib/data/models/appointment_model.dart
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'appointment_model.g.dart';

@HiveType(typeId: 2)
class Appointment {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String patientId;
  
  @HiveField(2)
  final String doctorId;
  
  @HiveField(3)
  final DateTime dateTime;
  
  @HiveField(4)
  final AppointmentStatus status;
  
  @HiveField(5)
  final DateTime createdAt;
  
  @HiveField(6)
  final DateTime? updatedAt;
  
  @HiveField(7)
  final String? notes;
  
  Appointment({
    String? id,
    required this.patientId,
    required this.doctorId,
    required this.dateTime,
    this.status = AppointmentStatus.pending,
    DateTime? createdAt,
    this.updatedAt,
    this.notes,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now();
}

@HiveType(typeId: 3)
enum AppointmentStatus {
  @HiveField(0)
  pending,
  
  @HiveField(1)
  approved,
  
  @HiveField(2)
  declined,
  
  @HiveField(3)
  completed,
  
  @HiveField(4)
  canceled,
  
  @HiveField(5)
  missed,
}