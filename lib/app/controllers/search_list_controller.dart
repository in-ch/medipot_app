import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter/material.dart';

import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/services/services.dart';

class SearchListController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt page = 0.obs;

  final PagingController<int, CareerListItem> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      getCareersForSearchList(pageKey);
    });

    super.onInit();
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  /// 페이지 숫자 더하기
  void addPage() {
    page.value += 1;
    update();
  }

  Future<void> getCareersForSearchList(int pageKey) async {
    try {
      final response = await CareerService.getCareers(
          pageKey,
          10,
          Get.arguments['keyword'],
          Get.arguments['keyword'],
          '',
          Get.arguments['keyword'],
          '',
          '');

      if (response['statusCode'] == 200) {
        final data = response['data'];
        final totalCount = response['totalCount'];
        final list = List<CareerListItem>.from(
            data.map((item) => CareerListItem.fromJson(item)));
        final isLastPage = totalCount <= pageKey * 10;

        if (isLastPage) {
          pagingController.appendLastPage(list);
        } else {
          addPage();
          pagingController.appendPage(list, pageKey + 1);
        }
        update();
      } else {
        pagingController.error = 'Failed to load data';
      }
    } catch (error) {
      debugPrint(error.toString());
      pagingController.error = error;
    } finally {
      update();
    }
  }
}
