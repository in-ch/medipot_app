import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/constants/constants.dart';
import 'package:docspot_app/app/views/common/common_button.dart';
import 'package:docspot_app/app/controllers/controllers.dart';

class SelectLocationAndDepartmentModal extends StatefulWidget {
  const SelectLocationAndDepartmentModal(
      {super.key, required this.initTabIndex});

  final int initTabIndex;

  @override
  State<SelectLocationAndDepartmentModal> createState() =>
      _SelectLocationAndDepartmentModalState();
}

class _SelectLocationAndDepartmentModalState
    extends State<SelectLocationAndDepartmentModal>
    with
        TickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<SelectLocationAndDepartmentModal> {
  @override
  bool get wantKeepAlive => false;

  late TabController _tabController;
  final RxList<String> locationListValue = RxList<String>(locationList);
  final RxList<String> departmentListValue =
      RxList<String>(['전체보기', ...departmentList]);

  late final CareerListController controller;

  String? selectedLocation;
  String? selectedDepartment;

  @override
  void initState() {
    _tabController = TabController(
        length: 2, vsync: this, initialIndex: widget.initTabIndex);

    if (!Get.isRegistered<CareerListController>()) {
      controller = Get.put(CareerListController());
    } else {
      controller = Get.find<CareerListController>();
    }
    setState(() {
      selectedDepartment = controller.departmentValue.value;
    });
    setState(() {
      selectedLocation = controller.locationValue.value;
    });
    super.initState();
  }

  void _onDismiss() {
    if (selectedLocation != null) {
      controller.updateLocation(selectedLocation!);
    }
    if (selectedDepartment != null) {
      controller.updateDepartment(selectedDepartment!);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return PopScope(
      onPopInvoked: (bool didPop) {
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
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: TabBar(
                    tabs: [
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        child: const Text("지역 선택"),
                      ),
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        child: const Text(
                          "진료과 선택",
                        ),
                      ),
                    ],
                    indicatorColor: Colors.white,
                    labelColor: colorScheme.primary,
                    unselectedLabelColor:
                        const Color.fromARGB(255, 136, 136, 136),
                    controller: _tabController,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    dividerColor: Colors.transparent,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: const Color.fromARGB(96, 210, 210, 210),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Wrap(
                        children: locationListValue
                            .map((location) => Opacity(
                                  opacity:
                                      selectedLocation == location ? 1 : 0.3,
                                  child: CommonButton(
                                    onClick: () {
                                      setState(() {
                                        selectedLocation = location;
                                      });
                                    },
                                    text: location,
                                    isHighlight: selectedLocation == location,
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: SingleChildScrollView(
                        child: Wrap(
                          children: departmentListValue
                              .map((department) => Opacity(
                                    opacity: selectedDepartment == department
                                        ? 1
                                        : 0.3,
                                    child: CommonButton(
                                      onClick: () {
                                        setState(() {
                                          selectedDepartment = department;
                                        });
                                      },
                                      text: department,
                                      isHighlight:
                                          selectedDepartment == department,
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
