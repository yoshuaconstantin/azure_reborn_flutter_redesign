import 'dart:async';

import 'package:basic_utils/basic_utils.dart';
import 'package:dio/dio.dart';

import '../../additional/constant.dart';
import '../../additional/generals.dart';
import '../../additional/preferences.dart';
import '../api_manager.dart';


class AuthorizationInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (Preferences.getInstance().contain(SharedPreferenceKey.JWT_auth)) {
      String? expires = Preferences.getInstance().getString(SharedPreferenceKey.JWT_auth);

      if (StringUtils.isNotNullOrEmpty(expires)) {
        if (DateTime.now().isAfter(DateTime.fromMillisecondsSinceEpoch(int.parse(expires!)))) {
          await refreshToken();
        }
      } else {
        await refreshToken();
      }

      options.headers["Authorization"] = Preferences.getInstance().getString(SharedPreferenceKey.JWT_auth);
    }

    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response != null && err.response!.statusCode == 401) {
      Generals.signOut();
    }

    return handler.next(err);
  }

  FutureOr<void> refreshToken() async {
    try {
      Response response = await ApiManager().refreshToken(
          Token: Preferences.getInstance().getString(SharedPreferenceKey.TOKEN, "")!
      );

      if (response.statusCode == 200) {
        Preferences.getInstance().setString(SharedPreferenceKey.JWT_auth, response.headers["jwt"]![0]);
      } else {
        Generals.signOut();
      }
    } catch (e, stacktrace) {
      print("Error: ${e}");
      print("Stacktrace: ${stacktrace}");

      Generals.signOut();
    }

  }
}