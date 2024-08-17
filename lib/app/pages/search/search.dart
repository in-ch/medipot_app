import 'package:docspot_app/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/views/views.dart';
import 'package:docspot_app/app/routes/routes.dart';

class SearchPage extends GetView<SearchsController> {
  SearchPage({super.key});

  final formattedTime = getFormattedHourTime();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Row(
                    children: [
                      const CustomBackButton(),
                      const SizedBox(width: 20),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            controller: controller.textEditingController,
                            focusNode: controller.focusNode,
                            onSubmitted: (String text) {
                              if (text.length > 1) {
                                Get.toNamed(Routes.searchList,
                                    arguments: {'keyword': text});
                                controller.addKeyword(text);
                                controller.textEditingController.clear();
                              } else {
                                Get.snackbar(
                                    "검색어 길이가 부족합니다.", "2글자 이상을 입력해주세요.");
                                controller.focusNode.requestFocus();
                              }
                            },
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                            decoration: const InputDecoration(
                              hintText: '검색어를 입력해주세요.',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.black38,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("최근 검색어",
                            style: Theme.of(context).textTheme.titleMedium),
                        GestureDetector(
                          onTap: () {
                            controller.clearKeywordRanks();
                          },
                          child: Text("전체 삭제",
                              style: Theme.of(context).textTheme.titleSmall),
                        ),
                      ]),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 30,
                  child: Obx(() => controller.recentKeywords.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: SizedBox(
                              width: double.infinity,
                              height: 25,
                              child: Text("최근 검색한 내용이 없습니다.",
                                  style: TextStyle(color: Colors.black38))),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            children: controller.recentKeywords.map((keyword) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SearchKeyword(text: keyword),
                              );
                            }).toList(),
                          ),
                        )),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("인기 검색어",
                            style: Theme.of(context).textTheme.titleMedium),
                        Text("$formattedTime 기준",
                            style: Theme.of(context).textTheme.titleSmall),
                      ]),
                ),
                const SizedBox(height: 10),
                SearchRank(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
