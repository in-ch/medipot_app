class Refresh {
  final String authorization;

  Refresh({
    required this.authorization,
  });

  factory Refresh.fromJson(Map<String, dynamic> json) {
    return Refresh(
      authorization: json['authorization'],
    );
  }
}
