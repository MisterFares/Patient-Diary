// lib/domain/entities/appointment.dart
class Appointment {
  final String id;
  final String patientName;
  final int patientAge;
  final DateTime dateTime;
  final AppointmentStatus status;
  final String? notes;
  
  Appointment({
    required this.id,
    required this.patientName,
    required this.patientAge,
    required this.dateTime,
    required this.status,
    this.notes,
  });
}

enum AppointmentStatus {
  upcoming,
  completed,
  missed,
}