import 'package:intl/intl.dart';

String calculateDday(String deadline) {
  DateTime now = DateTime.now();
  DateTime dueDate;

  try {
    DateFormat dateFormat1 = DateFormat("yyyy.MM.dd");
    dueDate = dateFormat1.parse(deadline);
  } catch (e) {
    try {
      DateFormat dateFormat2 = DateFormat("yyyy-MM-dd HH:mm:ss");
      dueDate = dateFormat2.parse(deadline);
    } catch (e) {
      return '';
    }
  }

  Duration difference = dueDate.difference(now);
  int days = difference.inDays;

  return days < 0
      ? '마감'
      : days == 0
          ? '오늘 마감'
          : "D-$days";
}
