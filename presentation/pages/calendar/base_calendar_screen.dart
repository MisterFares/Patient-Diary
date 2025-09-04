// lib/presentation/pages/calendar/base_calendar_screen.dart
import 'package:flutter/material.dart';
import 'package:project/core/constants/app_constants.dart';
import 'package:project/core/utils/calendar_utils.dart';
import 'package:project/core/widgets/buttons/primary_button.dart';

abstract class BaseCalendarScreen extends StatefulWidget {
  final String screenTitle;
  
  const BaseCalendarScreen({super.key, required this.screenTitle});
}

abstract class BaseCalendarScreenState<T extends BaseCalendarScreen> extends State<T> {
  DateTime _currentDate = DateTime(2025, 8, 27);
  int? _selectedDay;
  String? _selectedTime;
  
  final List<String> _timeSlots = AppConstants.timeSlots;
  
  void _goToPreviousMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month - 1);
      _selectedDay = null;
      _selectedTime = null;
    });
  }

  void _goToNextMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month + 1);
      _selectedDay = null;
      _selectedTime = null;
    });
  }
  
  void onDateTimeSelected(DateTime date, String time);
  
  @override
  Widget build(BuildContext context) {
    List<List<int?>> calendarData = CalendarUtils.generateCalendarData(_currentDate);
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
        ),
        title: Text(
          widget.screenTitle,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: AppConstants.fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        backgroundColor: AppConstants.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Month navigation
              Container(
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(width: 0.1, color: AppConstants.textSecondary))
                ),
                margin: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: AppConstants.textSecondary, size: 18),
                      onPressed: _goToPreviousMonth,
                    ),
                    Text(
                      '${CalendarUtils.monthNames[_currentDate.month - 1]} ${_currentDate.year}',
                      style: const TextStyle(
                        color: AppConstants.textSecondary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, color: AppConstants.textSecondary, size: 18),
                      onPressed: _goToNextMonth,
                    ),
                  ],
                ),
              ),
              
              // Weekday headers
              Row(
                children: CalendarUtils.weekdays.map((day) {
                  return Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        day,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppConstants.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              
              // Calendar days
              SizedBox(
                height: 205,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: calendarData.length,
                  itemBuilder: (context, weekIndex) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        children: List.generate(7, (weekdayIndex) {
                          int? day = calendarData[weekIndex][weekdayIndex];
                          bool isSelected = day == _selectedDay;
                          
                          return Expanded(
                            child: InkWell(
                              onTap: day == null ? null : () {
                                setState(() {
                                  _selectedDay = day;
                                });
                              },
                              child: Container(
                                height: 32,
                                margin: const EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                  color: isSelected && day != null ? AppConstants.primaryColor : Colors.transparent,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                  child: Text(
                                    day == null ? '' : day.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: isSelected 
                                        ? Colors.white 
                                        : (day != null ? AppConstants.textSecondary : Colors.transparent),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Time slots section
              const Align(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  'Slots Available',
                  style: TextStyle(
                    color: AppConstants.textSecondary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
              const SizedBox(height: 15),
              
              // Time slots grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 4,
                ),
                itemCount: _timeSlots.length,
                itemBuilder: (context, index) {
                  bool isSelected = _selectedTime == _timeSlots[index];
                  
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedTime = _timeSlots[index];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? AppConstants.primaryColor : const Color(0xFFE0E0E0),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          _timeSlots[index],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isSelected ? AppConstants.primaryColor : AppConstants.textSecondary,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              
              const SizedBox(height: 81),
              
              // Continue button
              if (_selectedDay != null && _selectedTime != null)
                PrimaryButton(
                  width: double.infinity,
                  text: 'Save',
                  onPressed: () {
                    final selectedDate = DateTime(
                      _currentDate.year, 
                      _currentDate.month, 
                      _selectedDay!
                    );
                    onDateTimeSelected(selectedDate, _selectedTime!);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}