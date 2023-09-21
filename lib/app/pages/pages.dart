import 'package:get/get.dart';
import 'package:medipot_app/app/bindings/bindings.dart';
import 'package:medipot_app/app/pages/pages.dart';
import 'package:medipot_app/app/routes/routes.dart';

export './home/home_page.dart';
export '../controllers/controllers.dart';

export './NotFound/not_found.dart';
export './home/sub/feed_sub_page.dart';
export './home/sub/map_sub_page.dart';
export './home/sub/favorites_sub_page.dart';
export './detail/detail_page.dart';
export './nestedReply/nested_reply_page.dart';
export './login/login_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      bindings: [LoginBinding()],
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.detail,
      page: () => const DetailPage(),
      bindings: [DetailBinding()],
    ),
    GetPage(
        name: Routes.nestedReply,
        page: () => const NestedReplyPage(),
        bindings: [NestedReplyBinding()])
  ];
}
