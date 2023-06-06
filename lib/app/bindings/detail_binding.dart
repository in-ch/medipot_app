import 'package:get/get.dart';
import 'package:medipot_app/app/controllers/controllers.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailController()); // DetailController를 바인딩
  }
}
