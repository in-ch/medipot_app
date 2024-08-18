import 'package:intl/intl.dart';

String getFormattedHourTime() {
  final now = DateTime.now();
  final formatter = DateFormat('HH');
  final formattedHour = formatter.format(now);
  return '$formattedHour:00';
}
