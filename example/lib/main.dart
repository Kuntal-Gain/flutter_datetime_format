import 'package:flutter/material.dart';

import 'package:flutter_datetime_format/flutter_datetime_format.dart' as fd;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime(2024, 9, 22, 14, 5, 30);

    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                fd.FLDateTime.formatCustom(date, 'DD/MM/YYYY - (HH:mm)'),
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                fd.FLDateTime.formatCustom(date, 'DD - MM - YYYY'),
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                fd.FLDateTime.formatWithNames(date, 'EEE, MMMM DD, YYYY'),
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
