String diffTime(String date) {
  DateTime givenDate = DateTime.parse(date);
  DateTime currentDate = DateTime.now();

// 차이 계산
  Duration difference = currentDate.difference(givenDate);

  // 일 전
  int days = difference.inDays;
  if (days > 0) {
    return '$days일 전';
  }

  // 주 전
  int weeks = days ~/ 7;
  if (weeks > 0 && days % 7 == 0) {
    return '$weeks 전';
  }

  // 시간 전
  int hours = difference.inHours % 24;
  if (hours > 0) {
    return '$hours시간 전';
  }

  // 분 전
  int minutes = difference.inMinutes % 60;
  if (minutes > 0) {
    return '$minutes분 전';
  }

  // 년 전
  int years = days ~/ 365;
  if (years > 0 && days % 365 == 0) {
    return '$years년 전';
  }

  return date.split('.')[0];
}
