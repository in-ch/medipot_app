import 'package:get/get.dart';

import 'package:docspot_app/app/bindings/bindings.dart';
import 'package:docspot_app/app/pages/pages.dart';
import 'package:docspot_app/app/routes/routes.dart';

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
import './csCenter/cs_center_page.dart';
import './phone/phone_page.dart';
import './phone/phone_pin_page.dart';
import './careerList/career_list_page.dart';
import './careerDetail/career_detail_page.dart';
import './search/search.dart';
import './search/search_list.dart';
import './alarm/alarm_page.dart';
import './email/email_page.dart';
import './game/roulette_game_page.dart';

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
        bindings: [ConsultListBinding()]),
    GetPage(
        name: Routes.csCenter,
        page: () => const CsCenterPage(),
        transition: Transition.cupertino,
        bindings: [CsCenterBinding()]),
    GetPage(
        name: Routes.phone,
        page: () => const PhonePage(),
        transition: Transition.cupertino,
        bindings: [PhoneBinding()]),
    GetPage(
        name: Routes.phonePin,
        page: () => const PhonePinPage(),
        transition: Transition.cupertino,
        bindings: [PhoneBinding()]),
    GetPage(
        name: Routes.careerList,
        page: () => const CareerListPage(),
        transition: Transition.cupertino,
        bindings: [CareerListBinding()]),
    GetPage(
        name: Routes.careerDetail,
        page: () => const CareerDetailPage(),
        transition: Transition.cupertino,
        bindings: [CareerDetailBinding()]),
    GetPage(
        name: Routes.search,
        page: () => SearchPage(),
        transition: Transition.cupertino,
        bindings: [SearchBinding()]),
    GetPage(
        name: Routes.searchList,
        page: () => const SearchListPage(),
        transition: Transition.cupertino,
        bindings: [SearchListBinding()]),
    GetPage(
        name: Routes.alarm,
        page: () => const AlarmPage(),
        transition: Transition.cupertino,
        bindings: [AlarmBinding()]),
    GetPage(
      name: Routes.feed,
      page: () => const FeedSubPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
        name: Routes.roulette,
        page: () => const RouletteGamePage(),
        transition: Transition.cupertino,
        bindings: [GameBinding()]),
    GetPage(
        name: Routes.email,
        page: () => const EmailPage(),
        transition: Transition.cupertino,
        bindings: [EmailBinding()])
  ];
}
