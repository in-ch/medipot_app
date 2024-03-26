import 'package:get/get.dart';
import 'package:docspot_app/app/controllers/controllers.dart';

class LocationDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LocationDetailController());
  }
}
