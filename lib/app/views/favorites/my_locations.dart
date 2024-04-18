import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';
import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/data/models/models.dart';

class MyLocations extends StatefulWidget {
  const MyLocations({Key? key}) : super(key: key);

  @override
  State<MyLocations> createState() => _MyLocationsState();
}

class _MyLocationsState extends State<MyLocations> {
  final PagingController<int, Location> _pagingController =
      PagingController(firstPageKey: 0);

  final LikeLocationController myLocationController =
      Get.put(LikeLocationController());

  /// [변수]
  /// myLocations 전용 paging 변수
  int page = 1;

  /// [변수]
  /// 좋아요한 입지들
  List<Location> likeLocations = [];

  /// [Method]
  /// page 숫자 더하기
  void addPage() {
    page += 1;
    setState(() {});
  }

  /// [Method]
  /// 입지 좋아요
  void handleLike(Location location) async {
    await myLocationController.likeLocation(context, location);
    likeLocations.add(location);
    setState(() {});
  }

  /// [Method]
  /// 입지 좋아요 취소
  void handleUnLike(Location location) async {
    await myLocationController.unlikeLocation(context, location);
    likeLocations.remove(location);
    setState(() {});
  }

  @override
  void initState() {
    likeLocations = myLocationController.likeLocations;

    _pagingController.addPageRequestListener((pageKey) {
      myLocationController.getMyLocations(_pagingController);
    });
    setState(() {});
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
                    noItemsFoundIndicatorBuilder: (context) =>
                        NoDatas(text: '올린 매물이 없습니다.'),
                    firstPageErrorIndicatorBuilder: (context) =>
                        NoDatas(text: '올린 매물이 없습니다.'),
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
                        likes: likeLocations,
                        like: (location) => handleLike(location),
                        unlike: (location) => handleUnLike(location),
                      );
                    },
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
