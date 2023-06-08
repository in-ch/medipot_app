import 'package:get/get.dart';

class DetailController extends GetxController {
  var count = 0;

  void increment() {
    count++;
    update(); // 상태 변경을 알림
  }

  void someMethod() {
    print("Hello world");
  }
}
