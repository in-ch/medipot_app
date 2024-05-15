import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';

class CareerListPage extends GetView<CareerController> {
  const CareerListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: appTheme,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: Theme.of(context).iconTheme,
            centerTitle: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leadingWidth: 54,
            leading: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                  child: const Icon(CupertinoIcons.back),
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
            ),
            title: Text("초빙정보 찾기",
                style: Theme.of(context).textTheme.headlineSmall),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 0),
                      child: Obx(
                        () => DropdownButton<String>(
                          value: controller.locationValue.value,
                          style: const TextStyle(color: Colors.black),
                          iconEnabledColor: Colors.black26,
                          dropdownColor: Colors.white,
                          underline: Container(),
                          onChanged: (String? newValue) {
                            controller.locationValue.value = newValue!;
                          },
                          items: controller.locationList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 0),
                      child: Obx(
                        () => DropdownButton<String>(
                          value: controller.departmentValue.value,
                          style: const TextStyle(color: Colors.black),
                          iconEnabledColor: Colors.black26,
                          dropdownColor: Colors.white,
                          underline: Container(),
                          onChanged: (String? newValue) {
                            controller.departmentValue.value = newValue!;
                          },
                          items: controller.departmentList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  ],
                ),
                Obx(
                  () => controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          width: double.infinity,
                          child: GridView(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                            ),
                            children: const [
                              CareerItem(
                                  img:
                                      "https://cdn.pixabay.com/photo/2015/07/10/20/54/stethoscope-840125_1280.jpg",
                                  company: "본탑재활의학과의원",
                                  position:
                                      "[분당 서현] 외래 진료 보조 업무 도와주실 선생님 모십니다."),
                              CareerItem(
                                  img:
                                      "https://cdn.pixabay.com/photo/2015/07/10/20/54/stethoscope-840125_1280.jpg",
                                  company: "삼성열린내과",
                                  position: "7호선 신대방삼거리역 삼성열린내과 정규직(주5일)"),
                              CareerItem(
                                  img:
                                      "https://cdn.pixabay.com/photo/2015/07/10/20/54/stethoscope-840125_1280.jpg",
                                  company: "참바로병원",
                                  position: "정형외과 외과 전문의"),
                              CareerItem(
                                  img:
                                      "https://cdn.pixabay.com/photo/2015/07/10/20/54/stethoscope-840125_1280.jpg",
                                  company: "삼성 손앤박 이비인후과의원",
                                  position: "이비인후과 전문의 초빙합니다."),
                              CareerItem(
                                  img:
                                      "https://cdn.pixabay.com/photo/2015/07/10/20/54/stethoscope-840125_1280.jpg",
                                  company: "삼성 손앤박 이비인후과의원",
                                  position: "이비인후과 전문의 초빙합니다."),
                              CareerItem(
                                  img:
                                      "https://cdn.pixabay.com/photo/2015/07/10/20/54/stethoscope-840125_1280.jpg",
                                  company: "삼성 손앤박 이비인후과의원",
                                  position: "이비인후과 전문의 초빙합니다."),
                            ],
                          ),
                        ),
                )
              ],
            ),
          ),
        ));
  }
}
