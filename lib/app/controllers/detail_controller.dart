import 'package:get/get.dart';

import 'package:medipot_app/data/models/models.dart';
import 'package:medipot_app/services/services.dart';

class DetailController extends GetxController {
  RxBool isLoading = false.obs;

  late Writing writing;

  void someMethod() {
    print(Get.arguments['no']);
  }

  @override
  void onInit() {
    getList();
    super.onInit();
  }

  /// [비즈니스 로직]
  /// @params token 지울꺼임.
  /// @params no 글 no값
  Future<Writing> getList() async {
    try {
      isLoading.value = true;
      final response = await WritingsService.getWriting(Get.arguments['no']);
      if (response['statusCode'] == 200) {
        final data = response['data'];
        writing = Writing.fromJson(data);
        update();
      } else {
        throw Exception('Failed to fetch list');
      }
    } catch (error) {
      isLoading.value = false;
      update();
      throw Exception(error);
    } finally {
      isLoading.value = false;
      update();
      throw Exception('Failed to fetch list');
    }
  }
}
