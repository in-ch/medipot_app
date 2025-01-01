import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';

class ArticleSubPage extends StatefulWidget {
  const ArticleSubPage({super.key});

  @override
  State<ArticleSubPage> createState() => _ArticleSubPageState();
}

class _ArticleSubPageState extends State<ArticleSubPage> {
  final ArticleController controller =
      Get.put(ArticleController(), permanent: true);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.pagingController.itemList == null ||
          controller.pagingController.itemList!.isEmpty) {
        controller.getArticles(0);
      } else {
        debugPrint('Articles already loaded, skipping API call.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          iconTheme: Theme.of(context).iconTheme,
          centerTitle: false,
          toolbarHeight: 40,
          backgroundColor: colorScheme.surface,
          elevation: 0,
          leadingWidth: 54,
          title: Image.asset(
            'assets/image/logo_text.png',
            width: 70,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10.0, top: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return const SelectDepartmentModal();
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        height: 30,
                        width: 110,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(controller.departmentValue.value,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600)),
                                const SizedBox(width: 3),
                                const Icon(Icons.arrow_drop_down,
                                    size: 20, color: Colors.black38)
                              ],
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              Obx(() => controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          color: Colors.white,
                          child: PagedGridView(
                            pagingController: controller.pagingController,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300,
                              mainAxisSpacing: 8.0,
                              crossAxisSpacing: 8.0,
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
                                return ArticleItem(
                                  titleKr: item.titleKr,
                                  contentKr: item.contentKr,
                                  img: item.img,
                                  no: item.no,
                                  date: item.date,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    )),
            ],
          ),
        ));
  }
}
