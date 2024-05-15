import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/routes/routes.dart';

class ShowRecent extends StatelessWidget {
  const ShowRecent({
    Key? key,
  }) : super(key: key);

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
                  "🔎 최근 본 포지션",
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 160.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                PositionItem(
                    img:
                        "https://cdn.pixabay.com/photo/2015/07/10/20/54/stethoscope-840125_1280.jpg",
                    company: "본탑재활의학과의원",
                    position: "[분당 서현] 외래 진료 보조 업무 도와주실 선생님 모십니다."),
                PositionItem(
                    img:
                        "https://cdn.pixabay.com/photo/2015/07/10/20/54/stethoscope-840125_1280.jpg",
                    company: "삼성열린내과",
                    position: "7호선 신대방삼거리역 삼성열린내과 정규직(주5일)"),
                PositionItem(
                    img:
                        "https://cdn.pixabay.com/photo/2015/07/10/20/54/stethoscope-840125_1280.jpg",
                    company: "참바로병원",
                    position: "정형외과 외과 전문의"),
                PositionItem(
                    img:
                        "https://cdn.pixabay.com/photo/2015/07/10/20/54/stethoscope-840125_1280.jpg",
                    company: "삼성 손앤박 이비인후과의원",
                    position: "이비인후과 전문의 초빙합니다."),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PositionItem extends StatelessWidget {
  const PositionItem({
    Key? key,
    required this.company,
    required this.position,
    required this.img,
  }) : super(key: key);

  final String company;
  final String position;
  final String img;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.careerDetail),
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: SizedBox(
          width: 170,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color.fromARGB(255, 243, 243, 243),
                ),
                width: 170,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(img, height: 110, fit: BoxFit.cover),
                )),
            const SizedBox(
              height: 10,
            ),
            Text(
              company,
              style: Theme.of(context).textTheme.labelMedium,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              position,
              style: Theme.of(context).textTheme.labelSmall,
              overflow: TextOverflow.ellipsis,
            ),
          ]),
        ),
      ),
    );
  }
}
