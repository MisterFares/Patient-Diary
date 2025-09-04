// lib/data/repositories/appointment_repository.dart
import 'package:hive/hive.dart';
import 'package:project/data/models/appointment_model.dart';

class AppointmentRepository {
  final Box appointmentsBox;

  AppointmentRepository({required this.appointmentsBox});

  Future<List<Appointment>> getAppointments() async {
    return appointmentsBox.values.cast<Appointment>().toList();
  }

  Future<List<Appointment>> getAppointmentsByStatus(AppointmentStatus status) async {
    final allAppointments = await getAppointments();
    return allAppointments.where((appt) => appt.status == status).toList();
  }

  Future<void> addAppointment(Appointment appointment) async {
    await appointmentsBox.put(appointment.id, appointment);
  }

  Future<void> updateAppointment(Appointment appointment) async {
    await appointmentsBox.put(appointment.id, appointment);
  }

  Future<void> deleteAppointment(String id) async {
    await appointmentsBox.delete(id);
  }

  Future<bool> isSlotAvailable(String doctorId, DateTime dateTime) async {
    final allAppointments = await getAppointments();
    return !allAppointments.any((appt) =>
        appt.doctorId == doctorId &&
        appt.dateTime == dateTime &&
        (appt.status == AppointmentStatus.pending ||
            appt.status == AppointmentStatus.approved));
  }
}