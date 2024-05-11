import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';

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
              ],
            ),
          ),
        ));
  }
}
