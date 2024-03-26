import 'package:get/get.dart';
import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/services/services.dart';

class NestedReplyController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt page = 0.obs;
  RxInt limit = 10.obs;
  RxInt totalCount = 0.obs;
  RxString userName = "".obs;
  RxBool hasMore = true.obs;

  List<NestedReply> nestedReplys = [];

  @override
  void onInit() {
    getNestedReplys();
    userName.value = Get.arguments['userName'];
    super.onInit();
  }

  /// [비즈니스 로직]
  Future<dynamic> getNestedReplys() async {
    try {
      isLoading.value = true;
      final response = await NestedReplysService.getNestedReplys(
          Get.arguments['no'], page.value, limit.value);
      if (response['statusCode'] == 200) {
        final data = response['data'];
        totalCount.value = data['totalCount'];
        final list = List<NestedReply>.from(
            data['list'].map((item) => NestedReply.fromJson(item)));
        nestedReplys.addAll(list);
        page++;
        if (list.length < limit.value) {
          hasMore.value = false;
        }
        update();
      } else {
        throw Exception('Failed to GET NESTED REPLY');
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
