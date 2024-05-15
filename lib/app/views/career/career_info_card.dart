import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/views/views.dart';
import 'package:docspot_app/app/controllers/controllers.dart';

class CareerInfoCard extends StatefulWidget {
  const CareerInfoCard({super.key});

  @override
  State<CareerInfoCard> createState() => _CareerInfoCardState();
}

class _CareerInfoCardState extends State<CareerInfoCard> {
  bool scrollAble = false;
  final CareerController careerController = Get.put(CareerController());

  void _onStartScroll(ScrollMetrics metrics) {}

  void _onUpdateScroll(ScrollUpdateNotification notification) {
    final scrollDelta = notification.dragDetails?.delta.dy ?? 0;
    if (scrollDelta > 0) {
      if (!careerController.hideBottomButton.value) {
        careerController.hideBottomButton.value = true;
      }
    } else if (scrollDelta < 0) {
      if (careerController.hideBottomButton.value) {
        careerController.hideBottomButton.value = false;
      }
    }
  }

  void _onEndScroll(ScrollEndNotification notification) {
    if (careerController.hideBottomButton.value) {
      final position = notification.metrics.pixels;
      if (position < 1.0) {
        scrollAble = false;
        setState(() {});
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    double minCardHeightFraction = 0.70;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final safeArea = MediaQuery.paddingOf(context);
    final appBarHeight = AppBar().preferredSize.height;

    final cardMinHeight = screenHeight * minCardHeightFraction;
    final cardMaxHeight = screenHeight - appBarHeight - safeArea.top;

    return AutoSlideUpPanel(
      minHeight: cardMinHeight,
      maxHeight: cardMaxHeight,
      onPanelSlide: (position) {
        careerController.bodyHeight.value = position;
        if (position > 0.99) scrollAble = true;
      },
      child: Container(
        height: double.infinity,
        color: Colors.white,
        child: Obx(() => NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollStartNotification) {
                  _onStartScroll(scrollNotification.metrics);
                } else if (scrollNotification is ScrollUpdateNotification) {
                  _onUpdateScroll(scrollNotification);
                } else if (scrollNotification is ScrollEndNotification) {
                  _onEndScroll(scrollNotification);
                }
                return false;
              },
              child: SingleChildScrollView(
                physics: (careerController.bodyHeight.value == 1 && scrollAble)
                    ? const ScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("[분당 서현] 외래 진료 보조 업무 모집합니다.",
                            style: Theme.of(context).textTheme.headlineMedium),
                        const SizedBox(height: 5),
                        Text("분당서울대병원",
                            style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(height: 10),
                        const Wrap(
                          children: [
                            Keyword(text: "🔥 화이팅"),
                            Keyword(text: "❄️ 추워요잉"),
                            Keyword(text: "🕰️ 시간은 째각째각"),
                            Keyword(text: "💰 행복과 돈"),
                            Keyword(text: "🌹 이건 장미"),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text("상세 내용",
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 5),
                        Text('''
안녕하십니까, 근로복지공단 **병원은 산재보험자병원으로 공공병원입니다.
응시원서 접수 마감일 2024년 5월 24일(금) 17시 30분 까지로 결원 인원에 대한 채용입니다.
채용일정 등 상세한 정보는 첨부파일의 채용공고문 참조 부탁드립니다.
관심이 있으신 분은  경영기획차장(055-280-****)에게 연락 부탁드립니다.

우편 또는 방문 접수도 가능하나 자사양식 접수로 첨부파일 참조 후 이메일 접수 부탁드립니다.


□ 재활의학과 전문의(별정직 의사)

- (채용인원) 재활의학과 전문의 1명
- (위치) 경남 창원시 성산구 창원대로 ***
- (근무조건) 주 5일 (평일 08:30~17:30), 주말 및 공휴일 휴진
- (급여) 세전 *** 수준 / 기본연봉, 진료성과급 포함 / 퇴직금, 연차수당, 기타 포상비(협진, 특진, 호출 등) 별도
 * 근무조건(주 32시간~40시간) 및 급여 추가 협의 가능
- (학회) 규정에 의거 일부 공가 부여
- (문의) 경영기획차장 055-280-****
''', style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.8)),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("모집 개요",
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 5),
                        const Section(title: "초빙과목", value: "재활의학과"),
                        const Section(title: "초빙유형", value: "봉직의(1명, 정규직"),
                        const Section(title: "경력", value: "무관"),
                        const Section(title: "구인사유", value: "결원"),
                        const Section(
                            title: "급여",
                            value: "Gross(세전) 연봉 111,111 ~ 222,222(만원)"),
                        const Section(
                            title: "근무시간",
                            value: '''평일 08시 30분 ~ 17시 30분 (주말 근무 x)'''),
                        const Section(
                            title: "당직", value: "야간 당직 없음 / 주말 당직 없음"),
                        const Section(title: "학회 출석", value: "가능"),
                        const Section(title: "기타", value: '''연차 15일'''),
                        const SizedBox(
                          height: 40,
                        ),
                        Text("지원 기간 / 방법",
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 5),
                        const Section(title: "마감일", value: "2024. 05. 24 (마감)"),
                        const Section(title: "담당자", value: "김미영 팀장 (경영기획부)"),
                        const Section(
                          title: "이메일",
                          value: "sample@gmail.com",
                        ),
                        const Section(title: "전화", value: "053-1234-xxxx"),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("근무지역",
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(
                          height: 20,
                        ),
                        const CareerCompanyInfo(
                            title: "본탑메디본재활의학과",
                            href: "https://naver.com",
                            img:
                                "https://attach.medijob.cc/file/company/heal-teun/20220808170159842172E801FA4902A4F8F7B6B532461D.png"),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
