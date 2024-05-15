import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/views/views.dart';

class SearchPage extends GetView<SearchsController> {
  const SearchPage({Key? key}) : super(key: key);

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
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          CupertinoIcons.back,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            controller: controller.textEditingController,
                            focusNode: controller.focusNode,
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
                          onTap: () {},
                          child: Text("전체 삭제",
                              style: Theme.of(context).textTheme.titleSmall),
                        ),
                      ]),
                ),
                const SizedBox(height: 5),
                const Wrap(
                  children: [
                    SearchKeyword(text: "무 빙"),
                    SearchKeyword(text: "Bomb"),
                    SearchKeyword(text: "미국의 탄생 역사")
                  ],
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("인기 검색어",
                            style: Theme.of(context).textTheme.titleMedium),
                        Text("21:00 기준",
                            style: Theme.of(context).textTheme.titleSmall),
                      ]),
                ),
                const SizedBox(height: 10),
                const SearchRank(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
