class Consult {
  final int no;
  final String createdAt;
  final String updatedAt;
  final String name;
  final String type;
  final String phone;
  final String detail;
  final bool isDone;
  final int user;

  Consult({
    required this.no,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.type,
    required this.phone,
    required this.detail,
    required this.isDone,
    required this.user,
  });

  factory Consult.fromJson(Map<String, dynamic> json) {
    return Consult(
      no: json['no'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      name: json['name'],
      type: json['type'],
      phone: json['phone'],
      detail: json['detail'],
      isDone: json['isDone'],
      user: json['user'],
    );
  }
}
