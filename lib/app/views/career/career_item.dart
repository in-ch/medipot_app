import 'package:docspot_app/app/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/utils/utils.dart';

class CareerItem extends StatelessWidget {
  final String company;
  final String position;
  final String img;
  final String deadline;
  final int no;

  CareerItem({
    Key? key,
    required this.company,
    required this.position,
    required this.img,
    required this.no,
    required this.deadline,
  }) : super(key: key) {
    // 컨트롤러를 초기화합니다.
    if (!Get.isRegistered<CareerController>()) {
      Get.put(CareerController());
    }
  }

  @override
  Widget build(BuildContext context) {
    final CareerController controller = Get.find<CareerController>();

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
                      height: company != "" ? 110 : 170,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 0),
                  child: Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          !deadline.contains("마감") && !(deadline.length < 2)
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 2, bottom: 2),
                                    child: Text(calculateDday(deadline),
                                        style: const TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1))),
                                  ),
                                )
                              : const SizedBox(),
                          Opacity(
                            opacity:
                                controller.likeCareers.contains(no) ? 1 : 0.5,
                            child: GestureDetector(
                              onTap: () {
                                controller.likeCareers.contains(no)
                                    ? controller.unlikeCareer(context, no)
                                    : controller.likeCareer(context, no);
                              },
                              child: SizedBox(
                                width: 50,
                                height: 100,
                                child: Icon(CupertinoIcons.bookmark_fill,
                                    color: colorScheme.primary),
                              ),
                            ),
                          )
                        ],
                      )),
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
                company != ""
                    ? Text(company,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w600))
                    : Container(),
                company != "" ? Container() : const SizedBox(height: 10),
                Text(position,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: company != "" ? 12.0 : 16.0,
                        fontWeight: FontWeight.w300)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
