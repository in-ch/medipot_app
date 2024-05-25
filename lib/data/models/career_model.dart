class Career {
  final int no;
  final String createdAt;
  final String updatedAt;
  final String title;
  final List<String> imgs;
  final List<String> keywords;
  final String detail;
  final String invitedSubject;
  final String invitationType;
  final String experience;
  final String reasonForHiring;
  final String salary;
  final String workingHours;
  final String onCallDuty;
  final bool conferenceAttendance;
  final String otherDetails;
  final String deadline;
  final String contactPerson;
  final String contactEmail;
  final String contactPhone;
  final Hospital hospital;

  Career({
    required this.no,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.imgs,
    required this.keywords,
    required this.detail,
    required this.invitedSubject,
    required this.invitationType,
    required this.experience,
    required this.reasonForHiring,
    required this.salary,
    required this.workingHours,
    required this.onCallDuty,
    required this.conferenceAttendance,
    required this.otherDetails,
    required this.deadline,
    required this.contactPerson,
    required this.contactEmail,
    required this.contactPhone,
    required this.hospital,
  });

  factory Career.fromJson(Map<String, dynamic> json) {
    return Career(
      no: json['no'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      title: json['title'],
      imgs: List<String>.from(json['imgs']),
      keywords: List<String>.from(json['keywords']),
      detail: json['detail'],
      invitedSubject: json['invitedSubject'],
      invitationType: json['invitationType'],
      experience: json['experience'],
      reasonForHiring: json['reasonForHiring'],
      salary: json['salary'],
      workingHours: json['workingHours'],
      onCallDuty: json['onCallDuty'],
      conferenceAttendance: json['conferenceAttendance'],
      otherDetails: json['otherDetails'],
      deadline: json['deadline'],
      contactPerson: json['contactPerson'],
      contactEmail: json['contactEmail'],
      contactPhone: json['contactPhone'],
      hospital: Hospital.fromJson(json['hospital']),
    );
  }
}

class Hospital {
  final int no;
  final String createdAt;
  final String updatedAt;
  final String name;
  final String logo;
  final String location;
  final String locationDetail;
  final double lat;
  final double lng;
  final String homepage;

  Hospital({
    required this.no,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.logo,
    required this.location,
    required this.locationDetail,
    required this.lat,
    required this.lng,
    required this.homepage,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      no: json['no'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      name: json['name'],
      logo: json['logo'],
      location: json['location'],
      locationDetail: json['location_detail'],
      lat: double.parse(json['lat']),
      lng: double.parse(json['lng']),
      homepage: json['homepage'],
    );
  }
}
