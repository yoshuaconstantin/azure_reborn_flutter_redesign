import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../additional/constant.dart';
import '../../../additional/preferences.dart';
import '../../../api/api_manager.dart';
import '../../../api/endpoint/feedback/delete_feedback/feedback_delete_comment_request.dart';
import '../../../api/endpoint/feedback/home_feedback/feedback_home_response.dart';
import '../../../api/endpoint/feedback/insert_feedback/feedback_insert_comment_request.dart';
import '../../../api/endpoint/feedback/update_feedback/feedback_update_comment_request.dart';

part 'feedback_user_event.dart';
part 'feedback_user_state.dart';

class FeedbackUserBloc extends Bloc<FeedbackUserEvent, FeedbackUserState> {
  FeedbackUserBloc() : super(FeedbackUserInitial()) {
    on<FeedbackUserEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<onGetDataFeedback>(_getData);
    on<onInsertDataFeedback>(_insertData);
    on<onUpdateDataFeedback>(_updateData);
    on<onDeleteDataFeedback>(_deleteData);
  }

  FutureOr<void> _getData(onGetDataFeedback event, Emitter<FeedbackUserState> emit) async  {
    try {
      emit(onGetDataFeedbackLoading());

      Response response = await ApiManager().getDataFeedback(
          Token: Preferences.getInstance().getString(SharedPreferenceKey.TOKEN) ?? ""
      );

      if (response.statusCode == 200) {
        FeedbackHomeResponse feedbackHomeResponse = FeedbackHomeResponse.fromJson(jsonDecode(response.data));


        emit(onGetDataFeedbackSuccess(data: feedbackHomeResponse));

      } else if (response.statusCode == 401) {
        emit(onGetDataFeedbackFailed(message: response.data));
      } else if (response.statusCode == 400) {
        emit(onGetDataFeedbackFailed(message: response.data));
      } else {
        emit(onGetDataFeedbackFailed(message: response.data));
      }
    } catch (e) {
      String message = "Something went wrong, try again later!";

      if (e is Exception) {
        message = e.toString().substring(e.toString().indexOf(":") + 1).trim();
      }

      if (e is DioError && e.response != null) {
        message = e.response!.data;
      }

      emit(onGetDataFeedbackFailed(message: message));
    } finally {
      emit(onGetDataFeedbackFinished());
    }
  }

  FutureOr<void> _insertData(onInsertDataFeedback event, Emitter<FeedbackUserState> emit) async {
    try {
      emit(onInsertDataFeedbackLoading());

      FeedbackInsertCommentRequest feedbackInsertCommentRequest = FeedbackInsertCommentRequest(
          token: Preferences.getInstance().getString(SharedPreferenceKey.TOKEN) ?? "",
          comment: event.comment);

      Response response = await ApiManager().insertDataFeedback(
          data: feedbackInsertCommentRequest
      );

      if (response.statusCode == 200) {

        emit(onInsertDataFeedbackSuccess());

      } else if (response.statusCode == 401) {
        emit(onInsertDataFeedbackFailed(message: response.data));
      } else if (response.statusCode == 400) {
        emit(onInsertDataFeedbackFailed(message: response.data));
      } else {
        emit(onInsertDataFeedbackFailed(message: response.data));
      }
    } catch (e) {
      String message = "Something went wrong, try again later!";

      if (e is Exception) {
        message = e.toString().substring(e.toString().indexOf(":") + 1).trim();
      }

      if (e is DioError && e.response != null) {
        message = e.response!.data;
      }

      emit(onInsertDataFeedbackFailed(message: message));
    } finally {
      emit(onInsertDataFeedbackFinished());
    }
  }

  FutureOr<void> _updateData(onUpdateDataFeedback event, Emitter<FeedbackUserState> emit) async {
    try {
      emit(onUpdateDataFeedbackLoading());

      FeedbackUpdateCommentRequest feedbackUpdateCommentRequest = FeedbackUpdateCommentRequest(
          token: Preferences.getInstance().getString(SharedPreferenceKey.TOKEN) ?? "",
          comment: event.comment, id: event.id);

      Response response = await ApiManager().updateDataFeedback(
          data: feedbackUpdateCommentRequest
      );

      if (response.statusCode == 200) {

        emit(onUpdateDataFeedbackSuccess());

      } else if (response.statusCode == 401) {
        emit(onUpdateDataFeedbackFailed(message: response.data));
      } else if (response.statusCode == 400) {
        emit(onUpdateDataFeedbackFailed(message: response.data));
      } else {
        emit(onUpdateDataFeedbackFailed(message: response.data));
      }
    } catch (e) {
      String message = "Something went wrong, try again later!";

      if (e is Exception) {
        message = e.toString().substring(e.toString().indexOf(":") + 1).trim();
      }

      if (e is DioError && e.response != null) {
        message = e.response!.data;
      }

      emit(onUpdateDataFeedbackFailed(message: message));
    } finally {
      emit(onUpdateDataFeedbackFinished());
    }
  }

  FutureOr<void> _deleteData(onDeleteDataFeedback event, Emitter<FeedbackUserState> emit) async {
    try {
      emit(onDeleteDataFeedbackLoading());

      FeedbackDeleteCommentRequest feedbackDeleteCommentRequest = FeedbackDeleteCommentRequest(
          token: Preferences.getInstance().getString(SharedPreferenceKey.TOKEN) ?? "",
          id: event.id);

      Response response = await ApiManager().deleteDataFeedback(
          data: feedbackDeleteCommentRequest
      );

      if (response.statusCode == 200) {

        emit(onDeleteDataFeedbackSuccess());

      } else if (response.statusCode == 401) {
        emit(onDeleteDataFeedbackFailed(message: response.data));
      } else if (response.statusCode == 400) {
        emit(onDeleteDataFeedbackFailed(message: response.data));
      } else {
        emit(onDeleteDataFeedbackFailed(message: response.data));
      }
    } catch (e) {
      String message = "Something went wrong, try again later!";

      if (e is Exception) {
        message = e.toString().substring(e.toString().indexOf(":") + 1).trim();
      }

      if (e is DioError && e.response != null) {
        message = e.response!.data;
      }

      emit(onDeleteDataFeedbackFailed(message: message));
    } finally {
      emit(onDeleteDataFeedbackFinished());
    }
  }
}
