
import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../additional/constant.dart';
import '../additional/preferences.dart';
import '../helper/custom_catch.dart';
import 'endpoint/community_post/comment/delete_comment/community_post_comment_delete_request.dart';
import 'endpoint/community_post/comment/home_comment/community_post_comment_home_request.dart';
import 'endpoint/community_post/comment/insert_comment/community_post_comment_insert_request.dart';
import 'endpoint/community_post/comment/update_comment/community_post_comment_update_request.dart';
import 'endpoint/community_post/like/community_post_like_request.dart';
import 'endpoint/community_post/post/delete_post/community_post_delete_request.dart';
import 'endpoint/community_post/post/insert_post/community_post_insert_request.dart';
import 'endpoint/community_post/post/update_post/community_post_update_request.dart';
import 'endpoint/dashboards/update/dashboards_home_update_request.dart';
import 'endpoint/feedback/delete_feedback/feedback_delete_comment_request.dart';
import 'endpoint/feedback/insert_feedback/feedback_insert_comment_request.dart';
import 'endpoint/feedback/update_feedback/feedback_update_comment_request.dart';
import 'endpoint/profile/insert_data/profile_insert_data_request.dart';
import 'endpoint/profile/delete_image/profile_delete_image_request.dart';
import 'endpoint/profile/update_image/profile_update_image_request.dart';
import 'endpoint/profile/upload_image/profile_upload_image_request.dart';
import 'endpoint/sign_in/sign_in_request.dart';
import 'interceptor/authorization_interceptor.dart';

class ApiManager {
  static bool PRIMARY = true;

