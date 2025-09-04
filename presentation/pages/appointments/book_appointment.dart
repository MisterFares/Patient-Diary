// lib/presentation/pages/appointments/book_appointment.dart
import 'package:flutter/material.dart';
import 'package:project/core/services/notification_service.dart';
import 'package:project/data/models/appointment_model.dart';
import 'package:project/data/models/doctor_model.dart';
import 'package:project/data/repositories/appointment_repository.dart';
import 'package:provider/provider.dart';

class BookAppointmentScreen extends StatefulWidget {
  final Doctor doctor;

  const BookAppointmentScreen({super.key, required this.doctor});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  DateTime? _selectedDate;
  String? _selectedTime;
  final TextEditingController _notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book with ${widget.doctor.name}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor info
            // Date selection
            // Time slot selection
            // Notes field
            // Book button
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _selectedTime = null;
      });
    }
  }

  Future<void> _bookAppointment() async {
    if (_selectedDate == null || _selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select date and time')),
      );
      return;
    }

    final appointmentRepository = Provider.of<AppointmentRepository>(context, listen: false);
    
    // Combine date and time
    final timeParts = _selectedTime!.split(':');
    final hours = int.parse(timeParts[0]);
    final minutes = int.parse(timeParts[1].split(' ')[0]);
    final isPm = _selectedTime!.contains('PM');
    
    final appointmentDateTime = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
      isPm && hours != 12 ? hours + 12 : hours,
      minutes,
    );

    // Check if slot is available
    final isAvailable = await appointmentRepository.isSlotAvailable(
      widget.doctor.id,
      appointmentDateTime,
    );

    if (!isAvailable) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('This time slot is not available')),
      );
      return;
    }

    // Create appointment
    final appointment = Appointment(
      doctorId: widget.doctor.id,
      patientId: 'current_patient_id', // You'll need to implement patient management
      dateTime: appointmentDateTime,
      notes: _notesController.text.isNotEmpty ? _notesController.text : null,
    );

    await appointmentRepository.addAppointment(appointment);

    // Schedule notification
    await NotificationService.scheduleAppointmentNotification(
      appointment.id.hashCode,
      'Appointment Reminder',
      'You have an appointment with ${widget.doctor.name} in 1 hour',
      appointmentDateTime,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Appointment booked successfully')),
    );

    Navigator.pop(context);
  }
}