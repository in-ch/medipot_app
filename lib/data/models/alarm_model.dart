class Alarm {
  final int no;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String type;
  final String title;
  final String body;
  final String page;
  final int pageNo;
  final int user;

  Alarm({
    required this.no,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
    required this.title,
    required this.body,
    required this.page,
    required this.pageNo,
    required this.user,
  });

  factory Alarm.fromJson(Map<String, dynamic> json) {
    return Alarm(
      no: json['no'],
      createdAt:
          DateTime.parse(json['createdAt']).add(const Duration(hours: 9)),
      updatedAt:
          DateTime.parse(json['updatedAt']).add(const Duration(hours: 9)),
      type: json['type'],
      title: json['title'],
      body: json['body'],
      page: json['page'],
      pageNo: json['pageNo'],
      user: json['user'],
    );
  }
}
