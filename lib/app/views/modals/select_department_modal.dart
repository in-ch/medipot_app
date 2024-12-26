import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:docspot_app/app/constants/constants.dart';
import 'package:docspot_app/app/views/common/common_button.dart';
import 'package:docspot_app/app/controllers/controllers.dart';

class SelectDepartmentModal extends StatefulWidget {
  const SelectDepartmentModal({super.key});

  @override
  State<SelectDepartmentModal> createState() => _SelectDepartmentModalState();
}

class _SelectDepartmentModalState extends State<SelectDepartmentModal>
    with
        TickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<SelectDepartmentModal> {
  @override
  bool get wantKeepAlive => false;

  final RxList<String> departmentListValue =
      RxList<String>(['전체보기', ...departmentList]);

  late final ArticleController controller;

  String? selectedLocation;
  String? selectedDepartment;

  @override
  void initState() {
    if (!Get.isRegistered<CareerListController>()) {
      controller = Get.put(ArticleController());
    } else {
      controller = Get.find<ArticleController>();
    }
    setState(() {
      selectedDepartment = controller.departmentValue.value;
    });
    super.initState();
  }

  void _onDismiss() {
    if (selectedDepartment != null) {
      controller.updateDepartment(selectedDepartment!);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          _onDismiss();
        }
      },
      child: Container(
        height: 500,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Center(
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
              Container(
                width: double.infinity,
                height: 1,
                color: const Color.fromARGB(96, 210, 210, 210),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: SingleChildScrollView(
                    child: Wrap(
                      children: departmentListValue
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
                          .toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
