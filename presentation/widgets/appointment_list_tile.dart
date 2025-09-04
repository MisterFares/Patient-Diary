import 'package:flutter/material.dart';
import 'package:project/data/models/appointment_model.dart';

class AppointmentListTile extends StatelessWidget {
  final Appointment appointment;
  final Future<void> Function(Appointment, AppointmentStatus) onStatusUpdate;

  const AppointmentListTile({
    super.key,
    required this.appointment,
    required this.onStatusUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text(
          "Patient ID: ${appointment.patientId}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Doctor ID: ${appointment.doctorId}"),
            Text("Date: ${appointment.dateTime.toLocal()}"),
            Text("Status: ${appointment.status.name}"),
            if (appointment.notes != null && appointment.notes!.isNotEmpty)
              Text("Notes: ${appointment.notes}"),
          ],
        ),
        isThreeLine: true,
        trailing: PopupMenuButton<AppointmentStatus>(
          icon: const Icon(Icons.more_vert),
          onSelected: (status) => onStatusUpdate(appointment, status),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: AppointmentStatus.approved,
              child: Text('Approve'),
            ),
            const PopupMenuItem(
              value: AppointmentStatus.declined,
              child: Text('Decline'),
            ),
            const PopupMenuItem(
              value: AppointmentStatus.canceled,
              child: Text('Cancel'),
            ),
            const PopupMenuItem(
              value: AppointmentStatus.completed,
              child: Text('Mark as Completed'),
            ),
          ],
        ),
      ),
    );
  }
}
