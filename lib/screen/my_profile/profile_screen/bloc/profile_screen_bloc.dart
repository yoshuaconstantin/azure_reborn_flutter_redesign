import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../additional/constant.dart';
import '../../../../api/api_manager.dart';
import '../../../../api/endpoint/profile/home/profile_home_response.dart';
import '../../../../api/endpoint/profile/home/profile_home_response_data.dart';

part 'profile_screen_event.dart';
part 'profile_screen_state.dart';

class ProfileScreenBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  ProfileScreenBloc() : super(ProfileScreenInitial()) {
    on<ProfileScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<onGetProfileData>(_getProfile);
  }

  FutureOr<void> _getProfile(onGetProfileData event, Emitter<ProfileScreenState> emit) async {
      try {
        emit(onGetProfileDataLoading());
        final prefs = await SharedPreferences.getInstance();

        Response response = await ApiManager().getDataProfile(
            Token: prefs.getString(SharedPreferenceKey.TOKEN.name)!
        );

        if (response.statusCode == 200) {

          ProfileHomeResponse profileHomeResponse = ProfileHomeResponse.fromJson(jsonDecode(response.data));

          emit(onGetProfileDataSuccess(data: profileHomeResponse));

        } else {
          emit(onGetProfileDataFailed(message: response.data));
        }
      } catch (e) {
        String message = "Something went wrong, try again later!";

        if (e is Exception) {
          message = e.toString().substring(e.toString().indexOf(":") + 1).trim();
        }

        if (e is DioError && e.response != null) {
          message = e.response!.data;
        }

        emit(onGetProfileDataFailed(message: message));
      } finally{
        emit(onGetProfileDataFinished());
      }
  }
}
