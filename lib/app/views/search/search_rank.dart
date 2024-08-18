import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/routes/routes.dart';

class SearchRank extends StatelessWidget {
  final SearchsController controller = Get.put(SearchsController());

  SearchRank({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(5, (index) {
                  if (index < controller.keywordRanks.length) {
                    return RankItem(
                      text: controller.keywordRanks[index].keyword,
                      rank: index + 1,
                      up: controller.keywordRanks[index].upDown == 'up',
                      normal: controller.keywordRanks[index].upDown == 'new' ||
                          controller.keywordRanks[index].upDown == 'normal',
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
              );
            }),
          ),
          Expanded(
            flex: 1,
            child: Obx(() {
              return Column(
                children: List.generate(5, (index) {
                  int rankIndex = index + 5;
                  if (rankIndex < controller.keywordRanks.length) {
                    return RankItem(
                      text: controller.keywordRanks[rankIndex].keyword,
                      rank: rankIndex + 1,
                      up: controller.keywordRanks[rankIndex].upDown == 'up',
                      normal: controller.keywordRanks[rankIndex].upDown ==
                              'new' ||
                          controller.keywordRanks[rankIndex].upDown == 'normal',
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class RankItem extends StatelessWidget {
  const RankItem({
    super.key,
    required this.rank,
    required this.text,
    this.up = false,
    this.normal = false,
  });

  final int rank;
  final String text;
  final bool up;
  final bool normal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.searchList, arguments: {'keyword': text});
      },
      child: SizedBox(
        height: 30,
        child: Row(children: [
          SizedBox(
            width: 20,
            child: Text(rank.toString(),
                style: Theme.of(context).textTheme.labelMedium),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 70,
            child: Text(text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelMedium),
          ),
          const SizedBox(width: 10),
          SizedBox(
            child: Text(
                up
                    ? "up"
                    : normal
                        ? "new"
                        : "-",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: up
                        ? const Color.fromARGB(255, 255, 94, 83)
                        : normal
                            ? const Color.fromARGB(255, 87, 239, 37)
                            : const Color.fromARGB(255, 215, 215, 215))),
          ),
        ]),
      ),
    );
  }
}
