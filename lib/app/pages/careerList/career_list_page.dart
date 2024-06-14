import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';

class CareerListPage extends GetView<CareerListController> {
  const CareerListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: appTheme,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            scrolledUnderElevation: 0,
            iconTheme: Theme.of(context).iconTheme,
            centerTitle: false,
            backgroundColor: Colors.white,
            elevation: 0,
            leadingWidth: 54,
            leading: const Align(
              alignment: Alignment.centerRight,
              child: CustomBackButton(),
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
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return const SelectLocationAndDepartmentModal(
                              initTabIndex: 0,
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 0),
                        child: Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(controller.locationValue.value,
                                    style:
                                        const TextStyle(color: Colors.black)),
                                const SizedBox(width: 5),
                                const Icon(Icons.arrow_drop_down,
                                    size: 20, color: Colors.black38)
                              ],
                            )),
                      ),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return const SelectLocationAndDepartmentModal(
                              initTabIndex: 1,
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 0),
                        child: Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(controller.departmentValue.value,
                                    style:
                                        const TextStyle(color: Colors.black)),
                                const SizedBox(width: 5),
                                const Icon(Icons.arrow_drop_down,
                                    size: 20, color: Colors.black38)
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Obx(
                  () => controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : Expanded(
                          child: Container(
                          color: colorScheme.surface,
                          height: double.infinity,
                          child: PagedGridView<int, dynamic>(
                            pagingController: controller.pagingController,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15.0,
                              crossAxisSpacing: 8.0,
                              childAspectRatio: 1.0,
                            ),
                            builderDelegate: PagedChildBuilderDelegate<dynamic>(
                              firstPageProgressIndicatorBuilder: (context) =>
                                  Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      colorScheme.primary),
                                ),
                              ),
                              noItemsFoundIndicatorBuilder: (context) =>
                                  NoDatas(text: '검색 결과가 없습니다.'),
                              firstPageErrorIndicatorBuilder: (context) =>
                                  NoDatas(text: '검색 결과가 없습니다.'),
                              newPageProgressIndicatorBuilder: (context) =>
                                  Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      colorScheme.primary),
                                ),
                              ),
                              itemBuilder: (context, item, index) {
                                return CareerItem(
                                  no: item.no,
                                  img: item.imgs[0],
                                  company: item.hospital.name,
                                  position: item.title,
                                  deadline: item.deadline,
                                );
                              },
                            ),
                          ),
                        )),
                )
              ],
            ),
          ),
        ));
  }
}
