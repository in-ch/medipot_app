String getCurrentDate() {
  DateTime now = DateTime.now();
  String formattedDate =
      "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
  return formattedDate;
}
