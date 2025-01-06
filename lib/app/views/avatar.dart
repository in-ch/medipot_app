import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.url,
    required this.radius,
  });

  const Avatar.small({
    super.key,
    required this.url,
  }) : radius = 16;

  const Avatar.medium({
    super.key,
    required this.url,
  }) : radius = 22;

  const Avatar.large({
    super.key,
    required this.url,
  }) : radius = 44;

  final double radius;
  final String url;

  @override
  Widget build(BuildContext context) {
    return CircularImageWidget(
      imageUrl: url,
      radius: radius,
    );
  }
}

class CircularImageWidget extends StatefulWidget {
  final String imageUrl;
  final double radius;

  const CircularImageWidget({
    super.key,
    required this.imageUrl,
    this.radius = 50.0,
  });

  @override
  _CircularImageWidgetState createState() => _CircularImageWidgetState();
}

class _CircularImageWidgetState extends State<CircularImageWidget> {
  Uint8List? imageBytes;

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  Future<void> loadImage() async {
    final response = await http.get(Uri.parse(widget.imageUrl));
    if (response.statusCode == 200) {
      setState(() {
        imageBytes = response.bodyBytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: widget.radius,
      backgroundImage: imageBytes != null ? MemoryImage(imageBytes!) : null,
    );
  }
}
