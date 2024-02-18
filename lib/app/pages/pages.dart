import 'package:get/get.dart';
import 'package:medipot_app/app/bindings/bindings.dart';
import 'package:medipot_app/app/pages/pages.dart';
import 'package:medipot_app/app/routes/routes.dart';

export '../controllers/controllers.dart';

export './home/home_page.dart';
export './NotFound/not_found.dart';
export './home/sub/feed_sub_page.dart';
export './home/sub/map_sub_page.dart';
export './home/sub/setting_sub_page.dart';
export './home/sub/favorites_sub_page.dart';
export './detail/detail_page.dart';
export './nestedReply/nested_reply_page.dart';
export './login/login_page.dart';
export './locationDetail/location_detail_page.dart';
export './setting/profile_setting.dart';
export './setting/delete_account.dart';
export './event/events_page.dart';
import './consultList/consult_list_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      transition: Transition.cupertino,
      bindings: [LoginBinding()],
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.detail,
      page: () => const DetailPage(),
      transition: Transition.cupertino,
      bindings: [DetailBinding()],
    ),
    GetPage(
      name: Routes.nestedReply,
      page: () => const NestedReplyPage(),
      transition: Transition.cupertino,
      bindings: [NestedReplyBinding()],
    ),
    GetPage(
      name: Routes.locationDetail,
      page: () => const LocationDetailPage(),
      transition: Transition.cupertino,
      bindings: [LocationDetailBinding()],
    ),
    GetPage(
      name: Routes.profileUpdate,
      page: () => const ProfileSettingPage(),
      transition: Transition.cupertino,
      bindings: [SettingBinding()],
    ),
    GetPage(
      name: Routes.deleteAccount,
      page: () => DeleteAccountPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.events,
      page: () => const EventsPage(),
      transition: Transition.cupertino,
      bindings: [EventsBinding()],
    ),
    GetPage(
        name: Routes.consultList,
        page: () => const ConsultListPage(),
        transition: Transition.cupertino,
        bindings: [ConsultListBinding()])
  ];
}
