class Location {
  int no;
  String createdAt;
  String updatedAt;
  String name;
  int deposit;
  int depositMonly;
  dynamic premium;
  int manageCost;
  int brokerage;
  List<String> departments;
  List<String> keywords;
  dynamic dedicatedArea;
  dynamic supplyArea;
  String etc;
  String simpleAddress;
  String parkingCapacity;
  String approvalDate;
  List<String> imgs;
  String lat;
  String lng;
  bool isApproved;

  Location(
      {required this.no,
      required this.createdAt,
      required this.updatedAt,
      required this.name,
      required this.deposit,
      required this.depositMonly,
      required this.premium,
      required this.manageCost,
      required this.brokerage,
      required this.departments,
      required this.keywords,
      required this.dedicatedArea,
      required this.supplyArea,
      required this.etc,
      required this.simpleAddress,
      required this.parkingCapacity,
      required this.approvalDate,
      required this.imgs,
      required this.lat,
      required this.lng,
      required this.isApproved});

  factory Location.fromJson(Map<String, dynamic> json) {
    List<dynamic> departments = json['departments'];
    List<String> departmentList =
        departments.map((item) => item.toString()).toList();

    List<dynamic> keywords = json['keywords'];
    List<String> keywordList = keywords.map((item) => item.toString()).toList();

    List<dynamic> imgs = json['imgs'];
    List<String> imgList = imgs.map((item) => item.toString()).toList();

    return Location(
      no: json['no'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      name: json['name'],
      deposit: json['deposit'],
      depositMonly: json['depositMonly'],
      premium: json['premium'],
      manageCost: json['manageCost'],
      brokerage: json['brokerage'],
      departments: departmentList,
      keywords: keywordList,
      dedicatedArea: json['dedicatedArea'],
      supplyArea: json['supplyArea'],
      etc: json['etc'],
      simpleAddress: json['simpleAddress'],
      parkingCapacity: json['parkingCapacity'],
      approvalDate: json['approvalDate'],
      imgs: imgList,
      lat: json['lat'],
      lng: json['lng'],
      isApproved: json['isApproved'],
    );
  }
}
