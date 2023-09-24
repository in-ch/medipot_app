import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:medipot_app/app/style/theme.dart';
import 'package:medipot_app/app/views/views.dart';
import 'package:medipot_app/data/models/models.dart';

class LikeLocations extends StatefulWidget {
  const LikeLocations({Key? key}) : super(key: key);

  @override
  State<LikeLocations> createState() => _LikeLocationsState();
}

class _LikeLocationsState extends State<LikeLocations> {
  final PagingController<int, LikeLocation> _pagingController =
      PagingController(firstPageKey: 0);

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
      // context.read<HomeProvider>().fetchLikeListExplore(context, _pagingController, page, addPage);
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
                padding: const EdgeInsets.only(top: 22),
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
                    return Container(
                        width: 50, height: 50, color: Colors.black38);
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
