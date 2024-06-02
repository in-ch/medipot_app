import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';

class SearchListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SearchListController());
  }
}
