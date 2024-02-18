import 'package:get/get.dart';

import 'package:medipot_app/app/controllers/controllers.dart';

class ConsultListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ConsultListController());
  }
}
