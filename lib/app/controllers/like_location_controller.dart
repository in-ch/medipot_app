import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medipot_app/data/models/models.dart';
import 'package:medipot_app/services/services.dart';

class LikeLocationController extends GetxController {
  RxInt page = 0.obs;
  List<LikeLocation> likeLocation = [];

  /// [비즈니스 로직]
  /// fetch likeLocations list
  Future<dynamic> getLikeLocations(PagingController pagingController) async {
    try {
      final response = await LikeLocationService.getLikeLocations();
      if (response['statusCode'] == 200) {
        final data = response['data'] as List;
        final list = List<LikeLocation>.from(
            data.map((item) => LikeLocation.fromJson(item)));
        likeLocation.addAll(list);
        pagingController.appendLastPage(list);
        update();
      } else {
        throw Exception('Failed to FETCH LikeLocations');
      }
    } catch (error) {
      update();
      throw Exception(error);
    } finally {
      update();
    }
  }
}
