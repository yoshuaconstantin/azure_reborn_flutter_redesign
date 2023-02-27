
import 'package:dio/dio.dart';

import '../additional/constant.dart';
import '../api/api_manager.dart';



class CustomCatch {

  static const String badState = "Status buruk";
  static const String internetError = "Silahkan cek koneksi internet anda";
  static const String serverDown = "Server tidak berjalan";

  static Future<String> internetCatch() async {
    try {
      Dio dio = await ApiManager.getDio();

      // Ping to Google Server to check the internet status
      Response response = await dio.get("http://www.google.com");
      if (response.statusCode == 200) {
        // Now you can ping the AyoDesa server
        Response response = await dio.get(ApiUrl.MAIN_BASE);
        Response responseTwo = await dio.get(ApiUrl.SECONDARY_BASE);

        if (response.statusCode == 200 || responseTwo.statusCode == 200) {}
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        String message = e.error.toString();

        if (message.contains("www.google.com")) {
          return CustomCatch.internetError;
        } else {
          return CustomCatch.serverDown;
        }
      } else {
        rethrow;
      }
    }

    return "";
  }
}