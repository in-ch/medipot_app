import 'package:get/get.dart';

import 'package:medipot_app/app/controllers/controllers.dart';

class CsCenterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CsCenterController());
  }
}
