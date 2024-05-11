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
            height: 500,
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
              children: const [
                CareerLocationCard(
                  title: '서울특별시',
                  color: Color.fromARGB(255, 0, 192, 173),
                  // onPressed: () => context.router.push(const PokedexRoute()),
                ),
                CareerLocationCard(
                  title: '경기도',
                  color: Color.fromARGB(255, 254, 118, 108),
                  // onPressed: () => context.router.push(const PokedexRoute()),
                ),
                CareerLocationCard(
                  title: '인천광역시',
                  color: Color.fromARGB(255, 54, 60, 244),
                  // onPressed: () => context.router.push(const PokedexRoute()),
                ),
                CareerLocationCard(
                  title: '부산광역시',
                  color: Color.fromARGB(255, 54, 177, 244),
                  // onPressed: () => context.router.push(const PokedexRoute()),
                ),
                CareerLocationCard(
                  title: '대전특별자치도',
                  color: Color.fromARGB(255, 0, 188, 6),
                  // onPressed: () => context.router.push(const PokedexRoute()),
                ),
                CareerLocationCard(
                  title: '제주도',
                  color: Color.fromARGB(255, 255, 198, 55),
                  // onPressed: () => context.router.push(const PokedexRoute()),
                ),
                CareerLocationCard(
                  title: '강원도',
                  color: Color.fromARGB(255, 0, 161, 124),
                  // onPressed: () => context.router.push(const PokedexRoute()),
                ),
                CareerLocationCard(
                  title: '광주광역시',
                  color: Color.fromARGB(255, 183, 116, 255),
                ),
                CareerLocationCard(
                  title: '충청북도',
                  color: Color.fromARGB(255, 189, 146, 110),
                ),
                CareerLocationCard(
                  title: '충청남도',
                  color: Color.fromARGB(255, 116, 197, 255),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
