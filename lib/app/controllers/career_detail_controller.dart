import 'package:get/get.dart';

import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/services/services.dart';

class CareerDetailController extends GetxController {
  RxBool isLoading = false.obs;

  Hospital defaultHospital = Hospital(
    no: 0,
    createdAt: '',
    updatedAt: '',
    name: 'Default Hospital',
    logo: '',
    location: 'Default Location',
    locationDetail: 'Default Location Detail',
    lat: 0.0,
    lng: 0.0,
    homepage: 'https://example.com',
  );

  Career career = Career.defaultCareer();

  @override
  void onInit() {
    int no = Get.arguments['no'];
    Future.delayed(Duration.zero, () async {
      getCareer(no);
    });
    super.onInit();
  }

  /// [비즈니스 로직]
  /// 커리어 상세 내용을 가져온다.
  Future<dynamic> getCareer(int no) async {
    try {
      isLoading.value = true;
      final response = await CareerService.getCareer(no);
      if (response['statusCode'] == 200) {
        final data = response['data'];
        career = Career.fromJson(data);
      }
    } catch (error) {
      print(error);
      isLoading.value = false;
      update();
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
