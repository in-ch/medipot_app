// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:docspot_app/app/views/views.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/constants/constants.dart';
import 'package:docspot_app/services/services.dart';

class PleaseDepartmentModal extends StatefulWidget {
  const PleaseDepartmentModal({super.key});

  @override
  State<PleaseDepartmentModal> createState() => _PleaseDepartmentModalState();
}

class _PleaseDepartmentModalState extends State<PleaseDepartmentModal> {
  String? selectedDepartment;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 220, 220, 220),
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "진료과를 알려주세요.",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              text: "매일 ",
              style: Theme.of(context).textTheme.displayMedium,
              children: [
                const TextSpan(
                  text: "오전 8시",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: " 채용 공고를 알려드립니다.",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: SingleChildScrollView(
                child: Wrap(
                    children: departmentList
                        .map((department) => Opacity(
                              opacity:
                                  selectedDepartment == department ? 1 : 0.3,
                              child: CommonButton(
                                onClick: () {
                                  setState(() {
                                    selectedDepartment = department;
                                  });
                                },
                                text: department,
                                isHighlight: selectedDepartment == department,
                              ),
                            ))
                        .toList()),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0, backgroundColor: colorScheme.primary),
                onPressed: () async {
                  if (selectedDepartment == null) {
                    Get.snackbar("진료과를 미선택하였습니다.", "진료과를 선택해주세요.");
                    return;
                  }
                  await UserService.updateDepartment(
                      selectedDepartment.toString());
                  Navigator.pop(context);
                },
                child: Text('확인',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.white)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: colorScheme.primary),
                    )),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('취소',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: colorScheme.primary)),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
