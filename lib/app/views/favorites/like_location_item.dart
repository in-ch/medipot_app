import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:medipot_app/app/routes/routes.dart';
import 'package:medipot_app/app/style/theme.dart';
import 'package:medipot_app/app/views/views.dart';
import 'package:medipot_app/data/models/models.dart';

class LikeLocationItem extends StatefulWidget {
  final LikeLocation likeLocation;
  final Future<void> Function(dynamic) like;
  final Future<void> Function(dynamic) unlike;

  const LikeLocationItem({
    Key? key,
    required this.likeLocation,
    required this.like,
    required this.unlike,
  }) : super(key: key);

  @override
  State<LikeLocationItem> createState() => _LikeLocationItemState();
}

class _LikeLocationItemState extends State<LikeLocationItem> {
  bool isLiked = true;

  void toggleLike(Location location) {
    if (isLiked) {
      widget.unlike(location);
      isLiked = false;
    } else {
      widget.like(location);
      isLiked = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: Row(
          children: [
            Container(
              color: const Color.fromARGB(255, 230, 230, 230),
              width: 150,
              height: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Image.network(widget.likeLocation.location.imgs[0],
                        fit: BoxFit.cover, width: 150, height: 150),
                  ),
                  Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: () => toggleLike(widget.likeLocation.location),
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: Image.asset(
                            isLiked
                                ? 'assets/image/heart_fill.png'
                                : 'assets/image/heart.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      )),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 150,
                      height: 26,
                      color: const Color.fromARGB(200, 50, 50, 50),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("비공개",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.locationDetail,
                    arguments: widget.likeLocation.location.no);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 3.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.likeLocation.location.simpleAddress,
                      style: appTheme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "${widget.likeLocation.location.deposit == 0 ? '가격 문의' : widget.likeLocation.location.deposit} / ${widget.likeLocation.location.depositMonly == 0 ? '가격 문의' : widget.likeLocation.location.depositMonly}",
                      style: appTheme.textTheme.titleSmall,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "${widget.likeLocation.location.dedicatedArea}㎡ / ${widget.likeLocation.location.supplyArea}㎡",
                      style: appTheme.textTheme.titleSmall,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 250,
                      child: Wrap(
                        children: widget.likeLocation.location.keywords
                            .map((keyword) {
                          return Tag(text: keyword);
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
