import 'package:get/get.dart';

import 'package:medipot_app/app/controllers/controllers.dart';

class PhoneBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PhoneController());
  }
}
