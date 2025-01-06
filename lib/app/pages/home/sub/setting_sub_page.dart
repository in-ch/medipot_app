import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/routes/routes.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';

class SettingSubPage extends StatefulWidget {
  const SettingSubPage({super.key});

  @override
  State<SettingSubPage> createState() => _SettingSubPageState();
}

class _SettingSubPageState extends State<SettingSubPage> {
  final SettingController settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    settingController.getMyData();
    return Theme(
      data: appTheme,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 30),
                        SizedBox(
                          height: 50,
                          child: GestureDetector(
                            onTap: () => settingController.isLoading.value
                                ? Get.snackbar('잠시만 기다려주세요.', '로딩 중입니다.')
                                : !settingController.isLogin.value
                                    ? Get.toNamed(Routes.login)
                                    : debugPrint('Go To Profile'),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              child: Obx(() => settingController.isLoading.value
                                  ? const SizedBox(height: 50)
                                  : Row(
                                      children: [
                                        SizedBox(
                                            width:
                                                !settingController.isLogin.value
                                                    ? 120
                                                    : 50,
                                            height:
                                                !settingController.isLogin.value
                                                    ? 20
                                                    : 50,
                                            child: Obx(() {
                                              return !settingController
                                                      .isLogin.value
                                                  ? settingController
                                                          .isLoading.value
                                                      ? Container()
                                                      : const Text(
                                                          "로그인이 필요합니다.",
                                                          style: TextStyle(
                                                              fontSize: 14.0))
                                                  : settingController
                                                          .isLoading.value
                                                      ? ClipOval(
                                                          child: Container(
                                                              width: 50,
                                                              height: 50,
                                                              color: Colors
                                                                  .black38))
                                                      : ClipOval(
                                                          child: Image.network(
                                                          settingController
                                                              .user.profile,
                                                          width: 50,
                                                          height: 50,
                                                          fit: BoxFit.cover,
                                                        ));
                                            })),
                                        const SizedBox(width: 10),
                                        GestureDetector(
                                          onTap: () =>
                                              Get.toNamed(Routes.profileUpdate),
                                          child: Row(
                                            children: [
                                              !settingController.isLogin.value
                                                  ? Container()
                                                  : Obx(() => Text(
                                                      settingController
                                                              .isLoading.value
                                                          ? '로딩'
                                                          : settingController
                                                              .user.nickname,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium)),
                                              const SizedBox(width: 10),
                                              const Icon(
                                                CupertinoIcons.chevron_right,
                                                color: Colors.black,
                                                size: 16,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        const Divider(
                          height: 1,
                          color: Colors.black12,
                        ),
                        const SettingButtonBoxs(),
                        const Divider(
                          height: 1,
                          color: Colors.black12,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              // SettingSnsBoxItem(
                              //     text: "인스타그램",
                              //     onTap: () {},
                              //     img: "assets/image/sns/instagram.png"),
                              SettingSnsBoxItem(
                                  text: "네이버 블로그",
                                  onTap: () async {
                                    String link = dotenv.get("NAVER_BLOG");
                                    final Uri url = Uri.parse(link);
                                    if (!await launchUrl(url)) {
                                      throw Exception('Could not launch $url');
                                    }
                                  },
                                  img: "assets/image/sns/blog-pencil.png"),
                              SettingSnsBoxItem(
                                  text: "티스토리 블로그",
                                  onTap: () async {
                                    String link = dotenv.get("TISTORY");
                                    final Uri url = Uri.parse(link);
                                    if (!await launchUrl(url)) {
                                      throw Exception('Could not launch $url');
                                    }
                                  },
                                  img: "assets/image/sns/blog-text.png")
                            ],
                          ),
                        ),
                        const Divider(
                          height: 1,
                          color: Colors.black12,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("현재 앱 버전",
                                      style: appTheme.textTheme.bodyLarge),
                                  const SizedBox(height: 5),
                                  Obx(() => Text(
                                      settingController.isLoading.value
                                          ? '로딩'
                                          : settingController.appVersion.value,
                                      style: appTheme.textTheme.bodyMedium)),
                                ],
                              ),
                              SimpleTextButton(
                                  text: "업데이트",
                                  event: () {
                                    Get.snackbar("최신 버전의 앱입니다.", "닥터팟");
                                  })
                            ],
                          ),
                        ),
                        const Divider(
                          height: 1,
                          color: Colors.black12,
                        ),
                        Obx(() => (!settingController.isLoading.value &&
                                settingController.isLogin.value)
                            ? SettingBoxItem(
                                title: '진료과 변경하기',
                                description: '알림 등에 사용되는 진료과를 변경할 수 있습니다.',
                                event: () async {
                                  await Get.dialog(
                                    const PleaseDepartmentModal(),
                                  );
                                })
                            : const SizedBox()),
                        Obx(() => (!settingController.isLoading.value &&
                                settingController.isLogin.value)
                            ? SettingBoxItem(
                                title: '이메일 변경하기',
                                description: '이메일을 변경할 수 있습니다.',
                                event: () async {
                                  Get.toNamed(Routes.email);
                                })
                            : const SizedBox()),
                        SettingBoxItem(
                            title: '개원 입지',
                            description: '개원 입지를 확인해보세요.',
                            event: () {
                              Get.toNamed(Routes.map);
                            }),
                        SettingBoxItem(
                            title: '이벤트 확인하기',
                            description: '진행 중인 다양한 이벤트를 확인해보세요.',
                            event: () {
                              Get.toNamed(Routes.events);
                            }),
                        SettingBoxItem(
                            title: '개인정보처리방침',
                            description: '개인정보처리방침을 확인할 수 있습니다.',
                            event: () async {
                              String webviewLink = dotenv.get("WEBVIEW_SERVER");
                              final Uri url =
                                  Uri.parse('$webviewLink/privacyPolicy');
                              if (!await launchUrl(url)) {
                                throw Exception('Could not launch $url');
                              }
                            }),
                        SettingBoxItem(
                            title: '서비스 이용약관',
                            description: '이용약관을 확인할 수 있습니다.',
                            event: () async {
                              String webviewLink = dotenv.get("WEBVIEW_SERVER");
                              final Uri url =
                                  Uri.parse('$webviewLink/termsOfUse');
                              if (!await launchUrl(url)) {
                                throw Exception('Could not launch $url');
                              }
                            }),
                        Obx(() => settingController.isLoading.value
                            ? const SizedBox(height: 1)
                            : Column(
                                children: [
                                  settingController.isLogin.value
                                      ? SettingBoxItem(
                                          title: '로그아웃',
                                          description:
                                              '로그인 시 더 다양한 기능을 확인할 수 있습니다.',
                                          event: () {
                                            settingController.logout(context);
                                          })
                                      : Container(),
                                  settingController.isLogin.value
                                      ? SettingBoxItem(
                                          title: '탈퇴하기',
                                          description: '탈퇴 시 기능이 제한될 수 있습니다.',
                                          event: () {
                                            Get.toNamed(Routes.deleteAccount);
                                          })
                                      : Container()
                                ],
                              )),
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
