import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';
import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/app/controllers/controllers.dart';

class LikeLocations extends StatefulWidget {
  const LikeLocations({Key? key}) : super(key: key);

  @override
  State<LikeLocations> createState() => _LikeLocationsState();
}

class _LikeLocationsState extends State<LikeLocations> {
  final PagingController<int, LikeLocation> _pagingController =
      PagingController(firstPageKey: 0);

  final LikeLocationController likeLocationController =
      Get.put(LikeLocationController());

  /// [변수]
  /// likeLocations 전용 paging 변수
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
      likeLocationController.getLikeLocations(_pagingController);
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
                    noItemsFoundIndicatorBuilder: (context) => NoDatas(
                        text: '찜한 목록이 없습니다.', sub: "닥스팟에서 마음에 드는 매물에 찜해보세요."),
                    firstPageErrorIndicatorBuilder: (context) => NoDatas(
                        text: '찜한 목록이 없습니다.', sub: "닥스팟에서 마음에 드는 매물에 찜해보세요."),
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
                      return LikeLocationItem(
                        likeLocation: item,
                        like: (location) => likeLocationController.likeLocation(
                            context, location),
                        unlike: (location) => likeLocationController
                            .unlikeLocation(context, location),
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
