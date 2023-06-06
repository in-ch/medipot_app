import 'package:get/route_manager.dart';
import 'package:medipot_app/app/bindings/bindings.dart';
import 'package:medipot_app/app/pages/pages.dart';
import 'package:medipot_app/app/routes/routes.dart';

export './home/home_page.dart';
export './login/login_page.dart';

export './NotFound/not_found.dart';
export './home/sub/feed_sub_page.dart';
export './home/sub/map_sub_page.dart';
export './detail/detail_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      bindings: [LoginBinding()],
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      bindings: [HomeBinding()],
    ),
    GetPage(
      name: Routes.detail,
      page: () => const DetailPage(),
      bindings: [DetailBinding()],
    ),
  ];
}
