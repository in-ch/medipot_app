import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/routes/routes.dart';

class ShowRecent extends StatefulWidget {
  const ShowRecent({super.key});

  @override
  State<ShowRecent> createState() => _ShowRecentState();
}

class _ShowRecentState extends State<ShowRecent> {
  final CareerController controller = Get.put(CareerController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getRecentItems();
    });
  }

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
                Obx(() => !controller.isRecentLoading.value
                    ? controller.recentCareerItems.isEmpty
                        ? const SizedBox()
                        : GestureDetector(
                            onTap: () {
                              controller.resetRecentItems(context);
                            },
                            child: Text(
                              "전체 삭제",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.black38),
                              textAlign: TextAlign.end,
                            ),
                          )
                    : const SizedBox())
              ],
            ),
          ),
          const SizedBox(height: 10),
          Obx(() => !controller.isRecentLoading.value
              ? controller.recentCareerItems.isEmpty
                  ? const SizedBox(
                      height: 160.0,
                      child: Center(
                        child: Text("최근 본 포지션이 없습니다."),
                      ),
                    )
                  : SizedBox(
                      width: double.infinity,
                      height: 160.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.recentCareerItems.length,
                        itemBuilder: (context, index) {
                          final item = controller.recentCareerItems[index];
                          return PositionItem(
                            img: item['img'],
                            company: item['hospitalName'],
                            position: item['title'],
                          );
                        },
                      ),
                    )
              : const SizedBox(
                  height: 160,
                  child: Center(child: CircularProgressIndicator())))
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
