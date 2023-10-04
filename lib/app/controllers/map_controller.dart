import 'package:get/get.dart';
import 'package:medipot_app/services/services.dart';

class MapController extends GetxController {
  RxBool isLoading = false.obs;

  /// [비즈니스 로직]
  /// access_token을 검증 후 필요 시 리프레쉬 실행
  Future<bool> tokenCheck() async {
    try {
      final response = await UserService.me();
      final data = response['data'];
      if (data == null) {
        await UserService.refresh();
      }
      return true;
    } catch (error) {
      return false;
    }
  }
}
