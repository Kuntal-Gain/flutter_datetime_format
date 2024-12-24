import 'package:flutter/material.dart';
import 'package:flutter_datetime_format/flutter_datetime_format.dart' as fd;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  // Initialize the locale data
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('fr', null); // Example: Initialize for French
  await initializeDateFormatting('es', null); // Example: Initialize for Spanish

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime(2024, 9, 22, 14, 5, 30); // Example date
    DateTime pastDate = DateTime.now().subtract(const Duration(hours: 5)); // 5 hours ago
    DateTime futureDate = DateTime.now().add(const Duration(days: 2)); // 2 days from now
    DateTime? nullDate; // Example null date


    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Example 1: Default formatting
            Center(
              child: Text(
                fd.FLDateTime.formatTime(date, 'DD/MM/YYYY - (HH:mm)'),
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Example 2: Localization Support
            Center(
              child: Text(
                fd.FLDateTime.formatTime(date, 'EEE, MMMM DD, YYYY', locale: 'en'),
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                fd.FLDateTime.formatTime(date, 'EEE, MMMM DD, YYYY', locale: 'es'),
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Example 3: Relative Time Formatting
            Center(
              child: Text(
                fd.FLDateTime.formatRelative(pastDate),
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                fd.FLDateTime.formatRelative(futureDate),
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Example 4: Null Date with Fallback
            Center(
              child: Text(
                fd.FLDateTime.formatTime(nullDate, 'DD/MM/YYYY'),
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
