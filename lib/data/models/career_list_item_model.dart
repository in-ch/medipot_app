class CareerListItem {
  final int no;
  final String title;
  final String deadline;
  final List<String> imgs;
  final HospitalListItem? hospital;

  CareerListItem({
    required this.no,
    required this.title,
    required this.imgs,
    required this.deadline,
    this.hospital,
  });

  factory CareerListItem.fromJson(Map<String, dynamic> json) {
    return CareerListItem(
      no: json['no'],
      title: json['title'],
      deadline: (json['deadline'] ?? "").trim(),
      imgs: List<String>.from(json['imgs']),
      hospital: json['hospital'] != null
          ? HospitalListItem.fromJson(json['hospital'])
          : null,
    );
  }
}

class HospitalListItem {
  final String name;

  HospitalListItem({
    required this.name,
  });

  factory HospitalListItem.fromJson(Map<String, dynamic> json) {
    return HospitalListItem(
      name: json['name'],
    );
  }
}
