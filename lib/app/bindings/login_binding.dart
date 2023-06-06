import 'package:get/get.dart';
import 'package:medipot_app/app/controllers/controllers.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController()); // LoginController를 바인딩
  }
}
