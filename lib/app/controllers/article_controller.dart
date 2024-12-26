import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/services/services.dart';

class ArticleController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt page = 0.obs;
  RxString departmentValue = '전체보기'.obs;

  RxString title = ''.obs;
  RxString content = ''.obs;
  RxString invitedSubject = ''.obs;

  final PagingController<int, ArticleListItem> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() {
    ever(departmentValue, (_) => _refreshPage());
    pagingController.addPageRequestListener((pageKey) {
      getArticles(pageKey);
    });
    update();
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

  /// 진료과 업데이트
  void updateDepartment(String value) {
    departmentValue.value = value;
    update();
  }

  /// 아티클 리스트를 조회한다.
  Future<void> getArticles(int pageKey) async {
    try {
      final response = await ArticleService.getCareers(
          pageKey,
          10,
          title.value,
          content.value,
          departmentValue.value == '전체보기' ? '' : departmentValue.value);

      if (response['statusCode'] == 200) {
        final data = response['data'];
        final totalCount = response['totalCount'];
        final list = List<ArticleListItem>.from(
            data.map((item) => ArticleListItem.fromJson(item)));
        final isLastPage = (pageKey + 1) * 10 >= totalCount;

        if (isLastPage) {
          pagingController.appendLastPage(list);
        } else {
          pagingController.appendPage(list, pageKey + 1);
          page.value = pageKey + 1;
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

  /// 페이지를 새로 고침한다.
  void _refreshPage() {
    if (departmentValue.value.isNotEmpty) {
      page.value = 0;
      pagingController.refresh();
    }
  }
}
