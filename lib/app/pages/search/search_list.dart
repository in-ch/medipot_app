import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';

class SearchListPage extends GetView<SearchListController> {
  const SearchListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: appTheme,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            scrolledUnderElevation: 0,
            iconTheme: Theme.of(context).iconTheme,
            centerTitle: false,
            backgroundColor: Colors.white,
            elevation: 0,
            leadingWidth: 54,
            leading: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                  child: const Icon(CupertinoIcons.back),
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
            ),
            title: Text(
                Get.arguments["keyword"].length > 8
                    ? Get.arguments["keyword"].substring(0, 8) + "..."
                    : Get.arguments["keyword"] + ' 검색 결과',
                style: Theme.of(context).textTheme.headlineSmall),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Obx(
                  () => controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : Expanded(
                          child: Container(
                          color: colorScheme.background,
                          height: double.infinity,
                          child: PagedGridView<int, dynamic>(
                            pagingController: controller.pagingController,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8.0,
                              crossAxisSpacing: 8.0,
                              childAspectRatio: 1.0,
                            ),
                            builderDelegate: PagedChildBuilderDelegate<dynamic>(
                              firstPageProgressIndicatorBuilder: (context) =>
                                  Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      colorScheme.primary),
                                ),
                              ),
                              noItemsFoundIndicatorBuilder: (context) =>
                                  NoDatas(text: '검색 결과가 없습니다.'),
                              firstPageErrorIndicatorBuilder: (context) =>
                                  NoDatas(text: '검색 결과가 없습니다.'),
                              newPageProgressIndicatorBuilder: (context) =>
                                  Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      colorScheme.primary),
                                ),
                              ),
                              itemBuilder: (context, item, index) {
                                return CareerItem(
                                  no: item.no,
                                  img: item.imgs[0],
                                  company: item.hospital.name,
                                  position: item.title,
                                );
                              },
                            ),
                          ),
                        )),
                )
              ],
            ),
          ),
        ));
  }
}
