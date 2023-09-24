class ApiResponse<T> {
  final int statusCode;
  final String type;
  final T data;

  ApiResponse({
    required this.statusCode,
    required this.type,
    required this.data,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return ApiResponse(
      statusCode: json['statusCode'],
      type: json['type'],
      data: fromJsonT(json['data']),
    );
  }
}