  static Future<Dio> getDio({bool withoutAuthorizationInterceptor = false}) async {
    String baseUrl;

    if (PRIMARY) {
      baseUrl = Preferences.getInstance().getString(SharedPreferenceKey.MAIN_BASE) ?? ApiUrl.MAIN_BASE;
    } else {
      baseUrl = Preferences.getInstance().getString(SharedPreferenceKey.SECONDARY_BASE) ?? ApiUrl.SECONDARY_BASE;
    }

    Dio dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 50000,
        receiveTimeout: 30000,
        responseDecoder: (responseBytes, options, responseBody) {
          if (responseBody.statusCode == 401) {
            options.responseType = ResponseType.plain;
          }

          return utf8.decode(responseBytes, allowMalformed: true);
        }));

    if (!withoutAuthorizationInterceptor) {
      dio.interceptors.add(AuthorizationInterceptor());
    }

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;

      return client;
    };

    return dio;
  }

  Future<Response> signIn({required SignInRequest signInRequest, bool secondTry = false}) async {
    try {
      Dio dio = await getDio();

      Response response = await dio.post(ApiUrl.SIGN_IN, data: signInRequest);

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return signIn(signInRequest: signInRequest, secondTry: true);
      }
    }
  }

  Future<Response> logout({required String Token, bool secondTry = false}) async {
    try {
      Dio dio = await getDio();

      Response response = await dio.get(ApiUrl.SIGN_OUT, queryParameters: {"token":Token});

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return logout(Token: Token, secondTry: true);
      }
    }
  }

  Future<Response> refreshToken({required String Token, bool secondTry = false}) async {
    try {
      Dio dio = await getDio(withoutAuthorizationInterceptor: true);

      Response response = await dio.get(ApiUrl.REFRESH_TOKEN, queryParameters: {"token":Token});

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return refreshToken(Token: Token, secondTry: true);
      }
    }
  }

  Future<Response> getDashboardsData({required String Token, bool secondTry = false}) async {
    try {
      Dio dio = await getDio();

      Response response = await dio.get(ApiUrl.DASHBOARDS, queryParameters: {"token":Token});

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return getDashboardsData(Token: Token, secondTry: true);
      }
    }
  }

  Future<Response> updateDashboardsData({required DashboardsHomeUpdateRequest data, bool secondTry = false}) async {
    try {
      Dio dio = await getDio();

      Response response = await dio.post(ApiUrl.UPDATE_DASHBOARDS_DATA, data: data);

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return updateDashboardsData(data: data, secondTry: true);
      }
    }
  }

  Future<Response> getDataProfile({required String Token, bool secondTry = false}) async {
    try {
      Dio dio = await getDio(withoutAuthorizationInterceptor: true);

      Response response = await dio.get(ApiUrl.PROFILES, queryParameters: {"token":Token});

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return getDataProfile(Token: Token, secondTry: true);
      }
    }
  }

  Future<Response> insertDataProfile({required ProfileInsertDataRequest data, bool secondTry = false}) async {
    try {
      Dio dio = await getDio(withoutAuthorizationInterceptor: true);

      Response response = await dio.post(ApiUrl.PROFILES, data: data);

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return insertDataProfile(data: data, secondTry: true);
      }
    }
  }

  Future<Response> insertDataProfileImage({required ProfileInsertImageRequest data, bool secondTry = false}) async {
    try {
      Dio dio = await getDio(withoutAuthorizationInterceptor: true);

      Response response = await dio.post(ApiUrl.PROFILE_IMAGES, data: data);

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return insertDataProfileImage(data: data, secondTry: true);
      }
    }
  }

  Future<Response> updateDataProfileImage({required ProfileUpdateImageRequest data, bool secondTry = false}) async {
    try {
      Dio dio = await getDio(withoutAuthorizationInterceptor: true);

      Response response = await dio.put(ApiUrl.PROFILE_IMAGES, data: data);

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return updateDataProfileImage(data: data, secondTry: true);
      }
    }
  }

  Future<Response> deleteDataProfileImage({required ProfileDeleteImageRequest data, bool secondTry = false}) async {
    try {
      Dio dio = await getDio(withoutAuthorizationInterceptor: true);

      Response response = await dio.delete(ApiUrl.PROFILE_IMAGES, data: data);

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return deleteDataProfileImage(data: data, secondTry: true);
      }
    }
  }

  Future<Response> getDataFeedback({required String Token, bool secondTry = false}) async {
    try {
      Dio dio = await getDio(withoutAuthorizationInterceptor: true);

      Response response = await dio.get(ApiUrl.USER_FEEDBACK, queryParameters: {"token":Token});

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return getDataFeedback(Token: Token, secondTry: true);
      }
    }
  }

  Future<Response> insertDataFeedback({required FeedbackInsertCommentRequest data, bool secondTry = false}) async {
    try {
      Dio dio = await getDio(withoutAuthorizationInterceptor: true);

      Response response = await dio.post(ApiUrl.PROFILES, data: data);

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return insertDataFeedback(data: data, secondTry: true);
      }
    }
  }

  Future<Response> updateDataFeedback({required FeedbackUpdateCommentRequest data, bool secondTry = false}) async {
    try {
      Dio dio = await getDio(withoutAuthorizationInterceptor: true);

      Response response = await dio.put(ApiUrl.USER_FEEDBACK, data: data);

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return updateDataFeedback(data: data, secondTry: true);
      }
    }
  }

  Future<Response> deleteDataFeedback({required FeedbackDeleteCommentRequest data, bool secondTry = false}) async {
    try {
      Dio dio = await getDio(withoutAuthorizationInterceptor: true);

      Response response = await dio.delete(ApiUrl.USER_FEEDBACK, data: data);

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return deleteDataFeedback(data: data, secondTry: true);
      }
    }
  }

  Future<Response> getDataCommunityPost({required String Token, bool secondTry = false}) async {
    try {
      Dio dio = await getDio(withoutAuthorizationInterceptor: true);

      Response response = await dio.get(ApiUrl.COMMUNITY_POST, queryParameters: {"token":Token});

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return getDataCommunityPost(Token: Token, secondTry: true);
      }
    }
  }

  Future<Response> insertDataCommunityPost({required CommunityPostInsertRequest data, bool secondTry = false}) async {
    try {
      Dio dio = await getDio(withoutAuthorizationInterceptor: true);

      Response response = await dio.post(ApiUrl.COMMUNITY_POST, data: data);

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return insertDataCommunityPost(data: data, secondTry: true);
      }
    }
  }

  Future<Response> updateDataCommunityPost({required CommunityPostUpdateRequest data, bool secondTry = false}) async {
    try {
      Dio dio = await getDio(withoutAuthorizationInterceptor: true);

      Response response = await dio.put(ApiUrl.COMMUNITY_POST, data: data);

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return updateDataCommunityPost(data: data, secondTry: true);
      }
    }
  }

  Future<Response> deleteDataCommunityPost({required CommunityPostDeleteRequest data, bool secondTry = false}) async {
    try {
      Dio dio = await getDio(withoutAuthorizationInterceptor: true);

      Response response = await dio.delete(ApiUrl.COMMUNITY_POST, data: data);

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return deleteDataCommunityPost(data: data, secondTry: true);
      }
    }
  }

  Future<Response> getDataCommunityPostComment({required CommunityPostCommentHomeRequest data, bool secondTry = false}) async {
    try {
      Dio dio = await getDio(withoutAuthorizationInterceptor: true);

      Response response = await dio.post(ApiUrl.COMMUNITY_POST_COMMENT, data: data);

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return getDataCommunityPostComment(data: data, secondTry: true);
      }
    }
  }

  Future<Response> insertDataCommunityPostComment({required CommunityPostCommentInsertRequest data, bool secondTry = false}) async {
    try {
      Dio dio = await getDio(withoutAuthorizationInterceptor: true);

      Response response = await dio.post(ApiUrl.COMMUNITY_POST_COMMENT, data: data);

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return insertDataCommunityPostComment(data: data, secondTry: true);
      }
    }
  }

  Future<Response> updateDataCommunityPostComment({required CommunityPostCommentUpdateRequest data, bool secondTry = false}) async {
    try {
      Dio dio = await getDio(withoutAuthorizationInterceptor: true);

      Response response = await dio.put(ApiUrl.COMMUNITY_POST_COMMENT, data: data);

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return updateDataCommunityPostComment(data: data, secondTry: true);
      }
    }
  }

  Future<Response> deleteDataCommunityPostComment({required CommunityPostCommentDeleteRequest data, bool secondTry = false}) async {
    try {
      Dio dio = await getDio(withoutAuthorizationInterceptor: true);

      Response response = await dio.delete(ApiUrl.COMMUNITY_POST_COMMENT, data: data);

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return deleteDataCommunityPostComment(data: data, secondTry: true);
      }
    }
  }

  Future<Response> likeCommunityPost({required CommunityPostLikeRequest data, bool secondTry = false}) async {
    try {
      Dio dio = await getDio(withoutAuthorizationInterceptor: true);

      Response response = await dio.post(ApiUrl.COMMUNITY_POST_LIKE, data: data);

      return response;
    } on DioError catch (e) {
      if (secondTry) {
        if(e.type == DioErrorType.response) {
          rethrow;
        } else {
          String message = await CustomCatch.internetCatch();
          throw Exception(message);
        }
      } else {
        PRIMARY = !PRIMARY;

        return likeCommunityPost(data: data, secondTry: true);
      }
    }
  }

}