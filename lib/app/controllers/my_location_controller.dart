import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medipot_app/data/models/models.dart';
import 'package:medipot_app/services/services.dart';

class MyLocationController extends GetxController {
  RxInt page = 0.obs;
  List<Location> myLocations = [];

  /// [비즈니스 로직]
  /// fetch getMyLocations list
  Future<dynamic> getLikeLocations(PagingController pagingController) async {
    try {
      final response = await MyLocationService.getMyLocations();
      if (response['statusCode'] == 200) {
        final data = response['data'] as List;
        final list =
            List<Location>.from(data.map((item) => Location.fromJson(item)));
        myLocations.addAll(list);
        pagingController.appendLastPage(list);
        update();
      } else {
        throw Exception('Failed to FETCH myLocations');
      }
    } catch (error) {
      update();
      throw Exception(error);
    } finally {
      update();
    }
  }
}
