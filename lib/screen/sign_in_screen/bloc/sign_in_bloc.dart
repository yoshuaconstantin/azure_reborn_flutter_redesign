import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../additional/constant.dart';
import '../../../api/api_manager.dart';
import '../../../api/endpoint/sign_in/sign_in_request.dart';
import '../../../api/endpoint/sign_in/sign_in_response.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<onSignIn>(SignInToServer);
  }

  FutureOr<void> SignInToServer(onSignIn event, Emitter<SignInState> emit) async {
    try {
      emit(onSignInLoading());

      final prefs = await SharedPreferences.getInstance();

      SignInRequest signInRequest = SignInRequest(
          username: event.username, password: event.password);

      Response response = await ApiManager().signIn(
          signInRequest: signInRequest
      );

      if (response.statusCode == 200) {
        SignInResponse signInResponse = SignInResponse.fromJson(jsonDecode(response.data));

        await prefs.setString(SharedPreferenceKey.JWT_auth.name, signInResponse.jwt);
        await prefs.setString(SharedPreferenceKey.TOKEN.name, signInResponse.token);

        emit(onSignInSuccess(data: signInResponse));

      } else if (response.statusCode == 401) {
        emit(onSignInFailed(message: response.data));
      } else if (response.statusCode == 400) {
        emit(onSignInFailed(message: response.data));
      } else {
        emit(onSignInFailed(message: response.data));
      }
    } catch (e) {
      String message = "Something went wrong, try again later!";

      if (e is Exception) {
        message = e.toString().substring(e.toString().indexOf(":") + 1).trim();
      }

      if (e is DioError && e.response != null) {
        message = e.response!.data;
      }

      emit(onSignInFailed(message: message));
    } finally {
      emit(onSignInFinished());
    }
  }
}
