import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/routes/routes.dart';

class CareerItem extends StatelessWidget {
  const CareerItem({
    super.key,
    required this.company,
    required this.position,
    required this.img,
    required this.no,
  });

  final String company;
  final String position;
  final String img;
  final int no;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.careerDetail, arguments: {'no': no});
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: const Color.fromARGB(255, 243, 243, 243),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      img,
                      width: double.infinity,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Opacity(
                  opacity: 0.7,
                  child: GestureDetector(
                    onTap: () {
                      Get.snackbar("좋아요를 하였습니다.", "기모리.");
                    },
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(CupertinoIcons.bookmark_fill,
                          color: colorScheme.primary),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.careerDetail, arguments: {'no': no});
          },
          child: SizedBox(
            height: 65,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(company,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.w600)),
                Text(position,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.w300))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
