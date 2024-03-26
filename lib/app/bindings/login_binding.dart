import 'package:get/get.dart';
import 'package:docspot_app/app/controllers/controllers.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController()); // LoginController를 바인딩
  }
}
