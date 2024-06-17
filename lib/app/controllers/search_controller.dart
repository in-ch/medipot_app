import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter/material.dart';

import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/services/services.dart';

class SearchsController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  RxBool isLoading = false.obs;
  RxInt page = 0.obs;

  RxList<KeywordRank> keywordRanks = <KeywordRank>[].obs;
  RxList<String> recentKeywords = <String>[].obs;

  final PagingController<int, CareerListItem> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() async {
    focusNode.requestFocus();
    getSearchRank();
    super.onInit();
  }

  /// [비즈니스 로직]
  /// 최근 검색어를 초기화한다.
  void clearKeywordRanks() {
    recentKeywords.clear();
    update();
  }

  /// [비즈니스 로직]
  /// 최근 검색어 추가
  void addKeyword(String keyword) {
    if (!recentKeywords.contains(keyword)) {
      recentKeywords.insert(0, keyword);
      update();
    } else {
      // 키워드가 이미 리스트에 있는 경우, 해당 키워드를 리스트 맨 앞으로 이동
      recentKeywords.remove(keyword);
      recentKeywords.insert(0, keyword);
      update();
    }
  }

  /// 페이지 숫자 더하기
  void addPage() {
    page.value += 1;
    update();
  }

  /// [비즈니스 로직]
  /// 단순히 LikeList를 초기화한다.
  Future<dynamic> getSearchRank() async {
    try {
      final response = await SearchService.getSearchRank();
      if (response['statusCode'] == 200) {
        final data = response['data'];
        final keywordRankResponse = KeywordRankResponse.fromJson(data);
        keywordRanks.clear();
        for (var keyword in keywordRankResponse.keywordList) {
          keywordRanks.add(
              KeywordRank(keyword: keyword.keyword, upDown: keyword.upDown));
        }
      }
    } catch (error) {
      debugPrint(error.toString());
      update();
    } finally {
      update();
    }
  }

  Future<void> getCareersForSearchList(int pageKey) async {
    try {
      final response = await CareerService.getCareers(
          pageKey,
          10,
          Get.arguments['keyword'],
          Get.arguments['keyword'],
          '전체보기',
          Get.arguments['keyword'],
          '전국',
          '');

      if (response['statusCode'] == 200) {
        final data = response['data'];
        final totalCount = response['totalCount'];
        final list = List<CareerListItem>.from(
            data.map((item) => CareerListItem.fromJson(item)));
        final isLastPage = totalCount <= pageKey * 10;

        if (isLastPage) {
          pagingController.appendLastPage(list);
        } else {
          addPage();
          pagingController.appendPage(list, pageKey + 1);
        }
        update();
      } else {
        pagingController.error = 'Failed to load data';
      }
    } catch (error) {
      debugPrint(error.toString());
      pagingController.error = error;
    } finally {
      update();
    }
  }
}
