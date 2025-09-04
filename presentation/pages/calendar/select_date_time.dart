// lib/presentation/pages/calendar/select_date_time.dart
import 'package:flutter/material.dart';
import 'package:project/core/constants/app_constants.dart';
import 'package:project/presentation/pages/calendar/base_calendar_screen.dart';

class SelectDateTime extends BaseCalendarScreen {
  const SelectDateTime({super.key}) : super(screenTitle: 'Select Date & Time');
  
  @override
  State<SelectDateTime> createState() => _SelectDateTimeState();
}

class _SelectDateTimeState extends BaseCalendarScreenState<SelectDateTime> {
  @override
  void onDateTimeSelected(DateTime date, String time) {
    // Handle date/time selection logic
    Navigator.pushNamed(context, AppConstants.routeAppointmentDetails);
  }
}

// lib/presentation/pages/calendar/reschedule_appointment.dart
class RescheduleAppointment extends BaseCalendarScreen {
  const RescheduleAppointment({super.key}) : super(screenTitle: 'Reschedule Appointment');
  
  @override
  State<RescheduleAppointment> createState() => _RescheduleAppointmentState();
}

class _RescheduleAppointmentState extends BaseCalendarScreenState<RescheduleAppointment> {
  @override
  void onDateTimeSelected(DateTime date, String time) {
    // Handle reschedule logic
    Navigator.pushNamed(context, AppConstants.routeAppointmentDetails);
  }
}