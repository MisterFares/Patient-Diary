// lib/presentation/pages/doctor_admin/doctor_dashboard.dart
import 'package:flutter/material.dart';
import 'package:project/core/services/notification_service.dart';
import 'package:project/data/models/appointment_model.dart';
import 'package:project/data/repositories/appointment_repository.dart';
import 'package:project/presentation/widgets/appointment_list_tile.dart';
import 'package:provider/provider.dart';

class DoctorDashboard extends StatefulWidget {
  const DoctorDashboard({super.key});

  @override
  State<DoctorDashboard> createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  List<Appointment> _todayAppointments = [];

  @override
  void initState() {
    super.initState();
    _loadTodayAppointments();
  }

  Future<void> _loadTodayAppointments() async {
    final appointmentRepository = Provider.of<AppointmentRepository>(context, listen: false);
    final allAppointments = await appointmentRepository.getAppointments();
    
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final todayEnd = DateTime(now.year, now.month, now.day, 23, 59, 59);
    
    setState(() {
      _todayAppointments = allAppointments.where((appt) {
        return appt.dateTime.isAfter(todayStart) && 
               appt.dateTime.isBefore(todayEnd) &&
               (appt.status == AppointmentStatus.pending ||
                appt.status == AppointmentStatus.approved);
      }).toList();
    });
  }

  Future<void> _updateAppointmentStatus(
    Appointment appointment, 
    AppointmentStatus newStatus
  ) async {
    final appointmentRepository = Provider.of<AppointmentRepository>(context, listen: false);
    
    final updatedAppointment = Appointment(
      id: appointment.id,
      patientId: appointment.patientId,
      doctorId: appointment.doctorId,
      dateTime: appointment.dateTime,
      status: newStatus,
      createdAt: appointment.createdAt,
      updatedAt: DateTime.now(),
      notes: appointment.notes,
    );
    
    await appointmentRepository.updateAppointment(updatedAppointment);
    
    // Cancel notification if declined or canceled
    if (newStatus == AppointmentStatus.declined || 
        newStatus == AppointmentStatus.canceled) {
      await NotificationService.cancelNotification(appointment.id.hashCode);
    }
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Appointment ${newStatus.name}')),
    );
    
    _loadTodayAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today\'s Appointments'),
      ),
      body: _todayAppointments.isEmpty
          ? const Center(child: Text('No appointments today'))
          : ListView.builder(
              itemCount: _todayAppointments.length,
              itemBuilder: (context, index) {
                final appointment = _todayAppointments[index];
                return AppointmentListTile(
                  appointment: appointment,
                  onStatusUpdate: _updateAppointmentStatus,
                );
              },
            ),
    );
  }
}