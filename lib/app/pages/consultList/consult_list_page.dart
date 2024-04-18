import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';

class ConsultListPage extends GetView<ConsultListController> {
  const ConsultListPage({super.key});

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
                title: SizedBox(
                  width: 200,
                  child: Text("상담 목록",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineMedium),
                )),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    height: double.infinity,
                    child: PagedListView<int, dynamic>(
                      padding: const EdgeInsets.all(8.0),
                      pagingController: controller.pagingController,
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
                            NoDatas(text: '상담 목록이 없습니다.'),
                        firstPageErrorIndicatorBuilder: (context) =>
                            NoDatas(text: '상담 목록이 없습니다.'),
                        newPageProgressIndicatorBuilder: (context) => Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                colorScheme.primary),
                          ),
                        ),
                        itemBuilder: (context, item, index) {
                          return MyConsultItem(
                            consult: item,
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}
