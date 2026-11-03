// ============================================================
// date_formatter.dart
// ============================================================
class DateFormatter {
  DateFormatter._();

  static const List<String> _weekdays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  static const List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  static String fullDate(DateTime date) {
    final weekday = _weekdays[date.weekday - 1]; // weekday: 1=Mon ... 7=Sun
    final month = _months[date.month - 1];
    return '$weekday, $month ${date.day}, ${date.year}';
  }
}
