import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/routes/routes.dart';

class ViewByDepartment extends StatelessWidget {
  const ViewByDepartment({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "직무별 보기",
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Department(name: "인턴", img: "assets/image/icons/8.png"),
              Department(name: "정형외과", img: "assets/image/icons/15.png"),
              Department(name: "내과", img: "assets/image/icons/2.png"),
              Department(name: "산부인과", img: "assets/image/icons/icon4.png"),
            ],
          ),
          const SizedBox(height: 15.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Department(name: "성형외과", img: "assets/image/icons/5.png"),
              Department(name: "정신과", img: "assets/image/icons/14.png"),
              Department(name: "소아청소년과", img: "assets/image/icons/6.png"),
              Department(name: "가정의학과", img: "assets/image/icons/icon1.png"),
            ],
          ),
          const SizedBox(height: 15.0),
        ],
      ),
    );
  }
}

class Department extends StatelessWidget {
  const Department({
    super.key,
    required this.name,
    required this.img,
  });

  final String name;
  final String img;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.careerList, arguments: {
          'department': name,
        });
      },
      child: Column(children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: const Color.fromARGB(255, 223, 223, 223),
            ),
            child: Image.asset(img, width: 60, height: 60)),
        const SizedBox(height: 10),
        Text(name, style: Theme.of(context).textTheme.titleSmall)
      ]),
    );
  }
}
