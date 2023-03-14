import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../additional/constant.dart';
import '../../../../api/api_manager.dart';
import '../../../../api/endpoint/account/delete_account/delete_account_request.dart';

part 'delete_account_event.dart';
part 'delete_account_state.dart';

class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  DeleteAccountBloc() : super(DeleteAccountInitial()) {
    on<DeleteAccountEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<onDeleteAccount>(_deleteAccount);
    on<onVerifyPassword>(_verifyPassword);

  }

  FutureOr<void> _deleteAccount(onDeleteAccount event, Emitter<DeleteAccountState> emit) async {
    try {
      emit(onDeleteAccountLoading());
      final prefs = await SharedPreferences.getInstance();

      Response response = await ApiManager().deleteAccount(data: DeleteAccountRequest(token: prefs.getString(SharedPreferenceKey.TOKEN.name)!));
      if (response.statusCode == 200) {

        emit(onDeleteAccountSuccess());

      } else {
        emit(onDeleteAccountFailed(message: response.data));
      }
    } catch (e) {
      String message = "Something went wrong, try again later!";

      if (e is Exception) {
        message = e.toString().substring(e.toString().indexOf(":") + 1).trim();
      }

      if (e is DioError && e.response != null) {
        message = e.response!.data;
      }

      emit(onDeleteAccountFailed(message: message));
    } finally{
      emit(onDeleteAccountFinished());
    }
  }

  FutureOr<void> _verifyPassword(onVerifyPassword event, Emitter<DeleteAccountState> emit) async {
    try {
      emit(onVerifyPasswordDoNothing());
      final prefs = await SharedPreferences.getInstance();

      Response response = await ApiManager().validateAccountPassword(
          password: event.password ,token: prefs.getString(SharedPreferenceKey.TOKEN.name)
      );

      if (response.statusCode == 200) {

        emit(onVerifyPasswordSuccess());

      } else {
        emit(onVerifyPasswordFailed(message: response.data));
      }
    } catch (e) {
      String message = "Something went wrong, try again later!";

      if (e is Exception) {
        message = e.toString().substring(e.toString().indexOf(":") + 1).trim();
      }

      if (e is DioError && e.response != null) {
        message = e.response!.data;
      }

      emit(onVerifyPasswordFailed(message: message));
    }
  }
}
