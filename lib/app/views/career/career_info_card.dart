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
                  child: const Column(
                    children: [
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Text("5",
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      SizedBox(height: 150),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
