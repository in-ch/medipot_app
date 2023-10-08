import 'package:medipot_app/data/models/models.dart';

class LikeLocation {
  int no;
  String createdAt;
  String updatedAt;
  Location location;

  LikeLocation(
      {required this.no,
      required this.createdAt,
      required this.updatedAt,
      required this.location});

  factory LikeLocation.fromJson(Map<String, dynamic> json) {
    return LikeLocation(
      no: json['no'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      location: Location.fromJson(json['location']),
    );
  }
}
