import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:docspot_app/services/services.dart';

class MapController extends GetxController {
  RxBool isLoading = false.obs;

  /// [비즈니스 로직]
  /// access_token을 검증 후 필요 시 리프레쉬 실행
  Future<bool> tokenCheck() async {
    try {
      final response = await UserService.me();
      final data = response['data'];
      if (data == null) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        bool isLogin = prefs.getBool('isLogin') ?? false;
        if (isLogin) {
          await UserService.refresh();
        } else {
          prefs.setString('nickname', "");
          prefs.setString('userNo', "");
          prefs.setString('phone', "");
          prefs.setString('accessToken', "");
          prefs.setString('refreshToken', "");
          prefs.setBool('isLogin', false);
        }
      }
      return true;
    } catch (error) {
      return false;
    }
  }
}
