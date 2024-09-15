import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';

class GameBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GameController());
  }
}
