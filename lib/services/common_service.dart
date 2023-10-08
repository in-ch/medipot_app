import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';

class CommonService {
  static Future<String> uploadImg(XFile xfile) async {
    String apiServer = dotenv.get("API_SERVER");
    Dio dio = Dio();
    final MultipartFile file = MultipartFile.fromFileSync(xfile.path);
    FormData formData = FormData.fromMap({"file": file});

    final url = '$apiServer/uploads/';

    final response = await dio.post(url, data: formData);
    return response.data['url'];
  }
}
