import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:docspot_app/services/services.dart';
import 'package:docspot_app/data/models/models.dart';

class ArticleDetailController extends GetxController {
  RxBool isLoading = false.obs;

  ArticleListItem article = ArticleListItem(
      no: 0, titleKr: "", contentKr: "", img: "", date: "", link: "");

  @override
  void onInit() {
    int no = Get.arguments['no'];
    getArticle(no);
    super.onInit();
  }

  /// 아티클 상세 내용을 조회한다.
  Future<void> getArticle(int no) async {
    try {
      isLoading.value = true;
      final response = await ArticleService.getArticle(no);
      final data = response['data'];
      article = ArticleListItem.fromJson(data);
    } finally {
      isLoading.value = false;
      update();
    }
  }

  /// [비즈니스 로직]
  /// 원본 보기 클릭 이벤트
  Future<dynamic> handleGoToOriginLink(String link) async {
    try {
      String url = link;
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        Get.snackbar("홈페이지 열기에 실패하였습니다.", "지속 발생 시 관리자에게 문의해주세요.");
      }
    } catch (error) {
      throw Exception(error);
    } finally {
      update();
    }
  }
}
