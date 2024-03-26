import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:docspot_app/app/views/views.dart';
import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/services/services.dart';

class Feeds extends StatefulWidget {
  const Feeds({
    Key? key,
    required this.tag,
    this.text = '',
  }) : super(key: key);

  final String tag;
  final String text;

  @override
  State<Feeds> createState() => _FeedsState();
}

class _FeedsState extends State<Feeds>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<Feeds> {
  @override
  bool get wantKeepAlive => false;

  int totalCount = 0;
  List<Writing> list = [];

  final PagingController<int, Writing> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      fetchList(widget.tag, widget.text);
    });
    super.initState();
  }

  @override
  dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<List<Writing>> fetchList(String tag, String text) async {
    try {
      final response = await WritingsService.getWritings(tag, text);
      if (response['statusCode'] == 200) {
        final data = response['data'];
        final list = List<Writing>.from(
            data['list'].map((item) => Writing.fromJson(item)));
        totalCount = response['totalCount'];

        _pagingController.appendLastPage(list);
        return list;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PagedListView<int, Writing>(
      padding: const EdgeInsets.only(top: 22),
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Writing>(
        firstPageProgressIndicatorBuilder: (context) => Container(),
        noItemsFoundIndicatorBuilder: (context) => const Text(
          "데이터가 없어",
          style: TextStyle(color: Colors.black),
        ),
        newPageProgressIndicatorBuilder: (context) => Container(),
        itemBuilder: (context, item, index) {
          return FeedWidget(
            isDetail: false,
            hideFollow: false,
            writing: item,
          );
        },
      ),
    );
  }
}
