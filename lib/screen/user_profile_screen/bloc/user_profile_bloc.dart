import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../additional/constant.dart';
import '../../../additional/preferences.dart';
import '../../../api/api_manager.dart';
import '../../../api/endpoint/profile/delete_image/profile_delete_image_request.dart';
import '../../../api/endpoint/profile/home/profile_home_response.dart';
import '../../../api/endpoint/profile/home/profile_home_response_data.dart';
import '../../../api/endpoint/profile/insert_data/profile_insert_data_request.dart';
import '../../../api/endpoint/profile/insert_data/profile_insert_data_request_data.dart';
import '../../../api/endpoint/profile/update_image/profile_update_image_request.dart';
import '../../../api/endpoint/profile/upload_image/profile_upload_image_request.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(UserProfileInitial()) {
    on<UserProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<onGetDataProfile>(_getData);
    on<onInsertDataProfile>(_insertData);
    on<onInsertDataProfileImage>(_uploadImage);
    on<onUpdateDataProfileImage>(_updateImage);
    on<onDeleteDataProfileImage>(_deleteImage);

  }

  FutureOr<void> _getData(onGetDataProfile event, Emitter<UserProfileState> emit) async {
    try {
      emit(onGetDataProfileLoading());

      Response response = await ApiManager().getDataProfile(
          Token: Preferences.getInstance().getString(SharedPreferenceKey.TOKEN) ?? ""
      );

      if (response.statusCode == 200) {
        ProfileHomeResponse profileHomeResponse = ProfileHomeResponse.fromJson(jsonDecode(response.data));

        emit(onGetDataProfileSuccess(data: profileHomeResponse.data![0]));

      } else if (response.statusCode == 401) {
        emit(onGetDataProfileFailed(message: response.data));
      } else if (response.statusCode == 400) {
        emit(onGetDataProfileFailed(message: response.data));
      } else {
        emit(onGetDataProfileFailed(message: response.data));
      }
    } catch (e) {
      String message = "Something went wrong, try again later!";

      if (e is Exception) {
        message = e.toString().substring(e.toString().indexOf(":") + 1).trim();
      }

      if (e is DioError && e.response != null) {
        message = e.response!.data;
      }

      emit(onGetDataProfileFailed(message: message));
    } finally {
      emit(onGetDataProfileFinished());
    }
  }

  FutureOr<void> _insertData(onInsertDataProfile event, Emitter<UserProfileState> emit) async {
    try {
      emit(onInsertDataProfileLoading());

      ProfileInsertDataRequest profileInsertDataRequest = ProfileInsertDataRequest(
          token: Preferences.getInstance().getString(SharedPreferenceKey.TOKEN) ?? "",
        data: [
          ProfileInsertDataRequestData(age: event.data.age,
              gender: event.data.gender,
              image_url: event.data.image_url,
              nation: event.data.nation,
              nickname: event.data.nickname
          )
        ]
          );

      Response response = await ApiManager().insertDataProfile(
          data: profileInsertDataRequest
      );

      if (response.statusCode == 200) {

        emit(onInsertDataProfileSuccess());

      } else if (response.statusCode == 401) {
        emit(onInsertDataProfileFailed(message: response.data));
      } else if (response.statusCode == 400) {
        emit(onInsertDataProfileFailed(message: response.data));
      } else {
        emit(onInsertDataProfileFailed(message: response.data));
      }
    } catch (e) {
      String message = "Something went wrong, try again later!";

      if (e is Exception) {
        message = e.toString().substring(e.toString().indexOf(":") + 1).trim();
      }

      if (e is DioError && e.response != null) {
        message = e.response!.data;
      }

      emit(onInsertDataProfileFailed(message: message));
    } finally {
      emit(onInsertDataProfileFinished());
    }
  }

  FutureOr<void> _uploadImage(onInsertDataProfileImage event, Emitter<UserProfileState> emit) async {
    try {
      emit(onUploadImageProfileLoading());

      ProfileInsertImageRequest profileInsertImageRequest = ProfileInsertImageRequest(
          token: Preferences.getInstance().getString(SharedPreferenceKey.TOKEN) ?? "",
          data: event.data
      );

      Response response = await ApiManager().insertDataProfileImage(
          data: profileInsertImageRequest
      );

      if (response.statusCode == 200) {

        emit(onUploadImageProfileSuccess());

      } else if (response.statusCode == 401) {
        emit(onUploadImageProfileFailed(message: response.data));
      } else if (response.statusCode == 400) {
        emit(onUploadImageProfileFailed(message: response.data));
      } else {
        emit(onUploadImageProfileFailed(message: response.data));
      }
    } catch (e) {
      String message = "Something went wrong, try again later!";

      if (e is Exception) {
        message = e.toString().substring(e.toString().indexOf(":") + 1).trim();
      }

      if (e is DioError && e.response != null) {
        message = e.response!.data;
      }

      emit(onUploadImageProfileFailed(message: message));
    } finally {
      emit(onUploadImageProfileFinished());
    }
  }

  FutureOr<void> _updateImage(onUpdateDataProfileImage event, Emitter<UserProfileState> emit) async {
    try {
      emit(onUpdateImageProfileLoading());

      ProfileUpdateImageRequest profileUpdateImageRequest = ProfileUpdateImageRequest(
          token: Preferences.getInstance().getString(SharedPreferenceKey.TOKEN) ?? "",
          data: event.data,
          oldImgUrl: event.oldImgUrl
      );

      Response response = await ApiManager().updateDataProfileImage(
          data: profileUpdateImageRequest
      );

      if (response.statusCode == 200) {

        emit(onUpdateImageProfileSuccess());

      } else if (response.statusCode == 401) {
        emit(onUpdateImageProfileFailed(message: response.data));
      } else if (response.statusCode == 400) {
        emit(onUpdateImageProfileFailed(message: response.data));
      } else {
        emit(onUpdateImageProfileFailed(message: response.data));
      }
    } catch (e) {
      String message = "Something went wrong, try again later!";

      if (e is Exception) {
        message = e.toString().substring(e.toString().indexOf(":") + 1).trim();
      }

      if (e is DioError && e.response != null) {
        message = e.response!.data;
      }

      emit(onUpdateImageProfileFailed(message: message));
    } finally {
      emit(onUpdateImageProfileFinished());
    }
  }

  FutureOr<void> _deleteImage(onDeleteDataProfileImage event, Emitter<UserProfileState> emit) async {
    try {
      emit(onDeleteImageProfileLoading());

      ProfileDeleteImageRequest profileDeleteImageRequest = ProfileDeleteImageRequest(
          token: Preferences.getInstance().getString(SharedPreferenceKey.TOKEN) ?? "",
          oldImgUrl: event.oldImgUrl
      );

      Response response = await ApiManager().deleteDataProfileImage(
          data: profileDeleteImageRequest
      );

      if (response.statusCode == 200) {

        emit(onDeleteImageProfileSuccess());

      } else if (response.statusCode == 401) {
        emit(onDeleteImageProfileFailed(message: response.data));
      } else if (response.statusCode == 400) {
        emit(onDeleteImageProfileFailed(message: response.data));
      } else {
        emit(onDeleteImageProfileFailed(message: response.data));
      }
    } catch (e) {
      String message = "Something went wrong, try again later!";

      if (e is Exception) {
        message = e.toString().substring(e.toString().indexOf(":") + 1).trim();
      }

      if (e is DioError && e.response != null) {
        message = e.response!.data;
      }

      emit(onDeleteImageProfileFailed(message: message));
    } finally {
      emit(onDeleteImageProfileFinished());
    }
  }
}
