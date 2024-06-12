import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';
import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/app/controllers/controllers.dart';

class LikeCareers extends StatefulWidget {
  const LikeCareers({Key? key}) : super(key: key);

  @override
  State<LikeCareers> createState() => _LikeCareersState();
}

class _LikeCareersState extends State<LikeCareers> {
  final PagingController<int, CareerListItem> _pagingController =
      PagingController(firstPageKey: 0);

  final CareerController careerController = Get.put(CareerController());

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
      careerController.getLikeCareersInfinite(_pagingController);
    });
    careerController.getLikeCareers();
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
      backgroundColor: colorScheme.surface,
      extendBody: true,
      body: Column(
        children: [
          Expanded(
            child: Container(
                color: colorScheme.surface,
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
                        text: '찜한 공고가 없습니다.', sub: "닥스팟에서 마음에 드는 초빙공고를 찜해보세요."),
                    firstPageErrorIndicatorBuilder: (context) => NoDatas(
                        text: '찜한 공고가 없습니다.', sub: "닥스팟에서 마음에 드는 초빙공고를 찜해보세요."),
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
                      return CareerItem(
                        no: item.no,
                        img: item.imgs[0],
                        company: "",
                        position: item.title,
                        deadline: '2024-12-31 23:59:00',
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
