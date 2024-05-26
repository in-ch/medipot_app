import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/services/services.dart';

class CareerListController extends GetxController {
  RxString locationValue = '전체보기'.obs;
  RxString departmentValue = '전체보기'.obs;
  RxBool isLoading = false.obs;
  RxInt page = 0.obs;

  RxString title = ''.obs;
  RxString detail = ''.obs;
  RxString invitedSubject = ''.obs;
  RxString hospitalName = ''.obs;
  RxString hospitalLocation = ''.obs;

  RxDouble bodyHeight = 0.0.obs;

  List<Career> careersInit = []; // 초빙 공고.zip

  final PagingController<int, Career> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      getCareers(pagingController, page.value, addPage);
    });

    super.onInit();
  }

  @override
  dispose() {
    pagingController.dispose();
    super.dispose();
  }

  /// [Method]
  /// page 숫자 더하기
  void addPage() {
    page += 1;
    update();
  }

  /// [비즈니스 로직]
  /// 커리어 리스트를 조회한다.
  Future<dynamic> getCareers(
    PagingController pagingController,
    int page,
    dynamic addPage,
  ) async {
    try {
      final response = await CareerService.getCareers(
          page,
          10,
          title.value,
          detail.value,
          Get.arguments['department'] ?? "",
          hospitalName.value,
          Get.arguments['location'] ?? "");
      if (response['statusCode'] == 200) {
        final data = response['data'];
        final totalCount = response['totalCount'];
        final list =
            List<Career>.from(data.map((item) => Career.fromJson(item)));

        final isLastPage = totalCount <= page * 10;

        if (isLastPage) {
          pagingController.appendLastPage(list);
        } else {
          addPage();
          pagingController.appendPage(list, page * 10);
        }
        update();
      }
    } catch (error) {
      debugPrint(error.toString());
      update();
    } finally {
      update();
    }
  }
}
