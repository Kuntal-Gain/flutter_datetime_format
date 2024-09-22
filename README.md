# Flutter Datetime Format 🌟

### A simple plugin to format dates and times in Flutter. 📅

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
- **`a`**: AM/PM marker (e.g., AM, PM) 🌙

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

## Example Usage 💻
Here is an example of how to use the `flutter_datetime_format` to format dates and times:

```
import 'package:flutter_datetime_format/flutter_datetime_format.dart' as fd;

void main() {
  DateTime now = DateTime.now();

  // Example 1: Format as 'DD/MM/YYYY'
  String formattedDate1 = FLDateTime.formatWithNames(now, 'DD/MM/YYYY');
  print(formattedDate1); // Output: 22/09/2024

  // Example 2: Format as 'YYYY-MM-DD HH:mm:ss'
  String formattedDate2 = FLDateTime.formatWithNames(now, 'YYYY-MM-DD HH:mm:ss');
  print(formattedDate2); // Output: 2024-09-22 14:05:30

  // Example 3: Format with full month name and weekday
  String formattedDate3 = FLDateTime.formatWithNames(now, 'EEE, MMMM DD, YYYY');
  print(formattedDate3); // Output: Sun, September 22, 2024

  // Example 4: 12-hour format with AM/PM
  String formattedDate4 = FLDateTime.formatWithNames(now, 'hh:mm a');
  print(formattedDate4); // Output: 02:05 PM
}
```

## Features ✨
- Format dates with custom format strings.
Support for both 12-hour (hh) and 24-hour (HH) formats.

- Easily convert DateTime objects to human-readable strings using predefined aliases.
- Includes full month names and abbreviated weekday names.