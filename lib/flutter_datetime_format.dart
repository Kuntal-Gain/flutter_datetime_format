import 'package:intl/intl.dart';

/// A utility class to handle DateTime formatting, both absolute and relative.
/// It provides methods to format dates in different styles such as custom, relative, and time with localization support.
class FLDateTime {

  /// Formats the given [date] using a custom format string.
  ///
  /// The [format] string can include various date/time placeholders such as:
  /// - 'YYYY' for year
  /// - 'MM' for month (2 digits)
  /// - 'DD' for day (2 digits)
  /// - 'HH' for hour (24-hour format, 2 digits)
  /// - 'hh' for hour (12-hour format, 2 digits)
  /// - 'mm' for minutes (2 digits)
  /// - 'ss' for seconds (2 digits)
  /// - 'md' for AM/PM indicator.
  /// 
  /// Example usage:
  /// ```dart
  /// FLDateTime.formatTime(DateTime.now(), 'DD/MM/YYYY HH:mm:ss');
  /// ```
  ///
  /// Returns a formatted string based on the provided format and the current [locale].
  static String formatTime(DateTime? date, String format, {String locale = 'en', String fallback = 'No Date Provided'}) {
    if (date == null) return fallback;

    List<String> weekdays = DateFormat.E(locale).dateSymbols.STANDALONEWEEKDAYS;
    List<String> months = DateFormat.MMMM(locale).dateSymbols.STANDALONEMONTHS;

    String formatted = format
        .replaceAll('EEE', weekdays[(date.weekday % 7)])
        .replaceAll('MMMM', months[date.month - 1])
        .replaceAll('YYYY', date.year.toString())
        .replaceAll('MM', date.month.toString().padLeft(2, '0'))
        .replaceAll('DD', date.day.toString().padLeft(2, '0'))
        .replaceAll('HH', date.hour.toString().padLeft(2, '0'))
        .replaceAll('hh', _formatHour(date.hour))
        .replaceAll('mm', date.minute.toString().padLeft(2, '0'))
        .replaceAll('ss', date.second.toString().padLeft(2, '0'))
        .replaceAll('md', date.hour >= 12 ? 'PM' : 'AM');

    return formatted;
  }

  /// Formats the given [date] into a human-readable relative time string compared to the [referenceDate].
  /// 
  /// The [referenceDate] defaults to the current time if not provided. 
  /// This method returns a string that shows how long ago the [date] was, or how long until it happens.
  ///
  /// Example usage:
  /// ```dart
  /// FLDateTime.formatRelative(DateTime.now().subtract(Duration(hours: 1)));
  /// ```
  ///
  /// Returns a relative time string like "1 hour ago" or "in 2 days".
  static String formatRelative(DateTime date, {DateTime? referenceDate}) {
    referenceDate ??= DateTime.now();
    Duration diff = referenceDate.difference(date);

    if (diff.inSeconds.abs() < 60) {
      return diff.isNegative ? 'in ${diff.inSeconds.abs()} seconds' : '${diff.inSeconds} seconds ago';
    } else if (diff.inMinutes.abs() < 60) {
      return diff.isNegative ? 'in ${diff.inMinutes.abs()} minutes' : '${diff.inMinutes} minutes ago';
    } else if (diff.inHours.abs() < 24) {
      return diff.isNegative ? 'in ${diff.inHours.abs()} hours' : '${diff.inHours} hours ago';
    } else if (diff.inDays.abs() < 7) {
      return diff.isNegative ? 'in ${diff.inDays.abs()} days' : '${diff.inDays} days ago';
    } else {
      int weeks = (diff.inDays / 7).abs().floor();
      return diff.isNegative ? 'in $weeks weeks' : '$weeks weeks ago';
    }
  }

  /// Helper function to format the hour in 12-hour format (1-12).
  ///
  /// Converts the given hour (in 24-hour format) to a 12-hour format.
  /// Example: 13 becomes 1, 22 becomes 10.
  ///
  /// Returns the hour in 12-hour format as a string.
  static String _formatHour(int hour) {
    int hour12 = hour % 12 == 0 ? 12 : hour % 12;
    return hour12.toString().padLeft(2, '0');
  }

  @Deprecated("formatCustom is deprecated, use formatTime instead")
  /// **Deprecated**: This method is deprecated and should no longer be used.
  /// Use [formatTime] instead for custom DateTime formatting.
  ///
  /// Formats the given [date] according to the specified [format] string.
  ///
  /// Example usage:
  /// ```dart
  /// FLDateTime.formatCustom(DateTime.now(), 'DD/MM/YYYY HH:mm:ss');
  /// ```
  /// Returns a formatted string based on the custom format.
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

  @Deprecated("formatHour12 is deprecated, use formatRelative instead")
  /// **Deprecated**: This method is deprecated. Use [formatRelative] instead.
  ///
  /// Helper function to format the hour in 12-hour format (1-12) with AM/PM.
  static String _formatHour12(int hour) {
    int hour12 = hour % 12 == 0 ? 12 : hour % 12;
    return hour12.toString().padLeft(2, '0');
  }

  @Deprecated("formatName is deprecated, use formatTime instead")
  /// **Deprecated**: This method is deprecated and should no longer be used.
  /// Use [formatTime] instead for custom DateTime formatting.
  ///
  /// Formats the given [date] with weekday and month name in a more traditional format.
  ///
  /// Example usage:
  /// ```dart
  /// FLDateTime.formatName(DateTime.now(), 'EEE, MMMM DD, YYYY');
  /// ```
  /// Returns a formatted string with full weekday and month names.
  static String formatName(DateTime date, String format) {
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
