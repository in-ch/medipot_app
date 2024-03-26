import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/services/services.dart';

class ConsultListController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt page = 0.obs;
  List<Consult> myConsults = [];

  final PagingController<int, Consult> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      getMyConsults(pagingController);
    });

    super.onInit();
  }

  /// [Method]
  /// page 숫자 더하기
  void addPage() {
    page += 1;
    update();
  }

  /// [비즈니스 로직]
  /// fetch getMyConsult list
  Future<dynamic> getMyConsults(PagingController pagingController) async {
    try {
      final response = await ConsultService.getMyConsults();
      if (response['statusCode'] == 200) {
        final data = response['data'] as List;
        final list =
            List<Consult>.from(data.map((item) => Consult.fromJson(item)));
        myConsults.addAll(list);
        pagingController.appendLastPage(list);
        update();
      } else {
        throw Exception('Failed to FETCH get my Consults');
      }
    } catch (error) {
      update();
      throw Exception(error);
    } finally {
      update();
    }
  }
}
