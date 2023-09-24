import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:medipot_app/app/style/theme.dart';
import 'package:medipot_app/app/views/views.dart';
import 'package:medipot_app/app/controllers/controllers.dart';
import 'package:medipot_app/data/models/models.dart';

class MyLocations extends StatefulWidget {
  const MyLocations({Key? key}) : super(key: key);

  @override
  State<MyLocations> createState() => _MyLocationsState();
}

class _MyLocationsState extends State<MyLocations> {
  final PagingController<int, Location> _pagingController =
      PagingController(firstPageKey: 0);

  final MyLocationController myLocationController =
      Get.put(MyLocationController());

  /// [변수]
  /// myLocations 전용 paging 변수
  int page = 1;

  /// [Method]
  /// page 숫자 더하기
  void addPage() {
    page += 1;
    setState(() {});
  }

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      myLocationController.getLikeLocations(_pagingController);
    });
    super.initState();
  }

  @override
  dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.background,
      extendBody: true,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: colorScheme.background,
              height: double.infinity,
              child: PagedListView<int, dynamic>(
                padding: const EdgeInsets.all(8.0),
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<dynamic>(
                  firstPageProgressIndicatorBuilder: (context) => Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(colorScheme.primary),
                    ),
                  ),
                  noItemsFoundIndicatorBuilder: (context) => const NoDatas(),
                  newPageProgressIndicatorBuilder: (context) => Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(colorScheme.primary),
                    ),
                  ),
                  itemBuilder: (context, item, index) {
                    return MyLocationItem(
                      location: item,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
