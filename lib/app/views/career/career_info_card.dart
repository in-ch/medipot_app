import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/views/views.dart';
import 'package:docspot_app/data/models/models.dart';

class CareerInfoCard extends StatefulWidget {
  const CareerInfoCard({super.key, required this.career});

  final Career career;

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
                        Text(widget.career.title,
                            style: Theme.of(context).textTheme.headlineMedium),
                        const SizedBox(height: 5),
                        Text(widget.career.hospital.name,
                            style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(height: 10),
                        Wrap(
                          children: List.generate(
                              widget.career.keywords.length,
                              (index) =>
                                  Keyword(text: widget.career.keywords[index])),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text("상세 내용",
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 5),
                        Html(data: widget.career.detail),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("모집 개요",
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 5),
                        Section(
                            title: "초빙과목", value: widget.career.invitedSubject),
                        Section(
                            title: "초빙유형", value: widget.career.invitationType),
                        Section(title: "경력", value: widget.career.experience),
                        Section(
                            title: "구인사유",
                            value: widget.career.reasonForHiring),
                        Section(title: "급여", value: widget.career.salary),
                        Section(
                            title: "근무시간", value: widget.career.workingHours),
                        Section(title: "당직", value: widget.career.onCallDuty),
                        Section(
                            title: "학회 출석",
                            value: widget.career.conferenceAttendance
                                ? "가능"
                                : "불가"),
                        Section(title: "기타", value: widget.career.otherDetails),
                        const SizedBox(
                          height: 40,
                        ),
                        Text("지원 기간 / 방법",
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 5),
                        Section(title: "마감일", value: widget.career.deadline),
                        Section(
                            title: "담당자", value: widget.career.contactPerson),
                        Section(
                          title: "이메일",
                          value: widget.career.contactEmail,
                        ),
                        Section(title: "전화", value: widget.career.contactPhone),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("근무지역",
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(
                          height: 20,
                        ),
                        CareerCompanyInfo(
                            title: widget.career.hospital.name,
                            href: widget.career.hospital.homepage,
                            img: widget.career.hospital.logo,
                            address: widget.career.hospital.locationDetail,
                            lat: widget.career.hospital.lat,
                            lng: widget.career.hospital.lng),
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
