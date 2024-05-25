import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/pages/pages.dart';

class CareerDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CareerDetailController());
  }
}
