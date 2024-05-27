class CareerListItem {
  final int no;
  final String title;
  final List<String> imgs;
  final HospitalListItem hospital;

  CareerListItem({
    required this.no,
    required this.title,
    required this.imgs,
    required this.hospital,
  });

  factory CareerListItem.fromJson(Map<String, dynamic> json) {
    return CareerListItem(
      no: json['no'],
      title: json['title'],
      imgs: List<String>.from(json['imgs']),
      hospital: HospitalListItem.fromJson(json['hospital']),
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
