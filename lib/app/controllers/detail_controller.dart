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
    getWriting();
    super.onInit();
  }

  /// [비즈니스 로직]
  /// @params token 지울꺼임.
  /// @params no 글 no값
  Future<dynamic> getWriting() async {
    try {
      isLoading.value = true;
      final response = await WritingsService.getWriting(Get.arguments['no']);
      if (response['statusCode'] == 200) {
        final data = response['data'];
        writing = Writing.fromJson(data);
        update();
      } else {
        throw Exception('Failed to GET DETAIL');
      }
    } catch (error) {
      isLoading.value = false;
      update();
      throw Exception(error);
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
