import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/services/services.dart';
import 'package:docspot_app/app/controllers/career_controller.dart';

class CareerListController extends GetxController {
  RxString locationValue = '전국'.obs;
  RxString departmentValue = '전체보기'.obs;
  RxBool isLoading = false.obs;
  RxInt page = 0.obs;

  RxString title = ''.obs;
  RxString detail = ''.obs;
  RxString invitedSubject = ''.obs;
  RxString hospitalName = ''.obs;
  RxString hospitalLocation = ''.obs;

  RxDouble bodyHeight = 0.0.obs;

  final PagingController<int, CareerListItem> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() {
    locationValue.value = Get.arguments['location'] ?? '전국';
    departmentValue.value = Get.arguments['department'] ?? '전체보기';

    ever(locationValue, (_) => _refreshPage());
    ever(departmentValue, (_) => _refreshPage());

    pagingController.addPageRequestListener((pageKey) {
      getCareers(pageKey);
    });

    CareerController careerController = CareerController();
    careerController.getLikeCareers();

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
  Future<void> getCareers(int pageKey) async {
    try {
      final response = await CareerService.getCareers(
        pageKey,
        10,
        title.value,
        detail.value,
        departmentValue.value == '전체보기' ? '' : departmentValue.value,
        hospitalName.value,
        locationValue.value == '전국' ? '' : locationValue.value,
      );

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

  /// 진료과 업데이트
  void updateDepartment(String value) {
    departmentValue.value = value;
    update();
  }

  /// 지역 선택 업데이트
  void updateLocation(String value) {
    locationValue.value = value;
    update();
  }

  /// 페이지를 새로 고침한다.
  void _refreshPage() {
    page.value = 0;
    pagingController.refresh();
  }
}
