import 'package:flutter_datetime_format/flutter_datetime_format.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Custom format date', () {
    DateTime date = DateTime(2024, 9, 22, 14, 5, 30);

    expect(FLDateTime.formatCustom(date, 'DD/MM/YYYY'), '22/09/2024');
    expect(FLDateTime.formatCustom(date, 'YYYY-MM-DD HH:mm:ss'),
        '2024-09-22 14:05:30');
    expect(FLDateTime.formatCustom(date, 'hh:mm a'), '02:05 PM');
  });
}
