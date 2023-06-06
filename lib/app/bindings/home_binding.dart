import 'package:get/get.dart';
import 'package:medipot_app/app/controllers/controllers.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController()); // HomeController를 바인딩
  }
}
