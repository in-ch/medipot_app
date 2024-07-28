import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/app/routes/routes.dart';

class CareerSlider extends StatefulWidget {
  final List<CareerListItem> careers;

  const CareerSlider({super.key, required this.careers});

  @override
  CareerSliderState createState() => CareerSliderState();
}

class CareerSliderState extends State<CareerSlider> {
  final PageController _pageController = PageController();

  List<Map<String, dynamic>> zips = [
    {"keyword": "📝 학회 참석 지원", "imgSrc": "assets/image/zip/zip-2.png"},
    {"keyword": "병원", "imgSrc": "assets/image/zip/zip-1.png"},
  ];

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
                  "🔥 초빙 공고.zip",
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            height: 120.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: zips.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index != 0
                      ? const EdgeInsets.only(left: 20)
                      : const EdgeInsets.only(left: 0),
                  child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.careerList, arguments: {
                      'keyword': zips[index]["keyword"],
                    }),
                    child: SizedBox(
                      width: 310,
                      height: 240,
                      child: Image.asset(zips[index]["imgSrc"]),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
