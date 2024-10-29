import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:docspot_app/services/services.dart';

class HomeController extends GetxController {
  RxInt unReadMsgCount = 0.obs;

  @override
  void onInit() async {
    await getMsgCount();
    super.onInit();
  }

  Future<void> getMsgCount() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userNo = prefs.getString("userNo").toString();
    int count = userNo == ""
        ? await ChatService.getAllChatMsgCount()
        : await ChatService.getUnreadChatMsgCount(int.parse(userNo));
    unReadMsgCount.value = count;
    update();
  }
}
