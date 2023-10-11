class Event {
  final int no;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String title;
  final String img;
  final String href;
  final DateTime startDate;
  final DateTime endDate;

  Event({
    required this.no,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.img,
    required this.href,
    required this.startDate,
    required this.endDate,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      no: json['no'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      title: json['title'],
      img: json['img'],
      href: json['href'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
    );
  }
}
