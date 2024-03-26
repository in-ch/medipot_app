import 'package:get/get.dart';
import 'package:docspot_app/app/controllers/controllers.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController()); // HomeController를 바인딩
  }
}
