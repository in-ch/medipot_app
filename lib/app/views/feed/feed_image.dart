import 'package:flutter/material.dart';

class FeedImage extends StatelessWidget {
  final String imageUrl;
  final double circleSize = 60.0;
  final bool isDetail;
  final List<String> images;

  const FeedImage(
      {super.key,
      required this.imageUrl,
      required this.isDetail,
      required this.images});

  @override
  Widget build(BuildContext context) {
    final int imageCount = images.length - 1;
    return isDetail
        ? Column(
            children: images
                .map(
                  (image) => Padding(
                    padding:
                        const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 8),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                )
                .toList(),
          )
        : SizedBox(
            height: 210,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: 10.0, left: isDetail ? 10 : 60, right: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  images.length > 1
                      ? Container(
                          width: circleSize,
                          height: circleSize,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(45, 66, 185, 0.8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "$imageCount +",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          );
  }
}
