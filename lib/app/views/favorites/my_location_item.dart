import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/routes/routes.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';
import 'package:docspot_app/data/models/models.dart';

class MyLocationItem extends StatefulWidget {
  final Location location;
  final List<Location> likes;
  final void Function(dynamic) like;
  final void Function(dynamic) unlike;

  const MyLocationItem({
    Key? key,
    required this.location,
    required this.likes,
    required this.like,
    required this.unlike,
  }) : super(key: key);

  @override
  State<MyLocationItem> createState() => _MyLocationItemState();
}

class _MyLocationItemState extends State<MyLocationItem> {
  bool isLiked = false;

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
  void initState() {
    isLiked = widget.likes.any((like) => like.no == widget.location.no);
    super.initState();
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
                    child: Image.network(widget.location.imgs[0],
                        fit: BoxFit.cover, width: 150, height: 150),
                  ),
                  Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: () => toggleLike(widget.location),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.location.isApproved ? "승인 완료" : "미승인",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12)),
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
                    arguments: {'locationNo': widget.location.no});
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 3.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.location.simpleAddress,
                      style: appTheme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "${widget.location.deposit == 0 ? '가격 문의' : widget.location.deposit} / ${widget.location.depositMonly == 0 ? '가격 문의' : widget.location.depositMonly}",
                      style: appTheme.textTheme.titleSmall,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "${widget.location.dedicatedArea}㎡ / ${widget.location.supplyArea}㎡",
                      style: appTheme.textTheme.titleSmall,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Wrap(
                        children: widget.location.keywords.map((keyword) {
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
