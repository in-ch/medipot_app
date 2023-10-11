class ImageUploadModel {
  final String url;

  ImageUploadModel({
    required this.url,
  });

  factory ImageUploadModel.fromJson(Map<String, dynamic> json) {
    return ImageUploadModel(
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
    };
  }
}
