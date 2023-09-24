import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medipot_app/data/models/models.dart';
import 'package:medipot_app/services/services.dart';

class ConsultController extends GetxController {
  RxInt page = 0.obs;
  List<Consult> myConsults = [];

  /// [비즈니스 로직]
  /// fetch getMyConsult list
  Future<dynamic> getMyConsults(PagingController pagingController) async {
    try {
      final response = await ConsultService.getMyConsults();
      if (response['statusCode'] == 200) {
        final data = response['data'] as List;
        final list =
            List<Consult>.from(data.map((item) => Consult.fromJson(item)));
        myConsults.addAll(list);
        pagingController.appendLastPage(list);
        update();
      } else {
        throw Exception('Failed to FETCH get my Consults');
      }
    } catch (error) {
      update();
      throw Exception(error);
    } finally {
      update();
    }
  }
}
