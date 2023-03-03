import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../additional/constant.dart';
import '../../../../api/api_manager.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(ChangePasswordInitial()) {
    on<ChangePasswordEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<onCheckPassword>(_checkPassword);
  }

  FutureOr<void> _checkPassword(onCheckPassword event, Emitter<ChangePasswordState> emit) async {
    try {
      emit(onCheckPasswordDoNothing());
      final prefs = await SharedPreferences.getInstance();

      Response response = await ApiManager().validateAccountPassword(
          password: event.password ,token: prefs.getString(SharedPreferenceKey.TOKEN.name)
      );

      if (response.statusCode == 200) {

        emit(onCheckPasswordSuccess());

      } else {
        emit(onCheckPasswordFailed(message: response.data));
      }
    } catch (e) {
      String message = "Something went wrong, try again later!";

      if (e is Exception) {
        message = e.toString().substring(e.toString().indexOf(":") + 1).trim();
      }

      if (e is DioError && e.response != null) {
        message = e.response!.data;
      }

      emit(onCheckPasswordFailed(message: message));
    }
  }
}
