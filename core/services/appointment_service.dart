// lib/core/services/appointment_service.dart
import 'package:project/core/services/local_storage_service.dart';
import 'package:project/data/models/appointment_model.dart';

// lib/core/services/appointment_service.dart
class AppointmentService {
  static Future<void> checkMissedAppointments() async {
    final appointmentsBox = LocalStorageService.appointmentsBox;
    final allAppointments = appointmentsBox.values.cast<Appointment>().toList();
    final now = DateTime.now();
    
    for (final appointment in allAppointments) {
      if (appointment.dateTime.isBefore(now) &&
          (appointment.status == AppointmentStatus.pending ||
           appointment.status == AppointmentStatus.approved)) {
        
        final updatedAppointment = Appointment(
          id: appointment.id,
          patientId: appointment.patientId,
          doctorId: appointment.doctorId,
          dateTime: appointment.dateTime,
          status: AppointmentStatus.missed,
          createdAt: appointment.createdAt,
          updatedAt: DateTime.now(),
          notes: appointment.notes,
        );
        
        await appointmentsBox.put(updatedAppointment.id, updatedAppointment);
      }
    }
  }
}