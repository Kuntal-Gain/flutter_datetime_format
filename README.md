


# Flutter Datetime Format 🌟

### A simple plugin to format dates and times in Flutter. 📅

<p align="center">
<a href="https://pub.dev/packages/flutter_datetime_format"><img src="https://img.shields.io/pub/v/flutter_datetime_format.svg" alt="Pub"></a>
<!-- <a href="https://github.com/Kuntal-Gain/flutter_datetime_format/actions"><img src="https://github.com/felangel/bloc/workflows/build/badge.svg" alt="build"></a> -->
<a href="https://github.com/Kuntal-Gain/flutter_datetime_format"><img src="https://img.shields.io/github/stars/Kuntal-Gain/flutter_datetime_format.svg?style=flat&logo=github&colorB=deeppink&label=stars" alt="Star on Github"></a>
<a href="https://flutter.dev/docs/development/data-and-backend/state-mgmt/options#bloc--rx"><img src="https://img.shields.io/badge/flutter-website-deepskyblue.svg" alt="Flutter Website"></a>
<a href="https://github.com/Solido/awesome-flutter#standard"><img src="https://img.shields.io/badge/awesome-flutter-blue.svg?longCache=true" alt="Awesome Flutter"></a>
<a href="https://fluttersamples.com"><img src="https://img.shields.io/badge/flutter-samples-teal.svg?longCache=true" alt="Flutter Samples"></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>

</p>

## Introduction 🚀

The `flutter_datetime_format` package provides an easy-to-use plugin for formatting `DateTime` objects into custom date/time strings. This plugin supports common date and time placeholders, which can be formatted to display full month names, abbreviated weekdays, and more. It is highly flexible, allowing developers to specify custom format patterns using predefined aliases. 🚀

## Format Aliases 🔤

You can use the following placeholders (aliases) in the custom format strings:

- **`YYYY`**: Year (e.g., 2024) 📆
- **`MM`**: Month as two digits (e.g., 09 for September) 🗓️
- **`MMMM`**: Full month name (e.g., September) 🌼
- **`DD`**: Day of the month as two digits (e.g., 05) 🔢
- **`EEE`**: Abbreviated weekday name (e.g., Sun, Mon) 📅
- **`HH`**: Hour (24-hour format, e.g., 14 for 2 PM) ⏰
- **`hh`**: Hour (12-hour format, e.g., 02 for 2 PM) 🕑
- **`mm`**: Minutes as two digits (e.g., 05) ⏲️
- **`ss`**: Seconds as two digits (e.g., 30) ⏱️
- **`md`**: AM/PM marker (e.g., AM, PM) 🌙

## Installation 📦

To use this package, add `flutter_datetime_format` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  flutter_datetime_format: ^0.0.1
```

Then, run:

```
flutter pub get
```

---

## Example Usage 💻

Here is an example of how to use the `flutter_datetime_format` to format dates and times:

```dart
import 'package:flutter_datetime_format/flutter_datetime_format.dart' as fd;

void main() {
  DateTime now = DateTime.now();

  // Example 1: Format as 'DD/MM/YYYY'
  String formattedDate1 = FLDateTime.formatTime(now, 'DD/MM/YYYY');
  print(formattedDate1); // Output: 22/09/2024

  // Example 2: Format as 'YYYY-MM-DD HH:mm:ss'
  String formattedDate2 = FLDateTime.formatTime(now, 'YYYY-MM-DD HH:mm:ss');
  print(formattedDate2); // Output: 2024-09-22 14:05:30

  // Example 3: Format with full month name and weekday
  String formattedDate3 = FLDateTime.formatTime(now, 'EEE, MMMM DD, YYYY');
  print(formattedDate3); // Output: Sun, September 22, 2024

  // Example 4: 12-hour format with AM/PM
  String formattedDate4 = FLDateTime.formatTime(now, 'hh:mm a');
  print(formattedDate4); // Output: 02:05 PM

  // New Example 5: Using the updated method 'formatTime' for custom format
  String formattedDate5 = FLDateTime.formatTime(now, 'DD MMMM YYYY, hh:mm:ss a');
  print(formattedDate5); // Output: 22 September 2024, 02:05:30 PM

  // New Example 6: Using the method 'formatRelative' for relative date formatting
  String relativeDate = FLDateTime.formatRelative(now.subtract(Duration(days: 1)));
  print(relativeDate); // Output: 1 day ago (depends on the current time)

}
```

---

### Key Updates:
- `formatTime(date,format)`: Add `formatTime` for localized date formatting and custom format support.
- `formatRelative(date,ref)`: Add `formatRelative` for formatting relative time like "2 hours ago" or "in 3 days".
- **deprecate**: `formatCustom` → Use `formatTime` instead.
- **deprecate**: `formatHour12` → Use `formatTime` instead.
- **deprecate**: `formatName` → Use `formatTime` instead.
- **fix**: Handle `null` `DateTime` values with fallback string in `formatTime`.


## Resources 📌

- [Flutter](https://flutter.dev) 🐦
- [Dart](https://dart.dev) 🦸‍♂️


---

Feel free to contribute, report issues, or request new features on [GitHub](https://github.com/your-repo/flutter_datetime_format).
```

I've added the chips section at the end, which includes links to the Flutter, Dart, Bloc, and State Management docs. You can customize the chip links further according to your needs.

Let me know if you need further modifications!