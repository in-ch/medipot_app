import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/services/services.dart';

class ArticleController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt page = 0.obs;

  RxString title = ''.obs;
  RxString content = ''.obs;
  RxString invitedSubject = ''.obs;

  final PagingController<int, ArticleListItem> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() {
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

  /// 커리어 리스트를 조회한다.
  Future<void> getArticles(int pageKey) async {
    try {
      isLoading.value = true;
      final response = await ArticleService.getCareers(
          pageKey, 10, title.value, content.value, invitedSubject.value);

      if (response['statusCode'] == 200) {
        final data = response['data'];
        final totalCount = response['totalCount'];
        final list = List<ArticleListItem>.from(
            data.map((item) => ArticleListItem.fromJson(item)));
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
      isLoading.value = false;
      pagingController.error = error;
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
