import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/views/views.dart';

class CareerCardHeader extends GetView<CareerController> {
  const CareerCardHeader(
      {super.key,
      required this.hospitalName,
      required this.hospitalNo,
      required this.text});

  final String hospitalName;
  final int hospitalNo;
  final String text;

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.viewInsetsOf(context).bottom - 10;
    final safeAreaBottom = MediaQuery.paddingOf(context).bottom - 10;
    final correctionVal = GetPlatform.isIOS ? viewInsets + safeAreaBottom : 0;
    return Positioned(
        top: 0,
        left: 0,
        child: Obx(() => Container(
              color:
                  Colors.white.withValues(alpha: controller.bodyHeight.value),
              child: SafeArea(
                maintainBottomViewPadding: true,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white
                      .withValues(alpha: controller.bodyHeight.value),
                  height: AppBar().preferredSize.height + correctionVal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CustomBackButton(),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 18.0, bottom: 2.0),
                              child: Opacity(
                                opacity: controller.bodyHeight.value,
                                child: Text(hospitalName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () =>
                              controller.onClickShareCourtUrl(hospitalNo, text),
                          child: const Padding(
                            padding: EdgeInsets.only(right: 12.0, bottom: 4.0),
                            child: Icon(CupertinoIcons.share),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
