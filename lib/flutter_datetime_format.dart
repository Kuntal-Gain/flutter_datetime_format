class FLDateTime {
  // Method to format DateTime
  static String formatCustom(DateTime date, String format) {
    String formatted = format
        .replaceAll('YYYY', date.year.toString())
        .replaceAll('MM', date.month.toString().padLeft(2, '0'))
        .replaceAll('DD', date.day.toString().padLeft(2, '0'))
        .replaceAll('HH', date.hour.toString().padLeft(2, '0'))
        .replaceAll('hh', _formatHour12(date.hour))
        .replaceAll('mm', date.minute.toString().padLeft(2, '0'))
        .replaceAll('ss', date.second.toString().padLeft(2, '0'))
        .replaceAll('a', date.hour >= 12 ? 'PM' : 'AM');

    return formatted;
  }

  // Helper function to format hour in 12-hour format
  static String _formatHour12(int hour) {
    int hour12 = hour % 12 == 0 ? 12 : hour % 12;
    return hour12.toString().padLeft(2, '0');
  }

  static String formatWithNames(DateTime date, String format) {
    List<String> weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    List<String> months = [
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
      'December'
    ];

    String formatted = format
        .replaceAll('EEE', weekdays[(date.weekday % 7)])
        .replaceAll('MMMM', months[date.month - 1])
        .replaceAll('YYYY', date.year.toString())
        .replaceAll('MM', date.month.toString().padLeft(2, '0'))
        .replaceAll('DD', date.day.toString().padLeft(2, '0'))
        .replaceAll('HH', date.hour.toString().padLeft(2, '0'))
        .replaceAll('hh', _formatHour12(date.hour))
        .replaceAll('mm', date.minute.toString().padLeft(2, '0'))
        .replaceAll('ss', date.second.toString().padLeft(2, '0'))
        .replaceAll('a', date.hour >= 12 ? 'PM' : 'AM');

    return formatted;
  }
}
