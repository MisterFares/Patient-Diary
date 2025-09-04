// lib/core/utils/calendar_utils.dart
class CalendarUtils {
  static List<String> get weekdays => ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  
  static List<String> get monthNames => [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];
  
  static List<List<int?>> generateCalendarData(DateTime date) {
    List<List<int?>> calendarData = [];
    
    DateTime firstDay = DateTime(date.year, date.month, 1);
    int daysInMonth = DateTime(date.year, date.month + 1, 0).day;
    
    int startingWeekday = firstDay.weekday % 7;
    
    List<int?> currentWeek = List.filled(7, null);
    int dayCounter = 1;
    
    for (int i = startingWeekday; i < 7; i++) {
      currentWeek[i] = dayCounter++;
    }
    calendarData.add(List.from(currentWeek));
    
    while (dayCounter <= daysInMonth) {
      currentWeek = List.filled(7, null);
      for (int i = 0; i < 7 && dayCounter <= daysInMonth; i++) {
        currentWeek[i] = dayCounter++;
      }
      calendarData.add(List.from(currentWeek));
    }
    
    return calendarData;
  }
}