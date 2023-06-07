import 'package:get/get.dart';
import 'package:medipot_app/data/models/models.dart';
import 'package:medipot_app/services/services.dart';

class FeedController extends GetxController {
  // 예시: 상태 변수
  RxList<Writing> list = <Writing>[].obs;
  RxInt totalCount = 0.obs;
  RxBool isLoading = false.obs;

  final String tag;
  final String text;

  FeedController({required this.tag, required this.text});

  @override
  void onInit() {
    super.onInit();
    fetchList(tag, text);
  }

  @override
  void onClose() {
    // 메모리 해제나 리소스 정리 등의 로직
    super.onClose();
  }

  /// [비즈니스 로직]
  /// @params token 지울꺼임.
  /// @params tag 태그이름
  /// @params text 검색어 이름
  void fetchList(String tag, String text) async {
    try {
      isLoading.value = true;
      final response = await WritingsService.fetchList(tag, text);
      if (response['statusCode'] == 200) {
        final data = response['data'];
        list.value = List<Writing>.from(
            data['list'].map((item) => Writing.fromJson(item)));
        totalCount.value = response['totalCount'];
        isLoading.value = false;
        update();
      } else {
        throw Exception('Failed to fetch list');
      }
    } catch (error) {
      isLoading.value = false;

      update();
      // Handle error
    } finally {
      isLoading.value = false;

      update();
    }
  }
}
