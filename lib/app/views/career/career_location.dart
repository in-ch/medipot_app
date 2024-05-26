import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/views/views.dart';
import 'package:docspot_app/app/routes/routes.dart';

class CareerLocations extends StatelessWidget {
  const CareerLocations({super.key});

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
                  "🧭 지역별 보기.zip",
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.start,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.careerList);
                  },
                  child: Text(
                    "전체보기",
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 600,
            child: GridView(
              padding: const EdgeInsets.symmetric(vertical: 15),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                childAspectRatio: 2.58,
                mainAxisSpacing: 15,
              ),
              children: [
                CareerLocationCard(
                  title: '서울',
                  img:
                      'https://medipot-uploads.s3.ap-northeast-2.amazonaws.com/app/seoul.jpg',
                  onPressed: () => Get.toNamed(Routes.careerList, arguments: {
                    'location': '서울',
                  }),
                ),
                CareerLocationCard(
                  title: '경기도',
                  img:
                      'https://medipot-uploads.s3.ap-northeast-2.amazonaws.com/app/gyeonggido.jpg',
                  onPressed: () => Get.toNamed(Routes.careerList, arguments: {
                    'location': '경기도',
                  }),
                ),
                CareerLocationCard(
                  title: '인천',
                  img:
                      'https://medipot-uploads.s3.ap-northeast-2.amazonaws.com/app/incheon.jpg',
                  onPressed: () => Get.toNamed(Routes.careerList, arguments: {
                    'location': '인천',
                  }),
                ),
                CareerLocationCard(
                  title: '부산',
                  img:
                      'https://medipot-uploads.s3.ap-northeast-2.amazonaws.com/app/busan.jpg',
                  onPressed: () => Get.toNamed(Routes.careerList, arguments: {
                    'location': '부산',
                  }),
                ),
                CareerLocationCard(
                  title: '대전',
                  img:
                      'https://medipot-uploads.s3.ap-northeast-2.amazonaws.com/app/daejeon.jpg',
                  onPressed: () => Get.toNamed(Routes.careerList, arguments: {
                    'location': '대전',
                  }),
                ),
                CareerLocationCard(
                  title: '제주',
                  img:
                      'https://medipot-uploads.s3.ap-northeast-2.amazonaws.com/app/jeju.jpg',
                  onPressed: () => Get.toNamed(Routes.careerList, arguments: {
                    'location': '제주',
                  }),
                ),
                CareerLocationCard(
                  title: '강원도',
                  img:
                      'https://medipot-uploads.s3.ap-northeast-2.amazonaws.com/app/gangwon.jpg',
                  onPressed: () => Get.toNamed(Routes.careerList, arguments: {
                    'location': '강원도',
                  }),
                ),
                CareerLocationCard(
                  title: '광주',
                  img:
                      'https://medipot-uploads.s3.ap-northeast-2.amazonaws.com/app/gwangju.jpg',
                  onPressed: () => Get.toNamed(Routes.careerList, arguments: {
                    'location': '광주',
                  }),
                ),
                CareerLocationCard(
                  title: '충청북도',
                  img:
                      'https://medipot-uploads.s3.ap-northeast-2.amazonaws.com/app/chungcheongbukdo.jpg',
                  onPressed: () => Get.toNamed(Routes.careerList, arguments: {
                    'location': '충청북도',
                  }),
                ),
                CareerLocationCard(
                  title: '충청남도',
                  img:
                      'https://medipot-uploads.s3.ap-northeast-2.amazonaws.com/app/chungcheongnamdo.jpg',
                  onPressed: () => Get.toNamed(Routes.careerList, arguments: {
                    'location': '충청남도',
                  }),
                ),
                CareerLocationCard(
                  title: '전라북도',
                  img:
                      'https://medipot-uploads.s3.ap-northeast-2.amazonaws.com/app/jeollabukdo.jpg',
                  onPressed: () => Get.toNamed(Routes.careerList, arguments: {
                    'location': '전라북도',
                  }),
                ),
                CareerLocationCard(
                  title: '전라남도',
                  img:
                      'https://medipot-uploads.s3.ap-northeast-2.amazonaws.com/app/jeollanamdo.jpg',
                  onPressed: () => Get.toNamed(Routes.careerList, arguments: {
                    'location': '전라남도',
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
